using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ultra.FASControls.Caller;
using Ultra.Web.Core.Common;
using UltraDbEntity;

namespace OYWebSite
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["name"] != null && Request.QueryString["pwd"] != null)
                {
                    var result = SetUserMsg(Request.QueryString["name"].ToString(), Request.QueryString["pwd"].ToString());
                    Response.Write(result);
                    Response.End();
                }
                this.errormsg.InnerText = "";
            }

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.Form["username"]))
            {
                this.errormsg.InnerText = "请输入帐号!";
                return;
            }
            if (string.IsNullOrEmpty(Request.Form["pwd"]))
            {
                this.errormsg.InnerText = "请输入密码!";
                return;
            }

            string pwdCode = ByteStringUtil.ByteArrayToHexStr(HashDigest.StringDigest(Request.Form["pwd"].ToString()));
            if (Request.Form["username"] == "admin")
            {
                var managers = SerNoCaller.Calr_User.Get(" where UserName=@0 and Pwd =@1 and IsDel = 0", Request.Form["username"].ToString(), pwdCode);
                if (managers == null || managers.Count < 1)
                {
                    this.errormsg.InnerText = "用户帐号密码无效!";
                    return;
                }
                else
                {
                    T_ERP_Suppliers user = new T_ERP_Suppliers();
                    user.SuppName = managers.FirstOrDefault().UserName;
                    Session["User"] = user;
                    Response.Redirect("~/MemberIndex.aspx");
                }
            }
            else
            {
                var users = SerNoCaller.Calr_Suppliers.Get("where SuppName=@0 and Pwd=@1 and IsUsing = 1"
                    , Request.Form["username"].ToString(), pwdCode);
                if (users == null || users.Count < 1)
                {
                    this.errormsg.InnerText = "用户帐号密码无效!";
                    return;
                }
                else
                {
                    T_ERP_Suppliers user = users.FirstOrDefault();
                    Session["User"] = user;
                    Response.Redirect("~/MemberIndex.aspx");
                }

            }

        }

        public string SetUserMsg(string name, string pwd)
        {
            string result = string.Empty;
            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(pwd))
            {
                return result = "请刷新页面重新登录";
            }

            string pwdCode = ByteStringUtil.ByteArrayToHexStr(HashDigest.StringDigest(pwd));
            if (name == "admin")
            {
                var managers = SerNoCaller.Calr_User.Get(" where UserName=@0 and Pwd =@1 and IsDel = 0", name, pwdCode);
                if (managers == null || managers.Count < 1)
                {
                    result = "用户帐号密码无效";
                }
                else
                {
                    T_ERP_Suppliers user = new T_ERP_Suppliers();
                    user.SuppName = managers.FirstOrDefault().UserName;
                    Session["User"] = user;
                    result = "登录成功";
                }
            }
            else
            {
                var users = SerNoCaller.Calr_Suppliers.Get("where SuppName=@0 and Pwd=@1 and IsUsing = 1"
                    , name, pwdCode);
                if (users == null || users.Count < 1)
                {
                    result = "用户帐号密码无效";
                }
                else
                {
                    T_ERP_Suppliers user = users.FirstOrDefault();
                    Session["User"] = user;
                    result = "登录成功";
                }
            }
            return result;
        }
    }
}