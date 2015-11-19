<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InventoryAdj.aspx.cs" Inherits="OYWebSite.InventoryAdj" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body style="background: #FFFFFF;">
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server"></f:PageManager>
        <f:Form ID="Form2" ShowBorder="false" ShowHeader="false" CssStyle="left:15px;top:27px;" Height="140px" MessageTarget="Qtip" Width="260px"  runat="server">
            <Items>
                <f:Panel ID="Panel2" ShowHeader="false" CssClass="formitem" ShowBorder="false"
                    Layout="Column" runat="server">
                    <Items>
                        <f:TextBox ID="txtQty" Label="原库存数" runat="server" LabelWidth="70px" Readonly="true">
                        </f:TextBox>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel11" ShowHeader="false" CssStyle="top:10px;" CssClass="formitem" ShowBorder="false"
                    Layout="Column" runat="server">
                    <Items>
                        <f:TextBox ID="txtAdjNum" Label="调整为" runat="server" LabelWidth="70px" Required="true">
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
