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
    <title>ho商城结算</title>
    <link href="<c:url value="../css/frozen.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="../css/homall.css"/>" rel="stylesheet" type="text/css"/>
    <script type="text/javascript"
            src="<c:url value="../js/lib/zeptojs/zepto.min.js"/>"></script>
</head>
<body>
<header id="header" class="header" style="position: absolute;width: 100%">
    <h2 class="ui-flex-pack-center">结算失败</h2>
</header>

<section class="ui-notice">
    <i></i>
    <p>${exception.getMessage()}</p>
    <div class="ui-notice-btn">
        <button id="back" class="ui-btn-primary ui-btn-lg">返回修改</button>
    </div>
</section>

</body>
<script type="text/javascript" src="<c:url value="../js/frozen.js"/>"></script>
<script>
    var prefix = "${pageContext.request.scheme}" + "://" + "${pageContext.request.serverName}" + ":" + "${pageContext.request.localPort}" + "/";

    $("#back").tap(function () {
        window.location.href = "${pageContext.request.contextPath}/h/user/carts";
    })
</script>
</html>