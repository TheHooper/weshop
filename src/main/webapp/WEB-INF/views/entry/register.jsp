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
    <title>快速注册</title>
    <link href="<c:url value="../h/css/frozen.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="../h/css/homall.css"/>" rel="stylesheet" type="text/css"/>
    <script type="text/javascript"
            src="<c:url value="../h/js/lib/zeptojs/zepto.min.js"/>"></script>
</head>
<body>
<header id="header" class="header">
    <a href="/h/index" class="header-arrow-l"><i id="headerBarCat" class="ui-icon-prev"></i></a>
    <h2 class="ui-flex-pack-center">加入HoMall</h2>
</header>

<br/>

<div class="ui-form ui-border-t">
    <div class="ui-form-item ui-border-b">
        <label>
            手机号
        </label>
        <input id="mobile-input" type="text" placeholder="请输入手机">
        <a href="javascript:void(0);" class="ui-icon-close">
        </a>
    </div>
    <div class="ui-form-item ui-form-item-l  ui-border-b">
        <label class="ui-border-r">
            <img src="/h/captcha?type=1" class="ho-vertical-align-middle"
                 onclick="this.src='/h/captcha?type=1&d='+new Date().getTime()"/>
        </label>
        <input id="captcha-input" type="text" placeholder="请输入图像验证码">
        <a href="javascript:void(0);" class="ui-icon-close"></a>
    </div>
    <div class="ui-form-item ui-form-item-r ui-border-b">
        <input id="mobileCode-input" type="text" placeholder="请输入短信验证码">
        <!-- 若按钮不可点击则添加 disabled 类 -->
        <button id="send-sms-btn" type="button" class="ui-border-l">发送短信</button>
        <a href="javascript:void(0);" class="ui-icon-close"></a>
    </div>
</div>

<br/>

<div class="ui-form ui-border-t">
    <div class="ui-form-item ui-border-b">
        <label class="ui-border-r">
            密码
        </label>
        <input id="password-input" type="password" placeholder="请输入密码">
        <a href="javascript:void(0);" class="ui-icon-close">
        </a>
    </div>
    <div class="ui-form-item ui-border-b">
        <label class="ui-border-r">
            确认密码
        </label>
        <input id="repassword-input" type="password" placeholder="请再次输入密码">
        <a href="javascript:void(0);" class="ui-icon-close">
        </a>
    </div>
</div>

<div class="ui-form ui-border-t">
    <div id="error-view" class="ui-form-item ui-border-b ho-text-center color-red" style="display: none">

    </div>
</div>

<div class="ui-btn-wrap text-center margin-top-m">
    <button class="ui-btn-lg ui-btn-primary" onclick="register()">
        确认
    </button>
    <button class="ui-btn-lg margin-top-s" onClick="javascript :history.go(-1);">
        返回
    </button>
</div>

<div class="ui-poptips ui-poptips-success" style="display: none">
    <div class="ui-poptips-cnt"><i></i>恭喜您，注册成功！</div>
</div>

</body>
<script type="text/javascript" src="<c:url value="../h/js/frozen.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="../h/js/util/base64.min.js"/>"></script>
<script>
    var prefix = "${pageContext.request.scheme}" + "://" + "${pageContext.request.serverName}" + ":" + "${pageContext.request.localPort}" + "/";

    //var base64 = BASE64.encoder(str);//返回编码后的字符
    // var unicode= BASE64.decoder(base64Str);//返回会解码后的unicode码数组。
    $(".ui-icon-close").tap(function () {
        console.log("tap");
    })

    $("#send-sms-btn").tap(function () {
        if ($(this).hasClass("disabled")) {
            return;
        } else {
            settime(this);
            var mobile = $("#mobile-input").val();
            var mobile64 = Base64.encode(mobile);
            $.ajax({
                type: "POST",
                url: prefix + "h/sms/sendCode",
                data: {
                    mobile: mobile64,
                    captcha: $("#captcha-input").val()
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


    function register() {
        var mobile = $("#mobile-input").val();
        var password = $("#password-input").val();
        var repassword = $("#repassword-input").val();
        var mobileCode = $("#mobileCode-input").val();
        if (valid(mobile, password, repassword)) {
            var mobile64 = Base64.encode(mobile);
            var password64 = Base64.encode(password);
            $.ajax({
                type: "POST",
                url: prefix + "h/user/register",
                data: {
                    mobile: mobile64,
                    password: password64,
                    mobileCode: mobileCode,
                    captcha: $("#captcha-input").val()
                },
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.code == "0") {
                        $("#error-view").css("display", "none");
                        $(".ui-poptips").css("display", "block");
                        setTimeout(function () {
                            window.location.href = "../index";
                        }, 1000)
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
    }

    function valid(mobile, password, repassword) {
        return true;
    }
</script>
</html>