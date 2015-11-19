using FineUI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ultra.FASControls.Caller;

namespace OYWebSite
{
    public partial class InventoryAdj : BasicSecurity
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!IsPostBack)
            {
                string Guid = Request.QueryString["Guid"];
                string Qty = Request.QueryString["Qty"];
                txtQty.Text = Qty;
            }
        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            if (Users == null)
            {
                SetSession();
                return;
            }
            if (string.IsNullOrEmpty(this.txtAdjNum.Text.Trim()))
            {
                Alert.Show("请输入调整数", MessageBoxIcon.Information);
                return;
            }
            Regex reg = new Regex("^[0-9]+$");
            Match ma = reg.Match(txtAdjNum.Text);
            if (!ma.Success)
            {
                Alert.Show("输入格式有误,请输入整数");
                return;
            }
            if (int.Parse(txtAdjNum.Text.Trim()) < 0)
            {
                Alert.Show("分配数量不能小于0", MessageBoxIcon.Warning);
                return;
            }
            Guid guid = Guid.Parse(Request.QueryString["Guid"]);
            var et = SerNoCaller.Calr_Inventory.Get("where Guid =@0", guid).FirstOrDefault();
            SerNoCaller.Calr_Inventory.ExecSql("Update T_ERP_Inventory Set Qty=@0 where Guid=@1", int.Parse(txtAdjNum.Text.Trim()),guid);
            var log = new UltraDbEntity.T_ERP_Log
            {
                Creator = Users.SuppName,
                Updator = Users.SuppName,
                Remark = string.Empty,
                Reserved1 = 0,
                Reserved2 = string.Empty,
                Reserved3 = false,
                Guid = Guid.NewGuid(),
                UserName = Users.SuppName,
                ActionName ="调整库存",
                ActionDesc = et.WareName + " " + et.AreaName + " " + et.LocName + " " + et.OuterIid + " " + et.OuterSkuId + " " + et.Model + " " + "原库存数:" + et.Qty + "  调整为:" + txtAdjNum.Text,
                BatchGuid = guid
            };
            Ultra.WindowsControl.Caller.SerNoCaller.Calr_Log.Add(log);
            PageContext.RegisterStartupScript(ActiveWindow.GetHidePostBackReference());
        }
    }
}