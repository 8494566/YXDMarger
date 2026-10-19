<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="false" %>
<%@ Import Namespace="System" %>
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
        Response.AddHeader("X-Frame-Options", "SAMEORIGIN");

        string err = "";
        string keepKey = "";
        int keepCur = 1;
        string keepAmt = "";

        string act = Request.Form["action"] ?? "";
        if (string.Equals(Request.HttpMethod, "POST", StringComparison.OrdinalIgnoreCase)
            && (act == "create" || act == "createpack"))
        {
            string key = (Request.Form["actor"] ?? "").Trim();
            string curRaw = (Request.Form["currency"] ?? "1").Trim();
            string amtRaw = (Request.Form["amount"] ?? "").Trim();
            keepKey = Db.H(key);
            keepAmt = Db.H(amtRaw);
            int cur = (curRaw == "2") ? 2 : 1;
            keepCur = cur;

            if (act == "createpack")
            {
                int gid = 0; int.TryParse(Request.Form["packid"], out gid);
                GiftPack gp = Cfg.FindPack(gid);
                if (Db.RateLimited("pay", Cfg.OrderRateLimitPerMin)) err = "操作太频繁了，请 1 分钟后再试。";
                else if (gp == null) err = "这个礼包不存在或已下架。";
                else if (key.Length < 1 || key.Length > 20) err = "请先填写角色名字或角色ID。";
                else
                {
                    try
                    {
                        ActorInfo a = Db.FindActor(key);
                        if (a == null)
                        {
                            err = "没有找到叫「" + Db.H(key) + "」的角色，请确认名字或角色ID。";
                            Db.Log("PACKNOTFOUND " + key);
                        }
                        else
                        {
                            string m2;
                            string no2 = Db.CreatePackOrder(a, gp, out m2);
                            if (no2 == null)
                            {
                                err = m2 ?? "下单失败，请稍后再试。";
                                Db.Log("PACKFAIL " + a.ActorName + " | " + gp.Name + " | " + err);
                            }
                            else
                            {
                                Db.Log("NEWPACK " + no2 + " | " + a.ActorName + " | " + gp.Name + " | " + gp.Price + "元");
                                Response.Redirect("/pay/order.aspx?no=" + Server.UrlEncode(no2), false);
                                return;
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        err = "下单失败，请稍后再试。";
                        Db.Log("PACKERR " + key + " | " + ex.Message);
                    }
                }
            }
            else
            {

            decimal amt = 0;
            bool amtOk = decimal.TryParse(amtRaw, NumberStyles.Number, CultureInfo.InvariantCulture, out amt);

            if (Db.RateLimited("pay", Cfg.OrderRateLimitPerMin))
            {
                err = "操作太频繁了，请 1 分钟后再试。";
            }
            else if (key.Length < 1 || key.Length > 20)
            {
                err = "请输入角色名字或角色ID。";
            }
            else if (!amtOk || amt < Cfg.MinYuan || amt > Cfg.MaxYuan)
            {
                err = string.Format("充值金额请填 {0} ~ {1} 元之间的数字。", Cfg.MinYuan, Cfg.MaxYuan);
            }
            else
            {
                ActorInfo a = null;
                try { a = Db.FindActor(key); }
                catch (Exception ex) { err = "查询角色出错，请稍后再试。"; Db.Log("FINDERR " + key + " | " + ex.Message); }

                if (err.Length == 0 && a == null)
                {
                    err = "没有找到叫「" + Db.H(key) + "」的角色，请确认名字或角色ID。";
                    Db.Log("NOTFOUND " + key);
                }
                else if (err.Length == 0)
                {
                    string msg;
                    try
                    {
                        string no = Db.CreateOrder(a, cur, amt, out msg);
                        if (no == null)
                        {
                            err = msg ?? "下单失败，请稍后再试。";
                        }
                        else
                        {
                            Db.Log("NEW " + no + " | " + a.ActorName + " | " + Db.CurrencyText(cur) + " | " + amt + "元");
                            Response.Redirect("/pay/order.aspx?no=" + Server.UrlEncode(no), false);
                            return;
                        }
                    }
                    catch (Exception ex)
                    {
                        err = "下单失败，请稍后再试。";
                        Db.Log("NEWERR " + a.ActorName + " | " + ex.Message);
                    }
                }
            }
            }
        }

        Response.Write(PageHtml(err, keepKey, keepCur, keepAmt));
    }

    static string PacksHtml()
    {
        List<GiftPack> packs = Cfg.GiftPacks();
        if (packs.Count == 0) return "";
        StringBuilder sb = new StringBuilder();
        sb.Append("<div class=\"packsec\"><div class=\"packtitle\">充值礼包（每个角色限购 ")
          .Append(Cfg.PackLimitPerActor).Append(" 次）</div>");
        foreach (GiftPack p in packs)
        {
            sb.Append("<div class=\"pack\"><div class=\"pl\"><div class=\"pn\">").Append(Db.H(p.Name)).Append("</div>")
              .Append("<div class=\"pd\">").Append(Db.H(p.Desc)).Append("</div></div>")
              .Append("<div class=\"pr\"><div class=\"pp\">¥").Append(p.Price.ToString("0.##")).Append("</div>")
              .Append("<button type=\"button\" class=\"pbtn\" onclick=\"payBuyPack(").Append(p.GoodsID).Append(")\">购买</button></div></div>");
        }
        sb.Append("</div>");
        return sb.ToString();
    }

    static string PageHtml(string err, string keepKey, int keepCur, string keepAmt)
    {
        string jsTag = "<script src=\"/pay/pay.js?v=1\"></scr" + "ipt>";
        string errHtml = (err.Length > 0)
            ? "<div class=\"bad\">" + Db.H(err) + "</div>"
            : "";

        string html = @"<!DOCTYPE html>
<html lang=""zh-CN"">
<head>
<meta charset=""utf-8"" />
<meta name=""viewport"" content=""width=device-width, initial-scale=1"" />
<title>{{SHOP}} - 充值</title>
<style>
* { box-sizing: border-box; }
body { margin:0; padding:0; font-family:""Microsoft YaHei"",""微软雅黑"",Arial,sans-serif;
       background:linear-gradient(160deg,#1b1436 0%,#2b1b52 55%,#120c26 100%);
       min-height:100vh; display:flex; align-items:center; justify-content:center; padding:24px; }
.card { width:100%; max-width:460px; background:#fff; border-radius:14px; padding:28px 26px 24px;
        box-shadow:0 18px 50px rgba(0,0,0,.5); }
h1 { margin:0 0 4px; font-size:21px; color:#2a2145; letter-spacing:1px; }
.sub { margin:0 0 20px; font-size:13px; color:#8b90a0; }
label { display:block; font-size:13px; color:#4a4f63; margin:0 0 6px; font-weight:600; }
input[type=text] { width:100%; height:42px; padding:0 12px; font-size:15px;
        border:1px solid #d3d7e2; border-radius:8px; background:#f9fafc; outline:none; }
input[type=text]:focus { border-color:#7a5cf0; background:#fff; box-shadow:0 0 0 3px rgba(122,92,240,.15); }
.row { margin-bottom:16px; }
.cur { display:flex; gap:10px; }
.cur label { flex:1; margin:0; cursor:pointer; }
.cur input { display:none; }
.cur .box { border:2px solid #e2e5ee; border-radius:10px; padding:10px 12px; text-align:center;
            transition:.15s; }
.cur .box .t { font-size:15px; font-weight:700; color:#2a2145; }
.cur .box .r { font-size:11px; color:#8b90a0; margin-top:3px; }
.cur input:checked + .box { border-color:#7a5cf0; background:#f4f1fe; }
.amts { display:flex; gap:8px; flex-wrap:wrap; margin-top:8px; }
.amts button { flex:1 0 21%; height:36px; border:1px solid #d3d7e2; background:#fff; border-radius:8px;
               cursor:pointer; font-size:14px; color:#4a4f63; }
.amts button:hover { border-color:#7a5cf0; color:#7a5cf0; }
.go { width:100%; height:46px; margin-top:6px; border:0; border-radius:9px; cursor:pointer;
      font-size:17px; font-weight:700; letter-spacing:3px; color:#fff;
      background:linear-gradient(90deg,#6a4df0,#9d5cf0); }
.go:hover { filter:brightness(1.08); }
.go:disabled { opacity:.6; cursor:default; }
.bad { background:#fdeced; color:#b32b36; border:1px solid #f5c2c7; padding:11px 13px;
       border-radius:8px; font-size:14px; margin-bottom:16px; }
.tip { margin-top:16px; font-size:12px; color:#98a0b3; line-height:1.8; border-top:1px solid #eef0f5; padding-top:12px; }
.tip a { color:#7a5cf0; }
.altbtn { display:block; margin-top:14px; height:44px; line-height:44px; text-align:center;
          border:1px solid #6a4df0; border-radius:9px; color:#5a3ee0; font-size:15px;
          font-weight:700; letter-spacing:1px; text-decoration:none; background:#f6f4ff; }
.altbtn:hover { background:#efebff; }
.altbtn b { color:#e4393c; }
.packsec { margin-top:18px; border-top:1px solid #eef0f5; padding-top:14px; }
.packtitle { font-size:13px; font-weight:700; color:#4a4f63; margin-bottom:10px; }
.pack { display:flex; align-items:center; justify-content:space-between; gap:10px;
        border:1px solid #e2e5ee; border-radius:10px; padding:10px 12px; margin-bottom:9px; }
.pack .pl { flex:1; min-width:0; }
.pack .pn { font-size:15px; font-weight:700; color:#2a2145; }
.pack .pd { font-size:11px; color:#8b90a0; margin-top:3px; line-height:1.6; }
.pack .pr { text-align:center; }
.pack .pp { font-size:14px; font-weight:700; color:#e4393c; margin-bottom:4px; }
.pbtn { border:0; background:#6a4df0; color:#fff; border-radius:7px; padding:6px 14px; cursor:pointer; font-size:13px; font-weight:700; }
.pbtn:hover { filter:brightness(1.08); }
</style>
</head>
<body>
<div class=""card"">
  <h1>{{SHOP}}</h1>
  <p class=""sub"">填写角色 → 选择区币种 → 输入金额 → 扫码支付</p>
  {{ERR}}
  <form method=""post"" action=""/pay/Default.aspx"" autocomplete=""off"" id=""f"">
    <input type=""hidden"" name=""action"" id=""hidact"" value=""create"" />
    <input type=""hidden"" name=""packid"" id=""packid"" value="""" />
    <div class=""row"">
      <label>角色名字 或 角色ID</label>
      <input type=""text"" name=""actor"" maxlength=""20"" value=""{{KEY}}""
             placeholder=""例如：将五一 或 10000"" autocomplete=""off"" />
    </div>
    <div class=""row"">
      <label>选择充值类型</label>
      <div class=""cur"">
        <label><input type=""radio"" name=""currency"" value=""1"" {{C1}} />
          <div class=""box""><div class=""t"">点券</div><div class=""r"">1 元 = {{RP}} 点券</div></div></label>
        <label><input type=""radio"" name=""currency"" value=""2"" {{C2}} />
          <div class=""box""><div class=""t"">金币</div><div class=""r"">1 元 = {{RG}} 金币</div></div></label>
      </div>
    </div>
    <div class=""row"">
      <label>充值金额（元）</label>
      <input type=""text"" name=""amount"" maxlength=""8"" value=""{{AMT}}"" placeholder=""输入金额"" autocomplete=""off"" />
      <div class=""amts"">
        <button type=""button"" onclick=""payFill(10)"">10 元</button>
        <button type=""button"" onclick=""payFill(30)"">30 元</button>
        <button type=""button"" onclick=""payFill(50)"">50 元</button>
        <button type=""button"" onclick=""payFill(100)"">100 元</button>
        <button type=""button"" onclick=""payFill(200)"">200 元</button>
        <button type=""button"" onclick=""payFill(500)"">500 元</button>
        <button type=""button"" onclick=""payFill(1000)"">1000 元</button>
        <button type=""button"" onclick=""payFill(0)"">清空</button>
      </div>
    </div>
    <button type=""submit"" class=""go"" id=""sub"">立 即 下 单</button>
    {{PACKS}}
  </form>
  <div class=""tip"">
    已经有订单？<a href=""/pay/order.aspx"">查询订单状态</a><br />
    下单后会显示收款二维码，付款完成后点「我已付款」，客服确认到账即自动发放。
  </div>
  <a class=""altbtn"" href='/register/'>还没有账号？先去注册 <b>→</b></a>
</div>
{{JS}}
</body>
</html>";

        return html.Replace("{{SHOP}}", Db.H(Cfg.ShopName))
                   .Replace("{{ERR}}", errHtml)
                   .Replace("{{KEY}}", keepKey)
                   .Replace("{{AMT}}", keepAmt)
                   .Replace("{{C1}}", keepCur == 1 ? "checked" : "")
                   .Replace("{{C2}}", keepCur == 2 ? "checked" : "")
                   .Replace("{{RP}}", Cfg.RatePointsPerYuan.ToString("N0"))
                   .Replace("{{RG}}", Cfg.RateGoldPerYuan.ToString("N0"))
                   .Replace("{{PACKS}}", PacksHtml())
                   .Replace("{{JS}}", jsTag);
    }
</script>
