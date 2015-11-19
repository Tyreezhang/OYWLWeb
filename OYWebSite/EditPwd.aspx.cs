using FineUI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ultra.FASControls.Caller;
using Ultra.Web.Core.Common;

namespace OYWebSite
{
    public partial class EditPwd : BasicSecurity
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!IsPostBack)
            {
            }
        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            if (Users == null)
            {
                SetSession();
                return;
            }
            if (string.IsNullOrEmpty(this.txtOldPwd.Text.Trim()))
            {
                Alert.Show("请输入原密码", MessageBoxIcon.Information);
                return;
            }
            if (string.IsNullOrEmpty(this.txtPwd.Text.Trim()))
            {
                Alert.Show("请输入旧密码", MessageBoxIcon.Information);
                return;
            }
            if (string.IsNullOrEmpty(this.txtNPwd.Text.Trim()))
            {
                Alert.Show("请确认密码", MessageBoxIcon.Information);
                return;
            }
            if (this.txtOldPwd.Text.Trim() == this.txtPwd.Text.Trim())
            {
                Alert.Show("新密码不能与原密码一样,请重新输入", MessageBoxIcon.Information);
                return;
            }
            if (this.txtPwd.Text.Trim() != this.txtNPwd.Text.Trim())
            {
                Alert.Show("新密码不一致,请确认密码", MessageBoxIcon.Information);
                return;
            }
            string pwdCode = ByteStringUtil.ByteArrayToHexStr(HashDigest.StringDigest(txtOldPwd.Text.Trim()));
            if (Users.SuppName == "admin")
            {

                var managers = SerNoCaller.Calr_User.Get(" where UserName=@0 and Pwd =@1 and IsDel = 0", Users.SuppName, pwdCode);
                if (managers == null || managers.Count < 1)
                {
                    Alert.Show("原密码错误,请重新输入", MessageBoxIcon.Information);
                    return;
                }
                SerNoCaller.Calr_User.ExecSql("Update T_ERP_User Set Pwd=@0 where UserName=@1",ByteStringUtil.ByteArrayToHexStr(HashDigest.StringDigest(this.txtPwd.Text.Trim())),managers.FirstOrDefault().UserName);
            }
            else
            {
                var users = SerNoCaller.Calr_Suppliers.Get("where SuppName=@0 and Pwd=@1 and IsUsing = 1", Users.SuppName, pwdCode);
                if (users == null || users.Count < 1)
                {
                    Alert.Show("原密码错误,请重新输入", MessageBoxIcon.Information);
                    return;
                }
                SerNoCaller.Calr_Suppliers.ExecSql("Update T_ERP_Suppliers Set Pwd=@0 where SuppName=@1", ByteStringUtil.ByteArrayToHexStr(HashDigest.StringDigest(this.txtPwd.Text.Trim())), users.FirstOrDefault().SuppName);
            }
            PageContext.RegisterStartupScript(ActiveWindow.GetHidePostBackReference());
        }
    }
}