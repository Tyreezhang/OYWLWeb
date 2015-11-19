<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cargoinquiry.aspx.cs" Inherits="OYWebSite.Cargoinquiry" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>货物查询</title>
    <link href="style/main.css" rel="stylesheet" />
    <script src="js/jquery-1.8.3.min.js"></script>
    <link href="dist/webuploader.css" rel="stylesheet" />
    <link href="image-upload/style.css" rel="stylesheet" />
    <script src="js/jquery.jslides.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#btncheckNo").click(function () {
                if ($("#checkno").val() != "请输入要查询的单号") {
                    $.ajax({
                        url: "/data/QueryCheckNo.aspx/Query",
                        type: "POST",
                        data: "{'checkNo':'" + $("#checkno").val() + "'}",
                        dataType: 'json',
                        contentType: "application/json; charset=utf-8",
                        error: function (err) {
                            alert('系统提示:操作失败！' + err.d);
                        },
                        success: function (data) {
                            $("#quertresult").empty();
                            $("#tracktable tbody").empty();
                            if (data.d.length == 1 && data.d[0].Reserved2 == "没有查询到相关记录") {
                                $("#ordlist tbody").empty();
                                $("#quertresult").append("<span style='padding:5px;font-size:14px;'>您好,没有查询到相关记录！</span>");
                                $("#gdjl").css("display", "none");
                                $("#splb").css("display", "none");
                                $("#tracktable").css("display", "none");
                                $("#ordlist").css("display", "none");
                            } else {
                                $("#ordlist tbody").empty();
                                $("#tracktable tbody").empty();
                                for (var i = 0; i < data.d.length; i++) {
                                    if (data.d[i].Flag) {
                                        $("#ordlist tbody").append("<tr><td>" + data.d[i].ItemName + "</td><td>" + data.d[i].ItemSkuName + "</td><td>" + data.d[i].Model + "</td><td>" + (data.d[i].Packcount == null ? "0" : data.d[i].Packcount) + "</td><td>" + data.d[i].Num + "</td><td>" + data.d[i].Volume + "</td></tr>");
                                    }
                                    else {
                                        $("#tracktable tbody").append("<tr><td>" + data.d[i].TrackTime + "</td><td>" + data.d[i].TrackMessage + "</td></tr>");

                                    }
                                }
                                $("#gdjl").css("display", "block");
                                $("#splb").css("display", "block");
                                $("#tracktable").css("display", "block");
                                $("#ordlist").css("display", "block");
                            }

                        }
                    });
                    return false;
                }
            });
            if ($('#<%=checknumber.ClientID%>').val() != "") {
                var checkno = $('#<%=checknumber.ClientID%>').val().replace(/\D/g, '');
                if (checkno.length > 14) {
                    checkno = checkno.substr(0, 14);
                }
                if (checkno == "") {
                    checkno = "请输入要查询的单号";
                }
                $("#checkno").val(checkno);
                $("#btncheckNo").click();
            }
        });
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
                    <a href="../ProductService.aspx">
                        <span class="font_chinese">产品服务</span>
                    </a>
                    <a href="../Companyfeatures.aspx">
                        <span class="font_chinese">公司风貌</span>
                    </a>
                    <a href="../Successful.aspx">
                        <span class="font_chinese">成功案例</span>
                    </a>
                    <a href="../Cargoinquiry.aspx" style="background: #ff9e40;">
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
                <img src="images/货物查询侧栏底.png" />
                <ul>
                    <li id="one" style="background-color: #2E2D29;"><span style="font-size: 12px;">●</span>  <span>货物查询</span></li>
                </ul>
            </div>
            <div class="Ps_mid">
                <div style="margin-top: 20px; width: 937px;">
                    <span style="font-family: '微软雅黑'; font-size: 30px; color: #CD2D2D; font-weight: bold;">货</span><span style="font-family: '微软雅黑'; font-size: 20px; font-weight: bold;">物查询/</span><span style="font-family: '微软雅黑'; font-size: 15px; font-weight: bold;">Cargo inquiry</span>
                    <hr />
                </div>
                <div style="width: 937px;">
                    <img src="images/货物查询.png" width="937" />
                </div>
                <div style="border: 1px solid #bfbfbf; padding: 20px; height: 190px; margin-top: 10px; width: 890px;">
                    <div style="font-size: 18px; margin-bottom: 10px;">按运单号查询</div>
                    <div style="width: 396px; float: left; margin-bottom: 10px;">
                        <p style="font-size: 14px; margin-bottom: 10px;">
                            <input type="hidden" runat="server" id="checknumber" />
                            <textarea id="checkno" onkeyup="this.value=this.value.replace(/\D/g,'');if(this.value.length>14){this.value=this.value.substr(0,14)}" onfocus="if(value=='请输入要查询的单号'){value=''}else{this.value=this.value.replace(/\D/g,'');if(this.value.length>14){this.value=this.value.substr(0,14)}}"
                                onblur="if (value ==''){value='请输入要查询的单号'}else{this.value=this.value.replace(/\D/g,'');if(this.value.length>14){this.value=this.value.substr(0,14)}}" onpaste="this.value=this.value.replace(/\D/g,'');if(this.value.length>14){this.value=this.value.substr(0,14)}" style="width: 380px; resize: none; height: 100px; padding: 5px; color: #989894; vertical-align: top;">请输入要查询的单号</textarea>
                            <span id="erromsg" style="color: red"></span>
                        </p>
                        <img src="images/货物查询按钮.png" id="btncheckNo" width="260" style="margin-left: 52px; cursor: pointer;" height="27" />
                    </div>
                </div>
                <div style="border: 1px solid #bfbfbf; padding: 20px; margin-top: 8px; width: 890px;">
                    <h3 class="queryh3">查询结果：</h3>
                    <div id="quertresult">
                    </div>
                    <div id="gdjl" style="padding: 5px; font-size: 14px; margin-top: 5px; width: 890px; display: none;">运单记录</div>
                    <div id="tracklist" style="margin-top: 0px; width: 890px;">
                        <table id="tracktable" style="display: none;" class="ordtable">
                            <thead>
                                <tr>
                                    <th style="width: 30%;">处理时间</th>
                                    <th style="width: 70%;">运单记录</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                    <div id="splb" style="padding: 5px; font-size: 14px; margin-top: 5px; width: 80px; display: none;">商品列表</div>
                    <div id="resultlist" style="margin-top: 0px; width: 890px;">
                        <table id="ordlist" style="display: none;" class="ordtable">
                            <thead>
                                <tr>
                                    <th style="width: 30%;">产品名称</th>
                                    <th style="width: 30%;">产品规格</th>
                                    <th style="width: 20%;">型号</th>
                                    <th style="width: 6%;">包件数</th>
                                    <th style="width: 7%;">件数</th>
                                    <th style="width: 7%;">体积</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
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
