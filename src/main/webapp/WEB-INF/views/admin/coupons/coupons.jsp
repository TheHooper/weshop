<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!doctype html>
<html class="no-js">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <meta name="renderer" content="webkit">
    <title>代码牛 | 后台管理系统</title>
    <meta name="description" content="">
    <jsp:include page="/WEB-INF/views/comp/header.include.jsp"/>
</head>
<style>
    .table-full-width {
        width: 100% !important;
    }
</style>
<body>

<!--  header start-->
<jsp:include page="/WEB-INF/views/comp/header.jsp"/>
<!--  header end-->

<div class="am-cf admin-main">
    <!-- sidebar start -->
    <jsp:include page="/WEB-INF/views/comp/siderbar.jsp"/>
    <!-- sidebar end -->

    <!-- content start -->
    <div class="admin-content">
        <div class="am-fl am-cf" id="tableHead">
        </div>
        <div class="am-g am-cf am-padding-top-sm">
            <div class="am-u-sm-4">
                开始时间<br/>

                <p><input id="startTime" type="text" class="am-form-field" placeholder="设置开始时间"
                          data-am-datepicker readonly/></p>
            </div>
            <div class="am-u-sm-4">
                结束时间<br/>

                <p><input id="endTime" type="text" class="am-form-field" placeholder="设置结束时间"
                          data-am-datepicker readonly/></p>
            </div>
            <div class="am-u-sm-4">
                优惠码<br/>

                <p><input id="queryCode" type="search" class="am-form-field" placeholder="优惠码"/></p>
            </div>
            <div class="am-u-sm-4">
                优惠券标题<br/>

                <p><input id="queryTitle" type="search" class="am-form-field" placeholder="优惠券标题"/></p>
            </div>
            <div class="am-u-sm-4">
                面额<br/>

                <p><input id="queryPrice" type="search" class="am-form-field"
                          onkeyup="this.value=this.value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                          onafterpaste="this.value=this.value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                          placeholder="优惠券面额"/></p>
            </div>
            <div class="am-u-sm-4">
                适用课程名<br/>

                <p><input id="queryCourse" type="search" class="am-form-field" placeholder="适用课程名"/>
            </div>
            <div class="am-g am-g-collapse">
                <div class="am-u-sm-6">
                    <button id="addCouponBtn" class="am-btn am-btn-success am-margin-left-lg am-margin-right"
                            data-toggle="modal" data-target="#addModel"><i
                            class="am-icon am-icon-plus am-padding-right-xs"></i>添加优惠券
                    </button>
                    <button id="pushCoupon" class="am-btn am-btn-warning  am-margin-right" data-toggle="modal"
                            data-target="#pushModel">
                        <i
                                class="am-icon am-icon-external-link-square am-padding-right-xs"></i>发放优惠券
                    </button>
                    <button id="pushExceptionalCoupon" class="am-btn am-btn-danger " data-toggle="modal"
                            data-target="#pushExceptionalModel">
                        <i
                                class="am-icon am-icon-external-link-square am-padding-right-xs"></i>特例发放
                    </button>
                </div>
                <div class="am-u-sm-6 am-text-right">
                    <p>
                        <button id="search" class="am-btn am-btn-primary am-margin-right"><i
                                class="am-icon am-icon-search"></i>搜索
                        </button>
                        <button onclick="refresh()"
                                class="am-btn  am-btn-secondary am-radius am-icon-refresh am-margin-right">刷新
                        </button>
                        <button onclick="cleanUp()"
                                class="am-btn  am-btn-default am-radius am-icon-trash am-margin-right-lg">清空
                        </button>
                    </p>
                </div>
            </div>
        </div>
        <ul class="am-avg-sm-1 am-avg-md-4 am-margin am-padding am-text-center admin-content-list ">
            <table class="table table-striped table-bordered"
                   id="admin-table">
                <thead>
                <tr role="row">
                    <th>id
                    </th>
                    <th>优惠码
                    </th>
                    <th>类别
                    </th>
                    <th>券名
                    </th>
                    <th>面额
                    </th>
                    <th>门槛
                    </th>
                    <th>领券日期
                    </th>
                    <th>适用课程
                    </th>
                    <th>创建时间
                    </th>
                    <th>修改时间
                    </th>
                    <th>操作
                    </th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </ul>

    </div>
    <!-- content end -->

    <!--add modal start-->
    <div role="dialog" id="addModel" class="modal fade in" tabindex="1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="color-line"></div>
                <div class="modal-header text-center">
                    <h4 class="modal-title">添加优惠券</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">优惠券名:</label>

                            <div class="col-sm-8">
                                <input id="addCouponTitle" type="text" class="form-control m-b"
                                       placeholder="如:新用户注册优惠券">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">描述:</label>

                            <div class="col-sm-8">
                                <textarea id="addCouponDes" type="text" class="form-control" rows="3"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">优惠码:</label>

                            <div class="col-sm-8">
                                <input id="addCouponCode" type="text" class="form-control m-b" placeholder="默认REC">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">类别:</label>

                            <div class="col-sm-8">
                                <select id="addTypeSelect" name="type" class="form-control">
                                    <option value="0" selected>常用优惠</option>
                                    <option value="1">课程优惠券</option>
                                    <option value="2">活动码</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">面额:</label>

                            <div class="col-sm-8">
                                <input id="addCouponPrice" type="text" class="form-control m-b"
                                       onkeyup="this.value=this.value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                       onafterpaste="this.value=this.value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                       placeholder="如:20或者25.5或者25.55">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">满减门槛:</label>

                            <div class="col-sm-8">
                                <input id="addCouponThreshold" type="text" class="form-control m-b"
                                       onkeyup="this.value=this.value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                       onafterpaste="this.value=this.value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                       placeholder="如:199">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">总数量:</label>

                            <div class="col-sm-8">
                                <input id="addCouponNum" type="text" class="form-control m-b"
                                       placeholder="优惠券可被领取量,如:100">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">领券开始日期:</label>

                            <div class="col-sm-8">
                                <input id="addCouponStartTime" type="text" class="form-control" placeholder="设置领券开始日期"
                                       data-am-datepicker readonly/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">领券截止日期:</label>

                            <div class="col-sm-8">
                                <input id="addCouponEndTime" type="text" class="form-control" placeholder="设置领券截止日期"
                                       data-am-datepicker readonly/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">使用截止日期:</label>

                            <div class="col-sm-8">
                                <input id="addCouponExpiredTime" type="text" class="form-control" placeholder="设置使用截止日期"
                                       data-am-datepicker readonly/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">有效天数:</label>

                            <div class="col-sm-8">
                                <input id="addCouponDays" type="text" class="form-control m-b"
                                       onkeyup="this.value=this.value.replace(/\D/g,'')"
                                       onafterpaste="this.value=this.value.replace(/\D/g,'')"
                                       placeholder="用户领取后开始计时">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  control-label">适用课程(ID):</label>

                            <div class="col-sm-8">
                                <input id="addCouponCourse" type="text" class="form-control m-b color-warning"
                                       placeholder="适用课程" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-3"></div>
                            <div class="col-sm-3">
                                <input id="addSearchCourseId" type="text" class="form-control m-b"
                                       placeholder="课程ID">
                            </div>
                            <div class="col-sm-3">
                                <input id="addSearchCourseTitle" type="text" class="form-control m-b"
                                       placeholder="课程标题">
                            </div>
                            <div class="col-sm-3">
                                <button id="addSearch"
                                        class="am-btn am-btn-sm am-radius am-btn-default am-margin-right"><i
                                        class="am-icon am-icon-search"></i>搜索
                                </button>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <table class="table table-striped table-bordered"
                                       id="addCourse-table">
                                    <thead>
                                    <tr role="row">
                                        <th>选择
                                        </th>
                                        <th>id
                                        </th>
                                        <th>课程名
                                        </th>
                                        <th>封面
                                        </th>
                                        <th>创建时间
                                        </th>
                                        <th>修改时间
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
                    <button id="addButton" onclick="addCoupon()" class="btn btn-primary" type="button">提交</button>
                </div>
            </div>
        </div>
    </div>
    <!--add modal end -->
    <!--modify modal start-->
    <div role="dialog" id="modifyModel" class="modal fade in" tabindex="0">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="color-line"></div>
                <div class="modal-header text-center">
                    <h4 class="modal-title">优惠券修改</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <input id="modifyCouponId" type="text" style="display: none">

                        <div class="form-group">
                            <label class="col-sm-3 control-label">优惠券名:</label>

                            <div class="col-sm-8">
                                <input id="modifyCouponTitle" type="text" class="form-control m-b"
                                       placeholder="如:新用户注册优惠券">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">描述:</label>

                            <div class="col-sm-8">
                                <textarea id="modifyCouponDes" type="text" class="form-control" rows="3"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">优惠码:</label>

                            <div class="col-sm-8">
                                <input id="modifyCouponCode" type="text" class="form-control m-b" placeholder="默认REC">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">类别:</label>

                            <div class="col-sm-8">
                                <select id="modifyTypeSelect" name="type" class="form-control">
                                    <option value="0" selected>常用优惠</option>
                                    <option value="1">课程优惠券</option>
                                    <option value="2">活动码</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">面额:</label>

                            <div class="col-sm-8">
                                <input id="modifyCouponPrice" type="text" class="form-control m-b"
                                       onkeyup="this.value=this.value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                       onafterpaste="this.value=this.value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                       placeholder="如:20或者25.5或者25.55">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">满减门槛:</label>

                            <div class="col-sm-8">
                                <input id="modifyCouponThreshold" type="text" class="form-control m-b"
                                       onkeyup="this.value=this.value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                       onafterpaste="this.value=this.value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                       placeholder="如:199">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">总数量:</label>

                            <div class="col-sm-8">
                                <input id="modifyCouponNum" type="text" class="form-control m-b"
                                       placeholder="优惠券可被领取量,如:100">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">领券开始日期:</label>

                            <div class="col-sm-8">
                                <input id="modifyCouponStartTime" type="text" class="form-control"
                                       placeholder="设置领券开始日期"
                                       data-am-datepicker readonly/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">领券截止日期:</label>

                            <div class="col-sm-8">
                                <input id="modifyCouponEndTime" type="text" class="form-control" placeholder="设置领券截止日期"
                                       data-am-datepicker readonly/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">使用截止日期:</label>

                            <div class="col-sm-8">
                                <input id="modifyCouponExpiredTime" type="text" class="form-control"
                                       placeholder="设置使用截止日期"
                                       data-am-datepicker readonly/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">有效天数:</label>

                            <div class="col-sm-8">
                                <input id="modifyCouponDays" type="text" class="form-control m-b"
                                       onkeyup="this.value=this.value.replace(/\D/g,'')"
                                       onafterpaste="this.value=this.value.replace(/\D/g,'')"
                                       placeholder="用户领取后开始计时">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  control-label">适用课程(ID):</label>

                            <div class="col-sm-8">
                                <input id="modifyCouponCourse" type="text" class="form-control m-b color-warning"
                                       placeholder="适用课程" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-3"></div>
                            <div class="col-sm-3">
                                <input id="modifySearchCourseId" type="text" class="form-control m-b"
                                       placeholder="课程ID">
                            </div>
                            <div class="col-sm-3">
                                <input id="modifySearchCourseTitle" type="text" class="form-control m-b"
                                       placeholder="课程标题">
                            </div>
                            <div class="col-sm-3">
                                <button id="modifySearch"
                                        class="am-btn am-btn-sm am-radius am-btn-default am-margin-right"><i
                                        class="am-icon am-icon-search"></i>搜索
                                </button>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <table class="table table-striped table-bordered"
                                       id="modifyCourse-table">
                                    <thead>
                                    <tr role="row">
                                        <th>选择
                                        </th>
                                        <th>id
                                        </th>
                                        <th>课程名
                                        </th>
                                        <th>封面
                                        </th>
                                        <th>创建时间
                                        </th>
                                        <th>修改时间
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
                    <button id="modifyButton" onclick="modifyCoupon()" class="btn btn-primary" type="button">提交</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--modify modal end -->
<!--push modal start-->
<div role="dialog" id="pushModel" class="modal fade in" tabindex="0">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="color-line"></div>
            <div class="modal-header text-center">
                <h4 class="modal-title">优惠券发放</h4>
            </div>
            <div class="modal-body">
                <div class="form-horizontal">
                    <div class="form-group ">
                        <div class="col-sm-4 col-sm-offset-2">
                            <input id="pushCouponCode" type="text" class="form-control m-b"
                                   placeholder="优惠券码">
                        </div>
                        <div class="col-sm-4">
                            <input id="pushCouponTitle" type="text" class="form-control m-b"
                                   placeholder="优惠券标题">
                        </div>

                        <div class="col-sm-8 col-sm-offset-2 am-margin-top-xs">
                            <input id="pushCouponCourseTitle" type="text" class="form-control m-b"
                                   placeholder="课程标题">
                        </div>
                        <div class="col-sm-2 am-margin-top-xs">
                            <button id="pushCouponSearch"
                                    class="am-btn am-btn-sm am-radius am-btn-default am-margin-right"><i
                                    class="am-icon am-icon-search"></i>搜索
                            </button>
                        </div>

                    </div>
                    <div class="form-group">
                        <div class="col-sm-12">
                            <table class="table table-striped table-bordered"
                                   id="push-table">
                                <thead>
                                <tr role="row">
                                    <th>选择
                                    </th>
                                    <th>code
                                    </th>
                                    <th>类别
                                    </th>
                                    <th>标题
                                    </th>
                                    <th>面额
                                    </th>
                                    <th>数量
                                    </th>
                                    <th>门槛
                                    </th>
                                    <th>课程标题
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                        <input id="push_type_tag" type="text" class="tags"/></p>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">发放数量:</label>

                        <div class="col-sm-8 ">
                            <input id="pushNum" class="form-control" type="text"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">发放规则:</label>

                        <div class="col-sm-8 ">
                            <select id="pushSelector" name="type" class="form-control">
                                <option value="ORDER_COUNT_DESC">用户成交量降序</option>
                                <option value="ORDER_COUNT_ASC">用户成交量升序</option>
                                <option value="COST_SUM_DESC">用户成交额降序</option>
                                <option value="COST_SUM_ASC">用户成交额升序</option>
                                <option value="USER_CREATED_DESC">用户注册时间降序</option>
                                <option value="USER_CREATED_ASC">用户注册时间升序</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" class=" btn btn-default" type="button">关闭</button>
                <button id="pushConfirm" class="btn btn-primary" onclick="pushCoupons()" type="button">提交</button>
            </div>
        </div>
    </div>
</div>
</div>
<!--pushExceptional modal end -->
<!--pushExceptional modal start-->
<div role="dialog" id="pushExceptionalModel" class="modal fade in" tabindex="0">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="color-line"></div>
            <div class="modal-header text-center">
                <h4 class="modal-title">优惠券发放</h4>
            </div>
            <div class="modal-body">
                <div class="form-horizontal">
                    <div class="form-group ">
                        <div class="col-sm-4 col-sm-offset-2">
                            <input id="pushExceptionalCouponCode" type="text" class="form-control m-b"
                                   placeholder="优惠券码">
                        </div>
                        <div class="col-sm-4">
                            <input id="pushExceptionalCouponTitle" type="text" class="form-control m-b"
                                   placeholder="优惠券标题">
                        </div>

                        <div class="col-sm-8 col-sm-offset-2 am-margin-top-xs">
                            <input id="pushCouponExceptionalCourseTitle" type="text" class="form-control m-b"
                                   placeholder="课程标题">
                        </div>
                        <div class="col-sm-2 am-margin-top-xs">
                            <button id="pushExceptionalCouponSearch"
                                    class="am-btn am-btn-sm am-radius am-btn-default am-margin-right"><i
                                    class="am-icon am-icon-search"></i>搜索
                            </button>
                        </div>

                    </div>
                    <div class="form-group">
                        <div class="col-sm-12">
                            <table class="table table-striped table-bordered"
                                   id="pushExceptional-table">
                                <thead>
                                <tr role="row">
                                    <th>选择
                                    </th>
                                    <th>code
                                    </th>
                                    <th>类别
                                    </th>
                                    <th>标题
                                    </th>
                                    <th>面额
                                    </th>
                                    <th>数量
                                    </th>
                                    <th>门槛
                                    </th>
                                    <th>课程标题
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                        <input id="pushExceptional_type_tag" type="text" class="tags"/></p>
                    </div>
                    <div class="form-group ">
                        <div class="col-sm-4 col-sm-offset-2">
                            <input id="pushExceptionalNickname" type="text" class="form-control m-b"
                                   placeholder="昵称">
                        </div>
                        <div class="col-sm-4">
                            <input id="pushExceptionalPhone" type="text" class="form-control m-b"
                                   placeholder="手机号">
                        </div>
                        <div class="col-sm-2">
                            <button id="pushExceptionalUserSearch"
                                    class="am-btn am-btn-sm am-radius am-btn-default am-margin-right"><i
                                    class="am-icon am-icon-search"></i>搜索
                            </button>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12">
                            <table class="table table-striped table-bordered"
                                   id="pushExceptionalUser-table">
                                <thead>
                                <tr role="row">
                                    <th>用户Id
                                    </th>
                                    <th>昵称
                                    </th>
                                    <th>头像
                                    </th>
                                    <th>电话
                                    </th>
                                    <th>code
                                    </th>
                                    <th>城市
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                        <input id="pushExceptional_user_tag" type="text" class="tags"/></p>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" class=" btn btn-default" type="button">关闭</button>
                <button id="pushExceptionalConfirm" class="btn btn-primary" onclick="pushCouponsExceptional()"
                        type="button">提交
                </button>
            </div>
        </div>
    </div>
</div>
</div>
<!--push modal end -->
<!--detail modal start-->
<div role="dialog" id="detailModel" class="modal fade in" tabindex="0">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="color-line"></div>
            <div class="modal-header text-center">
                <h4 class="modal-title">优惠券详情</h4>
            </div>
            <div class="modal-body">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">名称:</label>

                        <div class="col-sm-10">
                            <input id="detailName" type="text" class="form-control m-b"
                                   placeholder="名称" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">id:</label>

                        <div class="col-sm-4">
                            <input id="detailId" type="text" class="form-control m-b"
                                   placeholder="id" readonly>
                        </div>
                        <label class="col-sm-2 control-label">注册赠送:</label>

                        <div class="col-sm-4">
                            <input id="detailAutoPush" type="text" class="form-control m-b"
                                   placeholder="注册赠送" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">数量:</label>

                        <div class="col-sm-4">
                            <input id="detailNum" type="text" class="form-control m-b"
                                   placeholder="数量" readonly>
                        </div>
                        <label class="col-sm-2 control-label">面额:</label>

                        <div class="col-sm-4">
                            <input id="detailPrice" type="text" class="form-control m-b"
                                   placeholder="面额" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">有限天数:</label>

                        <div class="col-sm-4">
                            <input id="detailDeadline" type="text" class="form-control m-b"
                                   placeholder="有限天数" readonly>
                        </div>
                        <label class="col-sm-2 control-label">门槛:</label>

                        <div class="col-sm-4">
                            <input id="detailThreshold" type="text" class="form-control m-b"
                                   placeholder="门槛" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">创建时间:</label>

                        <div class="col-sm-4">
                            <input id="detailCreated" type="text" class="form-control m-b"
                                   placeholder="创建时间" readonly>
                        </div>
                        <label class="col-sm-2 control-label">修改时间:</label>

                        <div class="col-sm-4">
                            <input id="detailUpdated" type="text" class="form-control m-b"
                                   placeholder="修改时间" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">使用范围:</label>

                        <div class="col-sm-10">
                            <input id="detailGoodType" type="text" class="form-control m-b"
                                   placeholder="全场通用" readonly>
                        </div>
                    </div>
                    <div class="form-group am-text-center">
                        <canvas id="couponsChart" width="400" height="250"></canvas>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" class=" btn btn-default" type="button">关闭</button>
                <button class="btn btn-primary" type="button">提交</button>
            </div>
        </div>
    </div>
</div>
</div>
<!--detail modal end -->


<!-- loading modal -->
<div class="am-modal am-modal-loading am-modal-no-btn" tabindex="-1" id="loading-modal">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">处理中...</div>
        <div class="am-modal-bd">
            <span class="am-icon-spinner am-icon-spin"></span>
        </div>
    </div>
</div>
</div>
<!--register modal end -->
<link rel="stylesheet" href="<c:url value="/resources/css/tag/tagsinput.css"/>">
<script src="<c:url value="/resources/js/tag/tagsinput.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/sweet-alert/sweet-alert.css"/>">
<script src="<c:url value="/resources/js/sweet-alert/sweet-alert.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/jqueryDataTables/jquery.dataTables.min.css"/>">
<script src="<c:url value="/resources/js/jqueryDataTables/jquery.dataTables.js"/>"></script>
<script src="<c:url value="/resources/js/dropdown/jquery.cascadingdropdown.min.js"/>"></script>

<script type="text/javascript">
    var prefix = "${pageContext.request.contextPath}/";
    var oTable = $('#admin-table');
    var addCourseTable = $('#addCourse-table');
    var pushTable = $("#push-table");
    var modifyCourseTable = $("#modifyCourse-table");
    var pushExceptionalTable = $("#pushExceptional-table");
    var userTable = $("#pushExceptionalUser-table");

    var COUPON_TYPE = {
        0: "常用优惠",
        1: "课程优惠券",
        2: "活动码"
    };

    //-----------------业务方法区-------------------//
    function addCoupon() {
        if (checkAddInfo()) {
            jQuery.ajax({
                type: "POST",
                url: prefix + "/admin/coupon/add",
                data: {
                    "code": $("#addCouponCode").val(),
                    "type": $("#addTypeSelect").val(),
                    "title": $("#addCouponTitle").val(),
                    "des": $("#addCouponDes").val(),
                    "couponMoney": $("#addCouponPrice").val(),
                    "above": $("#addCouponThreshold").val(),
                    "startTime": praseDate($("#addCouponStartTime").val()),
                    "endTime": praseDate($("#addCouponEndTime").val()),
                    "expiredTime": praseDate($("#addCouponExpiredTime").val()),
                    "validTime": dayToMillis($("#addCouponDays").val()),
                    "courseId": $("#addCouponCourse").val(),
                    "totalNum": $("#addCouponNum").val(),
                    "remainNum": $("#addCouponNum").val(),
                },
                dataType: "text",
                success: function (result) {
                    if (result == "success") {
                        clearAddInfo();
                        toastr.success('添加成功')
                    } else {
                        toastr.error("操作失败")
                    }
                }
            });
        }
    }

    function modifyCoupon() {
        if (checkModifyInfo()) {
            jQuery.ajax({
                type: "POST",
                url: prefix + "/admin/coupon/modify",
                data: {
                    "id": $("#modifyCouponId").val(),
                    "code": $("#modifyCouponCode").val(),
                    "type": $("#modifyTypeSelect").val(),
                    "title": $("#modifyCouponTitle").val(),
                    "des": $("#modifyCouponDes").val(),
                    "couponMoney": $("#modifyCouponPrice").val(),
                    "above": $("#modifyCouponThreshold").val(),
                    "startTime": praseDate($("#modifyCouponStartTime").val()),
                    "endTime": praseDate($("#modifyCouponEndTime").val()),
                    "expiredTime": praseDate($("#modifyCouponExpiredTime").val()),
                    "validTime": dayToMillis($("#modifyCouponDays").val()),
                    "courseId": $("#modifyCouponCourse").val(),
                    "totalNum": $("#modifyCouponNum").val(),
                    "remainNum": $("#modifyCouponNum").val(),
                },
                dataType: "text",
                success: function (result) {
                    if (result == "success") {
                        toastr.success('修改成功')
                    } else {
                        toastr.error("操作失败")
                    }
                }
            });
        }
    }

    function pushCoupons() {
        if (checkPushInfo()) {
//            $("#loading-modal").modal('open');
            var couponsId = getTagsInputId($("#push_type_tag"));
            var num;
            if ($("#pushNum").val() == null || $("#pushNum").val() == "") {
                num = 0
            } else {
                num = $("#pushNum").val();
            }
            var op = $('#pushSelector').val();
            jQuery.ajax({
                type: "POST",
                url: prefix + "admin/coupon/push",
                data: {
                    "idList": couponsId.toString(),
                    "num": num,
                    "sortType": op
                },
                dataType: "text",
                success: function (result) {
                    console.log(result);
                    if (result == "success") {
                        toastr.success('操作成功');
//                    $("#loading-modal").modal('close');
                        clearPushInfo();
                    } else {
                        toastr.success('操作失败');
                    }
                },
                error: function () {
                    toastr.error('连接失败');
                }
            });
        }
    }

    function pushCouponsExceptional() {
        if (checkPushExceptionalInfo()) {
//            $("#loading-modal").modal('open');
            var couponsId = getTagsInputId($("#pushExceptional_type_tag"));
            var userId = getTagsInputId($("#pushExceptional_user_tag"));
            jQuery.ajax({
                type: "POST",
                url: prefix + "admin/coupon/pushExceptional",
                data: {
                    "idList": couponsId.toString(),
                    "userIdList": userId.toString(),
                },
                dataType: "text",
                success: function (result) {
                    console.log(result);
                    if (result == "success") {
                        toastr.success('操作成功');
                        clearPushExceptionalInfo();
                    } else {
                        toastr.success('操作失败');
                    }
                },
                error: function () {
                    toastr.error('连接失败');
                }
            });
        }
    }

    function checkAddInfo() {
        var title = $("#addCouponTitle").val();
        var price = $("#addCouponPrice").val();
        var num = $("#addCouponNum").val();
        var days = $('#addCouponDays').val();
        var threshold = $("#addCouponThreshold").val();
        if (title == "" || price == "" || num == "" || days == "" || threshold == "") {
            toastr.error("除范围，其他属性不能为空");
            return false;
        } else {
            return true;
        }
    }

    function checkModifyInfo() {
        var title = $("#modifyCouponTitle").val();
        var price = $("#modifyCouponPrice").val();
        var num = $("#modifyCouponNum").val();
        var days = $('#modifyCouponDays').val();
        var threshold = $("#modifyCouponThreshold").val();
        if (title == "" || price == "" || num == "" || days == "" || threshold == "") {
            toastr.error("除范围，其他属性不能为空");
            return false;
        } else {
            return true;
        }
    }

    function checkPushInfo() {
        var tags = $('#push_type_tag').val();
        if (tags == "") {
            toastr.error("请选择要发送的优惠券");
            return false;
        } else {
            return true;
        }
    }

    function checkPushExceptionalInfo() {
        var tags = $('#pushExceptional_type_tag').val();
        var userTags = $('#pushExceptional_user_tag').val();
        if (tags == "") {
            toastr.error("请选择要发送的优惠券");
            return false;
        } else if (userTags == "") {
            toastr.error("请选择接受优惠券的用户");
            return false;
        } else {
            return true;
        }
    }

    function refresh() {   //  点击刷新
        window.location.reload();
    }

    function cleanUp() {//点击清空搜索信息
        $('#queryCode').val("");
        $('#queryTitle').val("");
        $('#queryPrice').val("");
        $('#queryCourse').val("");
        $('#startTime').val("");
        $('#endTime').val("");
    }

    function clearAddInfo() {
        $("#addCouponCode").val("");
        $("#addCouponTitle").val("");
        $("#addCouponDes").val("");
        $("#addCouponPrice").val("");
        $("#addCouponThreshold").val("");
        $("#addCouponStartTime").val("");
        $("#addCouponEndTime").val("");
        $("#addCouponExpiredTime").val("");
        $("#addCouponDays").val("");
        $("#addCouponCourse").val("");
        $("#addCouponNum").val("");

    }

    function clearModifyInfo() {
        $("#modifyCouponTitle").val("");
        $("#modifyCouponPrice").val("");
        $("#modifyCouponNum").val("");
        $('#modify_type_tag').importTags("");
        $('#modifyCouponDays').val("");
        $("#modifyCouponThreshold").val("");
    }

    function clearPushInfo() {
        $("input[name=pushCheck]").attr("checked", false);
        $('#push_type_tag').importTags("");
    }

    function clearPushExceptionalInfo() {
        $("#pushExceptional_type_tag").importTags("");
        $("#pushExceptional_user_tag").importTags("");
        $("input[name=pushUserCheck]").removeAttr("checked");
        $("input[name=pushExceptionalCheck]").removeAttr("checked");
    }

    //-----------------业务方法区-------------------//

    //tag val
    function getTagsInputId(tagsInput) {
        var ids = new Array;
        var tags = tagsInput.val().split(",");
        $.each(tags, function (i, e) {
            var start = e.indexOf(":");
            var end = e.indexOf(";");
            var idStr = e.substring(start + 1, end);
            ids.push(idStr);
        })
        return ids;
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

    function praseDate(time) {
        if (time == "") {
            return 0;
        }
        var nowTemp = new Date(time);
        return new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0).getTime();
    }

    function dayToMillis(day) {
        return day * 24 * 3600 * 1000;
    }
    //加载日期
    function generateDate(time) {
        var data = new Date(parseInt(time));
        var formatDate = data.format('yyyy-MM-dd HH:mm:ss');
        return formatDate;
    }

    //加载时间
    function generateTime(msd) {
        var time = parseFloat(msd);
        if (null != time && "" != time) {
            time = time / 1000;
            if (time > 60 && time < 60 * 60) {
                time = parseInt(time / 60.0) + "分钟" + parseInt((parseFloat(time / 60.0) -
                                parseInt(time / 60.0)) * 60) + "秒";
            }
            else if (time >= 60 * 60 && time < 60 * 60 * 24) {
                time = parseInt(time / 3600.0) + "小时" + parseInt((parseFloat(time / 3600.0) -
                                parseInt(time / 3600.0)) * 60) + "分钟" +
                        parseInt((parseFloat((parseFloat(time / 3600.0) - parseInt(time / 3600.0)) * 60) -
                                parseInt((parseFloat(time / 3600.0) - parseInt(time / 3600.0)) * 60)) * 60) + "秒";
            }
            else if (time >= 60 * 60 * 24) {
                time = parseInt(time / (3600 * 24)) + "天"
                        + parseInt((parseFloat(time / (3600 * 24)) - parseInt(time / (3600 * 24))) * 24) + "小时"
                        + parseInt((parseFloat(time / 3600.0) - parseInt(time / 3600.0)) * 60) + "分钟"
                        + parseInt((parseFloat((parseFloat(time / 3600.0) - parseInt(time / 3600.0)) * 60) -
                                parseInt((parseFloat(time / 3600.0) - parseInt(time / 3600.0)) * 60)) * 60) + "秒";
            }
            else {
                time = parseInt(time) + "秒";
            }
        }
        return time;
    }

    function generateDay(msd) {
        return parseInt(msd / 1000 / 3600 / 24);
    }

    function generateOp(id) {
        return ' <div class="btn-group">' +
                '<button  class="updateBtn  btn btn-xs btn-default color-secondary" data-toggle="modal" data-target="#modifyModel" data-id="' + id + '"> 修改</button> ' +
                '<button  class="deleteBtn  btn btn-xs btn-default color-secondary" data-id="' + id + '">删除</button>' +
                '</div>'
    }

    function generateRadioBox(id, name) {
        return '<input type="radio" name="' + name + '" value="' + id + '">'
    }

    function generateCheckBox(id, name) {
        return '<input type="checkbox" name="' + name + '" value="' + id + '">'
    }

    function generateImg(src, width, height) {
        return '<img class="am-img-responsive" height="' + height + '" width="' + width + '" src=' + src + ' />'
    }

    function generateType(type) {
        return '<span class="am-badge am-badge-secondary am-radius">' + COUPON_TYPE[type] + '</span>';
    }

    function loadAddCourseTable() {
        console.log("load table");
        addCourseTable.dataTable({
            "sDom": "<'row'<'col-sm-6'l><'col-sm-6'f>r><'row't><'row'<'col-sm-6'i><'col-sm-6'p>>",
            "bScrollCollapse": true,
            "aoColumns": [
                {
                    "mDataProp": "courseId",
                    "bSortable": false,
                    "mRender": function (data, type, full) {
                        return generateRadioBox(data, "addCourseCheck");
                    }
                },
                {
                    "mDataProp": "courseId",
                    "bSortable": false
                },
                {
                    "mDataProp": "title",
                    "bSortable": false
                }, {
                    "mDataProp": "cover",
                    "bSortable": false,
                    "mRender": function (data, type, full) {
                        return generateImg(data, "160ps", "100px");
                    }
                }, {
                    "mDataProp": "created",
                    "bSortable": false,
                    "mRender": function (data, type, full) {
                        return generateDate(data);
                    }
                }, {
                    "mDataProp": "updated",
                    "bSortable": false,
                    "mRender": function (data, type, full) {
                        return generateDate(data);
                    }
                }
            ],
            "iDisplayLength": 5,
            "bFilter": false,
            "bServerSide": true,
            "sAjaxSource": prefix + "/admin/course/baseQuery",
            "sServerMethod": "GET",
            "bRetrieve": true,
            "oLanguage": {
                "sSearch": "结果过滤:",
                "sZeroRecords": "找不到相关的记录",
                "oPaginate": {
                    "sNext": "下一页",
                    "sPrevious": "上一页",
                    "sLast": "最后一页",
                    "sFirst": "第一页"
                },
                "sInfo": "共 <code>_TOTAL_</code> 结果 当前显示 (<code>_START_</code> - <code>_END_</code>)",
                "sEmptyTable": "表中无可用记录",
                "sLengthMenu": "",
                "sInfoFiltered": "(从 <code>_MAX_</code>条记录中过滤)",
                "sInfoEmpty": "共 <code>0</code> 结果 当前显示 (<code>0</code> - <code>0</code>)"
            }, "fnServerParams": function (aoData) {
                aoData.push({"name": "id", "value": $('#addSearchCourseId').val()}
                        , {"name": "title", "value": $('#addSearchCourseTitle').val()}
                );
            },
            "oClasses": {
                "sFilter": "dataTables_filter"
            },
            "aaSorting": [[2, "asc"]]
        });
    }

    function loadModifyCourseTable() {
        console.log("load table");
        modifyCourseTable.dataTable({
            "sDom": "<'row'<'col-sm-6'l><'col-sm-6'f>r><'row't><'row'<'col-sm-6'i><'col-sm-6'p>>",
            "bScrollCollapse": true,
            "aoColumns": [
                {
                    "mDataProp": "courseId",
                    "bSortable": false,
                    "mRender": function (data, type, full) {
                        return generateRadioBox(data, "modifyCourseCheck");
                    }
                },
                {
                    "mDataProp": "courseId",
                    "bSortable": false
                },
                {
                    "mDataProp": "title",
                    "bSortable": false
                }, {
                    "mDataProp": "cover",
                    "bSortable": false,
                    "mRender": function (data, type, full) {
                        return generateImg(data, "160ps", "100px");
                    }
                }, {
                    "mDataProp": "created",
                    "bSortable": false,
                    "mRender": function (data, type, full) {
                        return generateDate(data);
                    }
                }, {
                    "mDataProp": "updated",
                    "bSortable": false,
                    "mRender": function (data, type, full) {
                        return generateDate(data);
                    }
                }
            ],
            "iDisplayLength": 5,
            "bFilter": false,
            "bServerSide": true,
            "sAjaxSource": prefix + "/admin/course/baseQuery",
            "sServerMethod": "GET",
            "bRetrieve": true,
            "oLanguage": {
                "sSearch": "结果过滤:",
                "sZeroRecords": "找不到相关的记录",
                "oPaginate": {
                    "sNext": "下一页",
                    "sPrevious": "上一页",
                    "sLast": "最后一页",
                    "sFirst": "第一页"
                },
                "sInfo": "共 <code>_TOTAL_</code> 结果 当前显示 (<code>_START_</code> - <code>_END_</code>)",
                "sEmptyTable": "表中无可用记录",
                "sLengthMenu": "",
                "sInfoFiltered": "(从 <code>_MAX_</code>条记录中过滤)",
                "sInfoEmpty": "共 <code>0</code> 结果 当前显示 (<code>0</code> - <code>0</code>)"
            }, "fnServerParams": function (aoData) {
                aoData.push({"name": "id", "value": $('#modifySearchCourseId').val()}
                        , {"name": "title", "value": $('#modifySearchCourseTitle').val()}
                );
            },
            "oClasses": {
                "sFilter": "dataTables_filter"
            },
            "aaSorting": [[2, "asc"]]
        });
    }

    function loadPushCoupon() {
        pushTable.dataTable({
            "sDom": "<'row'<'col-sm-6'l><'col-sm-6'f>r><'row't><'row'<'col-sm-6'i><'col-sm-6'p>>",
            "bScrollCollapse": true,
            "aoColumns": [
                {
                    "mDataProp": "id",
                    "bSortable": false,
                    "mRender": function (data, type, full) {
                        return generateCheckBox(data, "pushCheck");
                    }
                }, {
                    "mDataProp": "code",
                    "bSortable": false,
                    "mRender": function (data, type, full) {
                        return '<span class="am-badge am-badge-primary am-round">' + data + '</span>';
                    }
                }, {
                    "mDataProp": "type",
                    "bSortable": false,
                    "mRender": function (data, type, full) {
                        return generateType(data);
                    }
                },
                {
                    "mDataProp": "title",
                    "bSortable": false
                }, {
                    "mDataProp": "couponMoney",
                    "bSortable": false
                }, {
                    "mDataProp": "remainNum",
                    "bSortable": false
                }, {
                    "mDataProp": "above",
                    "bSortable": false
                }, {
                    "mDataProp": "courseTitle",
                    "bSortable": false,
                },
            ],
            "bFilter": false,
            "bServerSide": true,
            "sAjaxSource": prefix + "/admin/coupon/query",
            "sServerMethod": "GET",
            "bRetrieve": true,
            "oLanguage": {
                "sSearch": "结果过滤:",
                "sZeroRecords": "找不到相关的记录",
                "oPaginate": {
                    "sNext": "下一页",
                    "sPrevious": "上一页",
                    "sLast": "最后一页",
                    "sFirst": "第一页"
                },
                "sInfo": "共 <code>_TOTAL_</code> 结果 当前显示 (<code>_START_</code> - <code>_END_</code>)",
                "sEmptyTable": "表中无可用记录",
                "sLengthMenu": "显示 _MENU_ 记录",
                "sInfoFiltered": "(从 <code>_MAX_</code>条记录中过滤)",
                "sInfoEmpty": "共 <code>0</code> 结果 当前显示 (<code>0</code> - <code>0</code>)"
            }, "fnServerParams": function (aoData) {
                aoData.push({"name": "code", "value": $('#pushCouponCode').val()}
                        , {"name": "title", "value": $('#pushCouponTitle').val()}
                        , {"name": "courseTitle", "value": $('#pushCouponCourseTitle').val()});
            },
            "oClasses": {
                "sFilter": "dataTables_filter"
            },
            "aaSorting": [[2, "asc"]]
        });
    }

    function loadPushExceptional() {
        pushExceptionalTable.dataTable({
            "sDom": "<'row'<'col-sm-6'l><'col-sm-6'f>r><'row't><'row'<'col-sm-6'i><'col-sm-6'p>>",
            "bScrollCollapse": true,
            "aoColumns": [
                {
                    "mDataProp": "id",
                    "bSortable": false,
                    "mRender": function (data, type, full) {
                        return generateCheckBox(data, "pushExceptionalCheck");
                    }
                }, {
                    "mDataProp": "code",
                    "bSortable": false,
                    "mRender": function (data, type, full) {
                        return '<span class="am-badge am-badge-primary am-round">' + data + '</span>';
                    }
                }, {
                    "mDataProp": "type",
                    "bSortable": false,
                    "mRender": function (data, type, full) {
                        return generateType(data);
                    }
                },
                {
                    "mDataProp": "title",
                    "bSortable": false
                }, {
                    "mDataProp": "couponMoney",
                    "bSortable": false
                }, {
                    "mDataProp": "remainNum",
                    "bSortable": false
                }, {
                    "mDataProp": "above",
                    "bSortable": false
                }, {
                    "mDataProp": "courseTitle",
                    "bSortable": false,
                },
            ],
            "bFilter": false,
            "bServerSide": true,
            "sAjaxSource": prefix + "/admin/coupon/query",
            "sServerMethod": "GET",
            "bRetrieve": true,
            "oLanguage": {
                "sSearch": "结果过滤:",
                "sZeroRecords": "找不到相关的记录",
                "oPaginate": {
                    "sNext": "下一页",
                    "sPrevious": "上一页",
                    "sLast": "最后一页",
                    "sFirst": "第一页"
                },
                "sInfo": "共 <code>_TOTAL_</code> 结果 当前显示 (<code>_START_</code> - <code>_END_</code>)",
                "sEmptyTable": "表中无可用记录",
                "sLengthMenu": "显示 _MENU_ 记录",
                "sInfoFiltered": "(从 <code>_MAX_</code>条记录中过滤)",
                "sInfoEmpty": "共 <code>0</code> 结果 当前显示 (<code>0</code> - <code>0</code>)"
            }, "fnServerParams": function (aoData) {
                aoData.push({"name": "code", "value": $('#pushExceptionalCouponCode').val()}
                        , {"name": "title", "value": $('#pushExceptionalCouponTitle').val()}
                        , {"name": "courseTitle", "value": $('#pushCouponExceptionalCourseTitle').val()});
            },
            "oClasses": {
                "sFilter": "dataTables_filter"
            },
            "aaSorting": [[2, "asc"]]
        });
    }

    function loadUserTable() {
        userTable.dataTable({
            "sDom": "<'row'<'col-sm-6'l><'col-sm-6'f>r><'row't><'row'<'col-sm-6'i><'col-sm-6'p>>",
            "bScrollCollapse": true,
            "aoColumns": [
                {
                    "mDataProp": "id",
                    "bSortable": false,
                    "mRender": function (data, type, full) {
                        return generateCheckBox(data, "pushUserCheck");
                    }
                }, {
                    "mDataProp": "nickname",
                    "bSortable": false,
                }, {
                    "mDataProp": "avatar",
                    "bSortable": false,
                    "mRender": function (data, type, full) {
                        return generateImg(data, "80px", "80px");
                    }
                },
                {
                    "mDataProp": "phone",
                    "bSortable": false
                }, {
                    "mDataProp": "code",
                    "bSortable": false
                }, {
                    "mDataProp": "city",
                    "bSortable": false
                }
            ],
            "bFilter": false,
            "bServerSide": true,
            "sAjaxSource": prefix + "/admin/user/query",
            "sServerMethod": "GET",
            "bRetrieve": true,
            "oLanguage": {
                "sSearch": "结果过滤:",
                "sZeroRecords": "找不到相关的记录",
                "oPaginate": {
                    "sNext": "下一页",
                    "sPrevious": "上一页",
                    "sLast": "最后一页",
                    "sFirst": "第一页"
                },
                "sInfo": "共 <code>_TOTAL_</code> 结果 当前显示 (<code>_START_</code> - <code>_END_</code>)",
                "sEmptyTable": "表中无可用记录",
                "sLengthMenu": "显示 _MENU_ 记录",
                "sInfoFiltered": "(从 <code>_MAX_</code>条记录中过滤)",
                "sInfoEmpty": "共 <code>0</code> 结果 当前显示 (<code>0</code> - <code>0</code>)"
            }, "fnServerParams": function (aoData) {
                aoData.push({"name": "nickname", "value": $('#pushExceptionalNickname').val()}
                        , {"name": "phone", "value": $('#pushExceptionalPhone').val()}
                        , {"name": "confirm", "value": "ALL"});
            },
            "oClasses": {
                "sFilter": "dataTables_filter"
            },
            "aaSorting": [[2, "asc"]]
        });
    }

    function loadData() {
        oTable.dataTable({
            "sDom": "<'row'<'col-sm-6'l><'col-sm-6'f>r><'row't><'row'<'col-sm-6'i><'col-sm-6'p>>",
            "bScrollCollapse": true,
            "aoColumns": [
                {
                    "mDataProp": "id",
                    "bSortable": false
                },
                {
                    "mDataProp": "code",
                    "bSortable": false,
                    "mRender": function (data, type, full) {
                        return '<span class="am-badge am-badge-primary am-round">' + data + '</span>';
                    }
                }, {
                    "mDataProp": "type",
                    "bSortable": false,
                    "mRender": function (data, type, full) {
                        return generateType(data);
                    }
                },
                {
                    "mDataProp": "title",
                    "bSortable": false
                }, {
                    "mDataProp": "couponMoney",
                    "bSortable": false
                }, {
                    "mDataProp": "above",
                    "bSortable": false
                }, {
                    "mDataProp": "startTime",
                    "bSortable": false,
                    "mRender": function (data, type, full) {
                        return generateDate(data);
                    }
                }, {
                    "mDataProp": "courseTitle",
                    "bSortable": false,
                },
                {
                    "mDataProp": "created",
                    "bSortable": false,
                    "mRender": function (data, type, full) {
                        return generateDate(data);
                    }
                }, {
                    "mDataProp": "updated",
                    "bSortable": false,
                    "mRender": function (data, type, full) {
                        return generateDate(data);
                    }
                },
                {
                    "mDataProp": "id",
                    "bSortable": false,
                    "mRender": function (data, type, full) {
                        return generateOp(data);
                    },
                },

            ],
            "bFilter": false,
            "bServerSide": true,
            "sAjaxSource": prefix + "/admin/coupon/query",
            "sServerMethod": "GET",
            "bRetrieve": true,
            "oLanguage": {
                "sSearch": "结果过滤:",
                "sZeroRecords": "找不到相关的记录",
                "oPaginate": {
                    "sNext": "下一页",
                    "sPrevious": "上一页",
                    "sLast": "最后一页",
                    "sFirst": "第一页"
                },
                "sInfo": "共 <code>_TOTAL_</code> 结果 当前显示 (<code>_START_</code> - <code>_END_</code>)",
                "sEmptyTable": "表中无可用记录",
                "sLengthMenu": "显示 _MENU_ 记录",
                "sInfoFiltered": "(从 <code>_MAX_</code>条记录中过滤)",
                "sInfoEmpty": "共 <code>0</code> 结果 当前显示 (<code>0</code> - <code>0</code>)"
            }, "fnServerParams": function (aoData) {
                aoData.push({"name": "code", "value": $('#queryCode').val()}
                        , {"name": "title", "value": $('#queryTitle').val()}
                        , {"name": "couponMoney", "value": $('#queryPrice').val()}
                        , {"name": "courseTitle", "value": $('#queryCourse').val()}
                        , {"name": "startTime", "value": praseDate($('#startTime').val())}
                        , {"name": "endTime", "value": praseDate($('#endTime').val())});
            },
            "oClasses": {
                "sFilter": "dataTables_filter"
            },
            "aaSorting": [[2, "asc"]]
        });
    }

    function init() {

        $('.tooltip-hide').tooltip();
        $('#type_tag').tagsInput({
            width: 'auto',
            defaultText: '',
            'interactive': false,
        });
        $('#modify_type_tag').tagsInput({
            width: 'auto',
            defaultText: '',
            'interactive': false,
        });
        $('#push_type_tag').tagsInput({
            width: 'auto',
            'interactive': false,
        });
        $('#pushExceptional_type_tag').tagsInput({
            width: 'auto',
            'interactive': false,
        });
        $('#pushExceptional_user_tag').tagsInput({
            width: 'auto',
            'interactive': false,
        });
        /*============================================== event listener  ================================================*/
        /*==== btn click =====*/
        $("#addCouponBtn").on("click", function () {
            console.log("coupon course");
            loadAddCourseTable();
        })
        $('#pushCoupon').click(function (e) {
            e.preventDefault();
            if (!$(addCourseTable).hasClass("init")) {
                loadPushCoupon();
                $(addCourseTable).addClass("init");
            } else {
                console.log($('input[name="pushCheck"]'));
            }
        })
        $('#pushExceptionalCoupon').click(function (e) {
            e.preventDefault();
            if (!$(pushExceptionalTable).hasClass("init")) {
                loadPushExceptional();
                loadUserTable();
                $(pushExceptionalTable).addClass("init");
            } else {
                console.log($('input[name="pushCheck"]'));
            }
        })
        //search
        $('#addSearch').click(function (e) {
            e.preventDefault();
            var table = addCourseTable.dataTable();
            var oSettings = addCourseTable.fnSettings();
            $.get(oSettings.sAjaxSource, {
                id: $('#addSearchCourseId').val(),
                title: $('#addSearchCourseTitle').val()
            }, function (json) {
                console.log("reload the register table");
                table.fnClearTable(this);
                for (var i = 0; i < json.aaData.length; i++) {
                    table.oApi._fnAddData(oSettings, json.aaData[i]);
                }
                oSettings.aiDisplay = oSettings.aiDisplayMaster.slice();
                table.fnDraw();
            }, 'json')
        });
        $('#modifySearch').click(function (e) {
            e.preventDefault();
            var table = modifyCourseTable.dataTable();
            var oSettings = modifyCourseTable.fnSettings();
            $.get(oSettings.sAjaxSource, {
                id: $('#modifySearchCourseId').val(),
                title: $('#modifySearchCourseTitle').val()
            }, function (json) {
                console.log("reload the register table");
                table.fnClearTable(this);
                for (var i = 0; i < json.aaData.length; i++) {
                    table.oApi._fnAddData(oSettings, json.aaData[i]);
                }
                oSettings.aiDisplay = oSettings.aiDisplayMaster.slice();
                table.fnDraw();
            }, 'json')
        });
        $('#pushCouponSearch').click(function (e) {
            e.preventDefault();
            var table = pushTable.dataTable();
            var oSettings = pushTable.fnSettings();
            $.get(oSettings.sAjaxSource, {
                code: $('#pushCouponCode').val(),
                title: $('#pushCouponTitle').val(),
                courseTitle: $("#pushCouponCourseTitle").val()
            }, function (json) {
                console.log("reload the push table");
                table.fnClearTable(this);
                for (var i = 0; i < json.aaData.length; i++) {
                    table.oApi._fnAddData(oSettings, json.aaData[i]);
                }
                oSettings.aiDisplay = oSettings.aiDisplayMaster.slice();
                table.fnDraw();
            }, 'json')
        });
        $('#pushExceptionalCouponSearch').click(function (e) {
            e.preventDefault();
            var table = pushExceptionalTable.dataTable();
            var oSettings = pushExceptionalTable.fnSettings();
            $.get(oSettings.sAjaxSource, {
                code: $('#pushExceptionalCouponCode').val(),
                title: $('#pushExceptionalCouponTitle').val(),
                courseTitle: $("#pushCouponExceptionalCourseTitle").val()
            }, function (json) {
                console.log("reload the push table");
                table.fnClearTable(this);
                for (var i = 0; i < json.aaData.length; i++) {
                    table.oApi._fnAddData(oSettings, json.aaData[i]);
                }
                oSettings.aiDisplay = oSettings.aiDisplayMaster.slice();
                table.fnDraw();
            }, 'json')
        });
        $('#pushExceptionalUserSearch').click(function (e) {
            e.preventDefault();
            var table = userTable.dataTable();
            var oSettings = userTable.fnSettings();
            $.get(oSettings.sAjaxSource, {
                nickname: $('#pushExceptionalNickname').val(),
                phone: $('#pushExceptionalPhone').val(),
                confirm: "ALL"
            }, function (json) {
                console.log("reload the push table");
                table.fnClearTable(this);
                for (var i = 0; i < json.aaData.length; i++) {
                    table.oApi._fnAddData(oSettings, json.aaData[i]);
                }
                oSettings.aiDisplay = oSettings.aiDisplayMaster.slice();
                table.fnDraw();
            }, 'json')
        });
        $('#search').click(function (e) {
            e.preventDefault();
            var table = oTable.dataTable();
            var oSettings = table.fnSettings();
            $.get(oSettings.sAjaxSource, {
                code: $('#queryCode').val(),
                title: $('#queryTitle').val(),
                couponMoney: $('#queryPrice').val(),
                courseTitle: $('#queryCourse').val(),
                startTime: praseDate($('#startTime').val()),
                endTime: praseDate($('#endTime').val())
            }, function (json) {
                console.log("reload the table");
                table.fnClearTable(this);
                for (var i = 0; i < json.aaData.length; i++) {
                    table.oApi._fnAddData(oSettings, json.aaData[i]);
                }
                oSettings.aiDisplay = oSettings.aiDisplayMaster.slice();
                table.fnDraw();
            }, 'json')
        });
        /*==== model click ====*/
        $('#admin-table').find('tbody').on('click', ' tr button.updateBtn', function (e) {
            e.preventDefault();
            var tr = $(this).parents("tr");
            var data = oTable.fnGetData(tr[0]);
            console.log(data);
            if (data.id != $("modifyCouponId").val()) {
                $("#modifyCouponId").val(data.id);
                $("#modifyCouponCode").val(data.code);
                $("#modifyTypeSelect").val(data.type);
                $("#modifyCouponTitle").val(data.title);
                $("#modifyCouponDes").val(data.des);
                $("#modifyCouponPrice").val(data.couponMoney);
                $("#modifyCouponThreshold").val(data.above);
                $("#modifyCouponStartTime").val(generateDate(data.startTime));
                $("#modifyCouponEndTime").val(generateDate(data.endTime));
                $("#modifyCouponExpiredTime").val(generateDate(data.expiredTime));
                $("#modifyCouponDays").val(generateDay(data.validTime));
                $("#modifyCouponCourse").val(data.courseId);
                $("#modifyCouponNum").val(data.totalNum);
                loadModifyCourseTable();
            }
        })

        $('#admin-table').find('tbody').on('click', ' tr button.detailBtn', function (e) {
            e.preventDefault();
            var id = $(this).parents("tr").children("td:nth-child(1)").text();
            console.log(id);
            $.ajax({
                type: "get",
                url: prefix + "coupons/detail/" + id,
                success: function (result) {
                    console.log(result);
                    loadChart(result);
                }
            });
            var title = $(this).parents("tr").children("td:nth-child(2)").text();
            var price = $(this).parents("tr").children("td:nth-child(3)").text();
            var num = $(this).parents("tr").children("td:nth-child(4)").text();
            var legalGoodsType = $(this).parents("tr").children("td:nth-child(5)").text();
            var limitDays = $(this).parents("tr").children("td:nth-child(6)").text();
            var threshold = $(this).parents("tr").children("td:nth-child(7)").text();
            var autoPush = $(this).parents("tr").children("td:nth-child(8)").text();
            var created = $(this).parents("tr").children("td:nth-child(9)").text();
            var updated = $(this).parents("tr").children("td:nth-child(10)").text();
            $("#detailId").val(id);
            $("#detailAutoPush").val(autoPush);
            $("#detailCreated").val(created);
            $("#detailUpdated").val(updated);
            $("#detailName").val(title);
            $("#detailPrice").val(price);
            $("#detailNum").val(num);
            $('#detailGoodType').importTags(legalGoodsType);
            $('#detailDeadline').val(limitDays)
            $("#detailThreshold").val(threshold)
        })

        $('#admin-table').find('tbody').on('click', ' tr button.deleteBtn', function (e) {
            e.preventDefault();
            var id = $(this).parents("tr").children("td:nth-child(1)").text();
            swal({
                        title: "是否确定删除",
                        text: "删除后，用户已领的券也会失效",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#5ECD1E",
                        confirmButtonText: "Yes, 删除",
                        cancelButtonText: "No, 取消",
                        closeOnConfirm: true,
                        closeOnCancel: true
                    },
                    function (isConfirm) {
                        if (isConfirm) {
                            $.ajax({
                                type: "post",  //提交方式
                                url: prefix + "coupons/detail/" + id,
                                success: function (result) {
                                    $thisTr.remove();
                                    toastr.success('删除成功');
                                }
                            });
                        } else {

                        }
                    });
        })
        /*==== model click end====*/
        /*==== radio click ==*/
        $('#addCourse-table').find('tbody').on('click', ' tr input[name="addCourseCheck"]', function (e) {
            var id = $(this).val();
            if (this.checked) {
                $("#addCouponCourse").val(id);
            } else {
                $("#addCouponCourse").val("");
            }
        });
        $('#modifyCourse-table').find('tbody').on('click', ' tr input[name="modifyCourseCheck"]', function (e) {
            var id = $(this).val();
            if (this.checked) {
                $("#modifyCouponCourse").val(id);
            } else {
                $("#modifyCouponCourse").val("");
            }
        });
        $('#push-table').find('tbody').on('click', ' tr input[name="pushCheck"]', function (e) {
            var id = $(this).val();
            var title = $(this).parents("tr").children("td:nth-child(4)").text();
            var tag = "id:" + id + ";" + title;
            if (this.checked) {
                if (!$('#push_type_tag').tagExist(tag)) {
                    var b = $('#push_type_tag').val() + "," + tag;
                    $('#push_type_tag').importTags(b);
                }
            } else {
                if ($('#push_type_tag').tagExist(tag)) {
                    $('#push_type_tag').removeTag(tag);
                }
            }
        });
        $('#pushExceptional-table').find('tbody').on('click', ' tr input[name="pushExceptionalCheck"]', function (e) {
            var id = $(this).val();
            var title = $(this).parents("tr").children("td:nth-child(4)").text();
            var tag = "id:" + id + ";" + title;
            if (this.checked) {
                if (!$('#pushExceptional_type_tag').tagExist(tag)) {
                    var b = $('#pushExceptional_type_tag').val() + "," + tag;
                    $('#pushExceptional_type_tag').importTags(b);
                }
            } else {
                if ($('#pushExceptional_type_tag').tagExist(tag)) {
                    $('#pushExceptional_type_tag').removeTag(tag);
                }
            }
        });
        $('#pushExceptionalUser-table').find('tbody').on('click', ' tr input[name="pushUserCheck"]', function (e) {
            var id = $(this).val();
            var title = $(this).parents("tr").children("td:nth-child(2)").text();
            var tag = "id:" + id + ";" + title;
            if (this.checked) {
                if (!$('#pushExceptional_user_tag').tagExist(tag)) {
                    var b = $('#pushExceptional_user_tag').val() + "," + tag;
                    $('#pushExceptional_user_tag').importTags(b);
                }
            } else {
                if ($('#pushExceptional_user_tag').tagExist(tag)) {
                    $('#pushExceptional_user_tag').removeTag(tag);
                }
            }
        });
        /*==== radio click end ==*/

        /*============================================== event listener end ================================================*/

        var $startTime = $('#startTime');
        $startTime.datepicker({
            initialDate: new Date(),
            onRender: function (date) {
                return date.valueOf() < now.valueOf() ? 'am-disabled' : '';
            }
        }).on('changeDate.datepicker.amui', function (event) {
            var nowTemp = new Date($('#startTime').val());
            if (nowTemp >= new Date($('#endTime').val())) {
                $('#startTime').val("");
                toastr.error("起始日期不能大于结束日期");
            }
            $(this).datepicker('close');
        });

        var $endTime = $('#endTime');
        $endTime.datepicker({
            initialDate: new Date(),
            onRender: function (date) {
                return date.valueOf() < now.valueOf() ? 'am-disabled' : '';
            }
        }).on('changeDate.datepicker.amui', function (event) {
            var nowTemp = new Date($('#endTime').val());
            if (nowTemp <= new Date($('#startTime').val())) {
                $('#endTime').val("");
                toastr.error("结束日期必须大于起始日期");
            }
            $(this).datepicker('close');
        });
    }

    $(document).ready(function () {
        init();
        loadData();
    })

</script>
</body>
</html>
