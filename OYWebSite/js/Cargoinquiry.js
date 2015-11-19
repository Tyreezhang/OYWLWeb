$(function () {
    alert(document.all('<%=checknumber.ClientID %>').value);
    $("#btncheckNo").click(function () {
        if ($("#checkno").val() != "请输入要查询的单号") {
            $.ajax({
                url: "/data/QueryCheckNo.aspx/Query",
                type: "POST",
                data: "{'checkNo':'" + $("#checkno").val() + "'}",
                dataType: 'json',
                contentType: "application/json; charset=utf-8",
                error: function (err) {
                    alert('系统提示:操作失败！'+err.d);
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
                        $("#tracktable").css("display","block");
                        $("#ordlist").css("display", "block");
                    }

                }
            });
            return false;
        }
    });
});