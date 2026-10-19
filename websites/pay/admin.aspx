<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="false" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.Text.RegularExpressions" %>
<%@ Import Namespace="System.Web" %>
<%@ Import Namespace="System.Globalization" %>
<script runat="server">

    void Page_Load(object sender, EventArgs e)
    {
        Response.ContentEncoding = Encoding.UTF8;
        Response.ContentType = "text/html";
        Response.AddHeader("X-Robots-Tag", "noindex, nofollow");
        Response.AddHeader("X-Content-Type-Options", "nosniff");

        string ip = Db.Ip();
        if (!AdminAuth.IpAllowed(ip))
        {
            Response.Write(Wrap("访问被拒", "<div class=\"bad\">你的 IP（" + Db.H(ip) + "）不在允许访问后台的名单里。</div>", ""));
            return;
        }

        string msg = "";
        string msgCls = "ok";

        // ---------- 首次设置口令（仅限服务器本机） ----------
        if (!AdminAuth.HasPassword())
        {
            if (Request.HttpMethod == "POST" && Request.Form["action"] == "setpwd")
            {
                if (!AdminAuth.FirstRunAllowed())
                {
                    msg = "首次设置管理员密码只允许在服务器本机上操作。";
                    msgCls = "bad";
                }
                else
                {
                    string p1 = Request.Form["p1"] ?? "";
                    string p2 = Request.Form["p2"] ?? "";
                    if (p1.Length < 8) { msg = "密码至少 8 位。"; msgCls = "bad"; }
                    else if (p1 != p2) { msg = "两次输入不一致。"; msgCls = "bad"; }
                    else
                    {
                        AdminAuth.SetPassword(p1);
                        AdminAuth.Login();
                        Db.Log("ADMIN_SETPWD");
                        Response.Redirect("/pay/admin.aspx", false);
                        return;
                    }
                }
            }
            Response.Write(Wrap("初始化管理员密码", SetupHtml(msg, msgCls), ""));
            return;
        }

        // ---------- 登录 ----------
        if (Request.HttpMethod == "POST" && Request.Form["action"] == "login")
        {
            if (Db.RateLimited("adm", 10))
            {
                msg = "尝试过于频繁，请稍后再试。"; msgCls = "bad";
            }
            else if (AdminAuth.Verify(Request.Form["pwd"] ?? ""))
            {
                AdminAuth.Login();
                Db.Log("ADMIN_LOGIN OK");
                Response.Redirect("/pay/admin.aspx", false);
                return;
            }
            else
            {
                msg = "密码错误。"; msgCls = "bad";
                Db.Log("ADMIN_LOGIN FAIL");
            }
        }
        if (Request.HttpMethod == "POST" && Request.Form["action"] == "logout")
        {
            AdminAuth.Logout();
            Response.Redirect("/pay/admin.aspx", false);
            return;
        }
        if (!AdminAuth.LoggedIn())
        {
            Response.Write(Wrap("后台登录", LoginHtml(msg, msgCls), ""));
            return;
        }

        // ---------- 已登录：操作 ----------
        string act = Request.Form["action"] ?? "";
        string orderNo = (Request.Form["no"] ?? "").Trim();

        if (Request.HttpMethod == "POST" && act == "grant" && orderNo.Length > 0)
        {
            string outMsg;
            int rc;
            try { rc = Db.GrantOrder(orderNo, (Request.Form["trade"] ?? "").Trim(), out outMsg); }
            catch (Exception ex) { rc = -1; outMsg = ex.Message; }
            if (rc == 1) { msg = "订单 " + Db.H(orderNo) + " 发放成功。"; Db.Log("GRANT OK " + orderNo); }
            else {
                msg = "订单 " + Db.H(orderNo) + " 发放失败：" + Db.H(outMsg ?? ""); msgCls = "bad";
                Db.Log("GRANT FAIL " + orderNo + " | " + outMsg);
                try { Notify.Send("【充值】发放失败", "订单：" + orderNo + "\n原因：" + (outMsg ?? "") + "\n\n后台：" + Cfg.AdminUrl); }
                catch { }
            }
        }
        else if (Request.HttpMethod == "POST" && act == "cancel" && orderNo.Length > 0)
        {
            bool ok = Db.CancelOrder(orderNo, (Request.Form["why"] ?? "").Trim());
            msg = ok ? ("订单 " + Db.H(orderNo) + " 已取消。") : "取消失败，订单状态可能已变化。";
            if (!ok) msgCls = "bad";
            Db.Log("CANCEL " + orderNo);
        }
        else if (Request.HttpMethod == "POST" && act == "testnotify")
        {
            string nr = Notify.Send("【测试】充值到账提醒",
                "这是一条测试消息。\n如果你在微信里看到它，说明到账提醒配置正常。\n" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
            if (nr == "not-configured")
            {
                msg = "还没配置推送。请把 SendKey 写进 C:\\PayApp\\App_Data\\notify.txt（一行：serverchan:你的SendKey），或跑 C:\\PayApp\\tools\\set-notify.ps1。";
                msgCls = "bad";
            }
            else
            {
                msg = "推送接口返回：" + Db.H(nr);
                if (nr.IndexOf("200") < 0) msgCls = "bad";
            }
            Db.Log("TESTNOTIFY " + nr);
        }

        int st = -1;
        int.TryParse(Request.QueryString["st"], out st);
        if (Request.QueryString["st"] == null) st = 1;
        else if (Request.QueryString["st"].Trim() == "all") st = -1;

        string q = (Request.QueryString["q"] ?? "").Trim();

        Response.Write(Wrap("充值后台", AdminBody(msg, msgCls, st, q), ""));
    }

    static string SetupHtml(string msg, string cls)
    {
        return (msg.Length > 0 ? "<div class=\"" + cls + "\">" + Db.H(msg) + "</div>" : "")
            + @"<p class=""lead"">第一次使用，请设置一个管理员密码（至少 8 位）。密码只保存加密后的哈希，不会明文存储。</p>
  <form method=""post"" action=""/pay/admin.aspx"" autocomplete=""off"">
    <input type=""hidden"" name=""action"" value=""setpwd"" />
    <div class=""row""><label>新密码</label><input type=""password"" name=""p1"" /></div>
    <div class=""row""><label>再输一次</label><input type=""password"" name=""p2"" /></div>
    <button type=""submit"" class=""go"">设 置 密 码</button>
  </form>
  <div class=""tip"">出于安全，只有当浏览器在服务器本机（localhost）打开时才能设置。</div>";
    }

    static string LoginHtml(string msg, string cls)
    {
        return (msg.Length > 0 ? "<div class=\"" + cls + "\">" + Db.H(msg) + "</div>" : "")
            + @"<form method=""post"" action=""/pay/admin.aspx"" autocomplete=""off"">
    <input type=""hidden"" name=""action"" value=""login"" />
    <div class=""row""><label>管理员密码</label><input type=""password"" name=""pwd"" /></div>
    <button type=""submit"" class=""go"">登 录</button>
  </form>";
    }

    static string StLink(string label, int s, int cur, string q)
    {
        bool on = (s == cur);
        string href = "/pay/admin.aspx?st=" + s + (q.Length > 0 ? "&q=" + HttpUtility.UrlEncode(q) : "");
        return "<a class=\"" + (on ? "tab on" : "tab") + "\" href=\"" + href + "\">" + label + "</a>";
    }

    static string AdminBody(string msg, string cls, int st, string q)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("<div class=\"topbar\"><span>已登录 ｜ 推送：" + (Notify.Enabled() ? "已配置" : "未配置") + "</span>");
        sb.Append("<a href=\"/pay/gm.aspx\" style=\"margin-left:10px;padding:6px 14px;background:#6f4df5;color:#fff;border-radius:8px;text-decoration:none;font-size:13px\">GM 发放</a>");
        sb.Append("<span>");
        sb.Append("<form method=\"post\" action=\"/pay/admin.aspx\" style=\"display:inline\"><input type=\"hidden\" name=\"action\" value=\"testnotify\" /><button class=\"smbtn\" type=\"submit\">测试推送</button></form> ");
        sb.Append("<form method=\"post\" action=\"/pay/admin.aspx\" style=\"display:inline\"><input type=\"hidden\" name=\"action\" value=\"logout\" /><button class=\"smbtn\" type=\"submit\">退出</button></form>");
        sb.Append("</span></div>");

        if (msg.Length > 0) sb.Append("<div class=\"" + cls + "\">" + msg + "</div>");

        sb.Append("<div class=\"tabs\">");
        sb.Append(StLink("待确认", 1, st, q));
        sb.Append(StLink("待支付", 0, st, q));
        sb.Append(StLink("已发放", 2, st, q));
        sb.Append(StLink("已取消", 3, st, q));
        sb.Append("<a class=\"" + (st == -1 ? "tab on" : "tab") + "\" href=\"/pay/admin.aspx?st=all" + (q.Length > 0 ? "&q=" + HttpUtility.UrlEncode(q) : "") + "\">全部</a>");
        sb.Append("</div>");

        sb.Append("<form method=\"get\" action=\"/pay/admin.aspx\" class=\"search\">");
        sb.Append("<input type=\"hidden\" name=\"st\" value=\"" + st + "\" />");
        sb.Append("<input type=\"text\" name=\"q\" value=\"" + Db.H(q) + "\" placeholder=\"按角色名 / 角色ID / 账号ID 搜索\" />");
        sb.Append("<button type=\"submit\" class=\"smbtn2\">搜索</button></form>");

        // 角色余额速查
        sb.Append("<form method=\"get\" action=\"/pay/admin.aspx\" class=\"search\">");
        sb.Append("<input type=\"hidden\" name=\"st\" value=\"" + st + "\" />");
        sb.Append("<input type=\"text\" name=\"look\" value=\"\" placeholder=\"查角色当前点券/金币（名字或ID）\" />");
        sb.Append("<button type=\"submit\" class=\"smbtn2\">查余额</button></form>");

        string look = (HttpContext.Current.Request.QueryString["look"] ?? "").Trim();
        if (look.Length > 0)
        {
            try
            {
                ActorInfo ai = Db.FindActor(look);
                if (ai == null) sb.Append("<div class=\"bad\">没找到角色：" + Db.H(look) + "</div>");
                else sb.Append("<div class=\"info2\">角色 <b>" + Db.H(ai.ActorName) + "</b>（ID " + ai.ActorID + " / 账号 " + ai.UserID
                    + "）当前：点券 <b>" + ai.Point.ToString("N0") + "</b>，身上金币 <b>" + ai.HoldMoney.ToString("N0") + "</b>"
                    + (ai.HoldMoney == 0 || ai.HoldMoney == 50000 ? "" : "") + "</div>");
            }
            catch (Exception ex) { sb.Append("<div class=\"bad\">查询失败：" + Db.H(ex.Message) + "</div>"); }
        }

        DataTable dt;
        try { dt = Db.QueryOrders(st, q, 200); }
        catch (Exception ex) { sb.Append("<div class=\"bad\">读取订单失败：" + Db.H(ex.Message) + "</div>"); return sb.ToString(); }

        if (dt.Rows.Count == 0) { sb.Append("<p class=\"lead\">没有符合条件的订单。</p>"); return sb.ToString(); }

        sb.Append("<table class=\"lst\"><tr><th>订单号</th><th>角色</th><th>类型</th><th>金额</th><th>应发</th><th>状态</th><th>下单/付款/发放</th><th>操作</th></tr>");
        foreach (DataRow r in dt.Rows)
        {
            int stt = Convert.ToInt32(r["Status"]);
            int cur = Convert.ToInt32(r["Currency"]);
            long grant = Convert.ToInt64(r["GrantAmount"]);
            decimal yuan = Convert.ToDecimal(r["AmountYuan"]);
            string no = r["OrderNo"].ToString();

            sb.Append("<tr>");
            sb.Append("<td class=\"mono\">" + Db.H(no) + "</td>");
            sb.Append("<td>" + Db.H(r["ActorName"].ToString()) + "<br /><span class=\"dim\">ID " + r["ActorID"] + " / 账号 " + r["UserID"] + "</span></td>");
            sb.Append("<td>" + Db.CurrencyText(cur) + "</td>");
            sb.Append("<td><b>¥" + yuan.ToString("0.##") + "</b></td>");
            sb.Append("<td>" + grant.ToString("N0") + "</td>");
            sb.Append("<td>" + Db.StatusText(stt) + (r["GrantResult"].ToString().Length > 0 ? "<br /><span class=\"dim\">" + Db.H(r["GrantResult"].ToString()) + "</span>" : "") + "</td>");
            sb.Append("<td class=\"dim\">" + Db.H(r["CreateTime"].ToString()) + "<br />" + Db.H(r["PaidTime"].ToString()) + "<br />" + Db.H(r["GrantTime"].ToString()) + "</td>");
            sb.Append("<td>");
            if (stt == 1 || stt == 0)
            {
                sb.Append("<form method=\"post\" action=\"/pay/admin.aspx?st=" + st + "\" onsubmit=\"return confirm('确认已收到这笔款，并立即发放？')\" class=\"act\">");
                sb.Append("<input type=\"hidden\" name=\"action\" value=\"grant\" />");
                sb.Append("<input type=\"hidden\" name=\"no\" value=\"" + Db.H(no) + "\" />");
                sb.Append("<input type=\"text\" name=\"trade\" placeholder=\"支付宝交易号(可空)\" />");
                sb.Append("<button type=\"submit\" class=\"okbtn\">确认到账并发放</button></form>");
                sb.Append("<form method=\"post\" action=\"/pay/admin.aspx?st=" + st + "\" onsubmit=\"return confirm('取消这个订单？')\" class=\"act\">");
                sb.Append("<input type=\"hidden\" name=\"action\" value=\"cancel\" />");
                sb.Append("<input type=\"hidden\" name=\"no\" value=\"" + Db.H(no) + "\" />");
                sb.Append("<input type=\"text\" name=\"why\" placeholder=\"取消原因(可空)\" />");
                sb.Append("<button type=\"submit\" class=\"badbtn\">取消</button></form>");
            }
            else
            {
                sb.Append("<span class=\"dim\">—</span>");
            }
            sb.Append("</td></tr>");
        }
        sb.Append("</table>");
        sb.Append("<p class=\"lead\">只显示最近 200 条。发放前请先核对支付宝到账金额与订单金额一致。</p>");
        return sb.ToString();
    }

    static string Wrap(string title, string body, string js)
    {
        string html = @"<!DOCTYPE html>
<html lang=""zh-CN"">
<head>
<meta charset=""utf-8"" />
<meta name=""viewport"" content=""width=device-width, initial-scale=1"" />
<title>{{TITLE}} - {{SHOP}}</title>
<style>
* { box-sizing:border-box; }
body { margin:0; padding:0; font-family:""Microsoft YaHei"",""微软雅黑"",Arial,sans-serif;
       background:#f2f4f8; color:#2a2145; padding:22px; }
.card { max-width:1180px; margin:0 auto; background:#fff; border-radius:12px; padding:22px 24px;
        box-shadow:0 10px 30px rgba(30,20,70,.08); }
.card.narrow { max-width:430px; }
h1 { margin:0 0 14px; font-size:19px; }
.lead { font-size:13px; color:#6b7285; line-height:1.9; }
label { display:block; font-size:13px; color:#4a4f63; margin:0 0 6px; font-weight:600; }
input[type=text], input[type=password] { width:100%; height:38px; padding:0 10px; font-size:14px;
        border:1px solid #d3d7e2; border-radius:7px; background:#f9fafc; outline:none; }
input[type=text]:focus, input[type=password]:focus { border-color:#7a5cf0; background:#fff; }
.row { margin-bottom:14px; }
.go { width:100%; height:42px; border:0; border-radius:8px; cursor:pointer; font-size:16px;
      font-weight:700; letter-spacing:2px; color:#fff; background:linear-gradient(90deg,#6a4df0,#9d5cf0); }
.go:hover { filter:brightness(1.08); }
.ok { background:#e8f8ee; color:#1d7a45; border:1px solid #b7e6ca; padding:10px 12px;
      border-radius:7px; font-size:13px; margin-bottom:14px; }
.bad { background:#fdeced; color:#b32b36; border:1px solid #f5c2c7; padding:10px 12px;
       border-radius:7px; font-size:13px; margin-bottom:14px; }
.info2 { background:#eef4ff; color:#2a4a8a; border:1px solid #c3d4f5; padding:10px 12px;
         border-radius:7px; font-size:13px; margin-bottom:14px; }
.tip { margin-top:14px; font-size:12px; color:#98a0b3; }
.topbar { display:flex; justify-content:space-between; align-items:center; font-size:13px; color:#6b7285; margin-bottom:12px; }
.smbtn { border:1px solid #d3d7e2; background:#fff; border-radius:6px; padding:4px 10px; cursor:pointer; color:#4a4f63; }
.tabs { display:flex; gap:8px; margin-bottom:14px; flex-wrap:wrap; }
.tab { text-decoration:none; font-size:13px; color:#4a4f63; border:1px solid #d3d7e2; border-radius:20px;
       padding:5px 14px; background:#fff; }
.tab.on { background:#6a4df0; border-color:#6a4df0; color:#fff; font-weight:700; }
.search { display:flex; gap:8px; margin-bottom:10px; }
.search input { flex:1; }
.smbtn2 { border:0; background:#6a4df0; color:#fff; border-radius:7px; padding:0 16px; cursor:pointer; font-size:13px; }
table.lst { width:100%; border-collapse:collapse; font-size:13px; }
table.lst th { text-align:left; background:#f7f8fb; color:#6b7285; font-weight:600; padding:9px 8px; border-bottom:1px solid #e6e9f0; }
table.lst td { padding:9px 8px; border-bottom:1px solid #eef0f5; vertical-align:top; }
.mono { font-family:Consolas,monospace; font-size:12px; }
.dim { color:#9aa0b0; font-size:11px; }
.act { display:flex; gap:5px; margin-bottom:5px; }
.act input { flex:1; height:30px; font-size:12px; }
.okbtn { border:0; background:#1d9d5b; color:#fff; border-radius:6px; padding:0 10px; cursor:pointer; font-size:12px; white-space:nowrap; }
.badbtn { border:0; background:#e05260; color:#fff; border-radius:6px; padding:0 10px; cursor:pointer; font-size:12px; }
</style>
</head>
<body>
<div class=""card {{CARDCLS}}"">
  <h1>{{TITLE}}</h1>
  {{BODY}}
</div>
{{JS}}
</body>
</html>";
        return html.Replace("{{TITLE}}", Db.H(title))
                   .Replace("{{SHOP}}", Db.H(Cfg.ShopName))
                   .Replace("{{CARDCLS}}", body.Length < 900 ? "narrow" : "")
                   .Replace("{{BODY}}", body)
                   .Replace("{{JS}}", js);
    }
</script>
