<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rebateslist.aspx.cs" Inherits="OYWebSite.Rebateslist" %>

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
                    Text="运单号：">
                </f:Label>
                <f:TextBox ID="txtCheckNo" ShowLabel="false" Label="运单号" Width="180px" CssClass="marginr" runat="server">
                </f:TextBox>
                <f:Label ID="Label2" runat="server" Width="20px" CssStyle="left:12px;" CssClass="marginr" ShowLabel="false"
                    Text="">
                </f:Label>
                <f:Button runat="server" ID="btnQuery" CssStyle="left:10px; width:120px;" OnClick="btnQuery_Click" Text="查询">
                </f:Button>
            </Items>
        </f:Panel>
        <f:Grid ID="itemlist" PageSize="10" Title="表格" Height="350px" EnableCollapse="true" CssStyle="left:10px;top:5px;" Width="1120px" ShowBorder="true" ShowHeader="false" OnSort="itemlist_Sort" SortDirection="ASC" AllowSorting="true"
            AllowPaging="true" EnableTextSelection="true" EnableRowClickEvent="true" OnRowClick="itemlist_RowClick" IsDatabasePaging="true" runat="server" DataKeyNames="Id,CheckNo,Guid,CreateDate,Departure,Arrival,ReceiverName,ReceiverMobile,Freight,FreightType" OnPageIndexChange="itemlist_PageIndexChange">
            <Columns>
                <f:RowNumberField EnablePagingNumber="true" Width="30px" />
                <f:BoundField Width="135px" DataField="CheckNo" DataFormatString="{0}" HeaderText="运单号" DataToolTipField="CheckNo" SortField="CheckNo" />
                <f:BoundField Width="120px" DataField="CreateDate" HeaderText="运单日期" DataFormatString="{0:yyyy-MM-dd}" DataToolTipField="CreateDate" DataToolTipFormatString="{0:yyyy-MM-dd}" SortField="CreateDate" />
                <f:BoundField Width="130px" DataField="Departure" HeaderText="起运地" DataFormatString="{0}" DataToolTipField="Departure" SortField="Departure" />
                <f:BoundField Width="130px" DataField="Arrival" DataFormatString="{0}" HeaderText="到达地" DataToolTipField="Arrival" SortField="Arrival" />
                <f:BoundField Width="120px" DataField="ReceiverName" DataFormatString="{0}" HeaderText="收货人" DataToolTipField="ReceiverName" SortField="ReceiverName" />
                <f:BoundField Width="100px" DataField="ReceiverMobile" DataFormatString="{0}" HeaderText="收货人电话" DataToolTipField="ReceiverMobile" SortField="ReceiverMobile" />
                <f:BoundField Width="70px" DataField="CountFee" DataFormatString="{0}" HeaderText="费用总额" DataToolTipField="Freight" SortField="CountFee" />
                <f:BoundField Width="70px" DataField="ReturnPrice" DataFormatString="{0}" HeaderText="打款总额" DataToolTipField="Freight" SortField="ReturnPrice" />
                <f:BoundField Width="70px" DataField="Freight" DataFormatString="{0}" HeaderText="运费" DataToolTipField="Freight" SortField="Freight" />
                <f:BoundField Width="70px" DataField="FreightType" DataFormatString="{0}" HeaderText="运费类型" DataToolTipField="FreightType" SortField="FreightType" />

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
        <f:Grid ID="Ords" Height="180px" EnableCollapse="true" EnableTextSelection="true" Width="1120px" CssStyle="left:10px;top:5px;" ShowBorder="true" ShowHeader="false"
            runat="server">
            <Columns>
                <f:RowNumberField />
                <f:BoundField Width="210px" DataField="ItemName" DataFormatString="{0}" HeaderText="产品名称" DataToolTipField="ItemName" />
                <f:BoundField Width="210px" HeaderText="产品规格" DataField="ItemSkuName" DataFormatString="{0}" DataToolTipField="ItemSkuName">
                </f:BoundField>
                <f:BoundField Width="180px" DataField="Model" HeaderText="型号" DataFormatString="{0}" DataToolTipField="Model" />
                <f:BoundField Width="60px" DataField="Volume" HeaderText="体积" DataFormatString="{0}" DataToolTipField="Volume" />
                <f:BoundField Width="40px" DataField="Num" HeaderText="数量" DataFormatString="{0}" DataToolTipField="Num" />
                <f:BoundField Width="80px" DataField="Packing" HeaderText="包装" DataFormatString="{0}" DataToolTipField="Packing" />
                <f:BoundField Width="45px" DataField="Packcount" HeaderText="件数" DataFormatString="{0}" DataToolTipField="Packcount" />
                <f:BoundField Width="100px" DataField="Color" HeaderText="颜色" DataFormatString="{0}" DataToolTipField="Color" />
                <f:BoundField Width="80px" DataField="Guid" HeaderText="guid" DataFormatString="{0}" Hidden="true" />
            </Columns>
        </f:Grid>
    </form>
</body>
</html>
