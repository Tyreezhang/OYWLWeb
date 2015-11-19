using FineUI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UltraDbEntity;

namespace OYWebSite
{
    public partial class MemberIndex : BasicSecurity
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (Session["User"] != null)
            {
                var user = Session["User"] as T_ERP_Suppliers;
                this.lblUser.Text = user.SuppName;
            }
        }

        protected void editPwd_Click(object sender, EventArgs e)
        {
            if (Users == null)
            {
                SetSession();
                return;
            }
            PageContext.RegisterStartupScript(WindowPwd.GetShowReference(string.Format("./EditPwd.aspx")));
        }

        protected void WindowPwd_Close(object sender, FineUI.WindowCloseEventArgs e)
        {
            if (Users == null)
            {
                SetSession();
                return;
            }
        }
    }
}