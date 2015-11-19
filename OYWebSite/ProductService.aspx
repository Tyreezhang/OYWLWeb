<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductService.aspx.cs" Inherits="OYWebSite.ProductService" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>产品服务</title>
    <link href="style/main.css" rel="stylesheet" />
    <script src="js/jquery-1.8.3.min.js"></script>
    <link href="dist/webuploader.css" rel="stylesheet" />
    <link href="image-upload/style.css" rel="stylesheet" />
    <script src="js/jquery.jslides.js"></script>
    <script type="text/javascript">
        function Leftnavigation(flag) {
            switch (flag) {
                case "one":
                    $("#one").css("background-color", "#2E2D29");
                    $("#two").css("background-color", "#B7B8BC");
                    $("#three").css("background-color", "#B7B8BC");
                    $("#four").css("background-color", "#B7B8BC");
                    $("#zxfw").css("display", "block");
                    $("#ckgl").css("display", "none");
                    $("#psaz").css("display", "none");
                    $("#zzfw").css("display", "none");
                    break;
                case "two":
                    $("#two").css("background-color", "#2E2D29");
                    $("#one").css("background-color", "#B7B8BC");
                    $("#three").css("background-color", "#B7B8BC");
                    $("#four").css("background-color", "#B7B8BC");
                    $("#zxfw").css("display", "none");
                    $("#ckgl").css("display", "block");
                    $("#psaz").css("display", "none");
                    $("#zzfw").css("display", "none");
                    break;
                case "three":
                    $("#three").css("background-color", "#2E2D29");
                    $("#one").css("background-color", "#B7B8BC");
                    $("#two").css("background-color", "#B7B8BC");
                    $("#four").css("background-color", "#B7B8BC");
                    $("#zxfw").css("display", "none");
                    $("#ckgl").css("display", "none");
                    $("#psaz").css("display", "block");
                    $("#zzfw").css("display", "none");
                    break;
                case "four":
                    $("#four").css("background-color", "#2E2D29");
                    $("#one").css("background-color", "#B7B8BC");
                    $("#two").css("background-color", "#B7B8BC");
                    $("#three").css("background-color", "#B7B8BC");
                    $("#zxfw").css("display", "none");
                    $("#ckgl").css("display", "none");
                    $("#psaz").css("display", "none");
                    $("#zzfw").css("display", "block");
                    break;
            }

        }
    </script>
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
                    <a href="../ProductService.aspx" style="background: #ff9e40;">
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

        <!--中间部分-->
        <div class="public_box">
            <div class="Ps_left">
                <img src="images/产品服务侧栏底.png" />
                <ul>
                    <li id="one" style="background-color: #2E2D29;" onclick="Leftnavigation('one');"><span style="font-size: 12px;">●</span>  <span>专线服务</span></li>
                    <li id="two" style="margin-top: 3px;" onclick="Leftnavigation('two');"><span style="font-size: 12px;">●</span>  <span>仓储管理</span></li>
                    <li id="three" style="margin-top: 3px;" onclick="Leftnavigation('three');"><span style="font-size: 12px;">●</span>  <span>配送安装</span></li>
                    <li id="four" style="margin-top: 3px;" onclick="Leftnavigation('four');"><span style="font-size: 12px;">●</span>  <span>增值服务</span></li>
                </ul>
            </div>
            <div class="Ps_mid">
                <!--中间头部-->
                <div style="margin-top: 20px; width: 937px;">
                    <span style="font-family: '微软雅黑'; font-size: 30px; color: #CD2D2D; font-weight: bold;">产</span><span style="font-family: '微软雅黑'; font-size: 20px; font-weight: bold;">品服务/</span><span style="font-family: '微软雅黑'; font-size: 15px; font-weight: bold;">Services</span>
                    <hr />
                </div>

                <!--专线服务-->
                <div id="zxfw" style="width: 937px; display: block;">
                    <img src="images/专线服务.png" width="937" />
                    <div style="margin-top: 25px;">
                        <span style="font-size: 25px; color: #020202;">专线服务</span>
                        <div style="font-size: 18px; margin-top: 5px;">
                            &nbsp;&nbsp;&nbsp;&nbsp;我司将根据您所托运货物的特性，为您量身制定出安全、合理、快捷、实惠的运输模式。由专人对车辆进行全程跟踪、全方位服务，以保障您的货物能安全快速的到达。
                        </div>
                    </div>
                </div>

                <!--仓储管理-->
                <div id="ckgl" style="width: 937px; display: none;">
                    <img src="images/仓储管理.png" width="937" />
                    <div style="margin-top: 25px;">
                        <span style="font-size: 25px; color: #020202;">仓储管理</span>
                        <div style="font-size: 18px; margin-top: 5px; padding: 2px;">
                            &nbsp;&nbsp;&nbsp;&nbsp;目前，我司已经在万州、乐从、中山、容桂、南庄等各地建立起规模庞大的仓储系统，占地面积5000平方米，各个仓库基础设施、证照齐全。我们为您提供供应链管理体系的规划和设计，包括库存水平、仓库地理位置、仓库管理体系的优化和仓库运作管理等服务。
                            <br />
                            仓储的主要价值<br />
                            •为您设计和提供优化仓库方案，确保您的服务水平和降低库存成本<br />
                            •为您提供整个仓储过程的管理，减少您的管理成本<br />
                            •为您提供仓储管理信息支持加快信息流，降低库存成本等<br />
                            •为您提供优化的运作方案，提高仓库管理效率和准确性，降低运作成本<br />
                            <br />

                            仓储服务主要模式<br />
                            •公共仓库服务：通过公共仓库服务，主要满足规模较小的客户，我们通过整合多客户的仓库管理，降低管理成本，公共仓库有采用按月、天的计费办法；<br />
                            •合同仓库服务 :提供合同仓库服务，主要是满足规模较大或商品有特殊要求的客户，我们提供专业管理，合同仓库主要是通过合同约定的服务内容和服务时间进行收费；<br />
                            •装卸服务： 提供货物分拣、理货和装卸服务；

                        </div>
                    </div>
                </div>

                <!--配送安装-->
                <div id="psaz" style="width: 937px; display: none;">
                    <img src="images/配送安装.png" width="937" />
                    <div style="margin-top: 25px;">
                        <span style="font-size: 25px; color: #020202;">配送安装</span>
                        <div style="font-size: 18px; margin-top: 5px; padding: 2px;">
                            接货<br />
                            客户下单后，需上门提货的，配送中心根据货量指派相应车型到客户指定地点提货。<br />
                            送货<br />
                            货物到达目的地网点后，配送中心对提货方式为“送货”的运单，根据运单上指定的地点，按时将货物送达。<br />
                            城市配送<br />
                            在所服务的城区及市近郊范围内，按照客户要求，从一个指定的地点将货物送到另一个指定地点的短途包车服务（没有经过公司内部的装卸）<br />
                            配送是物流的始端和末端，是指服务于城区以及市近郊的货物配送活动，根据客户的要求，在与客户约定的时间里，将货物送达指定地点或上门提货。配送服务是干线运输服务的延伸或补充；为客户提供足不出户的物流服务。<br />
                            搬楼安装<br />
                            我司为你提供货物上楼，家具安装、拆装、维修、售后服务等一体化服务，本公司拥有专业的装卸工及家具安装工多名，大部分5年以上的家具安装工作实践经验， 精通各种品牌家具拆装、维修等，安装技术过硬、服务意识强，深受各地（网购家具）消费者与家具厂家的惠顾与厚爱！

                        </div>
                    </div>
                </div>

                <!--增值服务-->
                <div id="zzfw" style="width: 937px; display: none;">
                    <img src="images/增值服务.png" width="937" />
                    <div style="margin-top: 25px;">
                        <span style="font-size: 25px; color: #020202;">增值服务</span>
                        <div style="font-size: 18px; margin-top: 5px; padding: 2px;">
                            代收货款<br />
                            一、 代收货款服务<br />
                            为保障您货款安全、及时的回笼。我司特增设代收货款服务。代收货款实行转账支付，回收货款后，在承诺的退款时效内将货款汇出。提供两种代收货款服务“即日退”和“三日退”。<br />
                            1、即日退<br />
                            退款时效：收货人正常签收后24小时内到账（周末可退、国家公布的法定假期不退款）<br />
                            2、三日退<br />
                            退款时效：收货人正常签收后第三天汇款（遇周末、节假日顺延）<br />
                            二、保价运输<br />
                            保价运输 零损失，零风险<br />
                            定义：保价运输是我司与您共同确定的以托运人申明货物价值为基础的一种特殊运输方式。您向我司声明其托运货物的实际价值，若货物出险，即可获得我司相应赔偿。<br />
                            收费标准：保价费率4‰，最低收费5元/票。<br />
                            温馨提示：请您在发货时如实申报货物价值，并按货物价值购买保价，以免去后顾之忧。<br />
                            理赔原则<br />
                            1、办理保价运输服务的：货物全部灭失。按货物保价声明价值赔偿；货物部分毁损或灭失，按声明价值的损失比例赔偿；声明价值高于实际价值的，按实际价值赔偿。<br />
                            2、未办理保价运输服务的：每件货物价值在300元以内的按货物实际损失赔偿；每件货物价值超过300元的，我司对每件货物的最高赔偿额不超过300元。按以上方式计算得出的赔偿额超过货物实际价值的部分无效。<br />
                            三、包装<br />
                            360°安全包装，专为您的货物量身定制<br />
                            为确保货物运输安全，减少因包装不当导致的货物破损、散落、污染等，我司将提供木箱、木架、规格纸箱、膜（带托盘/不带托盘）、打包带、钢带、编织袋等包装材料。精心为您提供包装服务。<br />
                            备注：代打木箱业务仅个别城市提供服务。<br />

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <br />
        <br />
        <br />
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
