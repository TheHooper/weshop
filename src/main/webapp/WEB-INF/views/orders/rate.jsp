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
    <title>评价</title>
    <link href="<c:url value="../css/frozen.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="../css/homall.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="../css/rating.css"/>" rel="stylesheet" type="text/css"/>
    <script type="text/javascript"
            src="<c:url value="../js/lib/zeptojs/zepto.min.js"/>"></script>
</head>
<body>

<header id="header" class="header">
    <a href="${pageContext.request.contextPath}/h/user/orders" class="header-arrow-l"><i id="headerBarCat"
                                                                                         class="ui-icon-prev"></i></a>
    <h2 class="ui-flex-pack-center">订单评价</h2>
</header>

<section id="order-panel-section" class="ui-container ho-margin-bottom-0">
    <ul class="ui-list  ui-border-tb">
        <c:forEach items="${orderGoodses}" var="orderGoods" varStatus="index">
            <li>
                <input type="text" id="goods1-id" value="" style="display: none">
                <div class="ui-list-img">
                    <span style="background-image:url(${orderGoods.goodsPic})"></span>
                </div>
                </a>
                <div class="ui-list-info"><h4 class="ui-nowrap carts-title">${orderGoods.goodsTitle}</h4>
                    <p class="ui-nowrap carts-salesAttr">${orderGoods.salesAttr}</p>
                    <p class="ui-nowrap"><span class="carts-num">x${orderGoods.num}</span>
                        <span class="ho-margin-left-xs">¥${orderGoods.price}</span></p>

                </div>
            </li>
            <li>
                <div class="ui-row-flex ho-margin-top-sm">
                    <div class="ui-col ui-col-2 ho-text-center">
                        评价：
                    </div>
                    <input type="text" id="goods${index.index}-rate" style="display: none">
                    <div id="goods${index.index}" class="ui-col ui-col-5">
                    </div>
                    <div class="ui-col ui-col-2">
                        <span id="goods${index.index}-level" class="color-blue"></span>
                    </div>
                </div>
            </li>
            <li class="ho-margin-top-sm ui-border-b">
                <label>
                    评价内容：
                </label>
                <div>
                    <textarea id="goods${index.index}-comment" rows="6" placeholder="评价内容，不超过60字哟"
                              style="border:none;width: 120%"></textarea>
                </div>
            </li>
        </c:forEach>
    </ul>


    <footer class="text-center ho-margin-vertical-sm">
        <button id="confirm-btn" class="ui-btn-lg ui-btn-primary">
            确认评价
        </button>
        <button id="back-btn" class="ui-btn-lg ui-btn ho-margin-top-xs">
            返回
        </button>
    </footer>
</section>


<section class="ui-notice" style="display: none">
    <div class="ho-margin-vertical-xl">
        <i class="ui-icon-success ho-text-xxxl"></i>
    </div>
    <p>
        感谢您，已成功评价
    </p>
    <div class="ui-notice-btn">
        <button id="back" class="ui-btn-primary ui-btn-lg">返回订单</button>
    </div>
</section>

</body>
<%--<link href="<c:url value="../css/all-animation.css">" rel="stylesheet" type="text/css"/>--%>
<script type="text/javascript" src="<c:url value="../js/frozen.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="../js/homall/address.js"/>"></script>
<script type="text/javascript" src="<c:url value="../js/util/rating.js"/>"></script>
<script type="text/javascript">
    (function () {
        var prefix = "${pageContext.request.contextPath}"


        $("#back-btn").tap(function () {
            window.location.href = "${pageContext.request.contextPath}/h/user/orders";
        })

        var rateIdArrays = new Array();


        // current rating, or initial rating
        var currentRating = 0;
        // max rating, i.e. number of stars you want
        var maxRating = 5;
        // callback to run after setting the rating
        <c:forEach items="${orderGoodses}" var="orderGoods" varStatus="index">
        var el${index.index} = document.querySelector('#goods${index.index}');
        var callback${index.index} = function (rating) {
            $("#goods${index.index}-rate").val(rating);
            if (rating <= 2) {
                $("#goods${index.index}-level").attr("value", 2);
                $("#goods${index.index}-level").text("差")
            } else if (rating > 3) {
                $("#goods${index.index}-level").attr("value", 0);
                $("#goods${index.index}-level").text("好")
            } else {
                $("#goods${index.index}-level").attr("value", 1);
                $("#goods${index.index}-level").text("中")
            }
        };
        // rating instance
        var myRating${index.index} = rating(el${index.index}, currentRating, maxRating, callback${index.index});
        var rateForm = {
            orderId:${orderId},
            goodsId:${orderGoods.goodsId},
            level: "#goods${index.index}-level",
            score: "#goods${index.index}-rate",
            comment: "#goods${index.index}-comment"
        }
        rateIdArrays.push(rateForm);
        </c:forEach>

        $("#confirm-btn").tap(function () {
            $(rateIdArrays).each(function (i, e) {
                e.level = $(e.level).attr("value");
                e.score = $(e.score).val();
                e.comment = $(e.comment).val();
            })
            var rateListForm = {
                rateFormList: rateIdArrays
            }
            $.ajax({
                type: "POST",
                url: prefix + "h/orders/rate",
                data: $.customParam(rateListForm),
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    if (data.code == "0") {
                        el = $.tips({
                            content: '已确认收货',
                            stayTime: 2000,
                            type: "success"
                        })
                        el.on("tips:hide", function () {
                            console.log("tips hide");
                        })
                        $("#order-panel-section").css("display", "none");
                        $(".ui-notice").css("display", "block");
                    }
                },
                error: function (msg) {
                    console.log(JSON.stringify(msg));
                }
            })
        })

        $("#back").tap(function () {
            window.location.href = "${pageContext.request.contextPath}/h/user/orders?state=3";
        })
    })();
</script>
</html>
