<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OYWebSite.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="style/main.css" rel="stylesheet" />
    <script src="js/jquery-1.8.3.min.js"></script>
</head>
<body>
    <div class="top_head">
        <div class="public_box">
            <div class="headlog">
                <img src="images/LOGO.png" />
                <div class="hot_phone"><a href="Login.aspx">登录</a> | <a href="Contactus.aspx">联系我们</a> | 服务热线:13790032893&nbsp;</div>
            </div>
        </div>
    </div>

    <div class="top">
        <div class="public_box">
            <div class="font_nav">
                <a href="../Index.aspx">
                    <span class="font_chinese">首 页</span>
                </a>
                <a href="../ProductService.aspx">
                    <span class="font_chinese">产品服务</span>
                </a>
                <a href="../Companyfeatures.aspx">
                    <span class="font_chinese">公司风貌</span>
                </a>
                <a href="../Successful.aspx">
                    <span class="font_chinese">成功案例</span>
                </a>
                <a href="../Cargoinquiry.aspx">
                    <span class="font_chinese">货物查询</span>
                </a>
                <a href="../AfterSale.aspx">
                    <span class="font_chinese">售后建议</span>
                </a>
                <a href="../MessageCenter.aspx">
                    <span class="font_chinese">留言中心</span>
                </a>
                <a href="../Contactus.aspx">
                    <span class="font_chinese">联系我们</span>
                </a>
            </div>
        </div>
    </div>
    <!--中间顶部查询登录-->
    <div class="public_box">
        <div class="left">
            <img src="images/登录图片.png" width="550" height="430" />
        </div>
        <form runat="server">
            <div class="content_right" style="margin-top: 50px; margin-left: 150px;">
                <div style="color: #666666; font-family: '微软雅黑'; font-size: 24px; margin-left: 26px; margin-top: 12px;">会员登录</div>
                <div class="login">
                    <div class="login_name">
                        <em class="iname"></em>
                        <input type="text" id="username" name="username" minlength="1" value="" runat="server" placeholder="帐号" class="ui-widget-content ui-corner-all" style="width: 235px; padding: 12px 10px 10px 31px;" />
                    </div>
                    <div class="login_pwd">
                        <em class="ipwd"></em>
                        <input type="password" id="pwd" name="pwd" minlength="1" runat="server" placeholder="密码" class="ui-widget-content ui-corner-all" style="width: 235px; padding: 12px 10px 10px 31px;" />
                    </div>
                    <div>
                        <p runat="server" id="errormsg" style="margin-left: 70px; color: red;"></p>
                        <asp:Button runat="server" ID="btnLogin" CssClass="NLogin" OnClick="btnLogin_Click" />
                    </div>
                </div>
            </div>
        </form>
    </div>
    <br />
    <br />
    <div class="foot">
        <div class="foot_top">
            <div class="public_box">
                <div style="float: left; width: 170px; margin-top: 7px;">
                    <ul class="foot_ul">
                        <li>
                            <span>欧洋物流：万州/云阳/开县（及周边）专线直达往返</span>
                        </li>
                        <li>
                            <span>乐从总部：顺德区乐从镇顺联北区家私城10座后面</span>
                        </li>
                        <li>
                            <span>电话：0757-28332658</span>
                        </li>
                        <li>
                            <span>手机：13790032893 王生</span>
                        </li>
                        <li style="margin-top: 5px;">
                            <span>乐从总部仓库：乐从镇上华兴隆物流园5号仓</span>
                        </li>
                        <li>
                            <span>电话：0757-28851958</span>
                        </li>
                        <li>
                            <span>手机：13432680112 王经理</span>
                        </li>
                        <li style="margin-top: 5px;">
                            <span>万州地址：万州区北滨路小天鹅下面水晶郦诚旁</span>
                        </li>
                        <li>
                            <span>手机：15823720356 李生</span>
                        </li>
                    </ul>

                </div>

                <div style="float: left; width: 185px; margin-top: 7px; margin-left: 400px;">
                    <ul class="foot_ul">
                        <li>
                            <span>中山地址：中山市古镇曹二均都沙新工业区(古神公路旁)</span>
                            <br />
                            <span>电话：0760-87878260</span>
                            <br />
                            <span>手机：13266317347 王生</span>
                        </li>

                        <li style="margin-top: 5px;">
                            <span>顺德容桂（分部）：容桂镇细滘物流中心北门7-8号</span>
                            <br />
                            <span>电话：0757-22115617</span>
                            <br />
                            <span>手机：18578423566 贺生</span>
                        </li>

                        <li style="margin-top: 5px;">
                            <span>禅城南庄（分部）：南庄镇紫洞易运物流园B栋5-6号</span>
                            <br />
                            <span>电话：0757-82519293</span>
                            <br />
                        </li>
                    </ul>

                </div>
            </div>
        </div>
    </div>

</body>
</html>
