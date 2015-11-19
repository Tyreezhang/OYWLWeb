$(function () {
    $("#msg .comment_box").last().css("border-bottom", "1px dashed #FFFFFF");
    $("#btnQuery").click(function () {
        var CheckNo = $("#CheckNo").val();
        if (CheckNo != "请输入要查询的单号") {
            window.location.href = "../Cargoinquiry.aspx?CheckNo=" + CheckNo;
        }
    });
    $("#btnLogin").click(function () {
        var username = $("#username").val();
        var pwd = $("#pwd").val();
        if (username == null || username == "") {
            alert("请输入帐号！");
            return false;
        }
        if (pwd == null || pwd == "") {
            alert("请输入密码！");
            return false;
        }
        $.ajax({
            url: "Login.aspx?name=" + username + "&pwd=" + pwd,
            type: "POST",
            dataType: 'text',
            error: function () {
            },
            success: function (data) {
                if (data == "登录成功") {
                    window.parent.frames.location.href = "../MemberIndex.aspx"
                }
                else {
                    alert(data);
                }
            }
        });
        return false;
    });
})
function ClearInput() {
    alert("申请成功,我们将尽快处理您的问题。");
    window.location.href = "../Index.aspx?flag=1";
    return false;
}

