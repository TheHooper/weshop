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
    <title>确认订单</title>
    <link href="<c:url value="${pageContext.request.contextPath}/css/frozen.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="${pageContext.request.contextPath}/css/homall.css"/>" rel="stylesheet" type="text/css"/>
    <script type="text/javascript"
            src="<c:url value="${pageContext.request.contextPath}/js/lib/zeptojs/zepto.min.js"/>"></script>
</head>
<body>

<section id="pay-section">
    <header id="header" class="header">
        <a href="javascript:history.back(1)" class="header-arrow-l"><i id="headerBarCat" class="ui-icon-prev"></i></a>
        <h2 class="ui-flex-pack-center">确认订单</h2>
    </header>

    <section class="ho-panel ho-panel-default">
        <div class="ho-panel-hd">收货地址</div>
        <input id="pay-address-id" type="text" style="display: none"/>
        <div id="pay-address-div" class="ho-panel-bd color-blue">

        </div>
        <footer class="ho-panel-footer ho-text-right">
            <button id="to-list-address-section-btn" class="ui-btn">
                更换地址
            </button>
            <button id="to-add-address-section-btn" class="ui-btn">
                新增地址
            </button>
        </footer>
    </section>
    <section class="ho-panel ho-panel-default">
        <div class="ho-panel-bd ho-padding-0">
            <ul id="carts-ul" class="ui-list  ui-border-tb">
                <c:forEach items="${orderGoodses}" var="orderGoods">
                    <li class="ui-border-t">
                        <input class="orderGoods-id" value="${orderGoods.goodsId}" type="text" style="display: none">
                        <div class="ui-list-img">
                            <span style="background-image:url(${orderGoods.goodsPic}?imageMogr2/thumbnail/200x200)"></span>
                        </div>
                        <div class="ui-list-info"><h4 class="ui-nowrap carts-title">${orderGoods.goodsTitle}</h4>
                            <p class="ui-nowrap carts-salesAttr">${orderGoods.salesAttr}</p>
                            <p class="ui-nowrap"><span class="carts-num">x${orderGoods.num}</span></p>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </section>

    <!-- coupon -->
    <ul class="ui-list ui-list-text ui-list-link ui-border-tb">
        <li id="to-list-coupon-section-btn" class="ui-border-t">
            <h4 class="ui-nowrap">优惠券</h4>
            <span id="coupon-tip" class="ui-badge-num back-blue">1</span>
            <div id="coupon-check" class="ui-txt-info"></div>
        </li>
    </ul>
    <!-- coupon end -->

    <!-- total -->
    <ul class="ui-list ui-list-text ui-border-tb margin-top-m">
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
            <div class="ui-list-action">&yen;<span id="coupon-cost-view">0</span></div>
        </li>
        <li class="ui-border-t">
            <div class="ui-list-info">
                <h4 class="ui-nowrap">实际应付</h4>
            </div>
            <div class="ui-list-action">&yen;<span id="r-total-view">${order.totalAndDelivery}</span></div>
        </li>
    </ul>
    <!-- total end -->

    <div class="ui-btn-wrap text-center margin-top-m">
        <button id="pay-btn" class="ui-btn-lg ui-btn-primary">
            确认支付
        </button>
    </div>
</section>


<section id="add-address-section" style="display: none">
    <div class="ui-form ui-border-b ho-margin-top-sm">
        <div class="ui-form-item ui-form-item-l ui-border-b">
            <label class="ui-border-r">
                姓名
            </label>
            <input id="add-address-name-input" type="text" placeholder="请输入收货人姓名">
            <a href="#" class="ui-icon-close">
            </a>
        </div>
        <div class="ui-form-item ui-form-item-l ui-border-b">
            <label class="ui-border-r">
                联系电话
            </label>
            <input id="add-address-mobile-input" type="text" placeholder="请输入收货电话">
            <a href="#" class="ui-icon-close">
            </a>
        </div>
    </div>
    <div class="ui-form ho-margin-top-xs">
        <div class="ui-form-item ui-border-b">
            <label>省</label>
            <div class="ui-select">
                <select id="province-select">
                    <option>请选择省份</option>
                </select>
            </div>
        </div>
        <div class="ui-form-item ui-border-b">
            <label>市</label>
            <div class="ui-select">
                <select id="city-select">
                    <option>请先选择市</option>
                </select>
            </div>
        </div>
        <div class="ui-form-item ui-border-b">
            <label>区</label>
            <div class="ui-select">
                <select id="area-select">
                    <option>请先选择区</option>
                </select>
            </div>
        </div>
        <div class="ui-form-item ui-form-item-textarea ui-border-b">
            <label>
                详细地址
            </label>
            <textarea id="add-address-detail-input" placeholder="街道等详细地址"></textarea>
        </div>
    </div>
    <div class="ui-btn-wrap ho-margin-top-sm">
        <button id="address-confirm-btn" class="ui-btn-lg ui-btn-primary">
            确认添加
        </button>
        <button id="address-canel-btn" class="ui-btn-lg ho-margin-top-xs">
            返回
        </button>
    </div>
</section>


<section id="select-address-section" style="display: none">
    <ul id="select-address-ul" class="ui-list ui-list-text ui-list-radio ui-border-tb ho-margin-top-sm">
    </ul>
    <div class="ui-btn-wrap ho-margin-top-sm">
        <button id="select-address-confirm-btn" class="ui-btn-lg ui-btn-primary">
            确认选择
        </button>
        <button id="select-address-canel-btn" class="ui-btn-lg ho-margin-top-xs">
            返回
        </button>
    </div>
</section>

<section id="select-coupon-section" style="display: none">
    <ul id="select-coupon-ul" class="ui-list ui-border-tb ho-margin-top-sm">

    </ul>
    <div class="ui-footer" style="bottom:56px">
        <button id="select-coupon-ok" class="ui-btn-primary ui-btn-lg">确认选择</button>
        <button id="select-coupon-canel" class="ui-btn-default ui-btn-lg ho-margin-top-xs">取消返回</button>
    </div>
</section>

</body>
<%--<link href="../css/all-animation.css" rel="stylesheet" type="text/css"/>--%>
<script type="text/javascript" src="<c:url value="${pageContext.request.contextPath}/js/frozen.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="${pageContext.request.contextPath}/js/homall/address.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="${pageContext.request.contextPath}/js/util/base64.min.js"/>"></script>

<script type="text/javascript">
    (function () {
        var prefix = "${pageContext.request.contextPath}"
        console.log(prefix);

        AddressApi.urlPrefix = prefix;
        console.log(AddressApi.urlPrefix);
        AddressApi.loadProvince("province-select");
        AddressApi.bindAutoLoadEvent("province-select", "city-select", "area-select");

        $("#address-canel-btn").tap(function () {
            $("#add-address-section").css("display", "none");
            $("#select-address-section").css("display", "none");
            $("#select-coupon-section").css("display", "none");
            $("#pay-section").css("display", "block");
        })

        $("#select-address-canel-btn").tap(function () {
            $("#add-address-section").css("display", "none");
            $("#select-address-section").css("display", "none");
            $("#select-coupon-section").css("display", "none");
            $("#pay-section").css("display", "block");
        })

        $("#to-add-address-section-btn").tap(function () {
            $("#add-address-section").css("display", "block");
            $("#select-address-section").css("display", "none");
            $("#select-coupon-section").css("display", "none");
            $("#pay-section").css("display", "none");
        })

        $("#to-list-address-section-btn").tap(function () {
            $("#select-coupon-section").css("display", "none");
            $("#add-address-section").css("display", "none");
            $("#select-address-section").css("display", "block");
            $("#pay-section").css("display", "none");
        })

        $("#to-list-coupon-section-btn").tap(function () {
            if ($("#coupon-tip").text() == 0) {
                el = $.tips({
                    content: '本次订单无可用优惠券',
                    stayTime: 2000,
                    type: "warn"
                })
            } else {
                $("#add-address-section").css("display", "none");
                $("#select-address-section").css("display", "none");
                $("#pay-section").css("display", "none");
                $("#select-coupon-section").css("display", "block");
            }
        })

        $("#select-coupon-canel").tap(function () {
            $("#add-address-section").css("display", "none");
            $("#select-address-section").css("display", "none");
            $("#pay-section").css("display", "block");
            $("#select-coupon-section").css("display", "none");
        })

        $("#select-coupon-ok").tap(function () {
            if ($("input[name='CouponRadio']:checked").length > 0) {
                var id = $("input[name='CouponRadio']:checked").val();
                $("#coupon-check").text("已选");
                var rTotal = ${order.totalAndDelivery};
                var cPrice = $("#couponFee" + id).text();
                var newP = parseInt(rTotal) - parseInt(cPrice);
                $("#coupon-cost-view").text(cPrice);
                $("#r-total-view").text(newP);
                payForm.couponId = parseInt(id);
                $("#add-address-section").css("display", "none");
                $("#select-address-section").css("display", "none");
                $("#pay-section").css("display", "block");
                $("#select-coupon-section").css("display", "none");
            }
        })

        $("#address-confirm-btn").tap(function () {
            var name = $("#add-address-name-input").val();
            var mobile = $("#add-address-mobile-input").val();
            var provinceId = $("#province-select").val();
            var province = $("#province-select option").not(function () {
                return !this.selected
            }).text();
            var cityId = $("#city-select").val();
            var city = $("#city-select option").not(function () {
                return !this.selected
            }).text();
            var areaId = $("#area-select").val();
            var area = $("#area-select option").not(function () {
                return !this.selected
            }).text();
            var detail = $("#add-address-detail-input").val();
            var addressForm = {
                name: name,
                mobile: mobile,
                provinceId: provinceId,
                province: province,
                cityId: cityId,
                city: city,
                areaId: areaId,
                area: area,
                detail: detail
            }

            function afterAdd() {
                $("#add-address-section").css("display", "none");
                $("#pay-section").css("display", "block");
                $("#add-address-name-input").val("");
                $("#add-address-mobile-input").val("");
                $("#add-address-detail-input").val("");
                var addresses = AddressApi.loadAddresses(false, null);
                toAddress(null, addresses);
                $.tips({
                    content: '地址添加成功',
                    stayTime: 2000,
                    type: "success"
                });
            }

            AddressApi.addAddress(addressForm, afterAdd);
        })

        $("#select-address-confirm-btn").tap(function () {
            var selected = $(".select-address-radio:checked");
            var parentLi = selected.parents("li");
            var infoDiv = parentLi.children(".select-address-info");
            var nameMobile = infoDiv.children("p").text();
            var address = infoDiv.children("h4").text();
            $("#pay-address-id").val($(selected).val());
            $("#pay-address-div").text(nameMobile + address);
            $("#add-address-section").css("display", "none");
            $("#select-address-section").css("display", "none");
            $("#pay-section").css("display", "block");
        });

        var defaultAddress = AddressApi.loadDefaultAddress(false, null);
        var addresses = AddressApi.loadAddresses(false, null);

        var toAddress = function (defaultAddress, addresses) {
            if (defaultAddress != null) {
                var text = defaultAddress.name + "," + defaultAddress.mobile + "," +
                        defaultAddress.province + defaultAddress.city + defaultAddress.area + defaultAddress.detail;
                $("#pay-address-id").val(defaultAddress.id);
                $("#pay-address-div").text(text);
            } else {
                console.log($(addresses));
                if ($(addresses).length > 0) {
                    var address = addresses[0];
                    var text = address.name + "," + address.mobile + "," +
                            address.province + address.city + address.area + address.detail;
                    $("#pay-address-id").val(address.id);
                    $("#pay-address-div").text(text);
                } else {
                    $("#pay-address-div").text("暂无地址，请添加");
                }
            }
        }
        toAddress(defaultAddress, addresses);

        var toAddressSelect = function (addresses) {
            var id = $("#pay-address-id").val();
            $(addresses).each(function (i, e) {
                var input;
                if (id == e.id) {
                    input = '<input type="radio" value="' + e.id + '" checked class="select-address-radio" name="radio">';
                } else {
                    input = '<input type="radio" value="' + e.id + '"  class="select-address-radio" name="radio">';
                }
                var li = ' <li class="ui-border-t">'
                        + '<label class="ui-radio" for="radio">'
                        + input
                        + '</label>'
                        + '<div class="ui-list-info select-address-info">'
                        + '<p class="ui-nowrap" >' + e.name + "," + e.mobile + "," + '</p>'
                        + '<h4 class="ui-nowrap">' + e.province + e.city + e.area + e.detail + '</h4>'
                        + '</div>'
                        + '</li>'
                $("#select-address-ul").append(li);
            })
        }
        toAddressSelect(addresses);

        var payForm = {
            addressId: null,
            orderId: "${order.id}",
            password: null,
            couponId: null,
        }

        $("#pay-btn").tap(function () {
            var dia = $.dialog({
                title: '请输入密码',
                content: '<div class="ui-form-item ui-form-item-pure ui-border-b"><input id="pay-password"type="password" placeholder="密码"></div>',
                button: ["确认", "取消"]
            });

            dia.on("dialog:action", function (e) {
                console.log(e.index)
                if (e.index == 0) {
                    var password = $("#pay-password").val();
                    if (password == null || password == "") {
                        el = $.tips({
                            content: '请输入密码',
                            stayTime: 2000,
                            type: "success"
                        })
                    } else {
                        var password64 = Base64.encode(password);
                        payForm.password = password64;
                        payForm.addressId = $("#pay-address-id").val();
                        $.ajax({
                            type: "POST",
                            url: prefix + "/orders/pay",
                            data: payForm,
                            contentType: "application/x-www-form-urlencoded; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                if (data.code == "0") {
                                    window.location.href = "${pageContext.request.contextPath}/orders/paid";
                                } else {
                                    el = $.tips({
                                        content: data.msg,
                                        stayTime: 2000,
                                        type: "warn"
                                    })
                                }
                            },
                            error: function (msg) {

                            }
                        })
                    }
                }
            });
        });

        var couponsForm = {
            total:${order.totalAndDelivery},
            goodsIds: ""
        }

        var loadCoupon = function () {
            var ids = new Array();
            $(".orderGoods-id").each(function (i, e) {
                ids.push($(e).val());
            })
            couponsForm.goodsIds = ids;
            $.ajax({
                type: "POST",
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                    'charset': 'utf-8'
                },
                url: prefix + "/coupon/useable",
                data: JSON.stringify(couponsForm),
                //contentType: "application/x-www-form-urlencoded; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.code == null) {
                        console.log(data);
                        $("#coupon-tip").text(data.length)
                        if (data.length > 0) {
                            $("#select-coupon-ul").html("");
                            $(data).each(function (i, e) {
                                var li = '<li>'
                                        + '<div class="ui-avatar ho-text-center" style=" background-image:none">'
                                        + '<label class="ui-radio" for="radio">'
                                        + '<input  value="' + e.id + '" type="radio" name="CouponRadio">'
                                        + '</label>'
                                        + '</div>'
                                        + '<div class="ui-list-info ui-border-t">'
                                        + '<h4 class="ui-nowrap">' + e.title + '</h4>'
                                        + '<p class="ui-nowrap">有效期至：' + generateDate(e.deadline) + '</p>'
                                        + '<p class="ui-nowrap">满 &yen;' + e.threshold + ' - &yen;<span id="couponFee' + e.id + '">' + e.price + '</span></p>'
                                        + '</div>'
                                        + '</li>'
                                $("#select-coupon-ul").append($(li));
                            })
                        }
                    }
                },
                error: function (msg) {
                    console.log(JSON.stringify(msg));
                }
            })
        }

        loadCoupon();

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