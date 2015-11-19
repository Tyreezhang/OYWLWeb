using FineUI;
using PetaPoco;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ultra.FASControls;
using Ultra.FASControls.Caller;
using UltraDbEntity;

namespace OYWebSite
{
    public partial class Inventory : BasicSecurity
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!IsPostBack)
            {
                BindGrid("WareName", "DESC");
            }
        }

        private void BindGrid(string sortfield, string sort)
        {
            if (Users == null)
            {
                SetSession();
                return;
            }
            int pageIndex = 0;
            if (list.PageIndex == 0)
            {
                pageIndex += 1;
            }
            else
            {
                pageIndex = list.PageIndex + 1;
            }
            int pageSize = list.PageSize;
            string whr = string.Empty;
            if (Users.SuppName != "admin")
            {
                whr = string.Format(" where SuppName = '{0}' ", Users.SuppName);
            }
            else
            {
                whr = " where 1=1";
            }
            var objs = new List<object>();
            var idx = 0;
            if (!string.IsNullOrEmpty(this.txtOuterIid.Text))
            {
                whr += " and OuterIid  like @" + (idx++).ToString();
                objs.Add("%" + this.txtOuterIid.Text.Trim() + "%");
            }
            if (!string.IsNullOrEmpty(this.txtOuterSkuId.Text))
            {
                whr += " and OuterSkuId  like @" + (idx++).ToString();
                objs.Add("%" + this.txtOuterSkuId.Text.Trim() + "%");
            }
            if (!string.IsNullOrEmpty(this.txtModel.Text))
            {
                whr += " and Model  like @" + (idx++).ToString();
                objs.Add("%" + this.txtModel.Text.Trim() + "%");
            }
            whr += " order by " + sortfield + " " + sort;
            using (var db = new Database(SQLCONN.Conn))
            {
                var pages = db.Page<V_ERP_Inventory>(pageIndex, pageSize, "select * from V_ERP_Inventory " + whr, objs.ToArray());
                list.RecordCount = (int)pages.TotalItems;
                this.list.DataSource = pages.Items;
                list.DataBind();
            }
        }

        private void QueryBind(string sortfield, string sort)
        {
            if (Users == null)
            {
                SetSession();
                return;
            }
            int pageIndex = 1;
            int pageSize = list.PageSize;
            string whr = string.Empty;
            if (Users.SuppName != "admin")
            {
                whr = string.Format(" where SuppName = '{0}' ", Users.SuppName);
            }
            else
            {
                whr = " where 1=1";
            }
            var objs = new List<object>();
            var idx = 0;
            if (!string.IsNullOrEmpty(this.txtOuterIid.Text))
            {
                whr += " and OuterIid  like @" + (idx++).ToString();
                objs.Add("%" + this.txtOuterIid.Text.Trim() + "%");
            }
            if (!string.IsNullOrEmpty(this.txtOuterSkuId.Text))
            {
                whr += " and OuterSkuId  like @" + (idx++).ToString();
                objs.Add("%" + this.txtOuterSkuId.Text.Trim() + "%");
            }
            if (!string.IsNullOrEmpty(this.txtModel.Text))
            {
                whr += " and Model  like @" + (idx++).ToString();
                objs.Add("%" + this.txtModel.Text.Trim() + "%");
            }
            whr += " order by " + sortfield + " " + sort;
            using (var db = new Database(SQLCONN.Conn))
            {
                var pages = db.Page<V_ERP_Inventory>(pageIndex, pageSize, "select * from V_ERP_Inventory " + whr, objs.ToArray());
                list.RecordCount = (int)pages.TotalItems;
                this.list.DataSource = pages.Items;
                list.DataBind();
            }
        }

        protected void btnQuery_Click(object sender, EventArgs e)
        {
            if (Users == null)
            {
                SetSession();
                return;
            }
            QueryBind("WareName", "DESC");
        }

        protected void list_PageIndexChange(object sender, FineUI.GridPageEventArgs e)
        {
            if (Users == null)
            {
                SetSession();
                return;
            }
            list.PageIndex = e.NewPageIndex;
            BindGrid("WareName", "DESC");
        }

        protected void list_Sort(object sender, FineUI.GridSortEventArgs e)
        {
            list.SortDirection = e.SortDirection;
            list.SortField = e.SortField;
            BindGrid(e.SortField.ToString(), e.SortDirection.ToString());
        }

        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            list.PageSize = Convert.ToInt32(ddlPageSize.SelectedValue);
            // 更改每页显示数目时，防止 PageIndex 越界
            if (list.PageIndex > list.PageCount - 1)
            {
                list.PageIndex = list.PageCount - 1;
            }
            QueryBind("WareName", "DESC");
        }

        protected void btnDis_Click(object sender, EventArgs e)
        {
            if (Users == null)
            {
                SetSession();
                return;
            }
            int rows = list.SelectedRowIndex;
            if (rows < 0) return;
            object[] rowDataKeys = list.DataKeys[rows];
            PageContext.RegisterStartupScript(WindowAdj.GetShowReference(string.Format("./InventoryAdj.aspx?Guid={0}&Qty={1}", rowDataKeys[1].ToString(), rowDataKeys[10].ToString())));
        }

        protected void WindowAdj_Close(object sender, FineUI.WindowCloseEventArgs e)
        {
            if (Users == null)
            {
                SetSession();
                return;
            }
            BindGrid("WareName", "DESC");
        }
    }
}