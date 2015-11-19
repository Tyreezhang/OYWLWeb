<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AfterSale.aspx.cs" Inherits="OYWebSite.AfterSale" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>售后建议</title>
    <link href="style/main.css" rel="stylesheet" />
    <script src="js/jquery-1.8.3.min.js"></script>
    <link href="dist/webuploader.css" rel="stylesheet" />
    <link href="image-upload/style.css" rel="stylesheet" />
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
            alert("申请成功,我们将尽快处理您的问题。");
            window.location.href = "../AfterSale.aspx?flag=1";
            return false;
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
                <a href="../AfterSale.aspx" style="background: #ff9e40;">
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
            <img src="images/售后建议反馈侧栏底.png" />
            <ul>
                <li id="one" style="background-color: #2E2D29;"><span style="font-size: 12px;">●</span>  <span>售后/建议/反馈</span></li>
            </ul>
        </div>
        <div class="Ps_mid">
            <div style="margin-top: 20px; width: 937px;">
                <span style="font-family: '微软雅黑'; font-size: 30px; color: #CD2D2D; font-weight: bold;">售</span><span style="font-family: '微软雅黑'; font-size: 20px; font-weight: bold;">后/建议/反馈/</span><span style="font-family: '微软雅黑'; font-size: 15px; font-weight: bold;">Aftermarket / Suggestion / Feedback</span>
                <hr />
            </div>
            <div style="width: 937px; display: block;">
                <img src="images/货物查询.png" width="937" />
            </div>

            <div class="public_box" style="margin-top: 30px; width: 937px;">
                <form id="Form1" method="post" runat="server">
                    <!--售后申请-->
                    <div class="shservice">
                        <span style="font-size: 19px; font-family: '微软雅黑'"><span style="color: #020202;"><b>告诉我们您的需求</b> </span><span style="color: #020202; font-size: 16px;">将您对欧洋的任何疑问或对服务的任何不满告诉我们，也可以直接拨打我们的客户服务热线:0757-28332658</span> </span>
                        <hr size="3" color="#656565" />
                        <img src="images/售后服务申请.png" style="margin-top: 15px;" />
                        <table style="margin-top: 15px;">
                            <tr>
                                <td style="width: 120px;">申 请 人：</td>
                                <td style="width: 120px;">
                                    <input type="text" style="width: 200px;" runat="server" required="required" onkeyup="if(this.value.length>4){this.value=this.value.substr(0,4)};" oninvalid="setCustomValidity('必须填写！');" oninput="setCustomValidity('');" id="txtApplicanter" name="txtinput" /></td>
                                <td style="width: 10px;"></td>
                                <td>托 运 单 号：</td>
                                <td style="width: 120px;">
                                    <input type="text" style="width: 200px;" runat="server" required="required" oninvalid="setCustomValidity('必须填写！');" oninput="setCustomValidity('');" onkeyup="this.value=this.value.replace(/\D/g,'');if(this.value.length>14){this.value=this.value.substr(0,14)}" onfocus="this.value=this.value.replace(/\D/g,'');if(this.value.length>14){this.value=this.value.substr(0,14)}"
                                        onblur="this.value=this.value.replace(/\D/g,'');if(this.value.length>14){this.value=this.value.substr(0,14)}" onpaste="this.value=this.value.replace(/\D/g,'');if(this.value.length>14){this.value=this.value.substr(0,14)}" id="txtCheckNo" name="txtinput" /></td>
                                <td style="width: 10px;"></td>
                                <td>公 司 名：</td>
                                <td style="width: 120px;">
                                    <input type="text" style="width: 200px;" runat="server" id="txtCompanyName" name="txtinput" /></td>
                            </tr>
                            <tr style="height: 33px;">
                                <td style="width: 490px;">申请人联系方式：</td>
                                <td style="width: 120px;">
                                    <input type="text" style="width: 200px;" runat="server" required="required" oninvalid="setCustomValidity('必须填写！');" oninput="setCustomValidity('');" id="txtApplicanterTel" name="txtinput" /></td>
                                <td style="width: 10px;"></td>
                                <td>客 户 名：</td>
                                <td style="width: 120px;">
                                    <input type="text" style="width: 200px;" runat="server" id="txtCustomerName" name="txtinput" /></td>
                                <td style="width: 10px;"></td>
                                <td>客户联系方式：</td>
                                <td style="width: 120px;">
                                    <input type="text" style="width: 200px;" runat="server" id="txtCustomerTel" name="txtinput" /></td>
                            </tr>
                            <tr>
                                <td style="width: 120px;">客 户 地 址：</td>
                                <td colspan="8">
                                    <input type="text" style="float: left; width: 818px;" runat="server" id="txtCustomerAddress" name="txtinput" /></td>
                            </tr>
                            <tr>
                                <td style="width: 120px;">问 题 描 述：
                                </td>
                                <td colspan="8">
                                    <textarea runat="server" style="float: left; width: 816px; height: 60px; margin-top: 8px; resize: none;" required="required" id="Problemdescription" name="txtinput" oninvalid="setCustomValidity('必须填写！');" oninput="setCustomValidity('');"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30px;"></td>
                            </tr>
                            <tr>
                                <td style="width: 120px; line-height: 50px; vertical-align: middle">上 传 凭 证：
                                </td>
                                <td colspan="8"></td>
                            </tr>
                        </table>

                    </div>
                    <input id="txtimgSession" type="hidden" runat="server" />
                    <div id="wrapper">
                        <div id="container">
                            <div id="uploader">
                                <div class="queueList">
                                    <div id="dndArea" class="placeholder">
                                        <div id="filePicker" style="margin-top: -78px; margin-left: -18px;">
                                        </div>
                                        <div style="margin-left: -18px; margin-top: -12px">每张图片大小不超过3M,支持GIF、JPG、PNG、BMP格式</div>
                                    </div>
                                </div>
                                <div class="statusBar" style="display: none;">
                                    <div class="progress">
                                        <span class="text">0%</span>
                                        <span class="percentage"></span>
                                    </div>
                                    <div class="info"></div>
                                    <div class="btns">
                                        <div id="filePicker2"></div>
                                        <div class="uploadBtn">开始上传</div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div>
                        <asp:Button runat="server" CssClass="shApply" ID="BtnshApply" OnClick="BtnshApply_Click" />
                    </div>
                    <br />

                    <script src="image-upload/jquery.js"></script>
                    <script src="dist/webuploader.js"></script>
                    <script src="image-upload/upload.js"></script>
                </form>

                <!--售后记录-->
                <h3 class="position-title">售后反馈
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
