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
    <title>ho目录</title>
    <link href="<c:url value="${pageContext.request.contextPath}/h/css/frozen.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="${pageContext.request.contextPath}/h/css/homall.css"/>" rel="stylesheet" type="text/css"/>
    <script type="text/javascript"
            src="<c:url value="${pageContext.request.contextPath}/h/js/lib/zeptojs/zepto.min.js"/>"></script>
</head>
<style>
    .ui-scroller {
        width: auto;
        height: 400px;
        overflow: hidden;
    }

    .ui-scroller li {
        padding: 10px 0;
        /*border-bottom: 0.5px solid #ccc;*/
    }

    .ul-cat-active {
        background-color: white;
        border-right: none !important;
    }
</style>
<body>
<!-- header -->
<header class="ui-searchbar-wrap ui-border-b">
    <a href="/h/index"><i id="headerBarCat" class="ui-icon-prev"></i></a>
    <div class="ui-searchbar ui-border-radius">
        <i class="ui-icon-search"></i>
        <div class="ui-searchbar-text">搜索商品</div>
        <div class="ui-searchbar-input"><input value="" type="text" placeholder="商品名" autocapitalize="off"></div>
        <i class="ui-icon-close"></i>
    </div>
    <button class="ui-searchbar-cancel">搜索</button>
</header>
<!-- header E -->

<!-- cat body -->
<ul class="ui-row  text-center">
    <!-- father cat -->
    <li class="ui-col ui-col-33 back-grey">
        <div class="hoTopic-vertical-wapper">
            <div class="ui-scroller">
                <ul id="cat-parent-ul">

                </ul>
            </div>
        </div>
    </li>
    <!-- father cat E-->

    <!-- son cat -->
    <li id="cat-son-li" class="ui-col ui-col-67 back-white">
        <div class="ui-flex ui-flex-align-center ui-flex-pack-center" style="height: 100%">

            <ul id="son-cat-ul" class="ui-grid-trisect ho-padding-0" style="width: 100%">
                <h3>暂无分类</h3>
            </ul>

        </div>
    </li>
    <!-- son cat -->
</ul>
<!-- car body E-->

</body>
<script type="text/javascript" src="<c:url value="${pageContext.request.contextPath}/h/js/frozen.js"/>"></script>
<script type="text/javascript">
    (function () {
        var prefix = "${pageContext.request.scheme}" + "://" + "${pageContext.request.serverName}" + ":" + "${pageContext.request.localPort}" + "/";
        var loadParentCats = function () {
            $.ajax({
                type: "GET",
                url: prefix + "/h/admin/cat/roots",
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (typeof (data.code) == "undefined") {
                        $(data).each(function (i, e) {
                            var li = $('<li value="' + e.id + '">' + e.typeName + '</li>')
                            $("#cat-parent-ul").append(li);
                        });
                        var firstLI = $("#cat-parent-ul").children("li").get(0);
                        if (typeof (firstLI) != "undefined") {
                            $(firstLI).addClass("ul-cat-active");
                        }
                        loadActiveCats();
                        initScroll();
                    }
                },
                error: function (msg) {
                    alert(msg);
                }
            })
        }

        var initHeight = function () {
            var winHeight = $(window).height();
            var searchHeight = $(".ui-searchbar-wrap").height();
            var scrollerHeight = winHeight - searchHeight - 2;
            $(".ui-scroller").height(scrollerHeight);
            $("#cat-son-li").height(scrollerHeight + 2);
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

        var initScroll = function () {
            var scroll = new fz.Scroll('.ui-scroller', {
                scrollY: true
            });
        }

        var parentCatClickEve = function () {
            console.log(" run ---");
            $(document).on("tap", ".ui-scroller li", function (e) {
                $(".ul-cat-active").removeClass("ul-cat-active");
                $(e.target).addClass("ul-cat-active");
                loadActiveCats();
            })
            //change the sonCat method
        }

        var loadActiveCats = function () {
            var parentId = $(".ul-cat-active").attr("value");

            console.log(parentId);
            $.ajax({
                type: "GET",
                url: prefix + "/h/admin/cat/cats/" + parentId,
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (typeof (data.code) == "undefined") {
                        $("#son-cat-ul").html("");
                        console.log(data);
                        $(data.data).each(function (i, e) {
                            var cat;
                            if (typeof(e.logo) == "undefined") {
                                cat = getCatObj(e.id, e.typeName, "");
                            } else {
                                cat = getCatObj(e.id, e.typeName, e.logo);
                            }
                            console.log(i);
                            $("#son-cat-ul").append(cat);
                        })
                        if (data.data.length < 1) {
                            $("#son-cat-ul").html("<h3 class='ho-text-center'>抱歉,暂无分类</h3>");
                        }
                    }
                },
                error: function (msg) {
                    alert(msg);
                }
            })
        }

        var getCatObj = function (id, name, pic) {
            var qiniuAPI = "?imageMogr2/thumbnail/200x200";
            return $('<li>'
                    + '<a href="' + prefix + '/h/goods/list?catId=' + id + '">'
                    + '<div class="ui-grid-trisect-img">'
                    + '<span style="background-image:url(' + pic + ')"></span>'
                    + ' </div>'
                    + '<h4>' + name + '</h4>'
                    + '</a>'
                    + '</li>')
        }

        function init() {
            loadParentCats();
            initHeight();
            initSearchBar();
            parentCatClickEve();
        }

        init();
    })();

</script>
</html>