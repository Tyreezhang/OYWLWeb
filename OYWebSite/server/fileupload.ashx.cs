using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using Ultra.FASControls;
using Ultra.FASControls.Caller;
using UltraDbEntity;


namespace OYWebSite.server
{
    /// <summary>
    /// fileupload 的摘要说明
    /// </summary>
    public class fileupload : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            //指定字符集
            context.Response.ContentEncoding = Encoding.UTF8;
            if (context.Request["REQUEST_METHOD"] == "OPTIONS")
            {
                context.Response.End();
            }
            if (!string.IsNullOrEmpty(context.Request["ImageSession"].ToString()))
            {
                SaveFile(SQLCONN.UltraServerImageStr, context.Request["ImageSession"].ToString());
            }
        }
        /// <summary>
        /// 文件保存操作
        /// </summary>
        /// <param name="basePath"></param>
        private void SaveFile(string basePath, string ImageSession)
        {
            var name = string.Empty;
            basePath = (basePath.IndexOf("~") > -1) ? System.Web.HttpContext.Current.Server.MapPath(basePath) :
            basePath;
            HttpFileCollection files = System.Web.HttpContext.Current.Request.Files;
            //如果目录不存在，则创建目录
            if (!Directory.Exists(basePath))
            {
                Directory.CreateDirectory(basePath);
            }

            var suffix = files[0].ContentType.Split('/');
            //获取文件格式
            var _suffix = suffix[1].Equals("jpeg", StringComparison.CurrentCultureIgnoreCase) ? "jpg" : suffix[1];
            //var _temp = System.Web.HttpContext.Current.Request["name"];
            ////如果不修改文件名，则创建随机文件名
            //if (!string.IsNullOrEmpty(_temp))
            //{
            //    name = _temp;
            //}
            //else
            //{
            //    Random rand = new Random(24 * (int)DateTime.Now.Ticks);
            //    name = rand.Next() + "." + _suffix;
            //}
            var _temp = Guid.NewGuid() + "." + _suffix;
            //文件保存
            var full = basePath + _temp;
            files[0].SaveAs(full);
            T_ERP_Image img = new T_ERP_Image();
            img.Guid = Guid.NewGuid();
            img.Creator = img.Updator = "Sys";
            img.CreateDate = img.UpdateDate = DateTime.Now;
            img.Reserved2 = img.Remark = string.Empty;
            img.Reserved3 = false;
            img.Session = Guid.Parse(ImageSession);
            img.SavedFileName = _temp;
            using (var db = new PetaPoco.Database(SQLCONN.Conn))
            {
                db.Insert(img);
            }
            var _result = "{\"jsonrpc\" : \"2.0\", \"result\" : null, \"id\" : \"" + name + "\"}";
            System.Web.HttpContext.Current.Response.Write(_result);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}