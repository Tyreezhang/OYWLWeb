<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MessageCenter.aspx.cs" Inherits="OYWebSite.MessageCenter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>留言中心</title>
    <link href="style/main.css" rel="stylesheet" />
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="js/jquery.jslides.js"></script>
    <script type="text/javascript" src="../lib/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../src/kkpager.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../src/kkpager_orange.css" />
    <script type="text/javascript">
        function getParameter(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }
        function ClearInput() {
            alert("留言提交成功！");
            window.location.href = "../MessageCenter.aspx?flag=1";
            return false;
        }
        function f_refreshtype() {
            var Image1 = document.getElementById("img");
            if (Image1 != null) {
                Image1.src = Image1.src + "?";
            }
        }
        //init
        $(function () {
            var pageNo = getParameter('pno');
            if (!pageNo) {
                pageNo = 1;
            }
            var total = $("#<%=total.ClientID%>").val();
            var totalRecords = $("#<%=totalRecords.ClientID%>").val();
            //生成分页
            //有些参数是可选的，比如lang，若不传有默认值
            kkpager.generPageHtml({
                pno: pageNo,
                //总页码
                total: parseInt(total),
                //总数据条数
                totalRecords: parseInt(totalRecords),
                //链接前部
                hrefFormer: 'AfterSale',
                //链接尾部
                hrefLatter: '.aspx',
                getLink: function (n) {
                    return this.hrefFormer + this.hrefLatter + "?pno=" + n;
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
                <a href="../MessageCenter.aspx" style="background: #ff9e40;">
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
            <img src="images/留言中心侧栏底.png" />
            <ul>
                <li id="one" style="background-color: #2E2D29;"><span style="font-size: 12px;">●</span>  <span>留言中心</span></li>
            </ul>
        </div>
        <div class="Ps_mid">
            <div style="margin-top: 20px; width: 937px;">
                <span style="font-family: '微软雅黑'; font-size: 30px; color: #CD2D2D; font-weight: bold;">留</span><span style="font-family: '微软雅黑'; font-size: 20px; font-weight: bold;">言中心 </span><span style="font-family: '微软雅黑'; font-size: 15px; font-weight: bold;">Message/Center</span>
                <hr />
            </div>
            <div style="width: 937px; display: block;">
                <img src="images/留言中心.png" width="937" />
            </div>
            <div class="public_box" style="margin-top: 30px; width: 937px;">
                <form id="Form2" method="post" runat="server">
                    <div class="shservice" id="shservice">
                        <span style="font-size: 19px; font-family: '微软雅黑'"><span style="color: #020202;"><b>发表您的留言</b> </span><span style="color: #020202; font-size: 16px;">您可以留言的方式告诉我们，也可以直接拨打我们的客户服务热线:0757-28332658</span> </span>
                        <hr size="3" color="#656565" />
                        <img src="images/聆听您的声音.png" style="margin-top: 10px;" />
                        <table style="margin-top: 15px; width: 500px;" id="content">
                            <tr>
                                <td style="width: 280px;">姓 名：</td>
                                <td style="width: 120px;">
                                    <input type="text" style="width: 280px;" runat="server" required="required" onkeyup="if(this.value.length>4){this.value=this.value.substr(0,4)};" oninvalid="setCustomValidity('必须填写！');" oninput="setCustomValidity('');" id="txtApplicanter" name="txtinput" /></td>
                                <td style="width: 1100px;"></td>
                            </tr>
                            <tr style="height: 33px;">
                                <td style="width: 450px;">联系方式：</td>
                                <td style="width: 120px;">
                                    <input type="text" style="width: 280px;" runat="server" required="required" oninvalid="setCustomValidity('必须填写！');" oninput="setCustomValidity('');" id="txtApplicanterTel" name="txtinput" /></td>
                                <td style="width: 1100px;"></td>
                            </tr>
                            <tr>
                                <td style="width: 180px;">标 题：</td>
                                <td colspan="2">
                                    <input type="text" style="float: left; width: 280px;" runat="server" required="required"
                                       onkeyup="if(this.value.length>40){this.value=this.value.substr(0,40)}"  oninvalid="setCustomValidity('必须填写！');" oninput="setCustomValidity('');" id="txtTitle" name="txtinput" /></td>
                            </tr>
                            <tr>
                                <td style="width: 180px;">留言内容：
                                </td>
                                <td colspan="2">
                                    <textarea runat="server" style="float: left; width: 278px; height: 100px; margin-top: 8px; resize: none;" required="required"
                                        onkeyup="if(this.value.length>140){this.value=this.value.substr(0,140)}"    id="txtdescription" name="txtinput" oninvalid="setCustomValidity('必须填写！');" oninput="setCustomValidity('');"></textarea>
                                </td>
                                   <td style="text-align: left"><span style="color: red; margin-left: 5px;" runat="server" id="Span1"></span></td>
                            </tr>
                            <tr>
                                <td style="width: 120px;"></td>
                            </tr>
                            <tr>
                                <td style="width: 120px; line-height: 50px; vertical-align: middle">验证码：
                                </td>
                                <td>
                                    <input type="text" style="float: left; width: 215px;" runat="server" required="required" onkeyup="this.value=this.value.replace(/\D/g,'');if(this.value.length>4){this.value=this.value.substr(0,4)};" oninvalid="setCustomValidity('必须填写！');" oninput="setCustomValidity('');" id="txtVfcode" name="txtinput" />
                                    <img src="png.aspx" id="img" onclick="f_refreshtype()" /></td>
                                <td style="text-align: left"><span style="color: red; margin-left: 5px;" runat="server" id="txterror"></span></td>
                            </tr>
                        </table>

                    </div>

                    <div>
                        <asp:Button runat="server" CssClass="lyApply" ID="BtnlyApply" OnClick="BtnlyApply_Click" />
                    </div>
                    <br />
                </form>

                <!--留言记录-->
                <h3 class="position-title">留言板
                </h3>
                <div class="msg" id="msg">
                    <asp:Literal runat="server" ID="txtAfsalelist"></asp:Literal>
                </div>
                <input type="hidden" id="total" runat="server" />
                <input type="hidden" id="totalRecords" runat="server" />
                <div id="kkpager" style="margin-top: 10px; width: 906px;"></div>
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
</body>
</html>
