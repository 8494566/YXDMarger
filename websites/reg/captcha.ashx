<%@ WebHandler Language="C#" Class="CaptchaHandler" %>
<%@ Assembly Name="System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" %>

public class CaptchaHandler : System.Web.IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    public bool IsReusable { get { return false; } }

    public void ProcessRequest(System.Web.HttpContext ctx)
    {
        ctx.Response.ContentType = "image/png";
        ctx.Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache);
        ctx.Response.Cache.SetNoStore();

        System.Random rnd = new System.Random(System.Guid.NewGuid().GetHashCode());

        // 生成 4 位数字验证码，存进 Session
        char[] code = new char[4];
        for (int i = 0; i < 4; i++) code[i] = (char)('0' + rnd.Next(0, 10));
        ctx.Session["captcha"] = new string(code);

        int w = 120, h = 42;
        using (System.Drawing.Bitmap bmp = new System.Drawing.Bitmap(w, h))
        using (System.Drawing.Graphics g = System.Drawing.Graphics.FromImage(bmp))
        {
            g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.AntiAlias;
            g.Clear(System.Drawing.Color.FromArgb(248, 250, 253));

            // 干扰线
            for (int i = 0; i < 5; i++)
            {
                using (System.Drawing.Pen p = new System.Drawing.Pen(
                    System.Drawing.Color.FromArgb(rnd.Next(110, 200), rnd.Next(110, 200), rnd.Next(110, 200)), 1))
                {
                    g.DrawLine(p, rnd.Next(w), rnd.Next(h), rnd.Next(w), rnd.Next(h));
                }
            }

            // 数字
            using (System.Drawing.Font f = new System.Drawing.Font("Arial", 21,
                System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))
            {
                for (int i = 0; i < 4; i++)
                {
                    System.Drawing.Drawing2D.GraphicsState st = g.Save();
                    g.TranslateTransform(10 + i * 26, 7);
                    g.RotateTransform(rnd.Next(-25, 25));
                    using (System.Drawing.Brush b = new System.Drawing.SolidBrush(
                        System.Drawing.Color.FromArgb(rnd.Next(20, 90), rnd.Next(40, 110), rnd.Next(90, 170))))
                    {
                        g.DrawString(code[i].ToString(), f, b, 0, 0);
                    }
                    g.Restore(st);
                }
            }

            // 噪点
            for (int i = 0; i < 120; i++)
            {
                bmp.SetPixel(rnd.Next(w), rnd.Next(h),
                    System.Drawing.Color.FromArgb(rnd.Next(255), rnd.Next(255), rnd.Next(255)));
            }

            using (System.IO.MemoryStream ms = new System.IO.MemoryStream())
            {
                bmp.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                ctx.Response.BinaryWrite(ms.ToArray());
            }
        }
    }
}
