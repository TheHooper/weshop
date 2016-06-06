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
    <title>ho商城</title>
    <link href="<c:url value="../../css/frozen.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="../../css/homall.css"/>" rel="stylesheet" type="text/css"/>
    <script type="text/javascript"
            src="<c:url value="../../js/lib/zeptojs/zepto.min.js"/>"></script>
</head>
<body>
<!-- header part -->
<header id="header" class="ui-header">
    <div class="ui-tab" id="tab1">
        <ul id="topTap" class="ui-tab-nav ui-border-b">
            <li class="current" value="0">商品</li>
            <li value="1">详情</li>
            <li value="2">评价</li>
        </ul>
    </div>
</header>
<!-- header part end -->
<!-- footer part -->
<footer id="buy-footer" class="ui-footer" style="height: 48px">
    <div class="ui-row-flex ui-flex-align-center text-center hoTopic-footer" style="height: 100%">
        <div id="favor-btn" class="ui-col ui-col-1" style="height: 100%">
            <span class="ui-icon-star" style="line-height: 25px;color: #e6e6e6"></span>
            <h6>关注</h6>
        </div>
        <div id="go-cart-btn" class="ui-col ui-col-1" style="height: 100%">
            <span class="ui-icon-cart" style="line-height: 25px;color: #e6e6e6"></span>
            <h6>购物车</h6>
        </div>
        <div id="add-cart-btn" class="ui-col ui-col-2" style="height: 100%;line-height: 48px;">
            <h4>加入购物车</h4>
        </div>
        <div id="buy-btn" class="ui-col ui-col-2 back-blue" style="height: 100%;line-height: 48px">
            <h4>立即购买</h4>
        </div>
    </div>
</footer>
<!-- footer part end-->

<!-- 商品 页面-->
<section id="goods-section" class="ui-container">
    <!-- goods header -->
    <div class="back-white">
        <!-- slider -->
        <div class="ui-slider" id="slider" style="padding-top: 90%">
            <ul class="ui-slider-content" style="width: 300%">
                <%--<li><span style="background-image:url(http://placeholder.qiniudn.com/640x400)"></span></li>--%>
            </ul>
        </div>
        <!-- slider end -->
        <ul class="ui-list ui-list-pure ui-border-b margin-top-s">
            <li>
                <h3 class="ui-nowrap-multi">
                    ${goods.title}
                </h3>
            </li>
            <li>
                <h5 class="ui-nowrap-multi">${goods.intro}</h5>
            </li>
            <li>
                <span class="price txt-lg"> &yen;${goods.price} </span>
                <span class="price-fade"> 原价：<s>&yen;${goods.oPrice}</s> </span>
            </li>
        </ul>

    </div>
    <!-- goods header end-->
    <!-- buy ul -->
    <ul class="ui-list ui-list-one  ui-border-tb margin-top-s">
        <li id="attr-selected-li">
            <div class="ui-row-flex">
                <div class="ui-col ui-col-1">
                    <span class="list-title">已选</span>
                </div>
                <div id="selectedTip" class="ui-col ui-col-5 ui-nowrap">
                </div>
            </div>
        </li>
        <li>
            <div class="ui-row-flex">
                <div class="ui-col ui-col-1">
                    <span class="list-title">数量</span>
                </div>
                <div id="numTip" class="ui-col ui-col-5 ui-icon-unfold ui-right-icon ">
                    1
                </div>
            </div>
        </li>
        <li id="numSelector" style="display: none;">
            <div class="ui-row-flex">
                <div class="ui-col ui-col-1">
                </div>
                <div class="ui-col ui-col-5">
                    <input id="num-sub-btn" type='button' value='-' class='num-btn' field='quantity'/>
                    <input id="num" type='text' name='num' value='1' class='num'/>
                    <input id="num-plus-btn" type='button' value='+' class='num-btn' field='quantity'/>
                </div>
            </div>
        </li>
        <li>
            <div class="ui-row-flex">
                <div class="ui-col ui-col-1">
                    <span class="list-title">库存</span>
                </div>
                <div id="SKU" class="ui-col ui-col-5 ui-nowrap">
                    ${goods.stock}
                </div>
            </div>
        </li>
        <li>
            <div class="ui-row-flex">
                <div class="ui-col ui-col-1">
                    <span class="list-title">运费</span>
                </div>
                <div id="expressCharge" class="ui-col ui-col-5 ui-nowrap">
                    &yen;${goods.dCharge}
                </div>
            </div>
        </li>
    </ul>
    <!-- buy ul end -->
    <!-- detail -->
    <ul class="ui-list ui-list-one  ui-list-link ui-border-tb margin-top-m">
        <li id="detail-arrow-link">
            <span class="list-title">商品详情</span>
        </li>
    </ul>
    <!-- detail end -->
    <!-- rate -->
    <ul class="ui-list ui-list-text  ui-border-tb margin-top-m">
        <li id="rate-arrow-link" class="ui-arrowlink">
            <h4 class="list-title">商品评价</h4>
            <div id="rateNum" class="ui-txt-info txt-m margin-right-m">5条评价</div>
        </li>
        <li class="ui-border-t">
            <div class="ui-row-flex  ui-justify-flex">
                    <span class="comment-item-star">
                        <span class="real-star comment-stars-width2"></span>
                    </span>
                <div class="price-fade">
                    <h5>mikeghgh</h5>
                </div>
            </div>
        </li>
        <li>
            <div class="ui-row-flex ui-justify-flex txt-m">
                感觉不太行，整个CCP一样
            </div>
        </li>
        <li>
            <div class="price-fade">
                <h5>2016-05-12</h5>
            </div>
        </li>
        <li class="ui-border-t">
            <div class="ui-row-flex  ui-justify-flex">
                    <span class="comment-item-star">
                        <span class="real-star comment-stars-width5"></span>
                    </span>
                <div class="price-fade">
                    <h5>mikegfgf</h5>
                </div>
            </div>
        </li>
        <li>
            <div class="ui-row-flex ui-justify-flex txt-m">
                我是红卫兵
            </div>
        </li>
        <li>
            <div class="price-fade">
                <h5>2016-06-13</h5>
            </div>
        </li>
    </ul>
    <div class="ui-row back-white text-center ui-border-b">
        <i class="ui-icon-unfold"><label class="txt-m">更多评价</label></i>
    </div>
    <!-- rate end -->
</section>
<!-- 商品 页面 end-->

<!-- 详情 页面-->
<section id="detail-section" class="ui-container back-white" style="display: none">

</section>
<!-- 详情 页面 end-->

<!-- 评价 页面-->
<section id="rate-section" class="ui-container" style="display: none">
    <div class="ui-row-flex  text-center back-grey padding-vertical-s txt-fade">
        <div class="ui-col ui-col">
            全部<span id="all-rate-num">(28)</span>
        </div>
        <div class="ui-col ui-col">
            好评<span id="good-rate-num">(25)</span>
        </div>
        <div class="ui-col ui-col">
            中评<span id="nor-rate-num">(2)</span>
        </div>
        <div class="ui-col ui-col">
            差评<span id="bad-rate-num">(1)</span>
        </div>
        <div class="ui-col ui-col">
            有图<span id="pic-rate-num">(5)</span>
        </div>
    </div>
    <ul class="ui-list ui-list-text  ui-border-tb">
        <li class="ui-border-t">
            <div class="ui-row-flex  ui-justify-flex">
                    <span class="comment-item-star">
                        <span class="real-star comment-stars-width2"></span>
                    </span>
                <div class="price-fade">
                    <h5>mikeghgh</h5>
                </div>
            </div>
        </li>
        <li>
            <div class="ui-row-flex ui-justify-flex txt-m">
                感觉不太行，整个CCP一样
            </div>
        </li>
        <li>
            <div class="ui-row-flex ui-whitespace padding-fix">
                <img src="http://img30.360buyimg.com/shaidan/s310x310_jfs/t2743/145/737207555/3827/ea7747e/5724a059Ne169562d.jpg"
                     class="comment-item-img"/>
                <img src="http://img30.360buyimg.com/shaidan/s310x310_jfs/t2743/145/737207555/3827/ea7747e/5724a059Ne169562d.jpg"
                     class="comment-item-img"/>
                <img src="http://img30.360buyimg.com/shaidan/s310x310_jfs/t2743/145/737207555/3827/ea7747e/5724a059Ne169562d.jpg"
                     class="comment-item-img"/>
                <img src="http://img30.360buyimg.com/shaidan/s310x310_jfs/t2743/145/737207555/3827/ea7747e/5724a059Ne169562d.jpg"
                     class="comment-item-img"/>
            </div>
        </li>
        <li>
            <div class="price-fade">
                <h5>2016-05-12</h5>
            </div>
        </li>
        <li class="ui-border-t">
            <div class="ui-row-flex  ui-justify-flex">
                    <span class="comment-item-star">
                        <span class="real-star comment-stars-width5"></span>
                    </span>
                <div class="price-fade">
                    <h5>mikegfgf</h5>
                </div>
            </div>
        </li>
        <li>
            <div class="ui-row-flex ui-justify-flex txt-m">
                我是红卫兵
            </div>
        </li>
        <li>
            <div class="ui-row-flex ui-whitespace padding-fix">
                <img src="http://img30.360buyimg.com/shaidan/s310x310_jfs/t1936/178/2833003571/103010/b8c7b885/56f8a2dbNf5cc2281.jpg"
                     class="comment-item-img"/>
                <img src="http://img30.360buyimg.com/shaidan/s310x310_jfs/t1936/178/2833003571/103010/b8c7b885/56f8a2dbNf5cc2281.jpg"
                     class="comment-item-img"/>
            </div>
        </li>
        <li>
            <div class="price-fade">
                <h5>2016-06-13</h5>
            </div>
        </li>
    </ul>
    <div class="ui-row back-white text-center ui-border-b">
        <i class="ui-icon-unfold"><label class="txt-m">更多评价</label></i>
    </div>
</section>
<!-- 评价 页面 end-->

<div id="error-view" class="ui-poptips ui-poptips-warn" style="display: none">
    <div class="ui-poptips-cnt"><i></i>请先选择属性</div>
</div>


</body>
<link href="<c:url value="../../css/all-animation.css"/>" rel="stylesheet"
      type="text/css"/>
<script type="text/javascript" src="<c:url value="../../js/frozen.js"/>"></script>
<script type="text/javascript">
    (function () {
        var prefix = ""

        var goodsId = ${goods.id};
        var pics = new Array();
        pics.push("${goods.goodsMainPic}");
        pics.push("${goods.goodsSecondPic}");
        pics.push("${goods.goodsThirthPic}");
        pics.push("");

        var $attrArray = new Array();
        var $detailInited = false;
        var $rateInited = false;

        var tapEvent = function () {
            function toDeatil() {
                $("#goods-section").css("display", "none");
                $("#rate-section").css("display", "none");
                $("#detail-section").addClass('enter-right-bounce');
                $("#detail-section").css("display", "block");
                $("#buy-footer").addClass("rotate-out");
                setTimeout(function () {
                    $("#buy-footer").css("display", "none");
                }, "1500");
                if (!$detailInited) {
                    $.ajax({
                        type: "GET",
                        url: prefix + "/goods/detail/single/" + goodsId,
                        data: {},
//                                contentType: "application/json; charset=utf-8",
                        contentType: "application/x-www-form-urlencoded; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            if (typeof (data.code) == "undefined") {
                                $detailInited = true;
                                $('#detail-section').append(data.context);
                            }
                        },
                        error: function (msg) {

                        }
                    })
                }
            }

            function toRate() {
                $("#goods-section").css("display", "none");
                $("#detail-section").css("display", "none");
                $("#rate-section").addClass('enter-right-bounce');
                $("#rate-section").css("display", "block");
                $("#buy-footer").addClass("rotate-out");
                setTimeout(function () {
                    $("#buy-footer").css("display", "none");
                }, "1500");
            }

            function toGoods() {
                $("#detail-section").css("display", "none");
                $("#rate-section").css("display", "none");
                $("#goods-section").addClass('enter-right-bounce');
                $("#goods-section").css("display", "block");
                $("#buy-footer").removeClass("rotate-out");
                $("#buy-footer").addClass("flip-bottom");
                setTimeout(function () {
                    $("#buy-footer").css("display", "block");
                }, "1000");
            }

            $('#topTap').children("li").tap(function () {
                var index = $(this).val();
                if (index == 1) {
                    toDeatil();
                } else if (index == 2) {
                    toRate();
                } else {
                    toGoods();
                }
            })
            $('#detail-arrow-link').tap(function () {
                var lis = $('#topTap').children("li");
                lis.removeClass("current");
                var liArr = lis.toArray();
                $(liArr[1]).addClass("current");
                toDeatil();
            });
            $('#rate-arrow-link').tap(function () {
                var lis = $('#topTap').children("li");
                lis.removeClass("current");
                var liArr = lis.toArray();
                $(liArr[2]).addClass("current");
                toRate();
            });
        }

        var initSliderData = function () {
            var size = $("#slider .ui-slider-content li").length;
            $(pics).each(function (i, e) {
                if (e != "" && e != null) {
                    var li = '<li><span style="background-image:url(' + e + ')"></span></li>'
                    var size = size + 1;
                    $("#slider .ui-slider-content").append(li);
                }
            });
            $("#slider .ui-slider-content").css("width", size + "00%");

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
        }

        var attrSelectEvent = function () {
            var uls = $('.attr-ul');
            if (uls.length > 0) {
                $(uls).each(function (i, e) {
                    $(e).children("li").children("div").tap(function () {
                        $(e).children("li").children("div").removeClass("active");
                        $(this).addClass("active");
                        attrSelectTip();
                        var selectedItems = $(".attr-span.active");
                        if (selectedItems.length == $attrArray.length) {
                            var attrIds = {};
                            $(selectedItems).each(function (i, e) {
                                attrIds[i] = $(e).attr("value");
                            })
                            var attrForm = {
                                attrIds: attrIds
                            }
                            $.ajax({
                                type: "GET",
                                url: prefix + "/goods/sku/" + goodsId,
                                data: attrForm,
//                                contentType: "application/json; charset=utf-8",
                                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                                dataType: "json",
                                success: function (data) {
                                    if (typeof (data.code) == "undefined") {
                                        $("#SKU").text(data.stockNum);
                                        $("#selectedTip").attr("value", data.skuId);
                                        if (data.stockNum < $("#num").val()) {
                                            $("#num").val(data.stockNum);
                                            $('#numTip').text(data.stockNum);
                                        }
                                    }
                                },
                                error: function (msg) {

                                }
                            })
                        }
                    })
                })
            }
        }

        var attrSelectTip = function () {
            var selectedItems = $(".attr-span.active");
            var tipString = "";
            $(selectedItems).each(function (i, e) {
                tipString = tipString + " " + $(e).text();
            })
            $("#selectedTip").text(tipString);
        }

        var numEvent = function () {
            $('#numTip').tap(function () {
                if ($('#numSelector').css("display") == "none") {
                    $('#numSelector').css("display", "-webkit-box");
                } else {
                    $('#numSelector').css("display", "none");
                }
            })
            $("#num-sub-btn").tap(function () {
                var num = $("#num").val();
                if (num - 1 < 0) {
                    num = 0;
                } else {
                    num = num - 1;
                }
                $("#num").val(num);
                $('#numTip').text(num);
            })
            $("#num-plus-btn").tap(function () {
                var num = $("#num").val();
                var sku = $("#SKU").text();
                num = parseInt(num);
                sku = parseInt(sku);
                if (num + 1 > sku) {
                    num = sku;
                } else {
                    num = num + 1;
                }
                $("#num").val(num);
                $('#numTip').text(num);
            })
        }

        var attrsFactory = function (parentId, parentName, divAfterId) {
            var obj = new Object();
            obj.content = $('<li><div class="ui-row-flex"></div><li>');
            obj.parentId = parentId;
            obj.parentName = parentName;
            obj.parentNameContent = $('<div class="ui-col ui-col-1"><span value ="' + parentId + '" class="list-title">' + parentName + '</span></div>');
            obj.attrs = new Array();
            obj.attrContent = $('<div class="ui-col ui-col-5"><ul class="ui-grid-trisect padding-fix attr-ul"></ul></div>');
            obj.addAttr = function (attrId, attrName) {
                this.attrs.push(attrId);
                var attr = '<li><div value="' + attrId + '" class="attr-span">' + attrName + '</div></li>';
                $(obj.attrContent).children("ul").append(attr);
            }
            obj.inited = false;
            obj.init = function () {
                if (!this.inited) {
                    $(obj.content).children("div").append(this.parentNameContent);
                    $(obj.content).children("div").append(this.attrContent);
                    $('#' + divAfterId + '').after(obj.content);
                    this.inited = true;
                }
            }
            obj.init();
            return obj;
        }

        var attrEvent = function () {
            $.ajax({
                type: "GET",
                url: prefix + "/goods/attrs/" + goodsId,
                data: {},
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (typeof (data.code) == "undefined") {
                        $(data).each(function (i, e) {
                            var isAdded = false;
                            $($attrArray).each(function (si, se) {
                                if (se.parentId == e.parentId) {
                                    se.addAttr(e.attrId, e.attrName);
                                    isAdded = true;
                                }
                            })
                            if (!isAdded) {
                                var newAttrs = attrsFactory(e.parentId, e.parentName, "attr-selected-li");
                                $attrArray.push(newAttrs);
                                newAttrs.addAttr(e.attrId, e.attrName);
                            }
                        })

                    }
                    attrSelectEvent();
                },
                error: function (msg) {
                    console.log(JSON.stringify(msg));
                }
            })
        }


        var addToCart = function () {
            var cartAddForm = {
                goodsId: "${goods.id}",
                goodsPic: "${goods.goodsMainPic}",
                goodsTitle: "${goods.title}",
                skuId: $("#selectedTip").attr("value"),
                salesAttr: $("#selectedTip").text(),
                num: $("#num").val()
            }
            console.log(cartAddForm.skuId);
            if (typeof (cartAddForm.skuId) == "undefined" || "" == cartAddForm.skuId || cartAddForm.skuId == null) {
                $("#error-view").css("display", "block");
                setTimeout(function () {
                    $("#error-view").css("display", "none");
                }, 1500)
            } else {
                $.ajax({
                    type: "POST",
                    url: prefix + "/carts/add",
                    data: cartAddForm,
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.code == "0") {
                            $("#error-view div").text("已加入购物车");
                            $("#error-view").css("display", "block");
                            setTimeout(function () {
                                $("#error-view").css("display", "none");
                            }, 1500)
                        }
                        attrSelectEvent();
                    },
                    error: function (msg) {
                        console.log(JSON.stringify(msg));
                    }
                })
            }
        }

        var addToCartEvent = function () {
            $("#add-cart-btn").tap(function () {
                addToCart()
            })
        }

        var goCartEvent = function () {
            $('#go-cart-btn').tap(function () {
                window.location.href = prefix + "/user/carts";
            })
        }

        var buyEvent = function () {
            $("#buy-btn").tap(function () {
                var checkoutForm = {
                    goodsId: "${goods.id}",
                    skuId: $("#selectedTip").attr("value"),
                    salesAttr: $("#selectedTip").text(),
                    num: $("#num").val(),
                }
                if (typeof (checkoutForm.skuId) == "undefined" || "" == checkoutForm.skuId || checkoutForm.skuId == null) {
                    $("#error-view").css("display", "block");
                    setTimeout(function () {
                        $("#error-view").css("display", "none");
                    }, 1500)
                } else {
                    var my_val = $.trim($('#ipt').val());
                    // 取得要提交页面的URL
                    var action = prefix + "/orders/buy";
                    // 创建Form
                    var form = $('<form></form>');
                    // 设置属性
                    form.attr('action', action);
                    form.attr('method', 'post');
                    // form的target属性决定form在哪个页面提交
                    // _self -> 当前页面 _blank -> 新页面
                    form.attr('target', '_self');
                    // 创建Input
                    var goodsId_input = $('<input type="text" name="goodsId" />');
                    goodsId_input.attr('value', checkoutForm.goodsId);
                    var skuId_input = $('<input type="text" name="skuId" />');
                    skuId_input.attr('value', checkoutForm.skuId);
                    var salesAttr_input = $('<input type="text" name="salesAttr" />');
                    salesAttr_input.attr('value', checkoutForm.salesAttr);
                    var num_input = $('<input type="text" name="num" />');
                    num_input.attr('value', checkoutForm.num);
                    // 附加到Form
                    form.append(goodsId_input);
                    form.append(skuId_input);
                    form.append(salesAttr_input);
                    form.append(num_input);
                    // 提交表单
                    form.submit();
                    // 注意return false取消链接的默认动作
                    return false;
                }
            })
        }

        tapEvent();
        numEvent();
        attrEvent();
        initSliderData();
        addToCartEvent();
        goCartEvent();
        buyEvent();


        $(".ui-tab-nav li").tap(function () {
            $(".ui-tab-nav li").removeClass("current");
            $(this).addClass("current");
        });
    })();
</script>
</html>