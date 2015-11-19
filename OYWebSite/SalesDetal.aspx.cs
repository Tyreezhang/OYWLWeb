using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ultra.FASControls.Caller;
using UltraDbEntity;

namespace OYWebSite
{
    public partial class SalesDetal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Guid sgd = new Guid();
                if (Request.QueryString["SGD"] != null)
                {
                    try
                    {
                        sgd = Guid.Parse(Request.QueryString["SGD"].ToString());
                    }
                    catch (Exception)
                    {
                        Response.Redirect("AfterSale.aspx");
                        return;
                    }
                    var salelist = SerNoCaller.Calr_V_ERP_SalesDetalIMG.Get("where guid =@0", sgd);
                    if (salelist == null || salelist.Count < 1)
                    {
                        Response.Redirect("AfterSale.aspx");
                        return;
                    }
                    this.afterlist.Text = Aflist(salelist).ToString();
                }
                else
                {
                    Response.Redirect("AfterSale.aspx");
                    return;
                }
            }
        }

        private StringBuilder Aflist(List<V_ERP_SalesDetalIMG> salelist)
        {
            StringBuilder list = new StringBuilder();
            string str = string.Empty;
            string applyimg = string.Empty;
            string afterimg = string.Empty;
            string[] imgs = new string[] { };
            if (salelist == null || salelist.Count < 1) return list;
            foreach (var st in salelist)
            {
                if (!string.IsNullOrEmpty(st.creden))
                {
                    imgs = st.creden.TrimEnd(',').Split(',');
                    if (imgs != null && imgs.Length > 0)
                    {
                        applyimg += "<div style='width:937px;'>";
                        foreach (var et in imgs)
                        {
                            applyimg += "<a rel='apply_group' href='" + et + "' ><img style='cursor: pointer;' src='" + et + "' width='230'  height='131'/></a>" + "&nbsp;";
                        }
                        applyimg = applyimg.Substring(0, applyimg.Length - 6);
                        applyimg += "</div></br>";
                    }
                    str += applyimg;
                }
                str += " <div class='comment_box' style='font-size:14.5px;'><div class='info' style='color:black;'><span class='c_info fr'>" + st.CreateDate.ToString("yyyy-MM-dd") + "</span><div><span class='mr40'>姓名：" + st.Applicanter + "</span>&nbsp;&nbsp;&nbsp;&nbsp;运单号：" + st.CheckNo + "&nbsp;&nbsp;&nbsp;&nbsp;状态：" + (st.IsCancel == false ? "已处理" : "已驳回") + "</div></div>";
                str += "<div class='c_cont' style='color:black;'>" + st.Problemdescription + "</div><div class='reply_box'></div></div>";
                str += "  <div style='margin-top: 20px; width: 937px;'><span style=\"font-family: '微软雅黑'; font-size: 30px; color: #CD2D2D; font-weight: bold;\">售</span><span style=\"font-family: '微软雅黑'; font-size: 20px; font-weight: bold;\">后处理/</span><span style=\"font-family: '微软雅黑'; font-size: 15px; font-weight: bold;\">After processing</span><hr /></div>";
                if (!string.IsNullOrEmpty(st.image))
                {
                    var afimgs = st.image.TrimEnd(',').Split(',');
                    if (afimgs != null && afimgs.Length > 0)
                    {
                        afterimg += "<div style='width:937px;'>";
                        foreach (var mt in afimgs)
                        {
                            afterimg += "<a rel='after_group' href='" + mt + "' ><img style='cursor: pointer;' src='" + mt + "' width='230'  height='131'/></a>" + "&nbsp;";
                        }
                        afterimg += "</div></br>";
                    }
                    str += afterimg;
                }
                str += " <div class='comment_box' style='font-size:14.5px;'><div class='reply_box'><div class='reply' style='width:767px;color:black;'>" + "回复：" + st.Solution + "</div><div class='date' style='color:black;'>" + st.ProcessingTime.Value.ToString("yyyy-MM-dd") + "</div></div></div>";
            }
            list.Append(str);
            return list;
        }
    }
}