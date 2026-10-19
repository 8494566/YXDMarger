<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="false" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.Web" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="System.IO" %>
<script runat="server">

    // =====================================================================
    //  英雄岛 —— GM 物品发放后台
    //  放这里：C:\PayApp\gm.aspx     访问：http://<地址>:35179/pay/gm.aspx
    //  鉴权：复用 /pay 的后台密码（App_Data\admin.dat）
    //  发放：GameDB.dbo.PrGs_GameEmail_Add_V5（系统邮件，收件人在邮箱领取）
    //  日志：C:\PayApp\logs\gm-YYYYMM.log
    // =====================================================================

    static readonly string LogDir = @"C:\PayApp\logs";

    void Page_Load(object sender, EventArgs e)
    {
        Response.ContentEncoding = Encoding.UTF8;
        Response.ContentType = "text/html";
        Response.AddHeader("X-Robots-Tag", "noindex, nofollow");
        Response.AddHeader("X-Content-Type-Options", "nosniff");

        string ip = Db.Ip();
        if (!AdminAuth.IpAllowed(ip))
        {
            Response.Write(Wrap("访问被拒", "<div class=\"bad\">你的 IP（" + Db.H(ip) + "）不在允许访问后台的名单里。</div>"));
            return;
        }

        string msg = "";
        string msgCls = "ok";

        // ---------- 登录 ----------
        if (Request.HttpMethod == "POST" && Request.Form["action"] == "login")
        {
            if (Db.RateLimited("gmadm", 10)) { msg = "尝试过于频繁，请稍后再试。"; msgCls = "bad"; }
            else if (AdminAuth.Verify(Request.Form["pwd"] ?? "")) { AdminAuth.Login(); Response.Redirect("/pay/gm.aspx", false); return; }
            else { msg = "密码错误。"; msgCls = "bad"; Db.Log("GM_LOGIN FAIL ip=" + ip); }
        }
        if (Request.HttpMethod == "POST" && Request.Form["action"] == "logout")
        {
            AdminAuth.Logout();
            Response.Redirect("/pay/gm.aspx", false);
            return;
        }
        if (!AdminAuth.LoggedIn())
        {
            Response.Write(Wrap("GM 发放后台 · 登录", LoginHtml(msg, msgCls)));
            return;
        }

        // ---------- 发放 ----------
        string act = Request.Form["action"] ?? "";
        if (Request.HttpMethod == "POST" && act == "send")
        {
            string actorKey = (Request.Form["actor"] ?? "").Trim();
            int goodsId = ToInt(Request.Form["goodsid"], 0);
            int goodsNum = ToInt(Request.Form["goodsnum"], 1);
            int money = ToInt(Request.Form["money"], 0);
            string title = (Request.Form["title"] ?? "").Trim();
            string body = (Request.Form["body"] ?? "").Trim();

            ActorInfo a = Db.FindActor(actorKey);
            if (a == null) { msg = "找不到角色：" + Db.H(actorKey) + "（支持角色名或 ActorID）"; msgCls = "bad"; }
            else if (goodsId <= 0 && money <= 0) { msg = "至少填物品 ID 或金币数量。"; msgCls = "bad"; }
            else if (goodsId > 0 && goodsNum <= 0) { msg = "物品数量要大于 0。"; msgCls = "bad"; }
            else if (goodsNum > 30000) { msg = "单个附件数量上限 30000。"; msgCls = "bad"; }
            else
            {
                string ename = ItemName(goodsId);
                if (title.Length == 0)
                    title = goodsId > 0 ? ("GM发放 " + ename) : "GM发放 金币";
                if (body.Length == 0)
                    body = goodsId > 0 ? ("发放：" + ename + " x" + goodsNum + "，请点开邮件后领取附件。")
                                       : ("发放：金币 x" + money + "，请用邮箱的「获取全部金币」领取。");

                string outMsg;
                int emailId = SendMail(a, goodsId, goodsNum, money,
                                       Cut(title, 32), Cut(body, 600), out outMsg);

                if (emailId > 0)
                {
                    msg = "已发放给 <b>" + Db.H(a.ActorName) + "</b>（#" + a.ActorID + "）："
                        + (goodsId > 0 ? ("物品 " + goodsId + " " + Db.H(ename) + " x" + goodsNum) : "")
                        + (goodsId > 0 && money > 0 ? " + " : "")
                        + (money > 0 ? ("金币 x" + money) : "")
                        + " ｜ 邮件号 #" + emailId;
                    WriteLog("SEND ok actor=" + a.ActorID + "/" + a.ActorName + " goods=" + goodsId + " num=" + goodsNum + " money=" + money + " email=" + emailId + " ip=" + ip);
                }
                else
                {
                    msg = "发放失败：" + Db.H(outMsg); msgCls = "bad";
                    WriteLog("SEND fail actor=" + a.ActorID + "/" + a.ActorName + " goods=" + goodsId + " num=" + goodsNum + " money=" + money + " msg=" + outMsg + " ip=" + ip);
                }
            }
        }

        // ---------- 查询参数 ----------
        string aq = (Request.QueryString["aq"] ?? "").Trim();
        string iq = (Request.QueryString["iq"] ?? "").Trim();
        string pickActor = (Request.Form["actor"] ?? Request.QueryString["actor"] ?? "").Trim();
        string pickGoods = (Request.QueryString["goodsid"] ?? "").Trim();

        StringBuilder sb = new StringBuilder();
        sb.Append("<div class=\"topbar\"><span>GM 发放后台 ｜ 已登录</span>"
                + "<form method=\"post\" style=\"margin:0\"><input type=\"hidden\" name=\"action\" value=\"logout\" />"
                + "<button class=\"btn2\" type=\"submit\">退出</button></form></div>");
        if (msg.Length > 0) sb.Append("<div class=\"" + msgCls + "\">" + msg + "</div>");

        // --- 发放表单 ---
        sb.Append("<div class=\"card\"><h3>① 发放</h3><form method=\"post\">");
        sb.Append("<input type=\"hidden\" name=\"action\" value=\"send\" />");
        sb.Append("<div class=\"grid\">");
        sb.Append("<label>角色（名字或 ActorID）<input type=\"text\" name=\"actor\" value=\"" + Db.H(pickActor) + "\" placeholder=\"例如 无双 或 10001\" /></label>");
        sb.Append("<label>物品 ID<input type=\"text\" name=\"goodsid\" value=\"" + Db.H(pickGoods) + "\" placeholder=\"留空则只发金币\" /></label>");
        sb.Append("<label>物品数量<input type=\"text\" name=\"goodsnum\" value=\"1\" /></label>");
        sb.Append("<label>金币数量<input type=\"text\" name=\"money\" value=\"0\" /></label>");
        sb.Append("</div>");
        sb.Append("<label>邮件标题（可留空，最多约 10 个汉字）<input type=\"text\" name=\"title\" value=\"\" /></label>");
        sb.Append("<label>邮件正文（可留空）<input type=\"text\" name=\"body\" value=\"\" /></label>");
        sb.Append("<button class=\"btn\" type=\"submit\">确认发放</button>");
        sb.Append("<div class=\"tip\">发放后玩家在游戏内邮箱领取；物品与金币请分两次发（同一封邮件里只有物品会被领走）。</div>");
        sb.Append("</form></div>");

        // --- 角色查询 ---
        sb.Append("<div class=\"card\"><h3>② 查角色</h3><form method=\"get\">");
        sb.Append("<label>角色名 / ActorID / 账号ID<input type=\"text\" name=\"aq\" value=\"" + Db.H(aq) + "\" /></label>");
        sb.Append("<button class=\"btn\" type=\"submit\">查询</button></form>");
        if (aq.Length > 0) sb.Append(SearchActors(aq));
        sb.Append("</div>");

        // --- 物品查询 ---
        sb.Append("<div class=\"card\"><h3>③ 查物品（ID ↔ 名字）</h3><form method=\"get\">");
        sb.Append("<label>物品名字关键字 或 物品 ID<input type=\"text\" name=\"iq\" value=\"" + Db.H(iq) + "\" placeholder=\"例如 冰封水晶 / 金克拉 / 83114\" /></label>");
        sb.Append("<button class=\"btn\" type=\"submit\">搜索</button></form>");
        if (iq.Length > 0) sb.Append(SearchItems(iq));
        sb.Append("</div>");

        // --- 日志 ---
        sb.Append("<div class=\"card\"><h3>④ 最近发放记录</h3><pre class=\"log\">" + Db.H(RecentLog()) + "</pre></div>");

        Response.Write(Wrap("GM 发放后台", sb.ToString()));
    }

    // ------------------------------------------------------------------
    //  核心：调存储过程发系统邮件
    // ------------------------------------------------------------------
    int SendMail(ActorInfo a, int goodsId, int goodsNum, int money,
                 string title, string body, out string outMsg)
    {
        outMsg = "";
        try
        {
            using (SqlConnection cn = Db.Open())
            using (SqlCommand cmd = new SqlCommand("GameDB.dbo.PrGs_GameEmail_Add_V5", cn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 20;
                cmd.Parameters.Add("@FromActorID", SqlDbType.Int).Value = 0;   // <1000 走系统通道，跳过10秒限制
                cmd.Parameters.Add("@ToActorName", SqlDbType.NVarChar, 32).Value = a.ActorName;
                cmd.Parameters.Add("@EmailTitle", SqlDbType.NVarChar, 32).Value = title;
                cmd.Parameters.Add("@EmailBody", SqlDbType.NVarChar, 600).Value = body;
                cmd.Parameters.Add("@MoneyNum", SqlDbType.Int).Value = money;
                cmd.Parameters.Add("@AttachNum", SqlDbType.TinyInt).Value = (byte)(goodsId > 0 ? 1 : 0);
                cmd.Parameters.Add("@GoodsBuf", SqlDbType.Binary, 525).Value =
                    goodsId > 0 ? (object)Db.BuildGoodsBuf(goodsId, goodsNum) : DBNull.Value;
                SqlParameter pAid = cmd.Parameters.Add("@ToActorID", SqlDbType.Int);
                pAid.Direction = ParameterDirection.Output;
                SqlParameter pEid = cmd.Parameters.Add("@Out_EmailID", SqlDbType.Int);
                pEid.Direction = ParameterDirection.Output;
                SqlParameter pMsg = cmd.Parameters.Add("@ChvMsg", SqlDbType.VarChar, 128);
                pMsg.Direction = ParameterDirection.Output;
                SqlParameter pRet = cmd.Parameters.Add("@RET", SqlDbType.Int);
                pRet.Direction = ParameterDirection.ReturnValue;

                cmd.ExecuteNonQuery();

                outMsg = Convert.ToString(pMsg.Value);
                if (pRet.Value == null || Convert.ToInt32(pRet.Value) != 1) return 0;
                int eid = (pEid.Value == null || pEid.Value == DBNull.Value) ? 0 : Convert.ToInt32(pEid.Value);
                return eid;
            }
        }
        catch (Exception ex)
        {
            outMsg = ex.Message;
            return 0;
        }
    }

    string ItemName(int goodsId)
    {
        try
        {
            using (SqlConnection cn = Db.Open())
            using (SqlCommand cmd = new SqlCommand("SELECT Name FROM GameDB.dbo.GM_ItemCatalog WHERE GoodsID=@g;", cn))
            {
                cmd.Parameters.Add("@g", SqlDbType.Int).Value = goodsId;
                object o = cmd.ExecuteScalar();
                return (o == null || o == DBNull.Value) ? ("未知物品#" + goodsId) : o.ToString();
            }
        }
        catch { return "未知物品#" + goodsId; }
    }

    string SearchActors(string key)
    {
        StringBuilder sb = new StringBuilder();
        try
        {
            using (SqlConnection cn = Db.Open())
            using (SqlCommand cmd = new SqlCommand(
                "SELECT TOP 30 ActorID, ActorName, UsreID, ExploitLevel, ISNULL(HoldMoney,0), ISNULL(Point,0) " +
                "FROM GameDB.dbo.Actor WHERE ActorName LIKE @k OR CAST(ActorID AS varchar(20)) LIKE @k OR CAST(UsreID AS varchar(20))=@ex " +
                "ORDER BY ActorID;", cn))
            {
                cmd.Parameters.Add("@k", SqlDbType.NVarChar, 40).Value = "%" + key + "%";
                cmd.Parameters.Add("@ex", SqlDbType.NVarChar, 40).Value = key;
                using (SqlDataReader rd = cmd.ExecuteReader())
                {
                    sb.Append("<table><tr><th>ActorID</th><th>角色名</th><th>账号</th><th>等级</th><th>金币</th><th>点券</th><th></th></tr>");
                    bool any = false;
                    while (rd.Read())
                    {
                        any = true;
                        string nm = rd.GetString(1);
                        sb.Append("<tr><td>" + rd.GetInt32(0) + "</td><td>" + Db.H(nm) + "</td><td>" + rd.GetInt32(2)
                                + "</td><td>" + rd.GetByte(3) + "</td><td>" + rd.GetInt32(4) + "</td><td>" + rd.GetInt32(5)
                                + "</td><td><a href=\"/pay/gm.aspx?actor=" + Server.UrlEncode(nm) + "\">选用</a></td></tr>");
                    }
                    sb.Append("</table>");
                    if (!any) sb.Append("<div class=\"tip\">没有匹配的角色。</div>");
                }
            }
        }
        catch (Exception ex) { sb.Append("<div class=\"bad\">查询出错：" + Db.H(ex.Message) + "</div>"); }
        return sb.ToString();
    }

    string SearchItems(string key)
    {
        StringBuilder sb = new StringBuilder();
        try
        {
            int id = 0;
            bool byId = int.TryParse(key, out id);
            using (SqlConnection cn = Db.Open())
            using (SqlCommand cmd = new SqlCommand(
                "SELECT TOP 50 GoodsID, Name, ISNULL(ItemType,''), ISNULL(Src,'') FROM GameDB.dbo.GM_ItemCatalog " +
                (byId ? "WHERE GoodsID=@id " : "WHERE Name LIKE @k ") + "ORDER BY GoodsID;", cn))
            {
                if (byId) cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;
                else cmd.Parameters.Add("@k", SqlDbType.NVarChar, 60).Value = "%" + key + "%";
                using (SqlDataReader rd = cmd.ExecuteReader())
                {
                    sb.Append("<table><tr><th>物品 ID</th><th>名字</th><th>类型</th><th>来源表</th><th></th></tr>");
                    bool any = false;
                    while (rd.Read())
                    {
                        any = true;
                        string gid = rd.GetInt32(0).ToString();
                        sb.Append("<tr><td><b>" + gid + "</b></td><td>" + Db.H(rd.GetString(1)) + "</td><td>" + Db.H(rd.GetString(2))
                                + "</td><td>" + Db.H(rd.GetString(3)) + "</td><td><a href=\"/pay/gm.aspx?goodsid=" + gid + "\">选用</a></td></tr>");
                    }
                    sb.Append("</table>");
                    if (!any) sb.Append("<div class=\"tip\">没找到。目录只收了 装备/道具/材料/宝石 四张表；宠物卡、载具等特殊物品请直接填物品 ID。</div>");
                }
            }
        }
        catch (Exception ex) { sb.Append("<div class=\"bad\">查询出错：" + Db.H(ex.Message) + "</div>"); }
        return sb.ToString();
    }

    // ------------------------------------------------------------------
    //  小工具
    // ------------------------------------------------------------------
    static int ToInt(string s, int def)
    {
        int r;
        return int.TryParse((s ?? "").Trim(), out r) ? r : def;
    }

    // varchar 字段按字节截断（中文 2 字节）
    static string Cut(string s, int maxBytes)
    {
        if (string.IsNullOrEmpty(s)) return "";
        Encoding e = Encoding.GetEncoding(936);
        byte[] b = e.GetBytes(s);
        if (b.Length <= maxBytes) return s;
        return e.GetString(b, 0, maxBytes).TrimEnd(' ', '?');
    }

    static void WriteLog(string line)
    {
        try
        {
            if (!Directory.Exists(LogDir)) Directory.CreateDirectory(LogDir);
            string p = Path.Combine(LogDir, "gm-" + DateTime.Now.ToString("yyyyMM") + ".log");
            File.AppendAllText(p, DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + " " + line + Environment.NewLine, Encoding.UTF8);
        }
        catch { }
    }

    static string RecentLog()
    {
        try
        {
            string p = Path.Combine(LogDir, "gm-" + DateTime.Now.ToString("yyyyMM") + ".log");
            if (!File.Exists(p)) return "(还没有记录)";
            string[] all = File.ReadAllLines(p, Encoding.UTF8);
            int n = Math.Min(30, all.Length);
            StringBuilder sb = new StringBuilder();
            for (int i = all.Length - n; i < all.Length; i++) sb.AppendLine(all[i]);
            return sb.ToString();
        }
        catch { return "(读取失败)"; }
    }

    string LoginHtml(string msg, string cls)
    {
        StringBuilder sb = new StringBuilder();
        if (msg.Length > 0) sb.Append("<div class=\"" + cls + "\">" + msg + "</div>");
        sb.Append("<form method=\"post\"><input type=\"hidden\" name=\"action\" value=\"login\" />");
        sb.Append("<label>管理员密码<input type=\"password\" name=\"pwd\" /></label>");
        sb.Append("<button class=\"btn\" type=\"submit\">登录</button></form>");
        sb.Append("<div class=\"tip\">密码与「充值后台 /pay/admin.aspx」是同一个。</div>");
        return sb.ToString();
    }

    string Wrap(string title, string body)
    {
        StringBuilder h = new StringBuilder();
        h.Append("<!DOCTYPE html><html lang=\"zh-CN\"><head><meta charset=\"utf-8\" />");
        h.Append("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" />");
        h.Append("<title>" + Db.H(title) + "</title><style>");
        h.Append("*{box-sizing:border-box}body{margin:0;padding:18px;background:#f4f5fa;color:#23262f;font:14px/1.6 -apple-system,'Microsoft YaHei',sans-serif}");
        h.Append(".wrap{max-width:1000px;margin:0 auto}");
        h.Append("h2{font-size:18px;margin:0 0 14px}h3{font-size:15px;margin:0 0 12px;color:#4b3fbf}");
        h.Append(".card{background:#fff;border:1px solid #e6e8f0;border-radius:12px;padding:16px;margin-bottom:14px;box-shadow:0 1px 3px rgba(20,20,60,.05)}");
        h.Append(".topbar{display:flex;justify-content:space-between;align-items:center;background:#fff;border:1px solid #e6e8f0;border-radius:12px;padding:12px 16px;margin-bottom:14px}");
        h.Append("label{display:block;margin:0 0 12px;color:#5b6070;font-size:13px}");
        h.Append("input[type=text],input[type=password]{width:100%;height:38px;margin-top:5px;padding:0 10px;font-size:14px;border:1px solid #d8dbe6;border-radius:8px;background:#fbfbfe}");
        h.Append("input[type=text]:focus,input[type=password]:focus{outline:none;border-color:#7a5cf0;background:#fff}");
        h.Append(".grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(200px,1fr));gap:0 14px}");
        h.Append(".btn{height:38px;padding:0 22px;font-size:14px;color:#fff;background:#6f4df5;border:0;border-radius:8px;cursor:pointer}");
        h.Append(".btn:hover{background:#5c3ce0}.btn2{height:32px;padding:0 14px;font-size:13px;color:#4b3fbf;background:#eef0ff;border:1px solid #d9dcfb;border-radius:8px;cursor:pointer}");
        h.Append("table{width:100%;border-collapse:collapse;margin-top:6px;font-size:13px}");
        h.Append("th,td{padding:8px 10px;border-bottom:1px solid #eef0f6;text-align:left}th{color:#6b7080;font-weight:600;background:#fafbff}");
        h.Append("td a{color:#6f4df5;text-decoration:none}td a:hover{text-decoration:underline}");
        h.Append(".ok{background:#e9f9ef;border:1px solid #bce8cd;color:#1c7a44;border-radius:10px;padding:11px 14px;margin-bottom:14px}");
        h.Append(".bad{background:#fdecec;border:1px solid #f5c2c2;color:#a32b2b;border-radius:10px;padding:11px 14px;margin-bottom:14px}");
        h.Append(".tip{color:#8a8f9e;font-size:12.5px;margin-top:10px}");
        h.Append(".log{background:#0f1222;color:#c8f5d0;border-radius:10px;padding:12px;font-size:12px;line-height:1.7;max-height:280px;overflow:auto;white-space:pre-wrap}");
        h.Append("</style></head><body><div class=\"wrap\"><h2>" + Db.H(title) + "</h2>" + body + "</div></body></html>");
        return h.ToString();
    }
</script>
