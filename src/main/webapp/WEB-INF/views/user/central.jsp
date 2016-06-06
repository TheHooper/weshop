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
    <title>ho商城个人中心</title>
    <link href="<c:url value="../css/frozen.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="../css/homall.css"/>" rel="stylesheet" type="text/css"/>
    <script type="text/javascript"
            src="<c:url value="../js/lib/zeptojs/zepto.min.js"/>"></script>
</head>
<body>
<div id="header" class="header">
    <a href="/index" class="header-arrow-l"><i id="headerBarCat" class="ui-icon-prev"></i></a>
    <h2>个人中心</h2>
</div>

<!-- avatar -->
<div id="avatar-section"
     class="ui-flex ui-flex-ver ui-flex-align-center ui-flex-pack-center padding-vertical-m back-white">
    <div class="ui-avatar-lg">
        <span style="background-image:url(<c:url
                value="../img/avatar/avatar.jpg"/>)"></span>
    </div>
    <div class="ui-flex-pack-end">
        <h3 id="username">${ho_user.userName}</h3>
    </div>
</div>
<!-- avatar section -->

<!-- tool bar -->
<div class="ui-row-flex ui-border ui-whitespace padding-vertical-s margin-top-s text-center back-white">
    <div class="ui-col ui-col">
        <a href="/user/orders" class="color-black">
        <i class="ui-icon-dingdan"></i>
        <h5>全部订单</h5>
        </a>
    </div>
    <div class="ui-col ui-col">
        <a href="/user/orders?state=1" class="color-black">
        <i class="ui-icon-daifahuo"></i>
        <h5>待发货</h5>
        </a>
    </div>
    <div class="ui-col ui-col">
        <a href="/user/orders?state=2" class="color-black">
        <i class="ui-icon-daishouhuo1"></i>
        <h5>待收货</h5>
        </a>
    </div>
    <div class="ui-col ui-col">
        <a href="/user/orders?state=3" class="color-black">
        <i class="ui-icon-daipingjia"></i>
        <h5>待评价</h5>
        </a>
    </div>
</div>
<!-- tool bar end -->

<!-- list -->
<ul class="ui-list ui-list-one ui-list-link ui-border-tb margin-top-s">
    <li onclick="window.location.href = '/user/coupon'">
        <div class="ui-list-icon">
            <span class="ui-icon-coupons"></span>
        </div>
        <div class="ui-list-info ui-border-t">
            <h4 class="ui-nowrap">优惠券</h4>
        </div>
    </li>
    <li>
        <div class="ui-list-icon">
            <span class="ui-icon-personal"></span>
        </div>
        <div class="ui-list-info ui-border-t">
            <h4 class="ui-nowrap">手机号</h4>
            <div class="ui-txt-info">${ho_user.mobile}</div>
        </div>
    </li>
    <li>
        <div class="ui-list-icon">
            <span class="ui-icon-collect"></span>
        </div>
        <div class="ui-list-info ui-border-t">
            <h4 class="ui-nowrap">我的收藏</h4>
        </div>
    </li>
    <li>
        <div class="ui-list-icon">
            <span class="ui-icon-comment"></span>
        </div>
        <div class="ui-list-info ui-border-t">
            <h4 class="ui-nowrap">我的评价</h4>
        </div>
    </li>
    <li class="ui-border-t">
        <div class="ui-list-icon">
            <span class="ui-icon-express"></span>
        </div>
        <div class="ui-list-info">
            <h4 class="ui-nowrap">地址管理</h4>
            <div class="ui-reddot ui-reddot-static"></div>
        </div>
    </li>
    <li class="ui-border-t">
        <div class="ui-list-icon">
            <span class="ui-icon-safe"></span>
        </div>
        <div class="ui-list-info">
            <h4 class="ui-nowrap">修改密码</h4>
        </div>
    </li>
</ul>
<!-- list part -->

<!-- footer -->
<div class="ui-btn-wrap text-center margin-top-s">
    <button id="logout" class="ui-btn-lg">
        注销
    </button>
</div>
<!-- footer end-->
</body>
<script type="text/javascript" src="<c:url value="../js/frozen.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="../js/trianglify/trianglify.min.js"/>"></script>
<script type="text/javascript">
    (function () {
        var avatarBackground = Trianglify({
            height: 400,
            width: 640,
            cell_size: 30,
            variance: "0.75",
            seed: null,
            x_colors: 'random'
        });

        $("#avatar-section").css('background', 'url("' + avatarBackground.png() + '")');

        $("#logout").tap(function () {
            var dia = $.dialog({
                title: '<h3 style="text-align: center">注销</h3>',
                content: '<h4 style="text-align: center">请问真的要注销吗?</h4>',
                button: ["取消", "确认"]
            });

            dia.on("dialog:action", function (e) {
                console.log(e.index)
            });
            dia.on("dialog:hide", function (e) {
                console.log("dialog hide")
            });
        })
    })();
</script>
</html>