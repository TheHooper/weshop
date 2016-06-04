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
    <title>ho商城登录</title>
    <link href="<c:url value="${pageContext.request.contextPath}/h/css/frozen.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="${pageContext.request.contextPath}/h/css/homall.css"/>" rel="stylesheet" type="text/css"/>
    <script type="text/javascript"
            src="<c:url value="${pageContext.request.contextPath}/h/js/lib/zeptojs/zepto.min.js"/>"></script>
</head>
<body>
<header id="header" class="header">
    <h2 class="ui-flex-pack-center">HoMall登录</h2>
</header>

<br/>

<div class="ui-form ui-border-t">
    <div class="ui-form-item ui-border-b">
        <label>
            手机号
        </label>
        <input id="mobile-input" type="text" placeholder="请输入用户名或手机">
        <a href="#" class="ui-icon-close">
        </a>
    </div>
    <div class="ui-form-item ui-border-b">
        <label>
            密码
        </label>
        <input id="password-input" type="password" placeholder="请输入密码">
        <a href="#" class="ui-icon-close">
        </a>
    </div>
</div>

<br/>

<div class="ui-form ui-border-t">
    <div class="ui-form-item ui-form-item-l ui-border-b">
        <label class="ui-border-r">
            <img src="/h/captcha?type=1" class="ho-vertical-align-middle"
                 onclick="this.src='/h/captcha?type=1&d='+new Date().getTime()"/>
        </label>
        <input id="captcha-input" type="text" placeholder="请输入验证码">
        <a href="#" class="ui-icon-close">
        </a>
    </div>
</div>

<br/>

<div class="ui-form ui-border-t">
    <div class="ui-form-item ui-border-b">
        <p>
            记住登录
        </p>
        <label class="ui-switch">
            <input id="remember-input" type="checkbox">
        </label>
    </div>
</div>

<ul class="ui-row text-center margin-top-m">
    <li class="ui-col ui-col-33">
        <a href="register.jsp">快速注册</a>
    </li>
    <li class="ui-col ui-col-33">
        &nbsp;
    </li>
    <li class="ui-col ui-col-33">
        <a href="forgetPassword.jsp">找回密码</a>
    </li>
</ul>

<div class="ui-form  back-wall">
    <div id="error-view" class="ui-form-item  ho-text-center color-red" style="display: none">
        手机、密码错误
    </div>
</div>

<div class="ui-btn-wrap text-center margin-top-m">
    <button id="login-btn" class="ui-btn-lg ui-btn-primary">
        登录
    </button>
</div>

</body>
<script type="text/javascript" src="<c:url value="${pageContext.request.contextPath}/h/js/frozen.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="${pageContext.request.contextPath}/h/js/util/base64.min.js"/>"></script>
<script>
    var prefix = "${pageContext.request.scheme}" + "://" + "${pageContext.request.serverName}" + ":" + "${pageContext.request.localPort}" + "/";
    var backUrl = "${backUrl}";

    $("#login-btn").tap(function () {
        var mobile = $("#mobile-input").val();
        var password = $("#password-input").val();
        if (valid(mobile, password)) {
            var mobile64 = Base64.encode(mobile);
            var password64 = Base64.encode(password);
            $.ajax({
                type: "POST",
                url: prefix + "h/user/login",
                data: {
                    mobile: mobile64,
                    password: password64,
                    remember: $("#remember-input").val(),
                    captcha: $("#captcha-input").val()
                },
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.code == "0") {
                        $("#error-view").css("display", "none");
                        window.location.href = prefix + "h/index";
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

    function valid(mobile, password) {
        return true;
    }
</script>
</html>