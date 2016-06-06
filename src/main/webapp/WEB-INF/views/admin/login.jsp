<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>HOMALL | 后台登陆</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="stylesheet" href="<c:url value="../admin/css/az/amazeui.min.css"/>">
    <link rel="stylesheet" href="<c:url value="../admin/css/admin.css"/>">
    <link rel="stylesheet" href="<c:url value="../admin/css/app.css"/>">
</head>
<body>
<div class="login-header">
    <div class="am-g am-margin-top am-text-center">
        <span class="logo-font-size-50 color-primary am-vertical-align-middle ">HOMALL</span>
    </div>
    <hr/>
</div>
<div class="am-g">
    <div class="am-u-lg-3 am-u-md-9 am-u-sm-11 am-u-sm-centered login-firstContent am-margin-top-lg">

        <br>
        <form:form method="post" modelAttribute="adminLoginForm"
                   accept-charset="utf-8" class="form-horizontal">
            <div class="am-form am-form-horizontal">
                <div class="am-form-group">
                    <label for="username" class="color-primary">账号</label>
                    <form:input type="text" path="username" class="am-form-field" id="username" placeholder="管理员帐号"
                                oninvalid="setCustomValidity('请输入账号');" oninput="setCustomValidity('');"
                                required="ture"/>
                </div>
                <div class="form-group">
                    <form:errors path="username" cssClass=" am-badge am-badge-danger"/>
                </div>
                <div class="am-form-group">
                    <label for="password" class="color-primary">密码:</label>
                    <form:input type="password" path="password" class="am-form-field" id="password" placeholder="密码"
                                oninvalid="setCustomValidity('请输入密码');" oninput="setCustomValidity('');"
                                required="ture"/>
                </div>
                <div class="form-group">
                    <form:errors path="password" cssClass=" am-badge am-badge-danger"/>
                </div>
                <div class="am-form-group am-margin-top-lg  am-cf">
                        <%--<div class="am-fl">--%>
                        <%--<form:checkbox path="remember"/>--%>
                        <%--<span class="color-primary">记住登录</span>--%>
                        <%--</div>--%>
                    <input type="submit" value="登 录"
                           class="am-fr am-btn am-btn-lg am-radius am-padding-horizontal-xl bk-color-primary color-white">
                </div>
            </div>
        </form:form>
    </div>

</div>
<br><br><br><br>
<!-- footer start -->
<jsp:include page="/WEB-INF/views/admin/comp/footer.jsp"/>
<!-- footer end -->
</body>
<%--<script src="/js/app.js"></script>--%>
<script src="<c:url value="../admin/js/jquery.js"/>"></script>
<script src="<c:url value="../admin/js/az/amazeui.min.js"/>"></script>
<script>
    var prefix = "";

    function valid() {
        var username = jQuery("#username").val();
        var password = jQuery("#password").val();
        if ($('#username').val() == "") {
            jQuery("#loginTip").text("账户名或密码不能为空！");
            return false;
        }
        if (password == "") {
            jQuery("#loginTip").text("密码名或密码不能为空!");
            return false;
        }
        return true;
    }

</script>

</html>