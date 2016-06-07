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
    <title>我的订单</title>
    <link href="<c:url value="${pageContext.request.contextPath}/css/frozen.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="${pageContext.request.contextPath}/css/homall.css"/>" rel="stylesheet" type="text/css"/>
    <script type="text/javascript"
            src="<c:url value="${pageContext.request.contextPath}/js/lib/zeptojs/zepto.min.js"/>"></script>
</head>
<body>

<header id="header" class="header">
    <a href="${pageContext.request.contextPath}/user/orders" class="header-arrow-l"><i id="headerBarCat"
                                                                                       class="ui-icon-prev"></i></a>
    <h2 class="ui-flex-pack-center">订单详情</h2>
</header>

<section id="order-panel-section" class="ui-container ho-panel-group ho-margin-bottom-0">
    <section class="ho-panel ho-panel-default">
        <div class="ho-panel-hd ">订单信息</div>
        <input type="text" style="display: none"/>
        <div class="ho-panel-bd color-blue">
            订单号:${order.sn}
            <p>下单时间：${order.cTime}</p>
        </div>
        <footer class="ho-panel-footer">
        </footer>
    </section>

    <section class="ho-panel ho-panel-default">
        <div class="ho-panel-hd ">地址信息</div>
        <input type="text" style="display: none"/>
        <div class="ho-panel-bd color-blue">
            ${address.name},${address.mobile},${address.province},${address.city},${address.area}
            <p>${address.detail}</p>
        </div>
        <footer class="ho-panel-footer">
        </footer>
    </section>

    <c:if test="${order.deliveryCom != null}">
        <section class="ho-panel ho-panel-default">
            <div class="ho-panel-hd ">物流信息</div>
            <input type="text" style="display: none"/>
            <div class="ho-panel-bd color-blue">
                物流公司:${order.deliveryCom}
                <p>物流单号:${order.deliveryNo}</p>
                <p>发货时间:${order.deliveryTime}</p>
            </div>
            <footer class="ho-panel-footer">
            </footer>
        </section>
    </c:if>

    <section class="ho-panel ho-panel-default">
        <div class="ho-panel-hd ">商品信息</div>
        <input type="text" style="display: none"/>
        <div class="ho-panel-bd color-blue ho-padding-0">
            <ul id="carts-ul" class="ui-list  ui-border-tb">
                <c:forEach items="${orderGoodses}" var="orderGoods">
                    <li class="ui-border-t">
                        <a href="${pageContext.request.contextPath}/goods/detail/${orderGoods.goodsId}">
                            <div class="ui-list-img">
                                <span style="background-image:url(${orderGoods.goodsPic}?imageMogr2/thumbnail/200x200)"></span>
                            </div>
                        </a>
                        <div class="ui-list-info"><h4 class="ui-nowrap carts-title">${orderGoods.goodsTitle}</h4>
                            <p class="ui-nowrap carts-salesAttr">${orderGoods.salesAttr}</p>
                            <p class="ui-nowrap"><span class="carts-num">x${orderGoods.num}</span>
                                <span class="ho-margin-left-xs">&yen;${orderGoods.price}</span></p>
                                <%--<c:if test="${order.status == 3}">--%>
                                <%--<button class="ui-btn-s">--%>
                                <%--评价--%>
                                <%--</button>--%>
                                <%--</c:if>--%>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <footer class="ho-panel-footer">
        </footer>
    </section>

    <!-- total -->
    <ul class="ui-list ui-list-text ui-border-tb margin-top-m">
        <li>
            <div class="ui-list-info">
                <h4 class="ui-nowrap">优惠券</h4>
            </div>
            <div class="ui-list-action color-blue"><c:if test="${coupon != null}">${coupon.title}</c:if></div>
        </li>
        <li>
            <div class="ui-list-info">
                <h4 class="ui-nowrap">小计</h4>
            </div>
            <div class="ui-list-action">&yen;${order.total}</div>
        </li>
        <li>
            <div class="ui-list-info">
                <h4 class="ui-nowrap">运费</h4>
            </div>
            <div class="ui-list-action">&yen;${order.totalAndDelivery-order.total}</div>
        </li>
        <li>
            <div class="ui-list-info">
                <h4 class="ui-nowrap">优惠金额</h4>
            </div>
            <div class="ui-list-action">&yen;${order.totalAndDelivery-order.rTotal}</div>
        </li>
        <li class="ui-border-t">
            <div class="ui-list-info">
                <h4 class="ui-nowrap">实际已付</h4>
            </div>
            <div class="ui-list-action">&yen;${order.rTotal}</div>
        </li>
    </ul>
    <!-- total end -->

    <div class="ui-btn-wrap text-center ho-margin-top-xs">
        <button id="back-btn" class="ui-btn-lg ui-btn-primary">
            返回
        </button>
    </div>
</section>

</body>
<%--<link href="<c:url value="${pageContext.request.contextPath}/css/all-animation.css">" rel="stylesheet" type="text/css"/>--%>
<script type="text/javascript" src="<c:url value="${pageContext.request.contextPath}/js/frozen.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="${pageContext.request.contextPath}/js/homall/address.js"/>"></script>
<script type="text/javascript">
    (function () {
        var prefix = "${pageContext.request.contextPath}"


        $("#back-btn").tap(function () {
            window.location.href = "${pageContext.request.contextPath}/user/orders";
        })

    })();
</script>
</html>
