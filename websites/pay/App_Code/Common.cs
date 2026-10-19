using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

// =====================================================================
//  游戏充值中心 —— 公共逻辑
//  数据库账号：IIS APPPOOL\PayApp（非 sa，最小权限）
//  可访问：PayCenter.dbo.WebRechargeOrder (SELECT/INSERT/UPDATE)
//          GameDB.dbo.Actor (SELECT)
//          GameDB.dbo.PrGs_GameUser_Points_Add / PrGs_GameEmail_Add_V5 (EXECUTE)
// =====================================================================

public static class Cfg
{
    public static string Get(string key, string def)
    {
        string v = ConfigurationManager.AppSettings[key];
        return string.IsNullOrEmpty(v) ? def : v.Trim();
    }
    public static int GetInt(string key, int def)
    {
        int r;
        return int.TryParse(Get(key, def.ToString(CultureInfo.InvariantCulture)), out r) ? r : def;
    }
    public static decimal GetDec(string key, string def)
    {
        decimal r;
        return decimal.TryParse(Get(key, def), NumberStyles.Number, CultureInfo.InvariantCulture, out r) ? r : decimal.Parse(def, CultureInfo.InvariantCulture);
    }

    public static string PayConn { get { return ConfigurationManager.ConnectionStrings["PayCenter"].ConnectionString; } }
    public static int RatePointsPerYuan { get { return GetInt("RatePointsPerYuan", 10000); } }
    public static int RateGoldPerYuan { get { return GetInt("RateGoldPerYuan", 500000); } }
    public static decimal MinYuan { get { return GetDec("MinYuan", "1"); } }
    public static decimal MaxYuan { get { return GetDec("MaxYuan", "10000"); } }
    public static string AlipayQrImage { get { return Get("AlipayQrImage", "/pay/qr/alipay.png"); } }
    public static string AlipayQrUrl { get { return Get("AlipayQrUrl", ""); } }
    public static string ShopName { get { return Get("ShopName", "游戏充值中心"); } }
    public static int OrderRateLimitPerMin { get { return GetInt("OrderRateLimitPerMin", 10); } }
    public static string AdminAllowIps { get { return Get("AdminAllowIps", ""); } }
    public static string AdminUrl { get { return Get("AdminUrl", ""); } }
    public static int AdminSessionMinutes { get { return GetInt("AdminSessionMinutes", 30); } }
    public static string AdminNotes { get { return Get("AdminNotes", ""); } }

    public static int PackLimitPerActor { get { return GetInt("PackLimitPerActor", 1); } }

    // 礼包配置，格式：
    //   GoodsID|名称|价格元|描述|数量  ;; 多个用分号隔开
    public static List<GiftPack> GiftPacks()
    {
        List<GiftPack> list = new List<GiftPack>();
        string raw = Get("GiftPacks", "");
        if (raw.Length == 0) return list;
        foreach (string one in raw.Split(';'))
        {
            string s = one.Trim();
            if (s.Length == 0) continue;
            string[] p = s.Split('|');
            if (p.Length < 4) continue;
            int gid; decimal price; int num = 1;
            if (!int.TryParse(p[0].Trim(), out gid)) continue;
            if (!decimal.TryParse(p[2].Trim(), NumberStyles.Number, CultureInfo.InvariantCulture, out price)) continue;
            if (p.Length >= 5) int.TryParse(p[4].Trim(), out num);
            if (num < 1) num = 1;
            GiftPack gp = new GiftPack();
            gp.GoodsID = gid;
            gp.Name = p[1].Trim();
            gp.Price = price;
            gp.Desc = p[3].Trim();
            gp.GoodsNum = num;
            list.Add(gp);
        }
        return list;
    }

    public static GiftPack FindPack(int goodsId)
    {
        foreach (GiftPack p in GiftPacks()) if (p.GoodsID == goodsId) return p;
        return null;
    }
}

public sealed class ActorInfo
{
    public int ActorID;
    public int UserID;
    public string ActorName;
    public int Point;
    public int HoldMoney;
}

public sealed class QrItem
{
    public string Label;
    public string Url;
}

// 充值礼包（页面上按价格卖的套餐，买完发到游戏内邮箱）
public sealed class GiftPack
{
    public int GoodsID;
    public string Name;
    public decimal Price;
    public string Desc;
    public int GoodsNum;
}

public static class Db
{
    public static SqlConnection Open()
    {
        SqlConnection cn = new SqlConnection(Cfg.PayConn);
        cn.Open();
        return cn;
    }

    public static string H(string s) { return HttpUtility.HtmlEncode(s == null ? "" : s); }

    public static string Ip()
    {
        string ip = HttpContext.Current.Request.UserHostAddress;
        if (string.IsNullOrEmpty(ip)) ip = "unknown";
        if (ip == "::1") ip = "127.0.0.1";
        return ip.Length > 15 ? ip.Substring(0, 15) : ip;
    }

    // ---------- 限流 ----------
    public static bool RateLimited(string bucket, int perMin)
    {
        string key = "rl:" + bucket + ":" + Ip();
        object o = HttpRuntime.Cache[key];
        int n = (o == null) ? 0 : (int)o;
        if (n >= perMin) return true;
        HttpRuntime.Cache.Insert(key, n + 1, null, DateTime.UtcNow.AddMinutes(1), System.Web.Caching.Cache.NoSlidingExpiration);
        return false;
    }

    // ---------- 角色查询 ----------
    public static ActorInfo FindActor(string key)
    {
        key = (key == null) ? "" : key.Trim();
        if (key.StartsWith("#")) key = key.Substring(1).Trim();
        if (key.Length == 0) return null;

        bool numeric = Regex.IsMatch(key, @"^[0-9]{1,10}$");
        string sql = numeric
            ? "SELECT ActorID, UsreID, ActorName, ISNULL(Point,0), ISNULL(HoldMoney,0) FROM GameDB.dbo.Actor WHERE ActorID = @k;"
            : "SELECT ActorID, UsreID, ActorName, ISNULL(Point,0), ISNULL(HoldMoney,0) FROM GameDB.dbo.Actor WHERE ActorName = @k;";

        using (SqlConnection cn = Open())
        using (SqlCommand cmd = new SqlCommand(sql, cn))
        {
            cmd.CommandTimeout = 10;
            if (numeric) cmd.Parameters.Add("@k", SqlDbType.Int).Value = int.Parse(key);
            else cmd.Parameters.Add("@k", SqlDbType.NVarChar, 32).Value = key;
            using (SqlDataReader rd = cmd.ExecuteReader())
            {
                if (!rd.Read()) return null;
                ActorInfo a = new ActorInfo();
                a.ActorID = rd.GetInt32(0);
                a.UserID = rd.GetInt32(1);
                a.ActorName = rd.GetString(2);
                a.Point = rd.GetInt32(3);
                a.HoldMoney = rd.GetInt32(4);
                return a;
            }
        }
    }

    // ---------- 订单 ----------
    public static string NewOrderNo()
    {
        byte[] r = new byte[4];
        using (RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider()) rng.GetBytes(r);
        string tail = (BitConverter.ToUInt32(r, 0) % 1000000).ToString("D6");
        return "P" + DateTime.Now.ToString("yyMMddHHmmss") + tail;
    }

    // currency: 1=点券 2=金币 ; 成功返回订单号，失败返回 null（并给出 msg）
    public static string CreateOrder(ActorInfo a, int currency, decimal yuan, out string msg)
    {
        msg = null;
        long grant = (currency == 2)
            ? (long)Math.Round(yuan * Cfg.RateGoldPerYuan, MidpointRounding.AwayFromZero)
            : (long)Math.Round(yuan * Cfg.RatePointsPerYuan, MidpointRounding.AwayFromZero);
        if (grant <= 0) { msg = "金额太小"; return null; }
        if (grant > 2000000000L) { msg = "金额太大，请联系客服"; return null; }

        for (int attempt = 0; attempt < 5; attempt++)
        {
            string no = NewOrderNo();
            try
            {
                using (SqlConnection cn = Open())
                using (SqlCommand cmd = new SqlCommand(
                    "INSERT INTO PayCenter.dbo.WebRechargeOrder " +
                    "(OrderNo, UserID, ActorID, ActorName, Currency, AmountYuan, GrantAmount, Status, CreateIp) " +
                    "VALUES (@no, @uid, @aid, @an, @cur, @amt, @ga, 0, @ip);", cn))
                {
                    cmd.CommandTimeout = 10;
                    cmd.Parameters.Add("@no", SqlDbType.VarChar, 32).Value = no;
                    cmd.Parameters.Add("@uid", SqlDbType.Int).Value = a.UserID;
                    cmd.Parameters.Add("@aid", SqlDbType.Int).Value = a.ActorID;
                    cmd.Parameters.Add("@an", SqlDbType.VarChar, 18).Value = a.ActorName;
                    cmd.Parameters.Add("@cur", SqlDbType.TinyInt).Value = (byte)currency;
                    cmd.Parameters.Add("@amt", SqlDbType.Decimal).Value = yuan;
                    cmd.Parameters["@amt"].Precision = 10; cmd.Parameters["@amt"].Scale = 2;
                    cmd.Parameters.Add("@ga", SqlDbType.BigInt).Value = grant;
                    cmd.Parameters.Add("@ip", SqlDbType.VarChar, 16).Value = Ip();
                    cmd.ExecuteNonQuery();
                    return no;
                }
            }
            catch (SqlException ex)
            {
                if (ex.Number == 2627 || ex.Number == 2601) continue;  // 订单号撞了，重试
                throw;
            }
        }
        msg = "系统繁忙，请重试";
        return null;
    }

    // ---------- 礼包 ----------

    // 该角色这个礼包已经“占用”的单数。
    // 口径：待确认/发放中/已发放都算；待支付（0）只算最近 N 分钟内的，
    // 这样既能挡住马上重复下单，又不会因为玩家下了单不付款而把他永久锁死。
    public static long PackBuyCount(int actorId, int goodsId)
    {
        using (SqlConnection cn = Open())
        using (SqlCommand cmd = new SqlCommand(
            "SELECT COUNT(*) FROM PayCenter.dbo.WebRechargeOrder " +
            "WHERE ActorID=@a AND Currency=3 AND GoodsID=@g " +
            "AND (Status IN (1,2,15) OR (Status=0 AND CreateTime > DATEADD(minute, -@m, GETDATE())));", cn))
        {
            cmd.CommandTimeout = 10;
            cmd.Parameters.Add("@a", SqlDbType.Int).Value = actorId;
            cmd.Parameters.Add("@g", SqlDbType.Int).Value = goodsId;
            cmd.Parameters.Add("@m", SqlDbType.Int).Value = Cfg.GetInt("PackPendingMinutes", 30);
            return Convert.ToInt64(cmd.ExecuteScalar());
        }
    }

    // 已经真正发放成功的单数（发放前再查一次，卡死并发透发）
    public static long PackDeliveredCount(int actorId, int goodsId)
    {
        using (SqlConnection cn = Open())
        using (SqlCommand cmd = new SqlCommand(
            "SELECT COUNT(*) FROM PayCenter.dbo.WebRechargeOrder " +
            "WHERE ActorID=@a AND Currency=3 AND GoodsID=@g AND Status=2;", cn))
        {
            cmd.CommandTimeout = 10;
            cmd.Parameters.Add("@a", SqlDbType.Int).Value = actorId;
            cmd.Parameters.Add("@g", SqlDbType.Int).Value = goodsId;
            return Convert.ToInt64(cmd.ExecuteScalar());
        }
    }

    public static string CreatePackOrder(ActorInfo a, GiftPack gp, out string msg)
    {
        msg = null;
        if (a == null || gp == null) { msg = "参数错误"; return null; }
        if (PackBuyCount(a.ActorID, gp.GoodsID) >= Cfg.PackLimitPerActor)
        {
            msg = "「" + gp.Name + "」每个角色限购 " + Cfg.PackLimitPerActor + " 次，这个角色已经买过了。";
            return null;
        }
        for (int attempt = 0; attempt < 5; attempt++)
        {
            string no = NewOrderNo();
            try
            {
                using (SqlConnection cn = Open())
                using (SqlCommand cmd = new SqlCommand(
                    "INSERT INTO PayCenter.dbo.WebRechargeOrder " +
                    "(OrderNo, UserID, ActorID, ActorName, Currency, AmountYuan, GrantAmount, GoodsID, GoodsNum, GoodsName, Status, CreateIp) " +
                    "VALUES (@no, @uid, @aid, @an, 3, @amt, @ga, @gid, @gnum, @gname, 0, @ip);", cn))
                {
                    cmd.CommandTimeout = 10;
                    cmd.Parameters.Add("@no", SqlDbType.VarChar, 32).Value = no;
                    cmd.Parameters.Add("@uid", SqlDbType.Int).Value = a.UserID;
                    cmd.Parameters.Add("@aid", SqlDbType.Int).Value = a.ActorID;
                    cmd.Parameters.Add("@an", SqlDbType.VarChar, 18).Value = a.ActorName;
                    cmd.Parameters.Add("@amt", SqlDbType.Decimal).Value = gp.Price;
                    cmd.Parameters["@amt"].Precision = 10; cmd.Parameters["@amt"].Scale = 2;
                    cmd.Parameters.Add("@ga", SqlDbType.BigInt).Value = (long)gp.GoodsNum;
                    cmd.Parameters.Add("@gid", SqlDbType.Int).Value = gp.GoodsID;
                    cmd.Parameters.Add("@gnum", SqlDbType.Int).Value = gp.GoodsNum;
                    cmd.Parameters.Add("@gname", SqlDbType.NVarChar, 32).Value = gp.Name;
                    cmd.Parameters.Add("@ip", SqlDbType.VarChar, 16).Value = Ip();
                    cmd.ExecuteNonQuery();
                    return no;
                }
            }
            catch (SqlException ex)
            {
                if (ex.Number == 2627 || ex.Number == 2601) continue;
                throw;
            }
        }
        msg = "系统繁忙，请重试";
        return null;
    }

    // 构造邮件附件缓冲（525 字节 = 8 字节头 + 每格 105 字节）
    // 字段偏移按 PrGs_GameEmail_Open_V1 / PrGs_GameEmail_Update_V5 反推，
    // 并与库里现有系统礼包邮件逐字节对齐过。
    public static byte[] BuildGoodsBuf(int goodsId, int goodsNum)
    {
        byte[] buf = new byte[525];
        int b = 8;
        buf[b + 0] = (byte)(goodsId & 0xFF);
        buf[b + 1] = (byte)((goodsId >> 8) & 0xFF);
        buf[b + 2] = (byte)((goodsId >> 16) & 0xFF);
        buf[b + 3] = (byte)((goodsId >> 24) & 0xFF);
        buf[b + 4] = 0;                        // ContainerID
        buf[b + 5] = 0;                        // Place
        buf[b + 6] = (byte)(goodsNum & 0xFF);  // 数量（小端）
        buf[b + 7] = (byte)((goodsNum >> 8) & 0xFF);
        // +8,+9 UsedCount = 0
        buf[b + 10] = 0xFF; buf[b + 11] = 0xFF; buf[b + 12] = 0xFF; buf[b + 13] = 0xFF;   // 存在时间 = -1（永久）
        buf[b + 14] = 9;                       // 类型字节（与现有系统礼包邮件一致）
        // +15 Flag = 0，其余全 0
        return buf;
    }

    public static DataRow GetOrder(string no)
    {
        using (SqlConnection cn = Open())
        using (SqlCommand cmd = new SqlCommand(
            "SELECT OrderNo, UserID, ActorID, ActorName, Currency, AmountYuan, GrantAmount, Status, " +
            "ISNULL(GoodsID,0) AS GoodsID, ISNULL(GoodsNum,0) AS GoodsNum, ISNULL(GoodsName,'') AS GoodsName, " +
            "CONVERT(varchar(19),CreateTime,120) AS CreateTime, " +
            "ISNULL(CONVERT(varchar(19),PaidTime,120),'') AS PaidTime, " +
            "ISNULL(CONVERT(varchar(19),GrantTime,120),'') AS GrantTime, " +
            "ISNULL(GrantResult,'') AS GrantResult, ISNULL(PayTradeNo,'') AS PayTradeNo " +
            "FROM PayCenter.dbo.WebRechargeOrder WHERE OrderNo = @no;", cn))
        {
            cmd.CommandTimeout = 10;
            cmd.Parameters.Add("@no", SqlDbType.VarChar, 32).Value = no;
            using (DataTable dt = new DataTable())
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd)) da.Fill(dt);
                return dt.Rows.Count == 0 ? null : dt.Rows[0];
            }
        }
    }

    // 玩家点「我已付款」：0 -> 1
    public static bool MarkPaid(string no)
    {
        using (SqlConnection cn = Open())
        using (SqlCommand cmd = new SqlCommand(
            "UPDATE PayCenter.dbo.WebRechargeOrder SET Status = 1, PaidTime = GETDATE() " +
            "WHERE OrderNo = @no AND Status = 0;", cn))
        {
            cmd.CommandTimeout = 10;
            cmd.Parameters.Add("@no", SqlDbType.VarChar, 32).Value = no;
            return cmd.ExecuteNonQuery() == 1;
        }
    }

    // 管理员取消：0 或 1 -> 3
    public static bool CancelOrder(string no, string remark)
    {
        using (SqlConnection cn = Open())
        using (SqlCommand cmd = new SqlCommand(
            "UPDATE PayCenter.dbo.WebRechargeOrder SET Status = 3, GrantResult = @r " +
            "WHERE OrderNo = @no AND Status IN (0,1);", cn))
        {
            cmd.CommandTimeout = 10;
            cmd.Parameters.Add("@no", SqlDbType.VarChar, 32).Value = no;
            cmd.Parameters.Add("@r", SqlDbType.NVarChar, 200).Value = (object)remark ?? DBNull.Value;
            return cmd.ExecuteNonQuery() == 1;
        }
    }

    // 发放：1 -> 15(发放中) -> 2(已发放) / 回滚为 1
    // 返回 1=成功, 0=订单状态不对, -1=发放失败（msg 里有原因）
    public static int GrantOrder(string no, string payTradeNo, out string msg)
    {
        msg = null;

        // 1) 抢占订单，防止重复发放
        using (SqlConnection cn = Open())
        using (SqlCommand cmd = new SqlCommand(
            "UPDATE PayCenter.dbo.WebRechargeOrder SET Status = 15 " +
            "WHERE OrderNo = @no AND Status = 1;", cn))
        {
            cmd.CommandTimeout = 10;
            cmd.Parameters.Add("@no", SqlDbType.VarChar, 32).Value = no;
            if (cmd.ExecuteNonQuery() != 1) { msg = "订单状态不是「待确认」，可能已被处理"; return 0; }
        }

        DataRow o = GetOrder(no);
        if (o == null) { msg = "订单不存在"; return -1; }

        int currency = Convert.ToInt32(o["Currency"]);
        int actorId = Convert.ToInt32(o["ActorID"]);
        int userId = Convert.ToInt32(o["UserID"]);
        string actorName = o["ActorName"].ToString();
        long grant = Convert.ToInt64(o["GrantAmount"]);
        decimal yuan = Convert.ToDecimal(o["AmountYuan"]);
        int goodsId = Convert.ToInt32(o["GoodsID"]);
        int goodsNum = Convert.ToInt32(o["GoodsNum"]);
        string goodsName = o["GoodsName"].ToString();

        string fail = null;
        try
        {
            using (SqlConnection cn = Open())
            {
                if (currency == 3 && PackDeliveredCount(actorId, goodsId) >= Cfg.PackLimitPerActor)
                {
                    // 限购再卡一道：防止两个待确认订单都被发出去
                    fail = "该角色这个礼包已经发放过（每个角色限购 " + Cfg.PackLimitPerActor + " 次）";
                }
                else if (currency == 1)
                {
                    // 点券：调游戏官方过程
                    using (SqlCommand cmd = new SqlCommand("GameDB.dbo.PrGs_GameUser_Points_Add", cn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandTimeout = 20;
                        cmd.Parameters.Add("@UserID", SqlDbType.Int).Value = userId;
                        cmd.Parameters.Add("@ActorID", SqlDbType.Int).Value = actorId;
                        cmd.Parameters.Add("@PointsNum", SqlDbType.Int).Value = (int)grant;
                        cmd.Parameters.Add("@OrderNo", SqlDbType.Binary, 16).Value = new byte[16];
                        cmd.Parameters.Add("@RequestBuffer", SqlDbType.Binary, 10).Value = new byte[10];
                        SqlParameter outBal = cmd.Parameters.Add("@Out_BalancePointNums", SqlDbType.Int);
                        outBal.Direction = ParameterDirection.Output;
                        SqlParameter outMsg = cmd.Parameters.Add("@ChvMsg", SqlDbType.VarChar, 128);
                        outMsg.Direction = ParameterDirection.Output;
                        SqlParameter ret = cmd.Parameters.Add("@RET", SqlDbType.Int);
                        ret.Direction = ParameterDirection.ReturnValue;
                        cmd.ExecuteNonQuery();
                        if (Convert.ToInt32(ret.Value) != 1)
                            fail = "点券发放失败：" + Convert.ToString(outMsg.Value);
                    }
                }
                else
                {
                    // 金币 / 礼包：发游戏内邮件，玩家自己在邮箱领取（在线角色也安全）
                    string title;
                    string body;
                    byte attach = 0;
                    byte[] goodsBuf = null;
                    if (currency == 3)
                    {
                        string gname = (goodsName.Length > 0) ? goodsName : "礼包";
                        title = (gname.Length > 15) ? gname.Substring(0, 15) : gname;
                        body = "感谢支持！本次充值 ¥" + yuan.ToString("0.##", CultureInfo.InvariantCulture)
                             + "，您购买的【" + gname + "】已送达，请在邮件中领取。订单号 " + no;
                        goodsBuf = BuildGoodsBuf(goodsId, goodsNum);
                        attach = 1;
                    }
                    else
                    {
                        title = "充值到账";
                        body = "感谢支持！本次充值 ¥" + yuan.ToString("0.##", CultureInfo.InvariantCulture)
                             + "，已发放 " + grant + " 金币，请在邮件中领取。订单号 " + no;
                    }
                    using (SqlCommand cmd = new SqlCommand("GameDB.dbo.PrGs_GameEmail_Add_V5", cn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandTimeout = 20;
                        cmd.Parameters.Add("@FromActorID", SqlDbType.Int).Value = 0;   // <1000 走系统通道，跳过10秒限制
                        cmd.Parameters.Add("@ToActorName", SqlDbType.NVarChar, 32).Value = actorName;
                        cmd.Parameters.Add("@EmailTitle", SqlDbType.NVarChar, 32).Value = title;
                        cmd.Parameters.Add("@EmailBody", SqlDbType.NVarChar, 600).Value = body;
                        cmd.Parameters.Add("@MoneyNum", SqlDbType.Int).Value = (int)grant;
                        cmd.Parameters.Add("@AttachNum", SqlDbType.TinyInt).Value = attach;
                        cmd.Parameters.Add("@GoodsBuf", SqlDbType.Binary, 525).Value = (object)goodsBuf ?? DBNull.Value;
                        SqlParameter toId = cmd.Parameters.Add("@ToActorID", SqlDbType.Int);
                        toId.Direction = ParameterDirection.Output;
                        SqlParameter mailId = cmd.Parameters.Add("@Out_EmailID", SqlDbType.Int);
                        mailId.Direction = ParameterDirection.Output;
                        SqlParameter outMsg2 = cmd.Parameters.Add("@ChvMsg", SqlDbType.VarChar, 128);
                        outMsg2.Direction = ParameterDirection.Output;
                        SqlParameter ret2 = cmd.Parameters.Add("@RET", SqlDbType.Int);
                        ret2.Direction = ParameterDirection.ReturnValue;
                        cmd.ExecuteNonQuery();
                        if (Convert.ToInt32(ret2.Value) != 1)
                            fail = "金币邮件发放失败：" + Convert.ToString(outMsg2.Value);
                    }
                }
            }
        }
        catch (Exception ex)
        {
            fail = "发放异常：" + ex.Message;
        }

        string resultNote = (fail == null) ? ("成功发放 " + grant + (currency == 2 ? " 金币（邮件）" : " 点券"))
                                           : fail;
        using (SqlConnection cn = Open())
        using (SqlCommand cmd = new SqlCommand(
            "UPDATE PayCenter.dbo.WebRechargeOrder SET Status = @st, GrantTime = @gt, " +
            "PayTradeNo = @tn, GrantResult = @r WHERE OrderNo = @no AND Status = 15;", cn))
        {
            cmd.CommandTimeout = 10;
            cmd.Parameters.Add("@st", SqlDbType.TinyInt).Value = (byte)(fail == null ? 2 : 1);
            cmd.Parameters.Add("@gt", SqlDbType.DateTime).Value = (fail == null) ? (object)DateTime.Now : DBNull.Value;
            cmd.Parameters.Add("@tn", SqlDbType.NVarChar, 64).Value = string.IsNullOrEmpty(payTradeNo) ? (object)DBNull.Value : payTradeNo;
            cmd.Parameters.Add("@r", SqlDbType.NVarChar, 200).Value = resultNote;
            cmd.Parameters.Add("@no", SqlDbType.VarChar, 32).Value = no;
            cmd.ExecuteNonQuery();
        }

        if (fail != null) { msg = fail; return -1; }
        return 1;
    }

    public static DataTable QueryOrders(int status, string actorKey, int top)
    {
        StringBuilder sql = new StringBuilder(
            "SELECT TOP " + top + " OrderNo, UserID, ActorID, ActorName, Currency, AmountYuan, GrantAmount, Status, " +
            "ISNULL(GoodsID,0) AS GoodsID, ISNULL(GoodsNum,0) AS GoodsNum, ISNULL(GoodsName,'') AS GoodsName, " +
            "CONVERT(varchar(19),CreateTime,120) AS CreateTime, " +
            "ISNULL(CONVERT(varchar(19),PaidTime,120),'') AS PaidTime, " +
            "ISNULL(CONVERT(varchar(19),GrantTime,120),'') AS GrantTime, " +
            "ISNULL(GrantResult,'') AS GrantResult, ISNULL(PayTradeNo,'') AS PayTradeNo " +
            "FROM PayCenter.dbo.WebRechargeOrder WHERE 1=1 ");
        using (SqlConnection cn = Open())
        using (SqlCommand cmd = new SqlCommand())
        {
            cmd.Connection = cn;
            cmd.CommandTimeout = 15;
            if (status >= 0) { sql.Append("AND Status = @st "); cmd.Parameters.Add("@st", SqlDbType.TinyInt).Value = (byte)status; }
            if (!string.IsNullOrEmpty(actorKey))
            {
                actorKey = actorKey.Trim();
                if (Regex.IsMatch(actorKey, @"^[0-9]{1,10}$"))
                {
                    sql.Append("AND (ActorID = @a OR UserID = @a OR ActorName LIKE @n) ");
                    cmd.Parameters.Add("@a", SqlDbType.Int).Value = int.Parse(actorKey);
                    cmd.Parameters.Add("@n", SqlDbType.NVarChar, 40).Value = "%" + actorKey + "%";
                }
                else
                {
                    sql.Append("AND ActorName LIKE @n ");
                    cmd.Parameters.Add("@n", SqlDbType.NVarChar, 40).Value = "%" + actorKey + "%";
                }
            }
            sql.Append("ORDER BY CreateTime DESC;");
            cmd.CommandText = sql.ToString();
            using (DataTable dt = new DataTable())
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd)) da.Fill(dt);
                return dt;
            }
        }
    }

    public static string StatusText(int st)
    {
        switch (st)
        {
            case 0: return "待支付";
            case 1: return "待确认";
            case 2: return "已发放";
            case 3: return "已取消";
            case 15: return "发放中";
            default: return "未知";
        }
    }

    public static string CurrencyText(int c) { return c == 3 ? "礼包" : (c == 2 ? "金币" : "点券"); }

    // 把 URL 路径换算成本地物理路径（要扣掉应用虚拟路径 /pay 这一层）
    static string ToPhysical(string urlPath)
    {
        string rel = urlPath;
        string virt = HttpRuntime.AppDomainAppVirtualPath;
        if (!string.IsNullOrEmpty(virt) && virt != "/" &&
            rel.StartsWith(virt + "/", StringComparison.OrdinalIgnoreCase))
        {
            rel = rel.Substring(virt.Length);
        }
        return HttpRuntime.AppDomainAppPath.TrimEnd('\\') + rel.Replace('/', '\\');
    }

    // 找收款码：先看配置指定的文件，再在 qr 目录里把所有图片都收进来。
    // Windows 文件系统不区分大小写，所以 alipay.JPG / 收款码.jpg 都能认。
    public static List<QrItem> QrAll()
    {
        List<QrItem> list = new List<QrItem>();
        try
        {
            string dir = HttpRuntime.AppDomainAppPath.TrimEnd('\\') + "\\qr";
            if (!Directory.Exists(dir)) return list;
            string virt = HttpRuntime.AppDomainAppVirtualPath.TrimEnd('/') + "/qr/";

            // 配置指定的那张优先放在最前面
            try
            {
                string cfgPhys = ToPhysical(Cfg.AlipayQrImage);
                if (File.Exists(cfgPhys)) list.Add(MakeQrItem(virt, cfgPhys));
            }
            catch { }

            // 目录里其余图片（常见图片扩展名）
            string[] exts = new string[] { ".png", ".jpg", ".jpeg", ".gif", ".webp", ".bmp" };
            List<string> files = new List<string>(Directory.GetFiles(dir));
            files.Sort(StringComparer.OrdinalIgnoreCase);
            foreach (string f in files)
            {
                string ext = Path.GetExtension(f).ToLowerInvariant();
                if (Array.IndexOf(exts, ext) < 0) continue;
                string name = Path.GetFileName(f);
                if (name.ToLowerInvariant().IndexOf(".example.") >= 0) continue;
                QrItem it = MakeQrItem(virt, f);
                bool dup = false;
                foreach (QrItem x in list) { if (string.Equals(x.Url, it.Url, StringComparison.OrdinalIgnoreCase)) { dup = true; break; } }
                if (!dup) list.Add(it);
            }
        }
        catch { }
        return list;
    }

    static QrItem MakeQrItem(string virt, string physical)
    {
        string baseName = Path.GetFileNameWithoutExtension(physical);
        string ext = Path.GetExtension(physical).ToLowerInvariant();
        string low = baseName.ToLowerInvariant();
        QrItem q = new QrItem();
        if (low.Contains("alipay") || low.Contains("zfb") || baseName.Contains("支付宝")) q.Label = "支付宝";
        else if (low.Contains("wx") || low.Contains("weixin") || low.Contains("wechat") || baseName.Contains("微信")) q.Label = "微信";
        else q.Label = "扫码支付";
        q.Url = virt + Uri.EscapeDataString(baseName) + ext;
        // 带上文件修改时间的版本号，图片一换 URL 就变，彻底绕开浏览器缓存
        try
        {
            long ver = File.GetLastWriteTimeUtc(physical).Ticks;
            if (ver > 0) q.Url = q.Url + "?v=" + ver.ToString();
        }
        catch { }
        return q;
    }

    // 兼容用：取第一张
    public static string QrUrl()
    {
        List<QrItem> l = QrAll();
        return (l.Count > 0) ? l[0].Url : null;
    }

    public static bool QrConfigured() { return QrUrl() != null; }

    public static string Log(string s)
    {
        try
        {
            string dir = Path.Combine(HttpRuntime.AppDomainAppPath, "logs");
            if (!Directory.Exists(dir)) Directory.CreateDirectory(dir);
            File.AppendAllText(Path.Combine(dir, "pay-" + DateTime.Now.ToString("yyyyMM") + ".log"),
                DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + " | " + Ip() + " | " + s + Environment.NewLine,
                new UTF8Encoding(false));
            return null;
        }
        catch (Exception ex) { return ex.Message; }
    }
}

// =====================================================================
//  到账提醒推送（微信）
//  token 不写在 web.config 里，而是存在 App_Data\notify.txt（只有服务器能读），
//  由 C:\PayApp\tools\set-notify.ps1 录入，明文不经过任何聊天/日志。
//  支持：serverchan（Server酱）/ pushplus（PushPlus）/ wecom（企业微信机器人）
// =====================================================================
public static class Notify
{
    // .NET 4.5 目标框架默认只用 TLS 1.0，而 Server酱/PushPlus/企业微信都需要 TLS 1.2，
    // 不显式打开就会报“未能创建 SSL/TLS 安全通道”。
    static Notify()
    {
        try
        {
            ServicePointManager.SecurityProtocol |= (SecurityProtocolType)3072;   // Tls12
        }
        catch { }
    }

    static string ConfPath()
    {
        return Path.Combine(HttpRuntime.AppDomainAppPath, "App_Data", "notify.txt");
    }

    static string[] ReadConf()
    {
        try
        {
            if (File.Exists(ConfPath()))
            {
                string s = File.ReadAllText(ConfPath(), Encoding.UTF8);
                s = s.Trim().Trim('"').Trim();
                if (s.Length > 0)
                {
                    int i = s.IndexOf(':');
                    if (i > 0)
                        return new string[] { s.Substring(0, i).Trim().ToLowerInvariant(), s.Substring(i + 1).Trim() };

                    // 只写了 token、没写“渠道:”前缀时的容错：
                    // Server酱 的 key 以 SCT 开头；32 位纯小写 hex 则当 PushPlus。
                    string low = s.ToLowerInvariant();
                    if (!low.StartsWith("sct") && Regex.IsMatch(low, "^[0-9a-f]{32}$"))
                        return new string[] { "pushplus", s };
                    return new string[] { "serverchan", s };
                }
            }
        }
        catch { }
        return new string[] { Cfg.Get("NotifyProvider", "").ToLowerInvariant(), Cfg.Get("NotifyToken", "") };
    }

    public static bool Enabled()
    {
        string[] c = ReadConf();
        return c[0].Length > 0 && c[1].Length > 0;
    }

    static string JsonEsc(string s)
    {
        StringBuilder sb = new StringBuilder();
        foreach (char ch in s)
        {
            switch (ch)
            {
                case '"': sb.Append("\\\""); break;
                case '\\': sb.Append("\\\\"); break;
                case '\n': sb.Append("\\n"); break;
                case '\r': break;
                case '\t': sb.Append("\\t"); break;
                default:
                    if (ch < ' ') sb.Append("\\u" + ((int)ch).ToString("x4"));
                    else sb.Append(ch);
                    break;
            }
        }
        return sb.ToString();
    }

    static string RawPost(string url, string contentType, string payload, int timeoutMs)
    {
        byte[] b = Encoding.UTF8.GetBytes(payload);
        HttpWebRequest req = (HttpWebRequest)HttpWebRequest.Create(url);
        req.Method = "POST";
        req.ContentType = contentType;
        req.ContentLength = b.Length;
        req.Timeout = timeoutMs;
        req.ReadWriteTimeout = timeoutMs;
        req.UserAgent = "PayNotify/1.0";
        try
        {
            using (Stream s = req.GetRequestStream()) s.Write(b, 0, b.Length);
            using (HttpWebResponse resp = (HttpWebResponse)req.GetResponse())
            using (StreamReader sr = new StreamReader(resp.GetResponseStream(), Encoding.UTF8))
                return "HTTP " + ((int)resp.StatusCode) + " " + sr.ReadToEnd();
        }
        catch (WebException wex)
        {
            // 4xx/5xx 也会抛异常，但响应体里往往就是真正的原因（比如“错误的Key”），要读出来
            if (wex.Response != null)
            {
                using (StreamReader sr = new StreamReader(wex.Response.GetResponseStream(), Encoding.UTF8))
                    return "HTTP " + ((int)((HttpWebResponse)wex.Response).StatusCode) + " " + sr.ReadToEnd();
            }
            throw;
        }
    }

    static string PostForm(string url, string form, int timeoutMs)
    {
        return RawPost(url, "application/x-www-form-urlencoded; charset=utf-8", form, timeoutMs);
    }

    static string PostJson(string url, string json, int timeoutMs)
    {
        return RawPost(url, "application/json; charset=utf-8", json, timeoutMs);
    }

    // 返回结果字符串（无论成功失败都不抛异常，只写日志）
    public static string Send(string title, string body)
    {
        string[] c = ReadConf();
        string prov = c[0], tok = c[1];
        if (prov.Length == 0 || tok.Length == 0) return "not-configured";

        int timeout = Cfg.GetInt("NotifyTimeoutMs", 6000);
        string r;
        try
        {
            if (prov == "serverchan")
            {
                r = PostForm("https://sctapi.ftqq.com/" + Uri.EscapeDataString(tok) + ".send",
                    "title=" + Uri.EscapeDataString(title) + "&desp=" + Uri.EscapeDataString(body), timeout);
            }
            else if (prov == "pushplus")
            {
                r = PostForm("https://www.pushplus.plus/send",
                    "token=" + Uri.EscapeDataString(tok) + "&title=" + Uri.EscapeDataString(title)
                    + "&content=" + Uri.EscapeDataString(body) + "&template=txt", timeout);
            }
            else if (prov == "wecom")
            {
                r = PostJson("https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=" + Uri.EscapeDataString(tok),
                    "{\"msgtype\":\"text\",\"text\":{\"content\":\"" + JsonEsc(title + "\n" + body) + "\"}}", timeout);
            }
            else
            {
                r = "unknown-provider:" + prov;
            }
        }
        catch (Exception ex)
        {
            r = "error: " + ex.Message;
        }
        try { r = (r.Length > 300) ? r.Substring(0, 300) : r; } catch { }
        return r;
    }
}

// =====================================================================
//  管理员口令（PBKDF2 存 App_Data\admin.dat，明文不落任何地方）
// =====================================================================
public static class AdminAuth
{
    public const int Iterations = 60000;

    static string FilePath()
    {
        return Path.Combine(HttpRuntime.AppDomainAppPath, "App_Data", "admin.dat");
    }

    public static bool HasPassword()
    {
        try
        {
            if (!File.Exists(FilePath())) return false;
            return File.ReadAllText(FilePath(), Encoding.UTF8).Trim().Length > 0;
        }
        catch { return false; }
    }

    public static void SetPassword(string pwd)
    {
        byte[] salt = new byte[16];
        using (RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider()) rng.GetBytes(salt);
        string hash = Derive(pwd, salt);
        string dir = Path.GetDirectoryName(FilePath());
        if (!Directory.Exists(dir)) Directory.CreateDirectory(dir);
        File.WriteAllText(FilePath(), Iterations + ":" + Convert.ToBase64String(salt) + ":" + hash,
            new UTF8Encoding(false));
    }

    static string Derive(string pwd, byte[] salt)
    {
        using (Rfc2898DeriveBytes k = new Rfc2898DeriveBytes(pwd, salt, Iterations))
            return Convert.ToBase64String(k.GetBytes(32));
    }

    public static bool Verify(string pwd)
    {
        try
        {
            string[] p = File.ReadAllText(FilePath(), Encoding.UTF8).Trim().Split(':');
            if (p.Length != 3) return false;
            byte[] salt = Convert.FromBase64String(p[1]);
            string expect = p[2];
            string got = Derive(pwd, salt);
            return SlowEquals(expect, got);
        }
        catch { return false; }
    }

    static bool SlowEquals(string a, string b)
    {
        if (a == null || b == null) return false;
        int diff = a.Length ^ b.Length;
        for (int i = 0; i < a.Length && i < b.Length; i++) diff |= a[i] ^ b[i];
        return diff == 0;
    }

    public static bool IpAllowed(string ip)
    {
        string allow = Cfg.AdminAllowIps;
        if (string.IsNullOrEmpty(allow)) return true;
        foreach (string s in allow.Split(','))
        {
            string t = s.Trim();
            if (t.Length == 0) continue;
            if (t == ip) return true;
            if (t.EndsWith(".*") && ip.StartsWith(t.Substring(0, t.Length - 1))) return true;
        }
        return false;
    }

    // 首次设置口令只允许服务器本机操作
    public static bool FirstRunAllowed()
    {
        return HttpContext.Current.Request.IsLocal;
    }

    public static bool LoggedIn()
    {
        return HttpContext.Current.Session["adm"] != null;
    }

    public static void Login() { HttpContext.Current.Session["adm"] = "1"; }
    public static void Logout() { HttpContext.Current.Session.Remove("adm"); }
}
