<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Successful.aspx.cs" Inherits="OYWebSite.Successful" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>成功案例</title>
    <link href="style/main.css" rel="stylesheet" />
    <script src="js/jquery-1.8.3.min.js"></script>
    <link href="dist/webuploader.css" rel="stylesheet" />
    <link href="image-upload/style.css" rel="stylesheet" />
    <script src="js/jquery.jslides.js"></script>
</head>
<body>
    <form id="form1" runat="server">
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
                    <a href="../Successful.aspx" style="background: #ff9e40;">
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

        <!--中间部分-->
        <div class="public_box">
            <div class="Ps_left">
                <img src="images/成功案例侧栏底.png" />
                <ul>
                    <li id="one" style="background-color: #2E2D29;"><span style="font-size: 12px;">●</span>  <span>合作伙伴</span></li>
                </ul>
            </div>
            <div class="Ps_mid">
                <div style="margin-top: 20px; width: 937px;">
                    <span style="font-family: '微软雅黑'; font-size: 30px; color: #CD2D2D; font-weight: bold;">成</span><span style="font-family: '微软雅黑'; font-size: 20px; font-weight: bold;">功案例/</span><span style="font-family: '微软雅黑'; font-size: 15px; font-weight: bold;">Successful case</span>
                    <hr />
                </div>
                <div style="width: 937px; display: block;">
                    <img src="images/成功案例1.png" width="937" />
                </div>
                <div style="width: 937px; display: block; margin-top: 8px;">
                    <img src="images/成功案例2.png" width="937" />
                </div>
                <div style="width: 937px; display: block; margin-top: 8px;">
                    <img src="images/成功案例3.png" width="937" />
                </div>
                <div style="width: 937px; display: block; margin-top: 8px;">
                    <img src="images/成功案例4.png" width="937" />
                </div>
                <div style="width: 937px; display: block; margin-top: 8px;">
                    <img src="images/成功案例5.png" width="937" />
                </div>
                <div style="width: 937px; display: block; margin-top: 8px;">
                    <img src="images/成功案例6.png" width="937" />
                </div>
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
    </form>
</body>
</html>
