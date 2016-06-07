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
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <title>HoMall初心</title>
    <link href="<c:url value="../css/frozen.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="../css/homall.css"/>" rel="stylesheet" type="text/css"/>
    <script type="text/javascript"
            src="<c:url value="../js/lib/zeptojs/zepto.min.js"/>"></script>
</head>
<body>
<!-- header -->
<header class="ui-searchbar-wrap ui-border-b">
    <a href="/category"><i id="headerBarCat" class="ui-icon-cat-tall"></i></a>
    <div class="ui-searchbar ui-border-radius">
        <i class="ui-icon-search"></i>
        <div class="ui-searchbar-text">搜索商品</div>
        <div class="ui-searchbar-input"><input value="" type="text" placeholder="商品名" autocapitalize="off"></div>
        <i class="ui-icon-close ui-searchbar-close"></i>
    </div>
    <button class="ui-searchbar-cancel">搜索</button>
    <a href="/user/central"><i id="headerBarAccount" class="ui-icon-my"></i></a>
</header>
<!-- header E -->

<!-- slider -->
<div class="ui-slider" id="indexSlider">
    <ul class="ui-slider-content" style="width: 300%">
        <li onclick="javascript:window.location.href='/goods/detail/9'"><span
                style="background-image:url(http://7xtgdy.com1.z0.glb.clouddn.com/FvICg_y4bdix6QofUfq6yS7AUiR1)"></span>
        </li>
        <li onclick="javascript:window.location.href='/goods/detail/18'"><span
                style="background-image:url(http://7xtgdy.com1.z0.glb.clouddn.com/Fu_rsd3aub5K2ijMKjuRmtUOv3NP)"></span>
        </li>
        <li onclick="javascript:window.location.href='/goods/detail/15'"><span
                style="background-image:url(http://7xtgdy.com1.z0.glb.clouddn.com/FrGdfZ8N81A1UdVoBoic4MMMNCNm)"></span>
        </li>
    </ul>
</div>
<!-- slider E -->

<!-- toolBar -->
<ul class="ui-row text-center margin-top-s padding-vertical-s">
    <li class="ui-col ui-col-33">
        <a href="/user/orders" class="txt-black">
            <i class="ui-icon-history"></i>
            <p>订单查询</p>
        </a>
    </li>
    <li class="ui-col ui-col-33">
        <a href="/user/carts" class="txt-black">
            <i class="ui-icon-cart"></i>
            <p>购物车</p>
        </a>
    </li>
    <li class="ui-col ui-col-33">
        <a href="/user/central" class="txt-black">
            <i class="ui-icon-personal"></i>
            <p>个人中心</p>
        </a>
    </li>
</ul>
<!-- toolBar E -->

<!-- Recommand -->
<section class="ui-panel margin-top-m">
    <h2>本季主打</h2>
    <ul class="ui-grid-trisect ui-flex ui-flex-align-stretch">
        <li>
            <div class="ui-border back-white" style="height: 100%">
                <div class="text-center ho-padding-top-sm">
                    <h5 class="ui-nowrap">TISSOT</h5>
                </div>
                <div class="ho-text-center ho-margin-top-sm">
                    <a href="/goods/detail/18">
                        <img src="http://7xtgdy.com1.z0.glb.clouddn.com/FjB_qZXZbYx16NsvCZUEAStBJE8i?imageView2/2/w/100/h/100"/>
                    </a>
                </div>
            </div>
        </li>
        <li>
            <div class="ui-border back-white">
                <div class="text-center ho-padding-top-sm">
                    <h5 class="ui-nowrap">Danner</h5>
                </div>
                <div class="ho-text-center ho-margin-top-sm">
                    <a href="/goods/detail/17">
                        <img src="http://7xtgdy.com1.z0.glb.clouddn.com/FrH06T7SZjxeF_WNiCV1fvH47BDZ?imageView2/2/w/100/h/100"/>
                    </a>
                </div>
            </div>
        </li>
        <li>
            <div class="ui-border back-white">
                <div class="text-center ho-padding-top-sm">
                    <h5 class="ui-nowrap">Tommy</h5>
                </div>
                <div class="ho-text-center ho-margin-top-sm">
                    <a href="/goods/detail/9">
                        <img src="http://7xtgdy.com1.z0.glb.clouddn.com/Fk-4CYY1Na4OWWKACFGqrBe8aou_?imageView2/2/w/100/h/100"/>
                    </a>
                </div>
            </div>
        </li>
    </ul>
</section>
<!-- Recommand E -->

<!-- topic -->
<section class="ui-panel">
    <h2 class="ui-arrowlink"><span>六一喂食计划</span><!--<span class="ui-panel-title-tips">更多</span>--></h2>
    <div class="hoTopic-head" style="background-image: url(img/section/t1.png);">
        <div class="arrow-up hoTopic-head-arrow">
        </div>
    </div>
    <!-- html -->
    <div class="hoTopic-wapper">
        <ul class="hoTopic-scroller">
            <li style="background:url(http://7xtgdy.com1.z0.glb.clouddn.com/Fi8oVGYSQX6aVyO9S_AdkcrGWkdt?imageView2/2/w/80/h/80)"
                onclick="javascript:window.location.href='/goods/detail/15'"></li>
            <li style="background:url(http://7xtgdy.com1.z0.glb.clouddn.com/Fq41a7tr_EYOIN-thBGAAcNRFPqg?imageView2/2/w/80/h/80)"
                onclick="javascript:window.location.href='/goods/detail/13'"></li>
        </ul>
    </div>
</section>
<!-- topic E -->

<!-- Hot goods -->
<section class="margin-top-xl">
    <div class="text-center">
        <h2>- 热销商品 -</h2>
    </div>
    <div>
        <ul id="goodsListUl" class="ui-grid-halve">

        </ul>
    </div>
</section>
<!-- Hot goods E -->
</body>

<script type="text/javascript" src="<c:url value="../js/frozen.js"/>"></script>
<script type="text/javascript" src="<c:url value="../js/homall/goods.js"/>"></script>
<script type="text/javascript">
    (function () {
        var prefix = "${pageContext.request.contextPath}";

        var slider = new fz.Scroll('.ui-slider', {
            role: 'slider',
            indicator: true,
            autoplay: true,
            interval: 3000
        });

        slider.on('beforeScrollStart', function (fromIndex, toIndex) {
//            console.log(fromIndex, toIndex)
        });

        slider.on('scrollEnd', function (cruPage) {
//            console.log(cruPage)
        });

        $('.ui-searchbar').tap(function () {
            $('.ui-searchbar-wrap').addClass('focus');
            $('.ui-searchbar-input input').focus();
        });
        $('.ui-searchbar-cancel').tap(function () {
            $('.ui-searchbar-wrap').removeClass('focus');
            var searcher = $('.ui-searchbar-input input').val()
            window.location.href = prefix + "/goods/list?title=" + searcher;
        });

        var scroll = new fz.Scroll('.hoTopic-wapper', {
            scrollY: false,
            scrollX: true
        });

        var loadHotGoods = function () {
            $.ajax({
                type: "GET",
                url: prefix + "/goods/goodses",
                data: {
                    limit: 4,
                    offset: 0,
                    sold: 1
                },
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (typeof (data.code) == "undefined") {
                        console.log(data);
                        GoodsApi.urlPrefix = prefix;
                        GoodsApi.loadGoodsListFace(data, "goodsListUl");
                    }
                },
                error: function (msg) {

                }
            })
        }

        loadHotGoods();
    })();

</script>
</html>