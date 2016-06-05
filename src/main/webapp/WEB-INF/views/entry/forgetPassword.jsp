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
    <title>找回密码</title>
    <link href="<c:url value="../css/frozen.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="../css/homall.css"/>" rel="stylesheet" type="text/css"/>
    <script type="text/javascript"
            src="<c:url value="../js/lib/zeptojs/zepto.min.js"/>"></script>
</head>
<body>
<header id="header" class="header">
    <a href="/h/index" class="header-arrow-l"><i id="headerBarCat" class="ui-icon-prev"></i></a>
    <h2 class="ui-flex-pack-center">找回自己</h2>
</header>

<br/>

<div class="ui-form ui-border-t">
    <div class="ui-form-item ui-border-b">
        <label>
            手机号
        </label>
        <input type="text" placeholder="请输入手机">
        <a href="javascript:void(0);" class="ui-icon-close">
        </a>
    </div>
    <div class="ui-form-item ui-form-item-l  ui-border-b">
        <label class="ui-border-r">
            验证码
        </label>
        <input type="text" placeholder="请输入图像验证码">
        <a href="javascript:void(0);" class="ui-icon-close"></a>
    </div>
    <div class="ui-form-item ui-form-item-r ui-border-b">
        <input type="text" placeholder="请输入短信验证码">
        <!-- 若按钮不可点击则添加 disabled 类 -->
        <button type="button" class="ui-border-l">发送短信</button>
        <a href="javascript:void(0);" class="ui-icon-close"></a>
    </div>
</div>

<br/>

<div class="ui-form ui-border-t">
    <div class="ui-form-item ui-border-b">
        <label class="ui-border-r">
            新密码
        </label>
        <input type="password" placeholder="请输入新密码">
        <a href="javascript:void(0);" class="ui-icon-close">
        </a>
    </div>
    <div class="ui-form-item ui-border-b">
        <label class="ui-border-r">
            确认密码
        </label>
        <input type="password" placeholder="请再次输入新密码">
        <a href="javascript:void(0);" class="ui-icon-close">
        </a>
    </div>
</div>


<div class="ui-btn-wrap text-center margin-top-m">
    <button class="ui-btn-lg ui-btn-primary">
        确认
    </button>
    <button class="ui-btn-lg margin-top-s" onClick="javascript :history.go(-1);">
        返回
    </button>
</div>

</body>
<script type="text/javascript" src="<c:url value="../js/frozen.js"/>"></script>
</html>