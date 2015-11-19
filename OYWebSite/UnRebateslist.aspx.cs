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
    public partial class UnRebateslist : BasicSecurity
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!IsPostBack)
            {
                BindGrid("CreateDate", "DESC");
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
            if (itemlist.PageIndex == 0)
            {
                pageIndex += 1;
            }
            else
            {
                pageIndex = itemlist.PageIndex + 1;
            }
            int pageSize = itemlist.PageSize;
            string whr = string.Empty;
            if (Users.SuppName != "admin")
            {
                whr = string.Format(" where Distributor = '{0}' ", Users.SuppName);
            }
            else
            {
                whr = " where 1=1";
            }
            var objs = new List<object>();
            var idx = 0;
            if (!string.IsNullOrEmpty(this.txtCheckNo.Text))
            {
                whr += " and CheckNo  like @" + (idx++).ToString();
                objs.Add("%" + this.txtCheckNo.Text.Trim() + "%");
            }
            whr += " and IsDel=0 and IsAudit=1 and IsPrint=1 and ReturnPrice <> Freight and ReturnPrice < Freight ";
            whr += " order by " + sortfield + " " + sort;
            using (var db = new Database(SQLCONN.Conn))
            {
                var pages = db.Page<V_ERP_Consignment>(pageIndex, pageSize, "select * from V_ERP_Consignment " + whr, objs.ToArray());
                itemlist.RecordCount = (int)pages.TotalItems;
                this.itemlist.DataSource = pages.Items;
                itemlist.DataBind();
            }
            Ords.DataSource = null;
            Ords.DataBind();
        }

        private void QueryBind(string sortfield, string sort)
        {
            if (Users == null)
            {
                SetSession();
                return;
            }
            int pageIndex = 1;
            int pageSize = itemlist.PageSize;
            string whr = string.Empty;
            if (Users.SuppName != "admin")
            {
                whr = string.Format(" where Distributor = '{0}' ", Users.SuppName);
            }
            else
            {
                whr = " where 1=1";
            }
            var objs = new List<object>();
            var idx = 0;
            if (!string.IsNullOrEmpty(this.txtCheckNo.Text))
            {
                whr += " and CheckNo  like @" + (idx++).ToString();
                objs.Add("%" + this.txtCheckNo.Text.Trim() + "%");
            }
            whr += " and IsDel=0 and IsAudit=1 and IsPrint=1 and ReturnPrice <> Freight and ReturnPrice < Freight ";
            whr += " order by " + sortfield + " " + sort;
            using (var db = new Database(SQLCONN.Conn))
            {
                var pages = db.Page<V_ERP_Consignment>(pageIndex, pageSize, "select * from V_ERP_Consignment " + whr, objs.ToArray());
                itemlist.RecordCount = (int)pages.TotalItems;
                this.itemlist.DataSource = pages.Items;
                itemlist.DataBind();
            }
            Ords.DataSource = null;
            Ords.DataBind();
        }

        protected void itemlist_RowClick(object sender, FineUI.GridRowClickEventArgs e)
        {
            object[] rowDataKeys = itemlist.DataKeys[e.RowIndex];
            if (rowDataKeys.Length < 1) return;
            var list = SerNoCaller.Calr_ConsignmentOrder.Get(" select * from T_ERP_ConsignmentOrder where CheckNo = @0 ", rowDataKeys[1].ToString());
            Ords.DataSource = list;
            Ords.DataBind();
        }

        protected void itemlist_PageIndexChange(object sender, FineUI.GridPageEventArgs e)
        {
            if (Users == null)
            {
                SetSession();
                return;
            }
            itemlist.PageIndex = e.NewPageIndex;
            BindGrid("CreateDate", "DESC");
        }

        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            itemlist.PageSize = Convert.ToInt32(ddlPageSize.SelectedValue);
            // 更改每页显示数目时，防止 PageIndex 越界
            if (itemlist.PageIndex > itemlist.PageCount - 1)
            {
                itemlist.PageIndex = itemlist.PageCount - 1;
            }
            QueryBind("CreateDate", "DESC");
        }

        protected void itemlist_Sort(object sender, FineUI.GridSortEventArgs e)
        {
            itemlist.SortDirection = e.SortDirection;
            itemlist.SortField = e.SortField;
            BindGrid(e.SortField.ToString(), e.SortDirection.ToString());
        }

        protected void btnQuery_Click(object sender, EventArgs e)
        {
            if (Users == null)
            {
                SetSession();
                return;
            }
            QueryBind("CreateDate", "DESC");
        }
    }
}