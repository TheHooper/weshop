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
    <title>ho商城商品列表</title>
    <link href="<c:url value="../css/frozen.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="../css/homall.css"/>" rel="stylesheet" type="text/css"/>
    <script type="text/javascript"
            src="<c:url value="../js/lib/zeptojs/zepto.min.js"/>"></script>
</head>
<style>

</style>
<body>
<!-- header -->
<header class="ui-searchbar-wrap ui-border-b">
    <a href="<c:url value="../h//category"/>"><i id="headerBarCat"
                                                 class="ui-icon-prev"></i></a>
    <div class="ui-searchbar ui-border-radius">
        <i class="ui-icon-search"></i>
        <div class="ui-searchbar-text">搜索商品</div>
        <div class="ui-searchbar-input"><input value="" type="text" placeholder="商品名" autocapitalize="off"></div>
        <i class="ui-icon-close"></i>
    </div>
    <button class="ui-searchbar-cancel">搜索</button>
</header>
<!-- header E -->

<!-- tool -->
<div class="ui-row ui-whitespace back-white text-center">
    <div class="ui-col ui-col-33"><i id="sort-defalt-i" onclick="sortDefault()" class="ui-icon-unfold"
                                     style="font-size: 1.5em"><span
            style="font-size: 0.8em">综合</span></i></div>
    <div class="ui-col ui-col-33">
        <i onclick="sort(this)" class="ui-icon-sort-small sortable" value="SELL" style="font-size: 1.5em">
            <span style="font-size: 0.8em">销量</span>
        </i>
    </div>
    <div class="ui-col ui-col-33">
        <i onclick="sort(this)" class="ui-icon-sort-small sortable" value="PRICE" style="font-size: 1.5em">
            <span style="font-size: 0.8em">价格</span>
        </i>
    </div>
</div>
<!-- too E-->

<section class="ui-panel padding-top-s">
    <div>
        <ul id="goodsListUl" class="ui-grid-halve">
            <li>
                <div class="ui-border">
                    <div class="ui-grid-trisect-img">
                        <span style="background-image:url(http://placeholder.qiniudn.com/190x284)"></span>
                    </div>
                    <div class="padding-horizontal-xs">
                        <h4 class="ui-nowrap-multi">长书名长书名长书名长书名长书名长书名长书名</h4>
                        <h5 class="ui-nowrap price">&yen;2100 </h5>
                    </div>
                </div>
            </li>
            <li>
                <div class="ui-border">
                    <div class="ui-grid-trisect-img">
                        <span style="background-image:url(http://placeholder.qiniudn.com/190x284)"></span>
                    </div>
                    <div class="padding-horizontal-xs">
                        <h4 class="ui-nowrap-multi">长书名长书名长书名长书名长书名长书名长书名</h4>
                        <h5 class="ui-nowrap price">&yen;2200 </h5>
                    </div>
                </div>
            </li>
            <li>
                <div class="ui-border">
                    <div class="ui-grid-trisect-img">
                        <span style="background-image:url(http://placeholder.qiniudn.com/190x284)"></span>
                    </div>
                    <div class="padding-horizontal-xs">
                        <h4 class="ui-nowrap-multi">长书名长书名长书名长书名长书名长书名长书名</h4>
                        <h5 class="ui-nowrap price">&yen;220 </h5>
                    </div>
                </div>
            </li>
            <li>
                <div class="ui-border">
                    <div class="ui-grid-trisect-img">
                        <span style="background-image:url(http://placeholder.qiniudn.com/190x284)"></span>
                    </div>
                    <div class="padding-horizontal-xs">
                        <h4 class="ui-nowrap-multi">长书名长书名长书名长书名长书名长书名长书名</h4>
                        <h5 class="ui-nowrap price">&yen;200 </h5>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</section>

</body>
<script type="text/javascript" src="<c:url value="../js/frozen.js"/>"></script>
<script type="text/javascript" src="<c:url value="../js/homall/goods.js"/>"></script>
<script type="text/javascript">
//        var initHeight = function () {
//            var winHeight = $(window).height();
//            var searchHeight = $(".ui-searchbar-wrap").height();
//            var scrollerHeight = winHeight - searchHeight - 2;
//            $(".ui-scroller").height(scrollerHeight);
//            $("#sonCat").height(scrollerHeight + 2);
//        }

var prefix = "${pageContext.request.scheme}" + "://" + "${pageContext.request.serverName}" + ":" + "${pageContext.request.localPort}" + "/";

var basicOffset = 0;
var basiclimit = 6;
var fitlerForm = {
    title: "${title}",
    catId: "${catId}",
    time: 0,
    price: 0,
    sold: 0,
    orderType: 1,
    limit: basiclimit,
    offset: basicOffset
}


function sort(target) {
    fitlerForm.limit = basiclimit;
    fitlerForm.offset = basicOffset;
    $(".sortable").each(function (i, e) {
        if (e != target) {
            $(e).removeClass("ui-icon-asc");
            $(e).removeClass("ui-icon-desc");
        }
    });
    //asc to desc: cur desc
    if ($(target).hasClass("ui-icon-asc")) {
        $(target).removeClass("ui-icon-asc");
        $(target).addClass("ui-icon-desc");
        fitlerForm.orderType = 1;
    } else {
        // to asc:cur asc
        $(target).addClass("ui-icon-asc");
        fitlerForm.orderType = 0;
    }

    if ($(target).attr("value") == "SELL") {
        fitlerForm.sold = 1;
        fitlerForm.time = 0;
        fitlerForm.price = 0;
    } else if ($(target).attr("value") == "PRICE") {
        fitlerForm.sold = 0;
        fitlerForm.time = 0;
        fitlerForm.price = 1;
    } else {
        fitlerForm.sold = 0;
        fitlerForm.time = 0;
        fitlerForm.price = 0;
    }

    loadGoods(fitlerForm);
}

function sortDefault() {
    $(".ui-icon-asc").removeClass("ui-icon-asc");
    $(".ui-icon-desc").removeClass("ui-icon-desc");
    fitlerForm.sold = 0;
    fitlerForm.time = 1;
    fitlerForm.price = 0;
    fitlerForm.orderType = 1;
    fitlerForm.limit = basiclimit;
    fitlerForm.offset = basicOffset;
    loadGoods(fitlerForm);
}

        var initSearchBar = function () {
            $('.ui-searchbar').tap(function () {
                $('.ui-searchbar-wrap').addClass('focus');
                $('.ui-searchbar-input input').focus();
            });
            $('.ui-searchbar-cancel').tap(function () {
                $('.ui-searchbar-wrap').removeClass('focus');
            });
        }

var loadGoods = function (fitlerForm) {
    $.ajax({
        type: "GET",
        url: prefix + "h/goods/goodses",
        data: fitlerForm,
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        dataType: "json",
        success: function (data) {
            if (typeof (data.code) == "undefined") {
                $("#goodsListUl").html("");
                console.log(data);
                GoodsApi.urlPrefix = prefix;
                GoodsApi.loadGoodsListFace(data, "goodsListUl");
            }
        },
        error: function (msg) {

        }
    })
}
//        var initScroll = function () {
//            var scroll = new fz.Scroll('.ui-scroller', {
//                scrollY: true
//            });
//        }
//
//        var parentCatClickEve = function () {
//            console.log(" run ---");
//            $(".ui-scroller li").tap(function (e) {
//                $(".ul-cat-active").removeClass("ul-cat-active");
//                $(e.target).addClass("ul-cat-active");
//            })
//            //change the sonCat method
//        }

        function init() {
            initSearchBar();
            loadGoods(fitlerForm);
        }

        init();
</script>
</html>