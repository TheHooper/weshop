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
    <title>地址管理</title>
    <link href="<c:url value="${pageContext.request.contextPath}/css/frozen.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="${pageContext.request.contextPath}/css/homall.css"/>" rel="stylesheet" type="text/css"/>
    <script type="text/javascript"
            src="<c:url value="${pageContext.request.contextPath}/js/lib/zeptojs/zepto.min.js"/>"></script>
</head>
<body>
<header id="header" class="header">
    <a href="/user/central" class="header-arrow-l"><i id="headerBarCat" class="ui-icon-prev"></i></a>
    <h2 class="ui-flex-pack-center">地址管理</h2>
    <div class="ui-tab" id="tab1">
        <ul id="topTap" class="ui-tab-nav ui-border-b">
            <li value="0" class="current">查看</li>
            <li value="1">新增</li>
        </ul>
    </div>
</header>

<section id="add-address-section" class="ho-margin-top-mm" style="display: none">
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


<section id="select-address-section" class="ho-margin-top-mm">
    <ul id="select-address-ul" class="ui-list ui-list-pure ui-border-tb">
        <%--<li class="ui-border-t">--%>
        <%--<p><span>胡攀 </span><span class="date"> 15112533082</span></p>--%>
        <%--<h4 class="ui-nowrap-multi">北京市市辖区东城区中南海</h4>--%>
        <%--<p class="ho-text-right">--%>
        <%--<button id="to-list-address-section-btn" class="ui-btn ">--%>
        <%--设为默认--%>
        <%--</button>--%>
        <%--<button id="to-add-address-section-btn" class="ui-btn">--%>
        <%--删除地址--%>
        <%--</button>--%>
        <%--</p>--%>
        <%--</li>--%>
    </ul>
    <div class="ho-margin-top-sm">
        <button onclick="window.location.href='/user/central'" class="ui-btn-default ui-btn-lg">返回</button>
    </div>
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

        AddressApi.urlPrefix = prefix;
        AddressApi.loadProvince("province-select");
        AddressApi.bindAutoLoadEvent("province-select", "city-select", "area-select");

        var showAdd = function () {
            $("#add-address-section").css("display", "block");
            $("#select-address-section").css("display", "none");
        };

        var showList = function () {
            $("#add-address-section").css("display", "none");
            $("#select-address-section").css("display", "block");
        };

        $('#topTap').children("li").tap(function () {
            var index = $(this).val();
            $('#topTap').children("li").removeClass("current");
            $(this).addClass("current");
            if ($(this).attr("value") == 0) {
                showList();
            } else {
                showAdd();
            }
        });

        $("#address-canel-btn").tap(function () {
            showList();
        });



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
                $("#select-address-section").css("display", "block");
                $('#topTap').children("li").removeClass("current");
                var lis = $('#topTap').children("li");
                $(lis[0]).addClass("current");
                $("#add-address-name-input").val("");
                $("#add-address-mobile-input").val("");
                $("#add-address-detail-input").val("");
                $.tips({
                    content: '添加成功',
                    stayTime: 2000,
                    type: "success"
                })
                $("#select-address-ul").html("");
                loadAddress();
            }
            AddressApi.addAddress(addressForm, afterAdd);

        });


        var loadAddress = function () {
            $("#select-address-ul").html("");
            var addresses = AddressApi.loadAddresses(false, null);
            $(addresses).each(function (i, e) {
                var defaultor;
                if (e.isDefault == true) {
                    defaultor = '<span class="ho-margin-right-xs color-blue">默认地址</span>';
                } else {
                    defaultor = '<button value="' + e.id + '" class="ui-btn to-default ho-margin-right-xs">' + '设为默认' + '</button>';
                }
                var li = '<li class="ui-border-t">'
                        + '<p><span>' + e.name + '</span><span class="date"> ' + e.mobile + '</span></p>'
                        + '<h4 class="ui-nowrap-multi">' + e.province + e.city + e.area + e.detail + '</h4>'
                        + '<p class="ho-text-right">'
                        + defaultor
                        + '<button value="' + e.id + '" class="ui-btn to-del">'
                        + '删除地址'
                        + '</button>'
                        + '</p>'
                        + '</li>'
                $("#select-address-ul").append(li);
            })
        }

        loadAddress();

        $(document).on("tap", ".to-default", function () {
            var id = $(this).attr("value");
            var dia = $.dialog({
                title: '确认设为默认地址?',
                content: '',
                button: ["确认", "取消"]
            });

            dia.on("dialog:action", function (e) {
                console.log(e.index)
                if (e.index == 0) {
                    $.ajax({
                        type: "POST",
                        url: prefix + "/address/setDefault",
                        data: {addressId: id},
                        contentType: "application/x-www-form-urlencoded; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            if (data.code == 0) {
                                $.tips({
                                    content: '修改成功',
                                    stayTime: 2000,
                                    type: "success"
                                })
                                loadAddress();
                            }
                        },
                        error: function (msg) {
                            console.log(JSON.stringify(msg));
                        }
                    })
                }
            })
        })

        $(document).on("tap", ".to-del", function () {
            var id = $(this).attr("value");
            var dia = $.dialog({
                title: '确认删除该地址',
                content: '',
                button: ["确认", "取消"]
            });

            dia.on("dialog:action", function (e) {
                console.log(e.index)
                if (e.index == 0) {
                    $.ajax({
                        type: "POST",
                        url: prefix + "/address/del",
                        data: {addressId: id},
                        contentType: "application/x-www-form-urlencoded; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            if (data.code == 0) {
                                $.tips({
                                    content: '删除成功',
                                    stayTime: 2000,
                                    type: "success"
                                })
                                loadAddress();
                            }
                        },
                        error: function (msg) {
                            console.log(JSON.stringify(msg));
                        }
                    })
                }
            })
        })

    })();
</script>
</html>