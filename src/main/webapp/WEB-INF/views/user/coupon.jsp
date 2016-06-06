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
    <title>我的优惠券</title>
    <link href="<c:url value="../css/frozen.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="../css/homall.css"/>" rel="stylesheet" type="text/css"/>
    <script type="text/javascript"
            src="<c:url value="../js/lib/zeptojs/zepto.min.js"/>"></script>
</head>
<style>
    .flipy-vertical {
        -moz-transform: scaleY(-1);
        -webkit-transform: scaleY(-1);
        -o-transform: scaleY(-1);
        transform: scaleY(-1);
    }

    .flipy-vertical-fix {
        -moz-transform: scaleY(0);
        -webkit-transform: scaleY(0);
        -o-transform: scaleY(0);
        transform: scaleY(0);
    }

    .coupons-bottom {
        background: #ee7a77;
        color: #fff;
        min-height: 8px;
        padding: 1px 0 8px 8px;
        font-size: 12px;
    }

    .coupons-right-border {
        border-right: .1em solid;
        border-color: #f4f4f4;
    }

    .coupons-bottom-border {
        width: 100%;
        height: 3px;
        background: #f5f5f5;
        background: url(<c:url value="../img/coupon/coupons-bottom.png"/>) repeat-x;
        background-size: 8px;
    }

    .coupons-chevron-down {
        background: #ed7a77 url(<c:url value="../img/coupon/chevron-down.png"/>) no-repeat center center;
        background-size: 15px;
    }

    .coupons-color {
        color: #ed7a77;
    }

    .coupons--illegal {
        -webkit-filter: grayscale(100%);
        -moz-filter: grayscale(100%);
        -ms-filter: grayscale(100%);
        -o-filter: grayscale(100%);
        filter: grayscale(100%);
        filter: gray;
    }

    .titlebar-right-border {
        border-right: solid;
        border-color: #6a6c6f;
        border-width: 1px;
    }

    .titlebar-current {
        color: #f14b48;
        border-bottom: solid;
        border-color: #f14b48;
        border-width: .2em;
    }

    .available:hover {
        color: #f14b48;
    }

</style>
<body>

<header id="header" class="header">
    <a href="/user/central" class="header-arrow-l"><i id="headerBarCat" class="ui-icon-prev"></i></a>
    <h2 class="ui-flex-pack-center">我的优惠券</h2>
    <div class="ui-tab" id="tab1">
        <ul id="topTap" class="ui-tab-nav ui-border-b">
            <li value="0" class="current">未使用</li>
            <li value="1">已使用</li>
            <li value="2">已过期</li>
        </ul>
    </div>
</header>

<!-- coupons panel group-->
<div id="couponsContainer" class="ho-margin-top-lg">
    <%--<div class="ho-panel  ho-panel-default ho-margin-bottom-0">--%>
    <%--<div class="ho-panel-bd ho-padding-0 ho-margin-xs">--%>
    <%--<div class="ui-row">--%>
    <%--<div class="ui-col ui-col-50 ho-text-sm coupons-right-border ">--%>
    <%--<div class="ho-padding-left-sm  coupons-color"><i>¥</i><span class="ho-text-xxl">20</span>(满0可用)--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="ui-col ui-col-50 ho-text-center  coupons-color">--%>
    <%--<div class="ho-u-sm-12 ui-nowrap-multi">618特惠券超级好超级划算超级Homadfsadfasdfsfd</div>--%>
    <%--<div class="ho-u-sm-12 "> ~</div>--%>
    <%--<div class="ho-u-sm-12">2016-06-20</div>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="ho-padding-bottom-xs" onclick="moreDetail(this)" value="9" data-target="detail0">--%>
    <%--<div class="coupons-bottom coupons-chevron-down"><h3>使用范围:</h3></div>--%>
    <%--<div class="coupons-bottom-border"></div>--%>
    <%--</div>--%>
    <%--<div id="detail0" class="ho-panel  ho-panel-default" style="display: none">--%>
    <%--<div class="ho-panel-bd ho-padding-0 ho-margin-xs">使用范围:</div>--%>
    <%--</div>--%>
</div>
<!-- coupons panel group end-->

</body>
<%--<link href="<c:url value="../css/all-animation.css"/>" rel="stylesheet" type="text/css"/>--%>
<script type="text/javascript" src="<c:url value="../js/frozen.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="../js/homall/address.js"/>"></script>
<script type="text/javascript">

    var prefix = "${pageContext.request.contextPath}"

    function moreDetail(el) {
        var id = $(el).attr("data-target");
        var flag = $(el).children(".coupons-chevron-down");
        var couponId = $(el).attr("value");

        if (!$("#" + id + "").hasClass("init")) {
            $.ajax({
                type: "GET",
                url: prefix + "/coupon/cats",
                data: {couponId: couponId},
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.code == null) {
                        var cats = "使用范围：";
                        if (data.length == 0) {
                            cats = cats + "全场通用"
                        } else {
                            $(data).each(function (i, e) {
                                cats = cats + e + ";"
                            })
                        }
                        $("#" + id + "").children(".ho-panel-bd").html("<p>" + cats + "</p>");
                        $("#" + id + "").addClass("init");
                    }
                },
                error: function (msg) {
                    console.log(JSON.stringify(msg));
                }
            })
        }

        if ($(flag).hasClass("flipy-vertical")) {
            $(el).children(".coupons-chevron-down").removeClass("flipy-vertical");
            $(el).children(".coupons-chevron-down").children("span").css("visibility", "visible");
            $("#" + id + "").css("display", "none");
        } else {
            $(el).children(".coupons-chevron-down").addClass("flipy-vertical");
            $(el).children(".coupons-chevron-down").children("span").css("visibility", "hidden");
            $("#" + id + "").css("display", "block");
        }
    }
    (function () {
        var prefix = "${pageContext.request.contextPath}"

        var filterForm = {
            state: 0,
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

        function loadCoupon() {
            $.ajax({
                type: "GET",
                url: prefix + "/coupon/list",
                data: filterForm,
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.code == null) {
                        buildFace(data);
                    }
                },
                error: function (msg) {
                    console.log(JSON.stringify(msg));
                }
            })
        }

        //加载日期
        function generateDate(time) {
            var data = new Date(parseInt(time));
            var formatDate = data.format('yyyy-MM-dd');
            return formatDate;
        }

        function buildFace(couponses) {
            if (filterForm.state == 0) {
                $(couponses).each(function (i, e) {
                    var panel = '<div class="ho-panel  ho-panel-default ho-margin-bottom-0">'
                            + '<div class="ho-panel-bd ho-padding-0 ho-margin-xs">'
                            + '<div class="ui-row">'
                            + '<div class="ui-col ui-col-50 ho-text-sm coupons-right-border ">'
                            + '<div class="ho-padding-left-sm  coupons-color"><i>¥</i><span class="ho-text-xxl">' + e.price + '</span>(满' + e.threshold + '可用)'
                            + '</div>'
                            + '</div>'
                            + '<div class="ui-col ui-col-50 ho-text-center  coupons-color">'
                            + '<div class="ho-u-sm-12 ui-nowrap-multi">' + e.title + '</div>'
                            + '<div class="ho-u-sm-12 "> ~</div>'
                            + '<div class="ho-u-sm-12">' + generateDate(e.deadline) + '</div>'
                            + '</div>'
                            + '</div>'
                            + '</div>'
                            + '</div>'
                            + '<div class="ho-padding-bottom-xs" onclick="moreDetail(this)"  value="' + e.couponsId + '"  data-target="detail' + e.couponsId + '">'
                            + '<div class="coupons-bottom coupons-chevron-down"><span class="ho-text-sm">使用范围:</span></div>'
                            + '<div class="coupons-bottom-border"></div>'
                            + '</div>'
                            + '<div id="detail' + e.couponsId + '" class="ho-panel  ho-panel-default" style="display: none">'
                            + '<div class="ho-panel-bd ho-padding-0 ho-margin-xs">使用范围:</div>'
                            + '</div>';
                    $("#couponsContainer").append(panel);
                })
            } else {
                $(couponses).each(function (i, e) {
                    var panel = '<div class="ho-panel  ho-panel-default ho-margin-bottom-0 coupons--illegal">'
                            + '<div class="ho-panel-bd ho-padding-0 ho-margin-xs">'
                            + '<div class="ui-row">'
                            + '<div class="ui-col ui-col-50 ho-text-sm coupons-right-border ">'
                            + '<div class="ho-padding-left-sm  coupons-color"><i>¥</i><span class="ho-text-xxl">' + e.price + '</span>(满' + e.threshold + '可用)'
                            + '</div>'
                            + '</div>'
                            + '<div class="ui-col ui-col-50 ho-text-center  coupons-color">'
                            + '<div class="ho-u-sm-12 ui-nowrap-multi">' + e.title + '</div>'
                            + '<div class="ho-u-sm-12 "> ~</div>'
                            + '<div class="ho-u-sm-12">' + generateDate(e.deadline) + '</div>'
                            + '</div>'
                            + '</div>'
                            + '</div>'
                            + '</div>'
                            + '<div class="ho-padding-bottom-xs coupons--illegal" onclick="moreDetail(this)"  value="' + e.couponsId + '"  data-target="detail' + e.couponsId + '">'
                            + '<div class="coupons-bottom coupons-chevron-down"><span class="ho-text-sm">使用范围:</span>'
                            + generateStateTip(e.state) +
                            '</div>'
                            + '<div class="coupons-bottom-border"></div>'
                            + '</div>'
                            + '<div id="detail' + e.couponsId + '" class="ho-panel  ho-panel-default" style="display: none">'
                            + '<div class="ho-panel-bd ho-padding-0 ho-margin-xs">使用范围:</div>'
                            + '</div>';
                    $("#couponsContainer").append(panel);
                })
            }
        }


        function generateStateTip(type) {
            if (type == 1) {
                return '<span class="ho-fr ho-padding-right-sm ho-text-sm">已使用</span>';
            } else {
                return '<span class="ho-fr ho-padding-right-sm ho-text-sm">已失效</span>';
            }
        }

        initTopBar();
        loadCoupon();


        $('#topTap').children("li").tap(function () {
            var index = $(this).val();
            $('#topTap').children("li").removeClass("current");
            $(this).addClass("current");
            $("#order-panel-section").html("");
            filterForm.state = $(this).val();
            $("#couponsContainer").html("");
            loadCoupon();
        })

        //日期格式方法
        Date.prototype.format = function (fmt) {
            var o = {
                "M+": this.getMonth() + 1, //月份
                "d+": this.getDate(), //日
                "h+": this.getHours() % 12 == 0 ? 12 : this.getHours() % 12, //小时
                "H+": this.getHours(), //小时
                "m+": this.getMinutes(), //分
                "s+": this.getSeconds(), //秒
                "q+": Math.floor((this.getMonth() + 3) / 3), //季度
                "S": this.getMilliseconds() //毫秒
            };
            var week = {
                "0": "\u65e5",
                "1": "\u4e00",
                "2": "\u4e8c",
                "3": "\u4e09",
                "4": "\u56db",
                "5": "\u4e94",
                "6": "\u516d"
            };
            if (/(y+)/.test(fmt)) {
                fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
            }
            if (/(E+)/.test(fmt)) {
                fmt = fmt.replace(RegExp.$1, ((RegExp.$1.length > 1) ? (RegExp.$1.length > 2 ? "\u661f\u671f" : "\u5468") : "") + week[this.getDay() + ""]);
            }
            for (var k in o) {
                if (new RegExp("(" + k + ")").test(fmt)) {
                    fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
                }
            }
            return fmt;
        }
    })();
</script>
</html>