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
    public partial class Index : System.Web.UI.Page
    {
        public string imageSession { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                imageSession = txtimgSession.Value = Guid.NewGuid().ToString();
                this.txtAfsalelist.Text= Aflist().ToString();
            }
            else
            {
                imageSession = txtimgSession.Value;
            }
            if (Request.QueryString["flag"] != null)
            {
                if (Request.QueryString["flag"].ToString() == "1")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "message", "document.getElementById('wrapper').scrollIntoView();", true);
                }
            }
        }

        private void InsertAfterSales()
        {
            if (txtApplicanter.Value.Trim() == string.Empty || txtCheckNo.Value.Trim() == string.Empty || Problemdescription.Value == string.Empty)
           {
               ClientScript.RegisterStartupScript(this.GetType(), "message", "alert('申请人、托运单号、问题描述不能为空');", true);
               return;
           }
            var aftersale = new T_ERP_Aftersales();
            aftersale.Guid = Guid.NewGuid();
            aftersale.Creator = aftersale.Updator = "Sys";
            aftersale.CreateDate = aftersale.UpdateDate = DateTime.Now;
            aftersale.Reserved2 = aftersale.Remark = string.Empty;
            aftersale.Reserved3 = false;
            aftersale.Applicanter = txtApplicanter.Value.Trim();
            aftersale.ApplicanterTel = txtApplicanterTel.Value.Trim();
            aftersale.CheckNo = "TY"+txtCheckNo.Value.Trim();
            aftersale.CompanyName = txtCompanyName.Value.Trim();
            aftersale.CustomerAddress = txtCustomerAddress.Value.Trim();
            aftersale.Problemdescription = Problemdescription.Value.Trim();
            aftersale.CustomerName = txtCustomerName.Value.Trim();
            aftersale.CustomerTel = txtCustomerTel.Value.Trim();
            aftersale.ImageCredenSession = Guid.Parse(imageSession);
            aftersale.ImageSession = Guid.NewGuid();
            aftersale.IsCancel = false;
            var rd = SerNoCaller.Calr_Aftersales.Add(aftersale);
            if (!rd.IsOK)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "message", "alert('系统内部错误,请刷新页面');", true);
                return;
            }
            //alert('申请成功,我们将尽快处理您的问题。');
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "message", "ClearInput();", true);
                txtApplicanter.Value = string.Empty;
                txtApplicanterTel.Value = string.Empty;
                txtCheckNo.Value = string.Empty;
                txtCompanyName.Value = string.Empty;
                txtCustomerAddress.Value = string.Empty;
                txtCustomerName.Value = string.Empty;
                txtCustomerTel.Value=  string.Empty;
                Problemdescription.Value = string.Empty;
                return;
            }
        }

        protected void BtnshApply_Click(object sender, EventArgs e)
        {
            InsertAfterSales();
        }

        private StringBuilder Aflist()
        {
            StringBuilder list = new StringBuilder();
            string str = string.Empty;
            var sales = SerNoCaller.Calr_Aftersales.Get("select top 3 * from T_ERP_Aftersales where IsDel = 1 order by ProcessingTime desc ");
            if (sales == null || sales.Count < 3) return list;
            foreach(var st in sales)
            {
                str += " <div class='comment_box'><div class='info'><span class='c_info fr'>" + st.CreateDate.ToString("yyyy-MM-dd") + "</span><div><a title='查看详细' target='_blank' href='SalesDetal.aspx?SGD=" + st.Guid + "'><span class='mr40'>姓名：" + st.Applicanter + "</span>&nbsp;&nbsp;运单号：" + st.CheckNo + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;状态：" + (st.IsCancel == false ? "已处理" : "已驳回") + "</a></div></div>";
                str += "<div class='c_cont'>"+st.Problemdescription+"</div><div class='reply_box'>";
                str += "<div class='reply'>" + "回复：" + st.Solution + "</div><div class='date'>" + st.ProcessingTime.Value.ToString("yyyy-MM-dd") + "</div></div></div>";
            }
            list.Append(str);
            return list;
        }
    }
}