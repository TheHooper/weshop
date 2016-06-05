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
    <link href="<c:url value="../h/css/frozen.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="../h/css/homall.css"/>" rel="stylesheet" type="text/css"/>
    <script type="text/javascript"
            src="<c:url value="../h/js/lib/zeptojs/zepto.min.js"/>"></script>
</head>
<body>

<header id="header" class="header">
    <a href="/h/user/central" class="header-arrow-l"><i id="headerBarCat" class="ui-icon-prev"></i></a>
    <h2 class="ui-flex-pack-center">我的订单</h2>
    <div class="ui-tab" id="tab1">
        <ul id="topTap" class="ui-tab-nav ui-border-b">
            <li class="current">全部订单</li>
            <li value="0">待付款</li>
            <li value="1">待发货</li>
            <li value="2">待收货</li>
            <li value="3">待评价</li>
        </ul>
    </div>
</header>

<section id="order-panel-section" class="ui-container ho-margin-top-lg">

</section>

</body>
<%--<link href="<c:url value="../h/css/all-animation.css"/>" rel="stylesheet" type="text/css"/>--%>
<script type="text/javascript" src="<c:url value="../h/js/frozen.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="../h/js/homall/address.js"/>"></script>
<script type="text/javascript">
    (function () {
        var prefix = "${pageContext.request.scheme}" + "://" + "${pageContext.request.serverName}" + ":" + "${pageContext.request.localPort}" + "/";

        var filterForm = {
            state: null,
            offset: 0,
            limit: 6
        }

        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null)return unescape(r[2]);
            return null;
        }

        function initTopBar() {
            var state = GetQueryString("state");
            if (state != null) {
                state = parseInt(state);
                filterForm.state = state;
                var li = $('#topTap').children("li").get(state + 1);
                if (li != null) {
                    $('#topTap').children("li").removeClass("current");
                    $(li).addClass("current");
                }
            }
        }

        function loadOrders() {
            $.ajax({
                type: "GET",
                url: prefix + "h/orders/orders",
                data: filterForm,
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.code == null) {
                        console.log(data);
                        bulidOrderFace(data, "order-panel-section");
                    }
                },
                error: function (msg) {
                    console.log(JSON.stringify(msg));
                }
            })
        }

        function getOrderFaceFooter(state, id) {
            if (state == 0) {
                var footer = '<button value="' + id + '" class="ui-btn pay-btn">'
                        + '支付'
                        + '</button>'
                        + ' <button value="' + id + '" class="ui-btn cancel-btn">'
                        + '取消'
                        + '</button>'
                return footer;
            } else if (state == 2) {
                var footer = '<button value="' + id + '" class="ui-btn detail-btn">'
                        + '详情'
                        + '</button>'
                        + ' <button value="' + id + '" class="ui-btn receive-btn">'
                        + '收货'
                        + '</button>'
                return footer;
            }
            else if (state == 3) {
                var footer = '<button value="' + id + '" class="ui-btn detail-btn">'
                        + '详情'
                        + '</button>'
                        + ' <button value="' + id + '" class="ui-btn rate-btn">'
                        + '评价'
                        + '</button>'
                return footer;
            } else {
                var footer = '<button value="' + id + '" class="ui-btn detail-btn">'
                        + '详情'
                        + '</button>'
                        + ' <button value="' + id + '" class="ui-btn del-btn">'
                        + '删除'
                        + '</button>'
                return footer;
            }
        }

        function getOrderFaceUrl(state, id) {
            if (state == 0) {
                var url = "${pageContext.request.contextPath}/h/orders/buy/" + id;
                return url;
            } else {
                var url = "${pageContext.request.contextPath}/h/orders/detail/" + id;
                return url;
            }
        }

        function bulidOrderFace(orders, divId) {
            $(orders).each(function (i, e) {
                var panel = '<section class="ho-panel ho-panel-default">'
                        + '<div class="ho-panel-hd ho-text-xs">'
                        + '订单号' + e.sn
                        + '<span class="ho-fr ho-text-xs">' + e.cTime + '</span>'
                        + '</div>'
                        + '<input id="pay-address-id" type="text" style="display: none"/>'
                        + '<div id="pay-address-div" class="ho-panel-bd ho-padding-0">'
                        + '<a href="' + getOrderFaceUrl(e.status, e.id) + '">'
                        + '<ul class="ui-list  ui-list-one ">'
                        + '<li class="ui-border-t">'
                        + '<div class="ui-list-thumb">'
                        + '<span style="  background-image:url(' + e.orderPic + '?imageMogr2/thumbnail/200x200)"></span>'
                        + '</div>'
                        + '<div class="ui-list-info">'
                        + '<h4 class="ui-nowrap">共' + e.goodsNum + '件商品</h4>'
                        + '<h3 class="ui-nowrap price">&yen;' + e.totalAndDelivery + '</h3>'
                        + '</div>'
                        + '</li>'
                        + '</ul>'
                        + '</a>'
                        + '</div>'
                        + '<footer class="ho-panel-footer ho-cf">'
                        + '<div class="ho-fl">'
                        + e.statusStr
                        + '</div>'
                        + '<div class="ho-fr">'
                        + getOrderFaceFooter(e.status, e.id)
                        + '</div>'
                        + '</footer>'
                        + '</section>'
                $("#" + divId).append($(panel));
            })
        }

        var payBtnEvent = function () {
            $(document).on("tap", ".pay-btn", function () {
                var url = "${pageContext.request.contextPath}/h/orders/buy/" + $(this).attr("value");
                window.location.href = url;
            })
        }

        var detailBtnEvent = function () {
            $(document).on("tap", ".detail-btn", function () {
                var url = "${pageContext.request.contextPath}/h/orders/detail/" + $(this).attr("value");
                window.location.href = url;
            })
        }

        var rateBtnEvent = function () {
            $(document).on("tap", ".rate-btn", function () {
                var url = "${pageContext.request.contextPath}/h/orders/rate/" + $(this).attr("value");
                window.location.href = url;
            })
        }

        var receiveBtnEvent = function () {
            $(document).on("tap", ".receive-btn", function () {
                var id = $(this).attr("value");
                var dia = $.dialog({
                    title: '确认收货',
                    content: '请确认已经收到货品',
                    button: ["确认", "取消"]
                });

                dia.on("dialog:action", function (e) {
                    if (e.index == 0) {
                        $.ajax({
                            type: "POST",
                            url: prefix + "h/orders/receive",
                            data: {orderId: id},
                            contentType: "application/x-www-form-urlencoded; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                if (data.code == "0") {
                                    el = $.tips({
                                        content: '已确认收货',
                                        stayTime: 2000,
                                        type: "success"
                                    })
                                    el.on("tips:hide", function () {
                                        console.log("tips hide");
                                    })
                                    $("#order-panel-section").html("");
                                    loadOrders();
                                }
                            },
                            error: function (msg) {
                                console.log(JSON.stringify(msg));
                            }
                        })
                    }
                });
                dia.on("dialog:hide", function (e) {
                    console.log("dialog hide")
                });
            })
        }


        initTopBar();
        loadOrders();
        payBtnEvent();
        detailBtnEvent();
        rateBtnEvent();
        receiveBtnEvent();

        $('#topTap').children("li").tap(function () {
            var index = $(this).val();
            $('#topTap').children("li").removeClass("current");
            $(this).addClass("current");
            filterForm.state = $(this).attr("value");
            $("#order-panel-section").html("");
            loadOrders();
        })
    })();
</script>
</html>