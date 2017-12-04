<%@ WebHandler Language="C#" Class="Upload" %>

using System;
using System.Web;
using System.IO;
using System.Collections;
using System.Drawing;
using System.Drawing.Drawing2D;


public class Upload : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        context.Response.Expires = -1;
        try
        {
            var hd = context.Request.Headers.AllKeys;
            HttpPostedFile postedFile = context.Request.Files["Filedata"];
            string savepath = "";
            string tempPath = "";
            tempPath = "uploads";// System.Configuration.ConfigurationManager.AppSettings["FolderPath"]; 
            savepath = context.Server.MapPath(tempPath);
            string filename = postedFile.FileName;
            Stream strm = postedFile.InputStream;
            filename = Convert.ToString(DateTime.Now.ToString().Replace(" ", "_").Replace("/", "_").Replace(":", "_").Replace(",", "_") + "_" + filename);
            var targetFile = savepath + "\\" + filename;
            GenerateThumbnails(0.5, strm, targetFile);
            if (!Directory.Exists(savepath))
                Directory.CreateDirectory(savepath);
            //postedFile.SaveAs(savepath + @"\" + filename);
            context.Response.Write(tempPath + "/" + filename);
            context.Response.StatusCode = 200;
        }
        catch (Exception ex)
        {
            context.Response.Write("Error: " + ex.Message);
        }
    }

    private void GenerateThumbnails(double scaleFactor, Stream sourcePath, string targetPath)
    {
        using (var image = Image.FromStream(sourcePath))
        {
            var newWidth = (int)(image.Width * scaleFactor);
            var newHeight = (int)(image.Height * scaleFactor);
            var thumbnailImg = new Bitmap(newWidth, newHeight);
            var thumbGraph = Graphics.FromImage(thumbnailImg);
            thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
            thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
            thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
            var imageRectangle = new Rectangle(0, 0, newWidth, newHeight);
            thumbGraph.DrawImage(image, imageRectangle);
            thumbnailImg.Save(targetPath, image.RawFormat);
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}