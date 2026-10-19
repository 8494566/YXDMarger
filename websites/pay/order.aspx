<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="false" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.Text.RegularExpressions" %>
<%@ Import Namespace="System.Web" %>
<%@ Import Namespace="System.Globalization" %>
<script runat="server">

    void Page_Load(object sender, EventArgs e)
    {
        Response.ContentEncoding = Encoding.UTF8;
        Response.ContentType = "text/html";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.AddHeader("X-Content-Type-Options", "nosniff");

        string no = (Request.QueryString["no"] ?? Request.Form["no"] ?? "").Trim();

        if (string.Equals(Request.HttpMethod, "POST", StringComparison.OrdinalIgnoreCase)
            && Request.Form["action"] == "paid")
        {
            bool ok;
            try { ok = Db.MarkPaid(no); }
            catch { ok = false; }
            if (ok)
            {
                Db.Log("PAID " + no);
                // 推到管理员微信
                try
                {
                    DataRow o = Db.GetOrder(no);
                    if (o != null)
                    {
                        int cu = Convert.ToInt32(o["Currency"]);
                        string body = "金额：¥" + Convert.ToDecimal(o["AmountYuan"]).ToString("0.##")
                            + "\n类型：" + Db.CurrencyText(cu)
                            + "\n应发：" + Convert.ToInt64(o["GrantAmount"]).ToString("N0") + " " + Db.CurrencyText(cu)
                            + "\n角色：" + o["ActorName"] + "（ID " + o["ActorID"] + "）"
                            + "\n订单：" + no
                            + "\n\n玩家已付款，请核对到账后到这里确认：\n" + Cfg.AdminUrl;
                        string ts = DateTime.Now.ToString("MM-dd HH:mm");
                        string nr = Notify.Send("【充值】¥" + Convert.ToDecimal(o["AmountYuan"]).ToString("0.##") + " " + ts, body);
                        Db.Log("NOTIFY paid " + no + " | " + nr);
                    }
                }
                catch (Exception nex) { Db.Log("NOTIFYERR " + no + " | " + nex.Message); }
            }
            Response.Redirect("/pay/order.aspx?no=" + Server.UrlEncode(no) + (ok ? "&marked=1" : ""), false);
            return;
        }

        Response.Write(PageHtml(no));
    }

    static string PageHtml(string no)
    {
        string jsTag = "<script src=\"/pay/pay.js?v=1\"></scr" + "ipt>";

        if (no.Length == 0)
        {
            return Wrap("查询订单", "<p class=\"lead\">输入下单时拿到的订单号，查看处理进度。</p>"
                + "<form method=\"get\" action=\"/pay/order.aspx\" autocomplete=\"off\">"
                + "<div class=\"row\"><label>订单号</label>"
                + "<input type=\"text\" name=\"no\" maxlength=\"32\" placeholder=\"例如 P2609231730001234\" autocomplete=\"off\" /></div>"
                + "<button type=\"submit\" class=\"go\" id=\"sub\">查 询</button></form>"
                + "<div class=\"tip\"><a href=\"/pay/\">← 返回充值页</a></div>", jsTag);
        }

        if (!Regex.IsMatch(no, "^[A-Za-z0-9-]{6,32}$"))
        {
            return Wrap("查询订单", "<div class=\"bad\">订单号格式不正确。</div>"
                + "<div class=\"tip\"><a href=\"/pay/order.aspx\">← 重新输入</a></div>", jsTag);
        }

        DataRow r;
        try { r = Db.GetOrder(no); }
        catch (Exception ex) { Db.Log("GETERR " + no + " | " + ex.Message); r = null; }

        if (r == null)
        {
            return Wrap("查询订单", "<div class=\"bad\">没有找到这个订单号。</div>"
                + "<div class=\"tip\"><a href=\"/pay/order.aspx\">← 重新输入</a></div>", jsTag);
        }

        int status = Convert.ToInt32(r["Status"]);
        int currency = Convert.ToInt32(r["Currency"]);
        string actorName = r["ActorName"].ToString();
        long grant = Convert.ToInt64(r["GrantAmount"]);
        decimal yuan = Convert.ToDecimal(r["AmountYuan"]);
        string createTime = r["CreateTime"].ToString();
        string paidTime = r["PaidTime"].ToString();
        string grantTime = r["GrantTime"].ToString();
        string note = r["GrantResult"].ToString();
        string goodsName = r["GoodsName"].ToString();
        int goodsNum = Convert.ToInt32(r["GoodsNum"]);

        StringBuilder hb = new StringBuilder();
        hb.Append("<div class=\"ono\">").Append(Db.H(no)).Append("</div>\n");
        hb.Append("<div class=\"amt\">¥").Append(yuan.ToString("0.##")).Append(" <span class=\"cur\">")
          .Append(Db.CurrencyText(currency)).Append("</span></div>\n");
        hb.Append("<div class=\"stbar ").Append(status == 2 ? "st-ok" : (status == 3 ? "st-bad" : "st-wait"))
          .Append("\"><b>").Append(Db.StatusText(status)).Append("</b></div>\n");
        hb.Append("<table class=\"info\">\n");
        hb.Append("<tr><td>角色</td><td>").Append(Db.H(actorName)).Append("（ID ").Append(r["ActorID"]).Append("）</td></tr>\n");
        hb.Append("<tr><td>").Append(currency == 3 ? "礼包" : "应发数量").Append("</td><td>");
        if (currency == 3) hb.Append(Db.H(goodsName)).Append(" ×").Append(goodsNum);
        else hb.Append(grant.ToString("N0")).Append(" ").Append(Db.CurrencyText(currency));
        hb.Append("</td></tr>\n");
        hb.Append("<tr><td>下单时间</td><td>").Append(Db.H(createTime)).Append("</td></tr>\n");
        if (paidTime.Length > 0) hb.Append("<tr><td>付款通知</td><td>").Append(Db.H(paidTime)).Append("</td></tr>\n");
        if (grantTime.Length > 0) hb.Append("<tr><td>发放时间</td><td>").Append(Db.H(grantTime)).Append("</td></tr>\n");
        if (note.Length > 0) hb.Append("<tr><td>备注</td><td>").Append(Db.H(note)).Append("</td></tr>\n");
        hb.Append("</table>\n");

        if (status == 0)
        {
            List<QrItem> qrs = Db.QrAll();
            if (qrs.Count > 0)
            {
                hb.Append("<div class=\"qrwrap\">");
                foreach (QrItem q in qrs)
                {
                    hb.Append("<div class=\"qrbox\"><div class=\"qrlabel\">").Append(Db.H(q.Label)).Append("</div>")
                      .Append("<img src=\"").Append(Db.H(q.Url)).Append("\" alt=\"").Append(Db.H(q.Label)).Append("收款码\" /></div>");
                }
                hb.Append("</div>\n<div class=\"qrtip\">请扫码支付 <b>¥").Append(yuan.ToString("0.##")).Append("</b></div>\n");
            }
            else
            {
                hb.Append("<div class=\"bad\">管理员还没有配置收款二维码，请联系客服。</div>\n");
            }
            hb.Append("<form method=\"post\" action=\"/pay/order.aspx\" onsubmit=\"return payBusy()\">")
              .Append("<input type=\"hidden\" name=\"action\" value=\"paid\" />")
              .Append("<input type=\"hidden\" name=\"no\" value=\"").Append(Db.H(no)).Append("\" />")
              .Append("<button type=\"submit\" class=\"go\" id=\"sub\">我 已 付 款</button></form>\n");
        }
        else if (status == 1 || status == 15)
        {
            hb.Append("<div class=\"wait\">已收到你的付款通知，客服正在核对到账，<br />确认后会自动发放，请稍等片刻再刷新本页。</div>\n");
            hb.Append("<div class=\"tip\"><a href=\"/pay/order.aspx?no=").Append(Db.H(no)).Append("\">刷新状态</a></div>\n");
        }
        else if (status == 2)
        {
            hb.Append("<div class=\"ok\">已发放完成：");
            if (currency == 3) hb.Append(Db.H(goodsName)).Append(" ×").Append(goodsNum);
            else hb.Append(grant.ToString("N0")).Append(" ").Append(Db.CurrencyText(currency));
            if (currency == 2 || currency == 3) hb.Append("<br /><span class=\"sm\">已发到游戏内邮箱，请登录游戏在邮箱里领取。</span>");
            else hb.Append("<br /><span class=\"sm\">点券已到账，直接进游戏即可。</span>");
            hb.Append("</div>\n");
        }
        else if (status == 3)
        {
            hb.Append("<div class=\"bad\">该订单已取消。");
            if (note.Length > 0) hb.Append("<br /><span class=\"sm\">").Append(Db.H(note)).Append("</span>");
            hb.Append("</div>\n");
        }

        hb.Append("<div class=\"tip\"><a href=\"/pay/\">← 返回充值页</a> ｜ <a href=\"/pay/order.aspx\">查询其它订单</a></div>");

        return Wrap("订单 " + Db.H(no), hb.ToString(), jsTag);
    }

    static string Wrap(string title, string body, string jsTag)
    {
        string html = @"<!DOCTYPE html>
<html lang=""zh-CN"">
<head>
<meta charset=""utf-8"" />
<meta name=""viewport"" content=""width=device-width, initial-scale=1"" />
<title>{{SHOP}} - {{TITLE}}</title>
<style>
* { box-sizing: border-box; }
body { margin:0; padding:0; font-family:""Microsoft YaHei"",""微软雅黑"",Arial,sans-serif;
       background:linear-gradient(160deg,#1b1436 0%,#2b1b52 55%,#120c26 100%);
       min-height:100vh; display:flex; align-items:center; justify-content:center; padding:24px; }
.card { width:100%; max-width:460px; background:#fff; border-radius:14px; padding:26px 24px 22px;
        box-shadow:0 18px 50px rgba(0,0,0,.5); }
h1 { margin:0 0 4px; font-size:20px; color:#2a2145; letter-spacing:1px; }
.sub { margin:0 0 18px; font-size:13px; color:#8b90a0; }
label { display:block; font-size:13px; color:#4a4f63; margin:0 0 6px; font-weight:600; }
input[type=text] { width:100%; height:42px; padding:0 12px; font-size:15px;
        border:1px solid #d3d7e2; border-radius:8px; background:#f9fafc; outline:none; }
input[type=text]:focus { border-color:#7a5cf0; background:#fff; }
.row { margin-bottom:16px; }
.go { width:100%; height:46px; margin-top:6px; border:0; border-radius:9px; cursor:pointer;
      font-size:17px; font-weight:700; letter-spacing:3px; color:#fff;
      background:linear-gradient(90deg,#6a4df0,#9d5cf0); }
.go:hover { filter:brightness(1.08); }
.go:disabled { opacity:.6; cursor:default; }
.lead { font-size:14px; color:#5a6072; margin:0 0 16px; }
.bad { background:#fdeced; color:#b32b36; border:1px solid #f5c2c7; padding:11px 13px;
       border-radius:8px; font-size:14px; margin-bottom:14px; }
.ok { background:#e8f8ee; color:#1d7a45; border:1px solid #b7e6ca; padding:12px 14px;
      border-radius:8px; font-size:15px; margin-bottom:14px; }
.wait { background:#fff7e6; color:#8a6100; border:1px solid #ffd591; padding:12px 14px;
        border-radius:8px; font-size:14px; line-height:1.7; margin-bottom:14px; }
.sm { font-size:12px; opacity:.85; }
.ono { font-size:13px; color:#8b90a0; word-break:break-all; margin-bottom:6px; }
.amt { font-size:30px; font-weight:800; color:#2a2145; margin-bottom:10px; }
.amt .cur { font-size:14px; font-weight:600; color:#7a5cf0; margin-left:4px; }
.stbar { display:inline-block; padding:4px 12px; border-radius:20px; font-size:13px; margin-bottom:16px; }
.st-wait { background:#fff2d8; color:#8a6100; }
.st-ok { background:#e2f7ea; color:#1d7a45; }
.st-bad { background:#fdeced; color:#b32b36; }
table.info { width:100%; border-collapse:collapse; margin-bottom:16px; font-size:13px; }
table.info td { padding:7px 0; border-bottom:1px solid #eef0f5; color:#4a4f63; }
table.info td:first-child { color:#9298a8; width:88px; }
.qrwrap { display:flex; gap:14px; justify-content:center; flex-wrap:wrap; margin:8px 0 6px; }
.qrbox { text-align:center; }
.qrlabel { font-size:12px; color:#6b7285; margin-bottom:5px; font-weight:600; }
.qrbox img { width:196px; height:196px; object-fit:contain; border:1px solid #e2e5ee; border-radius:10px; background:#fff; padding:6px; }
.qrtip { font-size:14px; color:#4a4f63; margin:10px 0 16px; }
.qrtip b { color:#e4393c; font-size:17px; }
.tip { margin-top:16px; font-size:12px; color:#98a0b3; line-height:1.9; border-top:1px solid #eef0f5; padding-top:12px; }
.tip a { color:#7a5cf0; text-decoration:none; }
</style>
</head>
<body>
<div class=""card"">
  <h1>{{SHOP}}</h1>
  <p class=""sub"">{{TITLE}}</p>
  {{BODY}}
</div>
{{JS}}
</body>
</html>";
        return html.Replace("{{SHOP}}", Db.H(Cfg.ShopName))
                   .Replace("{{TITLE}}", title)
                   .Replace("{{BODY}}", body)
                   .Replace("{{JS}}", jsTag);
    }
</script>
