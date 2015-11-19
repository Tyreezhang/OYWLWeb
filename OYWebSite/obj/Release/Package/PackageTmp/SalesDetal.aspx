<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SalesDetal.aspx.cs" Inherits="OYWebSite.SalesDetal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>售后详细内容</title>
    <link href="style/main.css" rel="stylesheet" />
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="js/jquery.jslides.js"></script>
    <script src="fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
    <script src="fancybox/jquery.fancybox-1.3.4.pack.js"></script>
    <link href="fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet" />
    <script type="text/javascript">
        $(function () {
            $("a[rel=apply_group]").fancybox({
                'transitionIn': 'none',
                'transitionOut': 'none',
                'titlePosition': 'over',
                'titleFormat': function (title, currentArray, currentIndex, currentOpts) {
                    return '<span id="fancybox-title-over">Image ' + (currentIndex + 1) + ' / ' + currentArray.length + (title.length ? ' &nbsp; ' + title : '') + '</span>';
                }
            });
            $("a[rel=after_group]").fancybox({
                'transitionIn': 'none',
                'transitionOut': 'none',
                'titlePosition': 'over',
                'titleFormat': function (title, currentArray, currentIndex, currentOpts) {
                    return '<span id="fancybox-title-over">Image ' + (currentIndex + 1) + ' / ' + currentArray.length + (title.length ? ' &nbsp; ' + title : '') + '</span>';
                }
            });
        });
    </script>
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

    <!-- banner-->
    <div id="lanrenzhijia">
        <ul id="slides">
            <li style="z-index: 0; display: block; background: url(images/banner1.png) 50% 0% no-repeat;"></li>
            <li style="z-index: 1; display: none; background: url(images/banner2.jpg) 50% 0% no-repeat;"></li>
        </ul>
    </div>

    <div class="public_box">
        <div class="Ps_left">
            <img src="images/售后详细侧栏底.png" />
            <ul>
                <li id="one" style="background-color: #2E2D29;"><span style="font-size: 12px;">●</span>  <span>售后详情</span></li>
            </ul>
        </div>

        <div class="Ps_mid">
            <div style="margin-top: 20px; width: 937px;">
                <span style="font-family: '微软雅黑'; font-size: 30px; color: #CD2D2D; font-weight: bold;">申</span><span style="font-family: '微软雅黑'; font-size: 20px; font-weight: bold;">请售后/</span><span style="font-family: '微软雅黑'; font-size: 15px; font-weight: bold;">Apply for after sales</span>
                <hr />
            </div>
            <form runat="server">
                <div style="width: 937px; display: block;">
                    <asp:Literal runat="server" ID="afterlist"></asp:Literal>
                </div>
            </form>
        </div>
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
