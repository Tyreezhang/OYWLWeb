using FineUI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UltraDbEntity;

namespace OYWebSite
{
    public class BasicSecurity : System.Web.UI.Page
    {

        public T_ERP_Suppliers Users
        {
            get
            {
                return Session["User"] as T_ERP_Suppliers;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                if (Session["User"] == null)
                {
                    Response.Write("<script>if (window == top){window.location.href='../Login.aspx';} else{top.location.href='../Login.aspx';}</script>");
                    Response.End();
                    return;
                }
                Session.Timeout = 12000;
            }
        }

        public void SetSession()
        {
            Alert.Show("登录超时,请刷新页面重新登录", MessageBoxIcon.Warning);
            Response.Write("<script>if (window == top){window.location.href='../Login.aspx';} else{top.location.href='../Login.aspx';}</script>");
        }
    }
}