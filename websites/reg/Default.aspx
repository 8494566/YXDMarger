<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="false" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Security.Cryptography" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.Text.RegularExpressions" %>
<%@ Import Namespace="System.Web" %>
<%@ Import Namespace="System.Web.Caching" %>
<%@ Import Namespace="System.IO" %>
<script runat="server">

    // =====================================================================
    //  配置区
    // =====================================================================
    // web.config 里 connectionStrings 的名字
    const string CONN_NAME = "GameDBArea";

    // 同 IP 每分钟最多提交次数（防刷）
    const int RATE_LIMIT_PER_MIN = 5;

    // 注册用的 INSERT。外层用 SERIALIZABLE 事务，靠键范围锁防并发重复注册，
    // 所以数据库账号只需要 SELECT + INSERT 两个权限，不用 UPDATE。
    const string SQL_INSERT =
        "INSERT INTO dbo.account (UserName, PassWord, SecPsw) " +
        "SELECT @u, @p, @p " +
        "WHERE NOT EXISTS (SELECT 1 FROM dbo.account WHERE UserName = @u);";

    // 日志目录
    static readonly string LOG_DIR = @"C:\RegApp\logs";

    // 账号：字母+数字，4-16 位
    static readonly Regex ReUser = new Regex(@"^[A-Za-z0-9]{4,16}$", RegexOptions.Compiled);
    // 密码：可见 ASCII 字符（不含空格），6-20 位
    static readonly Regex RePass = new Regex(@"^[\x21-\x7E]{6,20}$", RegexOptions.Compiled);

    // 验证码模式：image=图形验证码(默认) / off=关闭
    static string CaptchaMode
    {
        get
        {
            string m = ConfigurationManager.AppSettings["CaptchaMode"];
            if (string.IsNullOrEmpty(m)) return "image";
            return m.Trim().ToLowerInvariant();
        }
    }

    // =====================================================================
    //  密码格式：小写 SHA1 十六进制（40 位），与游戏登录端一致
    //  密码只允许可见 ASCII，所以 UTF-8/ASCII/GBK 编码结果一致，不会踩编码坑
    // =====================================================================
    static string Sha1Hex(string s)
    {
        using (SHA1 sha = SHA1.Create())
        {
            byte[] b = sha.ComputeHash(Encoding.UTF8.GetBytes(s));
            StringBuilder sb = new StringBuilder(40);
            for (int i = 0; i < b.Length; i++) sb.Append(b[i].ToString("x2"));
            return sb.ToString();
        }
    }

    static string H(string s) { return HttpUtility.HtmlEncode(s == null ? "" : s); }

    static string ClientIp()
    {
        string ip = HttpContext.Current.Request.UserHostAddress;
        if (ip == null) ip = "unknown";
        if (ip == "::1") ip = "127.0.0.1";
        return ip;
    }

    static bool IsRateLimited()
    {
        string key = "rl:" + ClientIp();
        object o = HttpRuntime.Cache[key];
        int n = (o == null) ? 0 : (int)o;
        if (n >= RATE_LIMIT_PER_MIN) return true;
        HttpRuntime.Cache.Insert(key, n + 1, null, DateTime.UtcNow.AddMinutes(1), Cache.NoSlidingExpiration);
        return false;
    }

    static void LogLine(string s)
    {
        try
        {
            if (!Directory.Exists(LOG_DIR)) Directory.CreateDirectory(LOG_DIR);
            File.AppendAllText(Path.Combine(LOG_DIR, "reg-" + DateTime.Now.ToString("yyyyMM") + ".log"),
                DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + " | " + ClientIp() + " | " + s + Environment.NewLine,
                new UTF8Encoding(false));
        }
        catch { }
    }

    // 返回 1=成功  0=账号已存在  -1=出错
    static int TryRegister(string user, string sha1hex)
    {
        string cs = ConfigurationManager.ConnectionStrings[CONN_NAME].ConnectionString;
        using (SqlConnection cn = new SqlConnection(cs))
        {
            cn.Open();
            using (SqlTransaction tx = cn.BeginTransaction(IsolationLevel.Serializable))
            {
                using (SqlCommand cmd = new SqlCommand(SQL_INSERT, cn, tx))
                {
                    cmd.CommandTimeout = 10;
                    SqlParameter p1 = cmd.Parameters.Add("@u", SqlDbType.VarChar, 32);
                    p1.Value = user;
                    SqlParameter p2 = cmd.Parameters.Add("@p", SqlDbType.VarChar, 40);
                    p2.Value = sha1hex;

                    int n = cmd.ExecuteNonQuery();
                    if (n == 1) { tx.Commit(); return 1; }
                    tx.Rollback();
                    return 0;
                }
            }
        }
    }

    void Page_Load(object sender, EventArgs e)
    {
        Response.ContentEncoding = Encoding.UTF8;
        Response.ContentType = "text/html";
        Response.AddHeader("X-Content-Type-Options", "nosniff");
        Response.AddHeader("X-Frame-Options", "SAMEORIGIN");

        bool capOn = (CaptchaMode != "off");

        string msg = "";
        string keepUser = "";
        bool okFlag = false;

        if (string.Equals(Request.HttpMethod, "POST", StringComparison.OrdinalIgnoreCase))
        {
            string act = Request.Form["action"] ?? "";
            if (act == "register")
            {
                string user = (Request.Form["username"] ?? "").Trim();
                string pwd = Request.Form["password"] ?? "";
                string pwd2 = Request.Form["password2"] ?? "";
                string cap = (Request.Form["captcha"] ?? "").Trim();
                keepUser = H(user);

                string err = null;

                // 1) 图形验证码（一次性，用完即删）
                string expect = Session["captcha"] as string;
                Session.Remove("captcha");
                if (capOn && (expect == null || !string.Equals(expect, cap, StringComparison.OrdinalIgnoreCase)))
                    err = "验证码不正确，请重新输入。";
                // 2) 同 IP 限流
                else if (IsRateLimited())
                    err = "提交过于频繁，请 1 分钟后再试。";
                // 3) 服务端字段白名单校验（不依赖前端）
                else if (!ReUser.IsMatch(user))
                    err = "账号只能用字母和数字，长度 4-16 位。";
                else if (!RePass.IsMatch(pwd))
                    err = "密码只能用可见字符（不能有空格），长度 6-20 位。";
                else if (pwd != pwd2)
                    err = "两次输入的密码不一致。";

                if (err != null)
                {
                    msg = err;
                    LogLine("FAIL " + user + " | " + err);
                }
                else
                {
                    string hex = Sha1Hex(pwd);
                    try
                    {
                        int rc = TryRegister(user, hex);
                        if (rc == 1)
                        {
                            okFlag = true;
                            keepUser = "";
                            msg = "注册成功，可以进游戏了！账号：" + H(user);
                            LogLine("OK " + user);
                        }
                        else if (rc == 0)
                        {
                            msg = "账号已被注册，请换一个。";
                            LogLine("DUP " + user);
                        }
                        else
                        {
                            msg = "注册失败，请稍后再试。";
                            LogLine("ERR " + user);
                        }
                    }
                    catch (Exception ex)
                    {
                        msg = "服务器繁忙，请稍后再试。";
                        LogLine("EXC " + user + " | " + ex.Message);
                    }
                }
            }
        }

        string cls = okFlag ? "ok" : (msg.Length > 0 ? "bad" : "hide");
        string msgHtml = (msg.Length > 0)
            ? "<div class=\"" + cls + "\">" + H(msg) + "</div>"
            : "<div class=\"hide\"></div>";

        string capRow = capOn
            ? "<div class=\"row\"><label>验证码</label><div class=\"cap\">" +
              "<input type=\"text\" name=\"captcha\" maxlength=\"4\" placeholder=\"4 位数字\" autocomplete=\"off\" />" +
              "<img id=\"cap\" src=\"/register/captcha.ashx\" alt=\"验证码\" title=\"点击换一张\" /></div></div>"
            : "";

        Response.Write(PageHtml(msgHtml, keepUser, capRow));
    }

    static string PageHtml(string msgHtml, string keepUser, string capRow)
    {
        string jsTag = "<script src=\"/register/reg.js?v=1\"></scr" + "ipt>";
        string html = @"<!DOCTYPE html>
<html lang=""zh-CN"">
<head>
<meta charset=""utf-8"" />
<meta name=""viewport"" content=""width=device-width, initial-scale=1"" />
<title>游戏账号注册</title>
<style>
* { box-sizing: border-box; }
body { margin:0; padding:0; font-family: ""Microsoft YaHei"", ""微软雅黑"", Arial, sans-serif;
       background: linear-gradient(160deg,#12233b 0%,#1d3f63 55%,#0e1a2b 100%);
       min-height:100vh; display:flex; align-items:center; justify-content:center; padding:24px; }
.card { width:100%; max-width:420px; background:#fff; border-radius:14px; padding:30px 28px 26px;
        box-shadow:0 18px 50px rgba(0,0,0,.45); }
h1 { margin:0 0 4px; font-size:22px; color:#16233a; letter-spacing:1px; }
.sub { margin:0 0 22px; font-size:13px; color:#8492a6; }
label { display:block; font-size:13px; color:#41506b; margin:0 0 6px; font-weight:600; }
input[type=text], input[type=password] { width:100%; height:42px; padding:0 12px; font-size:15px;
        border:1px solid #ccd4e0; border-radius:8px; background:#f8fafc; outline:none; }
input[type=text]:focus, input[type=password]:focus { border-color:#3a7bd5; background:#fff;
        box-shadow:0 0 0 3px rgba(58,123,213,.15); }
.row { margin-bottom:15px; }
.cap { display:flex; align-items:center; gap:10px; }
.cap img { height:42px; width:120px; border:1px solid #ccd4e0; border-radius:8px; background:#fff; cursor:pointer; }
.cap input { flex:1; }
button { width:100%; height:44px; margin-top:8px; border:0; border-radius:9px; cursor:pointer;
         font-size:16px; font-weight:700; letter-spacing:2px; color:#fff;
         background:linear-gradient(90deg,#2f6fd0,#3a9ad9); }
button:hover { filter:brightness(1.07); }
button:disabled { opacity:.6; cursor:default; }
.tip { margin-top:16px; font-size:12px; color:#93a1b5; line-height:1.7; }
.altbtn { display:block; margin-top:14px; height:44px; line-height:44px; text-align:center;
          border:1px solid #3a9ad9; border-radius:9px; color:#2f6fd0; font-size:15px;
          font-weight:700; letter-spacing:1px; text-decoration:none; background:#f4f9ff; }
.altbtn:hover { background:#e8f3ff; }
.altbtn b { color:#e4393c; }
.ok { background:#e8f8ee; color:#1d7a45; border:1px solid #b7e6ca; padding:11px 13px;
      border-radius:8px; font-size:14px; margin-bottom:16px; }
.bad { background:#fdeced; color:#b32b36; border:1px solid #f5c2c7; padding:11px 13px;
       border-radius:8px; font-size:14px; margin-bottom:16px; }
.hide { display:none; }
</style>
</head>
<body>
<div class=""card"">
  <h1>游戏账号注册</h1>
  <p class=""sub"">填写账号和密码即可创建游戏账号</p>
  {{MSG}}
  <form method=""post"" action=""/register/Default.aspx"" autocomplete=""off"">
    <input type=""hidden"" name=""action"" value=""register"" />
    <div class=""row"">
      <label>账号</label>
      <input type=""text"" name=""username"" id=""username"" maxlength=""16"" placeholder=""字母+数字，4-16 位""
             value=""{{USER}}"" autocomplete=""off"" />
    </div>
    <div class=""row"">
      <label>密码</label>
      <input type=""password"" name=""password"" maxlength=""20"" placeholder=""6-20 位，不能有空格"" autocomplete=""new-password"" />
    </div>
    <div class=""row"">
      <label>确认密码</label>
      <input type=""password"" name=""password2"" maxlength=""20"" placeholder=""再输入一次密码"" autocomplete=""new-password"" />
    </div>
    {{CAPROW}}
    <button type=""submit"" id=""btn"">立 即 注 册</button>
  </form>
  <div class=""tip"">
    账号仅限字母和数字（4-16 位）；密码 6-20 位。<br />
    注册后直接用该账号登录游戏即可。
  </div>
  <a class=""altbtn"" href='/pay/'>赞助送礼包 <b>→</b></a>
</div>
{{JSTAG}}
</body>
</html>";

        return html.Replace("{{MSG}}", msgHtml).Replace("{{USER}}", keepUser).Replace("{{CAPROW}}", capRow).Replace("{{JSTAG}}", jsTag);
    }
</script>
