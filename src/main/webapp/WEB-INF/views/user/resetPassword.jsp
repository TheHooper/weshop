<%--
  Created by IntelliJ IDEA.
  User: 47123
  Date: 2016/5/13
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <title>修改密码</title>
    <link href="<c:url value="${pageContext.request.contextPath}/css/frozen.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="${pageContext.request.contextPath}/css/homall.css"/>" rel="stylesheet" type="text/css"/>
    <script type="text/javascript"
            src="<c:url value="${pageContext.request.contextPath}/js/lib/zeptojs/zepto.min.js"/>"></script>
</head>
<body>
<header id="header" class="header">
    <a href="/user/central" class="header-arrow-l"><i id="headerBarCat" class="ui-icon-prev"></i></a>
    <h2 class="ui-flex-pack-center">修改密码</h2>
</header>

<section id="forPassword">

    <br/>

    <div class="ui-form ui-border-t">
        <div class="ui-form-item ui-border-b">
            <label>
                手机号
            </label>
            <input id="mobile" type="text" placeholder="请输入手机">
            <a href="javascript:void(0);" class="ui-icon-close">
            </a>
        </div>
        <%--<div class="ui-form-item ui-form-item-l  ui-border-b">--%>
        <%--<label class="ui-border-r">--%>
        <%--验证码--%>
        <%--</label>--%>
        <%--<input type="text" placeholder="请输入图像验证码">--%>
        <%--<a href="javascript:void(0);" class="ui-icon-close"></a>--%>
        <%--</div>--%>
        <div class="ui-form-item ui-form-item-r ui-border-b">
            <input id="smsCode" type="text" placeholder="请输入短信验证码">
            <!-- 若按钮不可点击则添加 disabled 类 -->
            <button id="send-sms-btn" type="button" class="ui-border-l">发送短信</button>
            <a href="javascript:void(0);" class="ui-icon-close"></a>
        </div>
    </div>

    <br/>

    <div class="ui-form ui-border-t">
        <div class="ui-form-item ui-border-b">
            <label class="ui-border-r">
                新密码
            </label>
            <input id="newPassword" type="password" placeholder="请输入新密码">
            <a href="javascript:void(0);" class="ui-icon-close">
            </a>
        </div>
        <div class="ui-form-item ui-border-b">
            <label class="ui-border-r">
                确认密码
            </label>
            <input id="rePassword" type="password" placeholder="请再次输入新密码">
            <a href="javascript:void(0);" class="ui-icon-close">
            </a>
        </div>
    </div>

    <div class="ui-form ui-border-t">
        <div id="error-view" class="ui-form-item ui-border-b ho-text-center color-red" style="display: none">

        </div>
    </div>

    <div class="ui-btn-wrap text-center margin-top-m">
        <button id="forgetPassword-ok" class="ui-btn-lg ui-btn-primary">
            确认
        </button>
        <button class="ui-btn-lg margin-top-s" onClick="javascript :history.go(-1);">
            返回
        </button>
    </div>
</section>

<section id="notice" class="ui-notice" style="display: none">
    <div class="ho-margin-vertical-xl ">
        <i class="ui-icon-success ho-text-xxxl"></i>
    </div>
    <p>
        密码已经修改成功~！
    </p>
    <div class="ui-notice-btn">
        <button id="back" class="ui-btn-primary ui-btn-lg">返回</button>
    </div>
</section>

</body>
<script type="text/javascript" src="<c:url value="${pageContext.request.contextPath}/js/frozen.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="${pageContext.request.contextPath}/js/util/base64.min.js"/>"></script>
<script>
    (function () {
        var prefix = "${pageContext.request.contextPath}"


        $("#send-sms-btn").tap(function () {
            if ($(this).hasClass("disabled")) {
                return;
            } else {
                settime(this);
                var mobile = $("#mobile").val();
                var mobile64 = Base64.encode(mobile);
                $.ajax({
                    type: "POST",
                    url: prefix + "/sms/sendCode",
                    data: {
                        mobile: mobile64,
//                        captcha: $("#captcha-input").val()
                    },
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.code == "0") {
                            $("#error-view").css("display", "none");
                        } else {
                            console.log(data);
                            $("#error-view").css("display", "block");
                            $("#error-view").text(data.msg);
                            countdown = 1;
                        }
                    },
                    error: function (msg) {

                    }
                })
            }
        })

        var countdown = 60;

        function settime(val) {
            if (countdown == 0) {
                $(val).removeClass("disabled");
                $(val).text("发送短信");
                countdown = 60;
                return;
            } else {
                $(val).addClass("disabled");
                $(val).text("重新发送(" + countdown + ")");
                countdown--;
            }
            setTimeout(function () {
                settime(val)
            }, 1000)
        }

        $("#forgetPassword-ok").tap(function () {
            var mobile = $("#mobile").val();
            var password = $("#newPassword").val();
            var repassword = $("#rePassword").val();
            var mobileCode = $("#smsCode").val();
            if (valid(mobile, password, repassword)) {
                var mobile64 = Base64.encode(mobile);
                var password64 = Base64.encode(password);
                $.ajax({
                    type: "POST",
                    url: prefix + "/user/resetPassword",
                    data: {
                        mobile: mobile64,
                        password: password64,
                        mobileCode: mobileCode,
                    },
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.code == "0") {
                            $("#error-view").css("display", "none");
                            $("#forPassword").css("display", "none");
                            $("#notice").css("display", "block");
                        } else {
                            $("#error-view").css("display", "block");
                            if (data.code == "5010") {
                                $("#error-view").text("系统繁忙，请刷新后再试");
                            } else {
                                $("#error-view").text(data.msg);
                            }

                        }
                        console.log(data);
                    },
                    error: function (msg) {

                    }
                })
            }
        })

        function valid(mobile, password, repassword) {
            if (password != repassword) {
                $.tips({
                    content: '请确认重复密码一致',
                    stayTime: 2000,
                    type: "warn"
                })
                $("#error-view").css("display", "block");
                $("#error-view").text("密码不一致");
                return false;
            } else {
                return true;
            }
        }

        $("#back").tap(function () {
            window.location.href = prefix + "/user/central";
        })
    })();
</script>
</html>