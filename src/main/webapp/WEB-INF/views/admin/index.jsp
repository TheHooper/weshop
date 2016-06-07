<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <meta name="renderer" content="webkit">
    <title>HOMALL | 后台管理系统</title>
    <meta name="description" content="">
    <jsp:include page="/WEB-INF/views/admin/comp/header.include.jsp"/>
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/comp/header.jsp"/>
<div class="am-cf admin-main">
    <!-- sidebar start -->
    <!-- sidebar start -->
    <div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
        <div class="am-offcanvas-bar admin-offcanvas-bar">
            <ul class="am-list admin-sidebar-list">
                <li><a href="${pageContext.request.contextPath}/admin/index"><span class="am-icon-home"></span> 首页</a>
                </li>
                <li class="admin-parent">
                    <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-file"></span>
                        页面模块
                        <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                    <ul class="am-list am-collapse admin-sidebar-sub " id="collapse-nav">
                        <li><a href="admin-user.html" class="am-cf"><span class="am-icon-check"></span> 个人资料<span
                                class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
                        <li><a href="admin-help.html"><span class="am-icon-puzzle-piece"></span> 帮助页</a></li>
                        <li><a href="admin-gallery.html"><span class="am-icon-th"></span> 相册页面<span
                                class="am-badge am-badge-secondary am-margin-right am-fr">24</span></a></li>
                        <li><a href="admin-log.html"><span class="am-icon-calendar"></span> 系统日志</a></li>
                        <li><a href="admin-404.html"><span class="am-icon-bug"></span> 404</a></li>
                    </ul>
                </li>
                <li><a href="<c:url value="../admin/goods/list"/>"><span
                        class="am-icon-barcode"></span>商品管理</a></li>
                <li><a href="<c:url value="../admin/cat/list"/>"><span
                        class="am-icon-navicon"></span>类别管理</a></li>
                <li class="admin-parent">
                    <a class="am-cf" data-am-collapse="{target: '#order-collapse-nav'}"><span
                            class="am-icon-list-alt"></span> 订单管理
                        <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                    <ul class="am-list am-collapse admin-sidebar-sub am-in" id="order-collapse-nav">
                        <li><a href="<c:url value="../admin/orders/orders"/>"><span
                                class="am-icon-search"></span> 订单查询</a></li>
                        <li>
                            <a href="<c:url value="../admin/orders/ordersDelivery"/>"><span
                                    class="am-icon-truck"></span> 订单发货</a></li>
                    </ul>
                </li>
                <li><a href="<c:url value="../admin/rate/rate"/>"><span
                        class="am-icon-comment"></span>评价管理</a></li>
                <li><a href="<c:url value="../admin/coupon/coupons"/>"><span
                        class="am-icon-money"></span>优惠券管理</a></li>
                <li class="admin-parent">
                    <a class="am-cf" data-am-collapse="{target: '#count-collapse-nav'}"><span
                            class="am-icon-bar-chart"></span>统计管理
                        <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                    <ul class="am-list am-collapse admin-sidebar-sub am-in" id="count-collapse-nav">
                        <li><a href="<c:url value="../admin/count/dateCount"/>"><span
                                class="am-icon-bar-chart-o"></span>日期成交量统计</a></li>
                        <li>
                            <a href="<c:url value="../admin/count/dateSum"/>"><span
                                    class="am-icon-bar-chart-o" style="color:  #0c79b1"></span>日期成交额统计</a></li>
                        <li><a href="<c:url value="../admin/count/catsCount"/>"><span
                                class="am-icon-pie-chart"></span>类别成交量统计</a></li>
                        <li>
                            <a href="<c:url value="../admin/count/catsSum"/>"><span
                                    class="am-icon-pie-chart" style="color:  #0c79b1"></span>类别成交额统计</a></li>
                        <li><a href="<c:url value="../admin/count/goodsCount"/>"><span
                                class="am-icon-table"></span>商品成交量统计</a></li>
                        <li>
                            <a href="<c:url value="../admin/count/goodsSum"/>"><span
                                    class="am-icon-table" style="color:  #0c79b1"></span>商品成交额统计</a></li>
                    </ul>
                </li>
                <li><a href="admin-form.html"><span class="am-icon-pencil-square-o"></span> 表单</a></li>
                <li><a href="#"><span class="am-icon-sign-out"></span> 注销</a></li>
            </ul>

            <div class="am-panel am-panel-default admin-sidebar-panel">
                <div class="am-panel-bd">
                    <p><span class="am-icon-tag"></span>HOMALL</p>
                    <p>欢迎来到HOMALL商城管理后台!</p>
                </div>
            </div>
        </div>
    </div>
    <!-- sidebar end -->

    <div class="admin-content">
        <div class="admin-content-body">
            <div class="am-cf am-padding">
                <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">首页</strong> /
                    <small>欢迎来到HOMALL商城后台</small>
                </div>
            </div>

            <div class="am-g am-text-center am-margin-top-xl" style="height: 100%;">
                <h2 class="about-title about-color">登高莫问顶，途中耳目新。</h2>
            </div>
        </div>

        <!-- footer start -->
        <jsp:include page="/WEB-INF/views/admin/comp/footer.jsp"/>
        <!-- footer end -->

    </div>
</body>
</html>
