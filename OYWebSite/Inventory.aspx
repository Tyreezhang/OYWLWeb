<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="OYWebSite.Inventory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body style="background: #FFFFFF;">
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" ShowHeader="false" CssStyle="left:10px;top:5px;" Width="1020px" Height="30px" ShowBorder="false" Layout="Column" CssClass="formitem"
            runat="server">
            <Items>
                <f:Label ID="lblname" runat="server" Width="70px" CssStyle="left:12px;" CssClass="marginr" ShowLabel="false"
                    Text="产品名称：">
                </f:Label>
                <f:TextBox ID="txtOuterIid" ShowLabel="false" Label="产品名称" Width="180px" CssClass="marginr" runat="server">
                </f:TextBox>
                <f:Label ID="Label2" runat="server" Width="20px" CssStyle="left:12px;" CssClass="marginr" ShowLabel="false"
                    Text="">
                </f:Label>
                <f:Label ID="Label1" runat="server" Width="70px" CssStyle="left:12px;" CssClass="marginr" ShowLabel="false"
                    Text="产品规格：">
                </f:Label>
                <f:TextBox ID="txtOuterSkuId" ShowLabel="false" Label="产品规格" Width="180px" CssClass="marginr" runat="server">
                </f:TextBox>
                <f:Label ID="Label3" runat="server" Width="20px" CssStyle="left:12px;" CssClass="marginr" ShowLabel="false"
                    Text="">
                </f:Label>
                <f:Label ID="Label4" runat="server" Width="40px" CssStyle="left:12px;" CssClass="marginr" ShowLabel="false"
                    Text="型号：">
                </f:Label>
                <f:TextBox ID="txtModel" ShowLabel="false" Label="型号" Width="180px" CssClass="marginr" runat="server">
                </f:TextBox>
                <f:Label ID="Label5" runat="server" Width="20px" CssStyle="left:12px;" CssClass="marginr" ShowLabel="false"
                    Text="">
                </f:Label>
                <f:Button runat="server" ID="btnQuery" CssStyle="left:10px; width:120px;" OnClick="btnQuery_Click" Text="查询">
                </f:Button>
            </Items>
        </f:Panel>
        <f:Grid ID="list" PageSize="10" Title="表格" Height="510px" EnableCollapse="true" CssStyle="left:10px;top:5px;" Width="1120px" ShowBorder="true" ShowHeader="false" OnSort="list_Sort" SortDirection="ASC" AllowSorting="true"
            AllowPaging="true" EnableTextSelection="true" IsDatabasePaging="true" runat="server" DataKeyNames="Id,Guid,WareName,AreaName,LocName,OuterIid,OuterSkuId,Model,TopOuterIid,TopOuterSkuId,Qty" OnPageIndexChange="list_PageIndexChange">
            <Toolbars>
                <f:Toolbar ID="Toolbar" runat="server">
                    <Items>
                        <f:Button ID="btnDis" Text="库存调整" Icon="ApplicationGet" OnClick="btnDis_Click" runat="server">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Columns>
                <f:RowNumberField EnablePagingNumber="true" Width="30px" />
                <f:BoundField Width="135px" DataField="WareName" DataFormatString="{0}" HeaderText="仓库" DataToolTipField="WareName" SortField="WareName" />
                <f:BoundField Width="135px" DataField="AreaName" HeaderText="区域" DataToolTipField="AreaName" SortField="AreaName" />
                <f:BoundField Width="135px" DataField="LocName" HeaderText="库位" DataFormatString="{0}" DataToolTipField="LocName" SortField="LocName" />
                <f:BoundField Width="135px" DataField="OuterIid" DataFormatString="{0}" HeaderText="产品名称" DataToolTipField="OuterIid" SortField="OuterIid" />
                <f:BoundField Width="135px" DataField="OuterSkuId" DataFormatString="{0}" HeaderText="产品规格" DataToolTipField="OuterSkuId" SortField="OuterSkuId" />
                <f:BoundField Width="135px" DataField="Model" DataFormatString="{0}" HeaderText="型号" DataToolTipField="Model" SortField="Model" />
                <f:BoundField Width="100px" DataField="TopOuterIid" DataFormatString="{0}" HeaderText="颜色" DataToolTipField="TopOuterIid" SortField="TopOuterIid" />
                <f:BoundField Width="70px" DataField="Qty" DataFormatString="{0}" HeaderText="库存数" DataToolTipField="Qty" SortField="Qty" />
                <f:BoundField Width="135px" DataField="Guid" DataFormatString="{0}" HeaderText="Guid" Hidden="true" />
            </Columns>
            <PageItems>
                <f:ToolbarSeparator ID="ToolbarSeparator1" runat="server">
                </f:ToolbarSeparator>
                <f:ToolbarText ID="ToolbarText1" runat="server" Text="每页记录数：">
                </f:ToolbarText>
                <f:DropDownList runat="server" ID="ddlPageSize" Width="80px" AutoPostBack="true"
                    OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
                    <f:ListItem Text="10" Value="10" />
                    <f:ListItem Text="50" Value="50" />
                    <f:ListItem Text="100" Value="100" />
                    <f:ListItem Text="500" Value="500" />
                    <f:ListItem Text="2000" Value="2000" />
                    <f:ListItem Text="5000" Value="5000" />
                </f:DropDownList>
            </PageItems>
        </f:Grid>
                <f:Window ID="WindowAdj" Hidden="true" EnableIFrame="true" runat="server" EnableMaximize="false" Target="Parent" EnableResize="false" OnClose="WindowAdj_Close"
              Height="210px" Width="310px" Title="库存调整">
        </f:Window>
    </form>
</body>
</html>
