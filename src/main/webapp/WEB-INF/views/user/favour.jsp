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
    <title>我的收藏</title>
    <link href="<c:url value="${pageContext.request.contextPath}/css/frozen.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="${pageContext.request.contextPath}/css/homall.css"/>" rel="stylesheet" type="text/css"/>
    <script type="text/javascript"
            src="<c:url value="${pageContext.request.contextPath}/js/lib/zeptojs/zepto.min.js"/>"></script>
</head>
<body>
<header id="header" class="header">
    <a href="/user/central" class="header-arrow-l"><i id="headerBarCat" class="ui-icon-prev"></i></a>
    <h2 class="ui-flex-pack-center">我的收藏</h2>
</header>

<section id="goods-list-section" class="ho-margin-top-xs">
    <ul id="goods-ul" class="ui-list  ui-border-tb">

    </ul>
</section>


</body>
<%--<link href="${pageContext.request.contextPath}/css/all-animation.css" rel="stylesheet" type="text/css"/>--%>
<script type="text/javascript"
        src="<c:url value="${pageContext.request.contextPath}/js/homall/address.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="${pageContext.request.contextPath}/js/util/base64.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="${pageContext.request.contextPath}/js/frozen.js"/>"></script>
<%--<script type="text/javascript"--%>
<%--src="<c:url value="${pageContext.request.contextPath}/js/lib/zeptojs/zepto.min.js"/>"></script>--%>
<script type="text/javascript">
    (function () {
        var prefix = "${pageContext.request.contextPath}";

        var form = {
            offset: 0,
            limit: 10,
        }


        var loadFavour = function () {
            $.ajax({
                type: "POST",
                url: prefix + "/favour/list",
                data: form,
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.code == null) {
                        $(data).each(function (i, e) {
                            var li = '<li class="ui-border-t" onclick="window.location.href=">'
                                    + '<a href="${pageContext.request.contextPath}/goods/detail/' + e.id + '">'
                                    + '<div class="ui-list-img">'
                                    + '<span style="background-image:url(' + e.goodsMainPic + '?imageMogr2/thumbnail/200x200)"></span>'
                                    + '</div>'
                                    + '</a>'
                                    + '<div class="ui-list-info"><h4 class="ui-nowrap carts-title">' + e.title + '</h4>'
                                    + '<p class="ui-nowrap carts-salesAttr">' + e.intro + '</p>'
                                    + '<p class="ui-nowrap"><span class="carts-num">&yen;' + e.price + '</span></p>'
                                    + '<p class="ui-nowrap">收藏日期' + generateDate(e.cTime) + '</p>'
                                    + '</div>'
                                    + '</li>';
                            $("#goods-ul").append($(li));
                        })
                    }
                },
                error: function (msg) {
                    console.log(JSON.stringify(msg));
                }
            })
        }

        loadFavour();


        //加载日期
        function generateDate(time) {
            var data = new Date(parseInt(time));
            var formatDate = data.format('yyyy-MM-dd');
            return formatDate;
        }

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