using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OYWebSite
{
    public partial class Cargoinquiry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["CheckNo"]!=null)
            {
                this.checknumber.Value = Request.QueryString["CheckNo"].ToString();
            }
        }


    }
}