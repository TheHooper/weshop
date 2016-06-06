<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<header class="am-topbar admin-header">
    <div class="am-topbar-brand am-vertical-align">
        <b class="color-primary am-vertical-align-middle am-margin-left-sm">HOMALL</b>
    </div>

    <button data-am-collapse="{target: '#topbar-collapse'}"
            class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only"><span
            class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

    <div id="topbar-collapse" class="am-collapse am-topbar-collapse">

        <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
            <!--<li><a href="javascript:;"><span class="am-icon-envelope-o"></span> 收件箱 <span-->
            <!--class="am-badge am-badge-warning">5</span></a></li>-->
            <li class="am-dropdown" data-am-dropdown>
                <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
                    <span class="am-icon-users"></span> ${ho_admin.username} <span class="am-icon-caret-down"></span>
                </a>
                <ul class="am-dropdown-content">
                    <li><a href="#"><span class="am-icon-user"></span> 资料</a></li>
                    <li><a href="#"><span class="am-icon-cog"></span> 设置</a></li>
                    <li><a href="#"><span class="am-icon-power-off"></span> 退出</a></li>
                </ul>
            </li>
            <li class="am-hide-sm-only"><a id="admin-fullscreen" href="javascript:;"><span
                    class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
        </ul>
    </div>
</header>
<script type="text/javascript">
    var path = location.pathname.split('/');
    var app = path[1];
    var prefix = "${pageContext.request.contextPath}";
    $('.logout').click(function (e) {
        $.post(prefix + '/logout', function (data) {
            if (data == "success") {
                window.location.href = prefix + "/login";
            }
        });
    })
</script>

<script>
    (function ($) {
        'use strict';

        $(function () {
            var $fullText = $('.admin-fullText');
            $('#admin-fullscreen').on('click', function () {
                $.AMUI.fullscreen.toggle();
            });

            $(document).on($.AMUI.fullscreen.raw.fullscreenchange, function () {
                $fullText.text($.AMUI.fullscreen.isFullscreen ? '退出全屏' : '开启全屏');
            });
        });
    })(jQuery);
</script>

