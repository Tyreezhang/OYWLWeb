<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditPwd.aspx.cs" Inherits="OYWebSite.EditPwd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body style="background: #FFFFFF;">
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server"></f:PageManager>
        <f:Form ID="Form2" ShowBorder="false" ShowHeader="false" CssStyle="left:15px;top:27px;" Height="140px" MessageTarget="Qtip" Width="260px" runat="server">
            <Items>
                <f:Panel ID="Panel2" ShowHeader="false" CssClass="formitem" ShowBorder="false"
                    Layout="Column" runat="server">
                    <Items>
                        <f:TextBox ID="txtOldPwd" Label="原密码" runat="server" TextMode="Password" LabelWidth="70px" >
                        </f:TextBox>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel11" ShowHeader="false" CssStyle="top:10px;" CssClass="formitem" ShowBorder="false"
                    Layout="Column" runat="server">
                    <Items>
                        <f:TextBox ID="txtPwd" Label="新密码" runat="server" TextMode="Password" LabelWidth="70px" >
                        </f:TextBox>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel1" ShowHeader="false" CssStyle="top:20px;" CssClass="formitem" ShowBorder="false"
                    Layout="Column" runat="server">
                    <Items>
                        <f:TextBox ID="txtNPwd" Label="确认密码" runat="server" TextMode="Password" LabelWidth="70px" >
                        </f:TextBox>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel6" ShowHeader="false" CssStyle="top:35px;" CssClass="formitem" ShowBorder="false"
                    Layout="Column" runat="server">
                    <Items>
                        <f:Label ID="Label5" runat="server" Label="" Width="105px">
                        </f:Label>
                        <f:Button runat="server" ID="btnOk" CssStyle="width:108px;" Text="保存" ValidateForms="Form2" Icon="SystemSave" OnClick="btnOk_Click">
                        </f:Button>
                    </Items>
                </f:Panel>
            </Items>
        </f:Form>
    </form>
</body>
</html>
