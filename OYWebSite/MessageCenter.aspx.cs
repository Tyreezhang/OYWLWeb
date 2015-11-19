using PetaPoco;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ultra.FASControls;
using Ultra.FASControls.Caller;
using UltraDbEntity;

namespace OYWebSite
{
    public partial class MessageCenter : System.Web.UI.Page
    {
        public int PageSize { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageSize = 5;
                int pageindex = 1;
                if (Request.QueryString["pno"] != null)
                {
                    string pindex = Request.QueryString["pno"].ToString();
                    try
                    {
                        pageindex = int.Parse(pindex);
                    }
                    catch (Exception)
                    {
                        pageindex = 1;
                    }
                }
                this.txtAfsalelist.Text = Aflist(pageindex).ToString();
            }
            if (Request.QueryString["flag"] != null)
            {
                if (Request.QueryString["flag"].ToString() == "1")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "message", "document.getElementById('content').scrollIntoView();", true);
                }
            }
            txterror.InnerText = string.Empty;

        }

        public string NoHtml(string text)
        {
            //删除脚本
            text = Regex.Replace(text, @"<script[^>]*?>.*?</script>", "", RegexOptions.IgnoreCase);
            text = Regex.Replace(text, @"<style[^>]*?>.*?</style>", "", RegexOptions.IgnoreCase);
            //删除HTML
            text = Regex.Replace(text, @"<(.[^>]*)>", "", RegexOptions.IgnoreCase);
            text = Regex.Replace(text, @"([\r\n])[\s]+", "", RegexOptions.IgnoreCase);
            text = Regex.Replace(text, @"-->", "", RegexOptions.IgnoreCase);
            text = Regex.Replace(text, @"<!--.*", "", RegexOptions.IgnoreCase);

            text = Regex.Replace(text, @"&(quot|#34);", "\"", RegexOptions.IgnoreCase);
            text = Regex.Replace(text, @"&(amp|#38);", "&", RegexOptions.IgnoreCase);
            text = Regex.Replace(text, @"&(lt|#60);", "<", RegexOptions.IgnoreCase);
            text = Regex.Replace(text, @"&(gt|#62);", ">", RegexOptions.IgnoreCase);
            text = Regex.Replace(text, @"&(nbsp|#160);", " ", RegexOptions.IgnoreCase);
            text = Regex.Replace(text, @"&(iexcl|#161);", "\xa1", RegexOptions.IgnoreCase);
            text = Regex.Replace(text, @"&(cent|#162);", "\xa2", RegexOptions.IgnoreCase);
            text = Regex.Replace(text, @"&(pound|#163);", "\xa3", RegexOptions.IgnoreCase);
            text = Regex.Replace(text, @"&(copy|#169);", "\xa9", RegexOptions.IgnoreCase);
            text = Regex.Replace(text, @"&#(\d+);", "", RegexOptions.IgnoreCase);
            text.Replace("<", "");
            text.Replace(">", "");
            text.Replace("\r\n", "");
            text = HttpContext.Current.Server.HtmlEncode(text).Trim();
            return text;
        }

        protected void Page_Error(object sender, EventArgs e)
        {
            Exception ex = Server.GetLastError();
            if (ex is HttpRequestValidationException)
            {
                Response.Write("请您输入合法字符串。<a href='MessageCenter.aspx'>点击返回</a>");
                Server.ClearError();//如果不ClearError()这个异常会继续传到Application_Error()。
                Response.End();
            }
        }

        protected void BtnlyApply_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtApplicanter.Value.Trim()))
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "", "alert('请输入姓名!')", true);
                return;
            }
            if (string.IsNullOrEmpty(txtApplicanterTel.Value.Trim()))
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "", "alert('请输入联系方式!')", true);
                return;
            }
            if (string.IsNullOrEmpty(txtTitle.Value.Trim()))
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "", "alert('请输入标题!')", true);
                return;
            }
            if (string.IsNullOrEmpty(txtdescription.Value.Trim()))
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "", "alert('请输入留言内容!')", true);
                return;
            }
            if (string.IsNullOrEmpty(txtdescription.Value.Trim()))
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "", "alert('请输入留言内容!')", true);
                return;
            }
            if (string.IsNullOrEmpty(txtVfcode.Value.Trim()))
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "", "alert('请输入验证码!')", true);
                return;
            }
            //生成的验证码被保存到session中
            if (Session["CheckCode"] != null)
            {
                string checkcode = Session["CheckCode"].ToString();
                if (this.txtVfcode.Value != checkcode)
                {
                    txterror.InnerText = "  验证码输入错误!";
                    ClientScript.RegisterStartupScript(this.GetType(), "message", "document.getElementById('content').scrollIntoView();", true);
                    txtVfcode.Value = string.Empty;
                    return;
                }
            }
            txterror.InnerText = string.Empty;
            T_ERP_Message message = new T_ERP_Message();
            message.Guid = Guid.NewGuid();
            message.Creator = message.Updator = "Sys";
            message.CreateDate = message.UpdateDate = DateTime.Now;
            message.Reserved2 = message.Remark = string.Empty;
            message.Reserved3 = false;
            message.Applicanter = txtApplicanter.Value.Trim();
            message.ApplicanterTel = txtApplicanterTel.Value.Trim();
            message.Title = txtTitle.Value.Trim();
            message.Description = txtdescription.Value.Trim();
            message.IsCancel = false;
            var rd = SerNoCaller.Calr_Message.Add(message);
            if (!rd.IsOK)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "message", "alert('系统内部错误,请刷新页面');", true);
                return;
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "message", "ClearInput();", true);
                txtApplicanter.Value = string.Empty;
                txtApplicanterTel.Value = string.Empty;
                return;
            }
        }

        private StringBuilder Aflist(int pageindex)
        {
            StringBuilder list = new StringBuilder();
            string str = string.Empty;
            var objs = new List<object>();
            List<T_ERP_Message> message = new List<T_ERP_Message>();
            using (var db = new Database(SQLCONN.Conn))
            {
                var page = db.Page<T_ERP_Message>(pageindex, PageSize, "select * from T_ERP_Message where IsDel = 1 Order by Createdate desc", objs.ToArray());
                total.Value = (((int)page.TotalItems % PageSize == 0) ? ((int)page.TotalItems / PageSize) : ((int)page.TotalItems / PageSize + 1)).ToString();//总页数
                totalRecords.Value = ((int)page.TotalItems).ToString();
                message = page.Items;
            }
            if (message == null || message.Count < 1) return list;
            foreach (var st in message)
            {
                str += " <div class='comment_box'><div class='info'><span class='c_info fr'>" + st.CreateDate.ToString("yyyy-MM-dd") + "</span><div><a><span class='mr40'>姓名：" + st.Applicanter + "</span>&nbsp;&nbsp;标题：" + st.Title + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;状态：" + (st.IsCancel == false ? "已处理" : "已驳回") + "</a></div></div>";
                str += "<div class='c_cont'>" + st.Description + "</div><div class='reply_box'>";
                str += "<div class='reply' style='width:767px;'>" + "评论：" + st.Comment + "</div><div class='date'>" + st.CommentTime.Value.ToString("yyyy-MM-dd") + "</div></div></div>";
            }
            list.Append(str);
            return list;
        }
    }
}