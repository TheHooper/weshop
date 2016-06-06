<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!-- sidebar start -->
<div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
    <div class="am-offcanvas-bar admin-offcanvas-bar">
        <ul class="am-list admin-sidebar-list">
            <li><a href="admin-index.html"><span class="am-icon-home"></span> 首页</a></li>
            <li class="admin-parent">
                <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-file"></span> 页面模块
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
            <li><a href="<c:url value="../goods/list"/>"><span
                    class="am-icon-barcode"></span>商品管理</a></li>
            <li><a href="<c:url value="../cat/list"/>"><span
                    class="am-icon-navicon"></span>类别管理</a></li>
            <li class="admin-parent">
                <a class="am-cf" data-am-collapse="{target: '#order-collapse-nav'}"><span
                        class="am-icon-list-alt"></span> 订单管理
                    <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                <ul class="am-list am-collapse admin-sidebar-sub am-in" id="order-collapse-nav">
                    <li><a href="<c:url value="../orders/orders"/>"><span
                            class="am-icon-search"></span> 订单查询</a></li>
                    <li>
                        <a href="<c:url value="../orders/ordersDelivery"/>"><span
                                class="am-icon-truck"></span> 订单发货</a></li>
                </ul>
            </li>
            <li><a href="<c:url value="../rate/rate"/>"><span
                    class="am-icon-comment"></span>评价管理</a></li>
            <li><a href="<c:url value="../coupon/coupons"/>"><span
                    class="am-icon-money"></span>优惠券管理</a></li>
            <li class="admin-parent">
                <a class="am-cf" data-am-collapse="{target: '#count-collapse-nav'}"><span
                        class="am-icon-bar-chart"></span>统计管理
                    <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                <ul class="am-list am-collapse admin-sidebar-sub am-in" id="count-collapse-nav">
                    <li><a href="<c:url value="../count/dateCount"/>"><span
                            class="am-icon-bar-chart-o"></span>日期成交量统计</a></li>
                    <li>
                        <a href="<c:url value="../count/dateSum"/>"><span
                                class="am-icon-bar-chart-o" style="color:  #0c79b1"></span>日期成交额统计</a></li>
                    <li><a href="<c:url value="../count/catsCount"/>"><span
                            class="am-icon-pie-chart"></span>类别成交量统计</a></li>
                    <li>
                        <a href="<c:url value="../count/catsSum"/>"><span
                                class="am-icon-pie-chart" style="color:  #0c79b1"></span>类别成交额统计</a></li>
                    <li><a href="<c:url value="../count/goodsCount"/>"><span
                            class="am-icon-table"></span>商品成交量统计</a></li>
                    <li>
                        <a href="<c:url value="../count/goodsSum"/>"><span
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


<script type="text/javascript">
    var path = location.pathname.split('/');
    var app = path[1];
    var prefix = "";
    $('.logout').click(function (e) {
        $.post(prefix + '/logout', function (data) {
            if (data == "success") {
                window.location.href = prefix + "/login";
            }
        });
    })
</script>