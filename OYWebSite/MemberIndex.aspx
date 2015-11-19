<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberIndex.aspx.cs" Inherits="OYWebSite.MemberIndex" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>欧洋物流会员系统-主界面</title>
    <script src="image-upload/jquery.js"></script>

    <style>
        .header .title a {
            font-weight: bold;
            font-size: 24px;
            text-decoration: none;
            line-height: 50px;
            margin-left: 10px;
        }

        .bottomtable {
            width: 100%;
            font-size: 12px;
        }


        /* 主题相关样式 - neptune */
        .f-theme-neptune .header,
        .f-theme-neptune .bottomtable,
        .f-theme-neptune .x-splitter {
            background-color: #1475BB;
            color: #fff;
        }

            .f-theme-neptune .header a,
            .f-theme-neptune .bottomtable a {
                color: #fff;
            }

            .f-theme-neptune .header .x-panel-body {
                background-color: transparent;
            }

        .themeroller {
            top: 7px;
            float: right;
        }

        .EditPwd {
            color: #FFFFFF;
            font-size: 15px;
            font-family: '微软雅黑';
            margin-top: -5px;

            border: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="RegionPanel1" runat="server"></f:PageManager>
        <f:RegionPanel ID="RegionPanel1" ShowBorder="false" runat="server">
            <Regions>
                <f:Region ID="Region1" ShowBorder="false" Height="50px" ShowHeader="false"
                    Position="Top" Layout="Fit" runat="server">
                    <Items>
                        <f:ContentPanel ShowBorder="false" ShowHeader="false" ID="ContentPanel1" CssClass="header"
                            runat="server">
                            <div class="title" style="background-color: #1475BB;">
                                <a href="./Index.aspx" style="color: #FFFFFF; font-family: '宋体';">&nbsp;欧洋物流会员系统</a>
                                <div class="themeroller">
                                    <asp:Label runat="server" ID="lblUser" Style="color: #FFFFFF; font-size: 15px; font-family: '微软雅黑'">

                                    </asp:Label>
                                    <f:Button runat="server" CssClass="EditPwd" ID="BtnEditPwd" Text="修改密码" OnClick="editPwd_Click"></f:Button>
                                    <a href="javascript:void(0)" style="color: #FFFFFF; font-size: 15px; font-family: '微软雅黑'" id="loginOut">安全退出&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                                </div>
                            </div>
                            <f:Window ID="WindowPwd" Hidden="true" EnableIFrame="true" runat="server" EnableMaximize="false" Target="Parent" EnableResize="false" OnClose="WindowPwd_Close"
                                Height="210px" Width="310px" Title="修改密码">
                            </f:Window>
                        </f:ContentPanel>
                    </Items>
                </f:Region>
                <f:Region ID="Region2" Split="true" Width="200px" ShowHeader="true" Title="菜单"
                    EnableCollapse="true" Layout="Fit" Position="Left" runat="server">
                    <Items>
                        <f:Tree runat="server" ShowBorder="false" ShowHeader="false" EnableArrows="true" EnableLines="true" ID="leftMenuTree">
                            <Nodes>
                                <f:TreeNode Text="基础模块" Expanded="true">
                                    <f:TreeNode Text="订单列表" NavigateUrl="~/List.aspx" Icon="ApplicationAdd"></f:TreeNode>
                                    <f:TreeNode Text="打款未完结" NavigateUrl="~/UnRebateslist.aspx" Icon="Bell"></f:TreeNode>
                                    <f:TreeNode Text="打款已完结" NavigateUrl="~/Rebateslist.aspx" Icon="BellSilver"></f:TreeNode>
                                    <f:TreeNode Text="库存查询" NavigateUrl="~/Inventory.aspx" Icon="ApplicationHome"></f:TreeNode>
                                </f:TreeNode>
                            </Nodes>
                        </f:Tree>
                    </Items>
                </f:Region>
                <f:Region ID="mainRegion" ShowHeader="false" Layout="Fit" Position="Center"
                    runat="server">
                    <Items>
                        <f:TabStrip ID="mainTabStrip" EnableTabCloseMenu="true" ShowBorder="false" runat="server">
                            <Tabs>
                                <f:Tab ID="Tab1" Title="首页" Layout="Fit" Icon="House" runat="server">
                                    <Items>
                                        <f:ContentPanel ID="ContentPanel2" ShowBorder="false" BodyPadding="10px" ShowHeader="false" AutoScroll="true"
                                            runat="server">
                                            祝贵公司生意兴隆,财源滚滚！
                                        </f:ContentPanel>
                                    </Items>
                                </f:Tab>
                            </Tabs>
                        </f:TabStrip>
                    </Items>
                </f:Region>
                <f:Region ID="bottomPanel" RegionPosition="Bottom" ShowBorder="false" ShowHeader="false" EnableCollapse="false" runat="server" Layout="Fit">
                    <Items>
                        <f:ContentPanel ID="ContentPanel3" runat="server" ShowBorder="false" ShowHeader="false">
                            <table class="bottomtable">
                                <tr>
                                    <td style="width: 300px;">&nbsp;
                                        &nbsp;&nbsp;</td>
                                    <td style="text-align: center;">Copyright &copy;
                                        <label id="nowdate"></label>
                                        广东欧洋物流有限公司</td>
                                    <td style="width: 300px; text-align: right;">&nbsp;</td>
                                </tr>
                            </table>
                        </f:ContentPanel>
                    </Items>
                </f:Region>
            </Regions>
        </f:RegionPanel>
    </form>
    <script>
        $(document).ready(function () {
            var str = window.location.href;
            if (str.indexOf("#/List.aspx") < 0 && str.indexOf("#/UnRebateslist.aspx") < 0 && str.indexOf("#/Rebateslist.aspx") < 0 && str.indexOf("#/Inventory.aspx") < 0) {
                window.location.href = "/MemberIndex.aspx#/List.aspx";
            }
            var now = new Date();
            var yy = now.getFullYear(); //截取年，即2015 
            $("#nowdate").text(yy);
        });
        var menuClientID = '<%= leftMenuTree.ClientID %>';
        var tabStripClientID = '<%= mainTabStrip.ClientID %>';
        // 页面控件初始化完毕后，会调用用户自定义的onReady函数
        F.ready(function () {

            // 初始化主框架中的树(或者Accordion+Tree)和选项卡互动，以及地址栏的更新
            // treeMenu： 主框架中的树控件实例，或者内嵌树控件的手风琴控件实例
            // mainTabStrip： 选项卡实例
            // createToolbar： 创建选项卡前的回调函数（接受tabConfig参数）
            // updateLocationHash: 切换Tab时，是否更新地址栏Hash值
            // refreshWhenExist： 添加选项卡时，如果选项卡已经存在，是否刷新内部IFrame
            // refreshWhenTabChange: 切换选项卡时，是否刷新内部IFrame
            F.util.initTreeTabStrip(F(menuClientID), F(tabStripClientID), null, true, false, false);

        });
        $('#loginOut').click(function () {
            var r = confirm("确定是否退出系统？");
            if (r == true) {
                location.href = '../LoginOut.aspx';
            }
        })
    </script>
</body>
</html>
