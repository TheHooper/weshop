<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!-- sidebar start -->
<div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
    <div class="am-offcanvas-bar admin-offcanvas-bar">
        <ul class="am-list admin-sidebar-list">
            <li><a href="admin-index.html"><span class="am-icon-home"></span> 首页</a></li>
            <li class="admin-parent">
                <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-file"></span> 页面模块
                    <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                <ul class="am-list am-collapse admin-sidebar-sub " id="collapse-nav">
                    <li><a href="admin-user.html" class="am-cf"><span class="am-icon-check"></span> 个人资料<span
                            class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
                    <li><a href="admin-help.html"><span class="am-icon-puzzle-piece"></span> 帮助页</a></li>
                    <li><a href="admin-gallery.html"><span class="am-icon-th"></span> 相册页面<span
                            class="am-badge am-badge-secondary am-margin-right am-fr">24</span></a></li>
                    <li><a href="admin-log.html"><span class="am-icon-calendar"></span> 系统日志</a></li>
                    <li><a href="admin-404.html"><span class="am-icon-bug"></span> 404</a></li>
                </ul>
            </li>
            <li><a href="<c:url value="/h/admin/goods/list"/>"><span class="am-icon-barcode"></span>商品管理</a></li>
            <li><a href="<c:url value="/h/admin/cat/list"/>"><span class="am-icon-table"></span>类别管理</a></li>
            <li><a href="admin-form.html"><span class="am-icon-pencil-square-o"></span> 表单</a></li>
            <li><a href="#"><span class="am-icon-sign-out"></span> 注销</a></li>
        </ul>

        <div class="am-panel am-panel-default admin-sidebar-panel">
            <div class="am-panel-bd">
                <p><span class="am-icon-tag"></span>HOMALL</p>
                <p>欢迎来到HOMALL商城管理后台!</p>
            </div>
        </div>
    </div>
</div>
<!-- sidebar end -->


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