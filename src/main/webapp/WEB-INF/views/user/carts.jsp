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
    <title>购物车</title>
    <link href="<c:url value="../css/frozen.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="../css/homall.css"/>" rel="stylesheet" type="text/css"/>
    <script type="text/javascript"
            src="<c:url value="../js/lib/zeptojs/zepto.min.js"/>"></script>
</head>
<body>
<header id="header" class="header">
    <a href="/index" class="header-arrow-l"><i id="headerBarCat" class="ui-icon-prev"></i></a>
    <h2 class="ui-flex-pack-center">购物车</h2>
</header>

<!-- footer part -->
<footer id="buy-footer" class="ui-footer" style="height: 48px;visibility:hidden">
    <div class="ui-row-flex ui-flex-align-center text-center hoTopic-footer" style="height: 100%">
        <div class="ui-col ui-col-1">
        </div>
        <div class="ui-col ui-col-1">
        </div>
        <div class="ui-col ui-col-2">
        </div>
        <div class="ui-col ui-col-2 back-blue" style="height: 100%;line-height: 48px">
            <a href="/orders/checkout">
                <h4 class="color-white">结算</h4>
            </a>
        </div>
    </div>
</footer>
<!-- footer part end-->

<!-- tool bar -->
<ul class="ui-row-flex" style="height: 46px">
    <li class="ui-col ui-flex ui-flex-ver  ui-flex-align-start ui-flex-pack-center">
        <div id="cleanAll" class="padding-left-s txt-fade txt-lg " style="display: none">
            <!--清空-->
        </div>
    </li>
    <li class="ui-col ui-flex ui-flex-ver  ui-flex-align-end ui-flex-pack-center">
        <div id="edit" class="padding-right-s" style="visibility:hidden">
            <i class="ui-icon-set txt-lg"><span>编辑</span></i>
        </div>
    </li>
</ul>
<!-- tool bar E -->

<section class="ui-notice" style="height: 50%">
    <i></i>
    <p>购物车空空如也~</p>
</section>

<ul id="carts-ul" class="ui-list  ui-border-tb ho-margin-bottom-sm">

</ul>

</body>
<link href="<c:url value="../css/all-animation.css"/>" rel="stylesheet"
      type="text/css"/>
<script type="text/javascript" src="<c:url value="../js/frozen.js"/>"></script>
<script type="text/javascript">
    (function () {
        var prefix = "${pageContext.request.contextPath}"

        var editEvent = $('#edit').tap(function () {
            $('#edit').toggleClass("editing");
            if ($('#edit').hasClass("editing")) {
                $('#edit').children("i").children("span").text("保存");
                $('.h-list-checkbox').css("display", "block");
                $('.h-list-num').css("display", "block");
                $(".carts-num-tip").css("display", "none");
                $('.h-list-del').css("display", "block");
                $('.h-list-checkbox').toggleClass("flash-bang");
                $('.h-list-num').toggleClass("flash-bang");
                $('.h-list-del').toggleClass("flash-bang");
                $(".ui-list").children("li").addClass("margin-left-fix");
                $(".ui-list-info").addClass("padding-right-fix");
                $('#cleanAll').css('display', "block");
                $('#cleanAll').toggleClass("flash-bang");
            } else {
                $('#edit').children("i").children("span").text("编辑");
                $('.h-list-checkbox').css("display", "none");
                $('.h-list-num').css("display", "none");
                $(".carts-num-tip").css("display", "block");
                $('.h-list-del').css("display", "none");
                $('.h-list-checkbox').toggleClass("flash-bang");
                $('.h-list-num').toggleClass("flash-bang");
                $('.h-list-del').toggleClass("flash-bang");
                $(".ui-list").children("li").removeClass("margin-left-fix");
                $(".ui-list-info").removeClass("padding-right-fix");
                $('#cleanAll').css('display', "none");
                $('#cleanAll').toggleClass("flash-bang");
                updateCarts();
            }
        })

        var getChartGood = function (carts) {
            var qiniuApi = "?imageMogr2/thumbnail/200x200"
            return $(
                    '<li class="ui-border-t">'
                    + '<div class="h-list-center h-list-checkbox" style="display: none">'
                    + '<input type="checkbox" style="display: none"/>'
                    + '<input value="' + carts.goodsId + '" class="carts-goodsId" type="checkbox" style="display: none"/>'
                    + '</div>'
                    + '<div class="ui-list-img">'
                    + ' <span style="  background-image:url(' + carts.goodsPic + qiniuApi + ')"></span>'
//                            +' <img src="'+carts.goodsPic+qiniuApi+'" width="100px" height="100px"/>'
                    + '</div>'
                    + '<div class="ui-list-info">'
                    + ' <h4 class="ui-nowrap carts-title">' + carts.goodsTitle + '</h4>'
                    + '<p class="ui-nowrap carts-salesAttr">' + carts.salesAttr + '</p>'
                    + '<p class="ui-nowrap carts-num-tip">x' + carts.num + '</p>'
                    + '<div class="h-list-num" style="display: none">'
                    + '<input type="button" value="-" class="num-btn" field="quantity"/>'
                    + '<input type="text" name="num" value="' + carts.num + '" class="num carts-num"/>'
                    + '<input type="button" value="+" class="num-btn" field="quantity"/>'
                    + '</div>'
                    + '</div>'
                    + '<div class="h-list-center h-list-del" style="display: none">'
                    + ' <i value="' + carts.id + '" class="ui-icon-close carts-id"></i>'
                    + '</div>'
                    + '</li>');
        }

        var delFromCartsEvent = function () {
            $(document).on("tap", ".h-list-del", function () {
                var id = $(this).children(".carts-id").attr("value");
                var li = $(this).parent("li");
                console.log(li);
                $.ajax({
                    type: "POST",
                    url: prefix + "/carts/del",
                    data: {
                        id: id
                    },
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.code == "0") {
                            $(li).html("");
                        }
                    },
                    error: function (msg) {
                        console.log(JSON.stringify(msg));
                    }
                })
            })
        }

        var numChange = function () {
            $(document).on("tap", ".num-btn", function () {
                var num = $(this).siblings(".num");
                var val = parseInt($(num).val());
                if ($(this).val() == "+") {
                    $(num).val(val + 1);
                } else {
                    if (val <= 1) {
                        return
                    } else {
                        $(num).val(val - 1);
                    }
                }
            })
        }

        var updateCarts = function () {
            var lis = $("#carts-ul").children("li");
            var cartModifyFormList = new Array();
            $(lis).each(function (i, e) {
                if ($(e).html() != "" && $(e).html() != null) {
                    console.log(e);
                    console.log($(e).find(".carts-id"));
                    console.log($(e).find(".carts-num"));
                    var id = $(e).find(".carts-id").attr("value");
                    var num = $(e).find(".carts-num").val();
                    var cartForm = initUpdateCartForm(id, num);
                    cartModifyFormList.push(cartForm);
                }
            })
            if (cartModifyFormList.length > 0) {
                console.log(cartModifyFormList);
                $.ajax({
                    type: "POST",
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json',
                        'charset': 'utf-8'
                    },
                    url: prefix + "/carts/update",
                    data: JSON.stringify(cartModifyFormList),
                    //contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.code == "0") {
                            loadCarts();
                        }
                    },
                    error: function (msg) {
                        console.log(JSON.stringify(msg));
                    }
                })
            }
        }

        var initUpdateCartForm = function (id, num) {
            var obj = new Object();
            obj.id = id;
            obj.num = num;
            return obj;
        }

        var loadCarts = function () {
            $.ajax({
                type: "POST",
                url: prefix + "/carts/get",
                data: {},
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (typeof (data.code) == "undefined") {
                        console.log(data);
                        $("#carts-ul").html("");
                        if ($(data).size() > 0) {
                            $(".ui-notice").css("display", "none");
                            $("#edit").css("visibility", "visible");
                            $("#buy-footer").css("visibility", "visible");
                        }
                        $(data).each(function (i, e) {
                            var li = getChartGood(e);
                            $("#carts-ul").append(li);
                        })
                    }
                },
                error: function (msg) {
                    console.log(JSON.stringify(msg));
                }
            })
        }

        loadCarts();
        numChange();
        delFromCartsEvent();
    })();
</script>
</html>