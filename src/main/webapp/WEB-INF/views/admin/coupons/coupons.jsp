<%--
  Created by IntelliJ IDEA.
  User: 47123
  Date: 2016/5/13
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <meta name="renderer" content="webkit">
    <title>HOMALL | 订单管理 </title>
    <meta name="description" content="">
    <jsp:include page="/WEB-INF/views/admin/comp/header.include.in.jsp"/>
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/comp/header.jsp"/>
<div class="am-cf admin-main">

    <!-- sidebar start -->
    <jsp:include page="/WEB-INF/views/admin/comp/siderbar.jsp"/>
    <!-- sidebar end -->

    <!-- content start -->
    <div class="admin-content">
        <div class="admin-content-body">
            <div class="am-cf am-padding am-padding-bottom-0">
                <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">优惠券管理</strong> /
                    <small>Coupon</small>
                </div>
            </div>

            <hr>

            <div class="am-g">
                <div class="am-u-sm-12 am-u-md-4">
                    <div class="am-btn-toolbar">
                        <div class="am-btn-group am-btn-group-xs">
                            <button type="button" class="am-btn am-btn-default" onclick="$('#addWin').window('open');">
                                <span class="am-icon-plus"></span>新增优惠券
                            </button>
                            <button id="batch-send-btn" type="button" class="am-btn am-btn-default"
                            ><span class="am-icon-send-o"></span>批量发送
                            </button>
                            <button id="send-btn" type="button" class="am-btn am-btn-default"
                            ><span class="am-icon-send"></span>单个发送
                            </button>
                        </div>
                    </div>
                </div>
                <div class="am-u-md-4">
                    &nbsp;
                </div>
                <div class="am-u-sm-12 am-u-md-4">
                    <div class="am-input-group am-input-group-sm">
                        <input id="search-input" type="text" class="am-form-field" placeholder="优惠券标题">
                          <span class="am-input-group-btn">
                            <button id="search-btn" class="am-btn am-btn-default" type="button">查询</button>
                          </span>
                    </div>
                </div>
            </div>


            <div class="am-g">
                <div class="am-u-sm-12">
                    <table id="table" class="am-table am-table-striped am-table-hover table-main">
                        <thead>
                        <tr>
                            <th data-field="sn" class="table-title">id</th>
                            <th data-field="logo" class="table-title">券名</th>
                            <th data-field="typeName" class="table-type">面额</th>
                            <th data-field="typeName" class="table-type">门槛</th>
                            <th data-field="typeName" class="table-type">有效时长</th>
                            <th data-field="cTime" class="table-author am-hide-sm-only">数量</th>
                            <th data-field="isDel" class="table-set">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- footer start -->
            <jsp:include page="/WEB-INF/views/admin/comp/footer.jsp"/>
            <!-- footer end -->

        </div>
    </div>


    <div id="addWin" class="easyui-window" title="新增优惠券" data-options="iconCls:'icon-save',closed:true"
         style="width:100%;height:100%;padding:5px;">
        <div class="easyui-layout" data-options="fit:true">
            <div data-options="region:'center'" class="am-panel-group" style="padding:10px 0px 0px 10px;">
                <form class="am-form">
                    <fieldset>
                        <legend>新增优惠券</legend>

                        <div class="am-form-group">
                            <label for="add-title">券名</label>
                            <input type="text" class="" id="add-title" placeholder="输入优惠券标题">
                        </div>

                        <div class="am-form-group">
                            <label for="add-price">面额</label>
                            <input type="text" class="" id="add-price" placeholder="输入优惠券面额">
                        </div>

                        <div class="am-form-group">
                            <label for="add-threshold">使用门槛</label>
                            <input type="text" class="" id="add-threshold" placeholder="使用门槛">
                        </div>

                        <div class="am-form-group">
                            <label for="add-limitDays">有效天数</label>
                            <input type="text" class="" id="add-limitDays" placeholder="用户领取后有效天数">
                        </div>

                        <div class="am-form-group">
                            <label for="add-num">券数量</label>
                            <input type="text" class="" id="add-num" placeholder="优惠券数量">
                        </div>

                        <div class="am-form-group am-g am-g-collapse">
                            <div class="am-u-sm-4">
                                <select id="add-parent">
                                    <option value="option1">选项一...</option>
                                    <option value="option2">选项二.....</option>
                                    <option value="option3">选项三........</option>
                                </select>
                                <span class="am-form-caret"></span>
                            </div>
                            <div class="am-u-sm-2 am-u-end am-margin-left-sm">
                                <button id="add-cats-btn" type="button" class="am-btn am-btn-primary"><span
                                        class="am-icon-plus"></span>加入适用类别
                                </button>
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="doc-ta-1">优惠券适用范围</label>
                            <textarea id="add-cats" class="" rows="5" id="doc-ta-1"></textarea>
                        </div>

                    </fieldset>
                </form>
            </div>
            <div data-options="region:'south',border:false" style="text-align:center;margin-bottom: 15px">
                <a id="add-coupon-ok" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
                   href="javascript:void(0)"
                   style="width:80px">确认</a>
                <a id="add-coupon-cancel" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
                   href="javascript:void(0)" style="width:80px">取消</a>
            </div>
        </div>
    </div>


    <div id="DetailWin" class="easyui-window" title="详情优惠券" data-options="iconCls:'icon-save',closed:true"
         style="width:100%;height:100%;padding:5px;">
        <div class="easyui-layout" data-options="fit:true">
            <div data-options="region:'center'" class="am-panel-group" style="padding:10px 0px 0px 10px;">
                <form id="detailChart-parent" class="am-form">
                    <fieldset>
                        <legend>优惠券详情</legend>
                        <input type="text" id="detail-id" style="display: none"/>
                        <div class="am-form-group">
                            <label for="editor-title">券名</label>
                            <input type="text" class="" id="editor-title" disabled placeholder="输入优惠券标题">
                        </div>

                        <div class="am-form-group">
                            <label for="editor-price">面额</label>
                            <input type="text" class="" id="editor-price" disabled placeholder="输入优惠券面额">
                        </div>

                        <div class="am-form-group">
                            <label for="editor-threshold">使用门槛</label>
                            <input type="text" class="" id="editor-threshold" disabled placeholder="使用门槛">
                        </div>

                        <div class="am-form-group">
                            <label for="editor-limitDays">有效天数</label>
                            <input type="text" class="" id="editor-limitDays" disabled placeholder="用户领取后有效天数">
                        </div>

                        <div class="am-form-group">
                            <label for="editor-num">券数量</label>
                            <input type="number" class="" id="editor-num" disabled placeholder="优惠券数量">
                        </div>

                        <div class="am-form-group">
                            <label for="editor-cats">优惠券适用范围</label>
                            <textarea id="editor-cats" class="" rows="5"></textarea>
                        </div>
                    </fieldset>
                </form>
                <canvas width="120" height="40" id="detailChart"></canvas>
            </div>
            <div data-options="region:'south',border:false" style="text-align:center;margin-bottom: 15px">
                <a id="editor-coupon-ok" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
                   href="javascript:void(0)"
                   style="width:80px">确认</a>
                <a id="editor-coupon-cancel" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
                   href="javascript:void(0)" style="width:80px">取消</a>
            </div>
        </div>
    </div>

    <div id="batchSendWin" class="easyui-window" title="批量发送优惠券" data-options="iconCls:'icon-save',closed:true"
         style="width:100%;height:100%;padding:5px;">
        <div class="easyui-layout" data-options="fit:true">
            <div data-options="region:'center'" class="am-panel-group " style="padding:10px;">
                <table id="batch-send-table" class="easyui-datagrid" style="width:100%;height:250px"
                       data-options="url:'',pagination:true , fitColumns:true,singleSelect:true">
                    <thead>
                    <tr>
                        <th data-options="field:'id',width:100,formatter:couponBatchFormatter">id</th>
                        <th data-options="field:'title',width:100">优惠券名</th>
                        <th data-options="field:'price',width:100,align:'right'">面额</th>
                        <th data-options="field:'threshold',width:100,align:'right'">门槛</th>
                        <th data-options="field:'num',width:100,align:'right'">数量</th>
                    </tr>
                    </thead>
                </table>
                <div class="am-form  am-margin-top-xl">
                    <div class="am-form-group">
                        <label for="batch-send-num">发放数量</label>
                        <input type="number" class="" id="batch-send-num" placeholder="优惠券数量">
                    </div>
                </div>
                <div class="form-group am-margin-top-xl">
                    <label class="col-sm-2 control-label">发放规则:</label>
                    <div class="col-sm-8 ">
                        <select id="pushSelector"
                                data-am-selected="{btnWidth: '100%', btnSize: 'sm', btnStyle: 'secondary',dropUp: 0}">
                            <optgroup label="成交量">
                                <option value="0">用户成交量降序</option>
                                <option value="1">用户成交量升序</option>
                            </optgroup>
                            <optgroup label="成交额">
                                <option value="2">用户成交额降序</option>
                                <option value="3">用户成交额升序</option>
                            </optgroup>
                            <optgroup label="注册时间">
                                <option value="4">用户注册时间降序</option>
                                <option value="5">用户注册时间升序</option>
                            </optgroup>
                        </select>
                    </div>
                </div>
            </div>
            <div data-options="region:'south',border:false" style="text-align:center;margin-bottom: 15px">
                <a id="send-batch-ok" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
                   href="javascript:void(0)"
                   style="width:80px">确认</a>
                <a id="send-batch-cancel" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
                   href="javascript:void(0)" style="width:80px">取消</a>
            </div>
        </div>
    </div>

    <div id="sendWin" class="easyui-window" title="定点发送优惠券" data-options="iconCls:'icon-save',closed:true"
         style="width:100%;height:100%;padding:5px;">
        <div class="easyui-layout" data-options="fit:true">
            <div data-options="region:'center'" class="am-panel-group " style="padding:10px;">
                <table id="send-coupon-table" class="easyui-datagrid" style="width:100%;height:250px"
                       data-options="url:'',pagination:true , fitColumns:true,singleSelect:true">
                    <thead>
                    <tr>
                        <th data-options="field:'id',width:100,formatter:couponFormatter">id</th>
                        <th data-options="field:'title',width:100">优惠券名</th>
                        <th data-options="field:'price',width:100,align:'right'">面额</th>
                        <th data-options="field:'threshold',width:100,align:'right'">门槛</th>
                        <th data-options="field:'num',width:100,align:'right'">数量</th>
                    </tr>
                    </thead>
                </table>
                <table id="send-user-table" class="easyui-datagrid" style="width:100%;height:250px"
                       data-options="url:'',pagination:true , fitColumns:true,singleSelect:true,toolbar:'#tb'">
                    <thead>
                    <tr>
                        <th data-options="field:'id',width:100,formatter:userFormatter">id</th>
                        <th data-options="field:'userName',width:60">用户名</th>
                        <th data-options="field:'mobile',width:100,align:'right'">手机号</th>
                        <th data-options="field:'cTime',width:100,align:'right'">注册时间</th>
                    </tr>
                    </thead>
                </table>
                <div id="tb" style="padding:5px;height:auto">
                    <div>
                        <label for="send-user-name">用户名</label>
                        <input type="text" class="" id="send-user-name" placeholder="搜索用户名">
                        <label for="send-user-mobile">手机号</label>
                        <input type="text" class="" id="send-user-mobile" placeholder="搜索手机号">
                        <a id="send-search" href="javascript:void (0)" class="easyui-linkbutton"
                           iconCls="am-icon-search">搜索</a>
                    </div>
                </div>
                <div class="am-form">
                    <div class="am-form-group">
                        <label for="send-user-tag">已选用户</label>
                        <textarea id="send-user-tag" class="" rows="5"></textarea>
                    </div>
                </div>
            </div>
            <div data-options="region:'south',border:false" style="text-align:center;margin-bottom: 15px">
                <a id="send-ok" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)"
                   style="width:80px">确认</a>
                <a id="send-cancel" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
                   href="javascript:void(0)" style="width:80px">取消</a>
            </div>
        </div>
    </div>

    <link rel="stylesheet" href="<c:url value="../css/tag/tagsinput.css"/>">
    <script src="<c:url value="../js/tag/tagsinput.js"/>"></script>
    <link rel="stylesheet"
          href="<c:url value="../css/easyui/themes/metro/datagrid.css"/>"/>
    <link rel="stylesheet"
          href="<c:url value="../css/easyui/themes/metro/linkbutton.css"/>"/>
    <link rel="stylesheet"
          href="<c:url value="../css/easyui/themes/metro/pagination.css"/>"/>
    <script src="<c:url value="../js/easyui/plugins/jquery.linkbutton.js"/>"></script>
    <script src="<c:url value="../js/easyui/plugins/jquery.pagination.js"/>"></script>
    <script src="<c:url value="../js/easyui/plugins/jquery.datagrid.js"/>"></script>
    <script src="<c:url value="../js/chart/Chart.js"/>"></script>
    <script type="text/javascript">
        function couponBatchFormatter(value, row, index) {
            return "<input type='radio' class='couponBatchRadio' value='" + value + "' />";
        }
        function couponFormatter(value, row, index) {
            return "<input type='radio' class='couponRadio' value='" + value + "' />";
        }
        function userFormatter(value, row, index) {
            return "<input type='checkbox' class='userCheckBox' mobile='" + row.mobile + "' value='" + value + "' />";
        }

        (function () {
            var prefix = "${pageContext.request.contextPath}"

            var statusEnum = new Array(
                    '<span class="am-badge am-badge-danger">待付款</span>',
                    '<span class="am-badge am-badge-warning">待发货</span>',
                    '<span class="am-badge am-badge-primary">待收货</span>',
                    '<span class="am-badge am-badge-secondary">待评价</span>',
                    '<span class="am-badge am-badge-success">已完成</span>'
            )


            $("#batch-send-btn").click(function () {
                $("#batchSendWin").window('open');
                if (!$("#batch-send-table").hasClass("init")) {
                    $("#batch-send-table").datagrid({
                        url: '<c:url value="/admin/coupon/list"/>'
                    })
                    $("#batch-send-table").datagrid('reload');
                    $("#batch-send-table").addClass("init");
                }
            })

            $("#send-search").click(function () {
                var user = $("#send-user-name").val();
                var mobile = $("#send-user-mobile").val();
                var url;
                if (user != "" && typeof (user) != "undefined") {
                    url = "name=" + user;
                }
                if (mobile != "" && typeof (mobile) != "undefined") {
                    if (url != "" && typeof (url) != "undefined") {
                        url = url + "&mobile=" + mobile
                    } else {
                        url = "mobile=" + mobile;
                    }
                }
                $("#send-user-table").datagrid({
                    url: prefix + '/admin/coupon/user/list?' + url
                })
                $("#send-user-table").datagrid('reload');
            })

            $("#send-btn").click(function () {
                $("#sendWin").window('open');
                if (!$("#send-coupon-table").hasClass("init")) {
                    $("#send-coupon-table").datagrid({
                        url: '<c:url value="/admin/coupon/list"/>'
                    })
                    $("#send-coupon-table").datagrid('reload');
                    $("#send-coupon-table").addClass("init");
                }
                if (!$("#send-user-table").hasClass("init")) {
                    $("#send-user-table").datagrid({
                        url: '<c:url value="/admin/coupon/user/list"/>'
                    })
                    $("#send-user-table").datagrid('reload');
                    $("#send-user-table").addClass("init");
                }
            })

            var loadSelectBox = function () {
                $('#add-parent').html("");
//                $("#editor-parent").html("");
                var allOp = '<option value="0">所有类别</option>';
                $("#add-parent").append(allOp);
//                $("#editor-parent").append(allOp);
                $.ajax({
                    type: "GET",
                    url: prefix + "/admin/cat/roots",
                    data: {},
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (typeof (data.code) == "undefined") {
                            $(data).each(function (i, e) {
                                var op = '<option value="' + e.id + '">' + e.typeName + '</option>';
                                $('#add-parent').append(op);
//                                $("#editor-parent").append(op);
                            });
                        }
                    },
                    error: function (msg) {
                        alert(msg);
                    }
                })
            }
            loadSelectBox();

            $('#add-cats').tagsInput({
                width: 'auto',
                defaultText: '',
                'interactive': true,
            });
            var addCatsTagValue = "";
            function addTag(tagValue) {
                if (!$("#add-cats").tagExist(tagValue)) {
                    if (addCatsTagValue != "") {
                        addCatsTagValue = $("#add-cats").val() + "," + tagValue;
                    } else {
                        addCatsTagValue = tagValue + ",";
                    }
                    $("#add-cats").importTags(addCatsTagValue);
                }
            }
            function getTagsInputId(tagsInput) {
                var ids = new Array;
                var tags = tagsInput.val().split(",");
                $.each(tags, function (i, e) {
                    var idStr = e.split(":");
                    ids.push(parseInt(idStr[1]));
                })
                return ids;
            }
            $("#add-cats-btn").click(function () {
                var selectValue = $("#add-parent").val();
                var selectText = $("#add-parent").find("option:selected").text();
                var tag = selectText + ":" + selectValue;
                addTag(tag);
                console.log(addCatsTagValue);
                console.log(getTagsInputId($("#add-cats")))
            })


            $('#send-user-tag').tagsInput({
                width: 'auto',
                defaultText: '',
                'interactive': true,
            });
            var sendTagValue = "";
            $(document).on("change", ".userCheckBox", function () {
                if ($(this).prop("checked")) {
                    var selectValue = $(this).val();
                    var selectText = $(this).attr("mobile");
                    var tag = selectText + ":" + selectValue;
                    if (!$("#send-user-tag").tagExist(tag)) {
                        if (sendTagValue != "") {
                            sendTagValue = $("#send-user-tag").val() + "," + tag;
                        } else {
                            sendTagValue = tag + ",";
                        }
                        $("#send-user-tag").importTags(sendTagValue);
                    }
                } else {
                    var selectValue = $(this).val();
                    var selectText = $(this).attr("mobile");
                    var tag = selectText + ":" + selectValue;
                    if ($("#send-user-tag").tagExist(tag)) {
                        $("#send-user-tag").removeTag(tag);
                        sendTagValue = $("#send-user-tag").val();
                    }
                }
            })



            function praseDate(time) {
                if (time == "") {
                    return 0;
                }
                var nowTemp = new Date(time);
                return new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0).getTime();
            }

            var table = $('#table').DataTable({
                ajax: {
                    url: prefix + "/admin/coupon/list/dataTable",
                    type: "GET"
                },
                autoWidth: false,
                columns: [
                    {
                        "data": "id",
                        "orderable": false,
                        "width": "15%"
                    },
                    {
                        "data": "title",
                        "width": "15%"
                    },
                    {
                        "data": "price",
                        "width": "10%"
                    },
                    {
                        "data": "threshold",
                        "width": "10%"
                    },
                    {
                        "data": "limitDays",
                        "width": "10%"
                    },
                    {
                        "data": "num",
                        "width": "15%"
                    },
                    {
                        "data": "id",
                        "width": "15%"
                    }
                ],
                "columnDefs": [
                    {
                        "render": function (data, type, row, meta) {
                            return '<div class="am-btn-toolbar">' +
                                    '<div class="am-btn-group am-btn-group-xs">' +
                                    '<button value="' + data + '" class="am-btn am-btn-default am-btn-xs am-text-secondary editor"><span class="am-icon-eye"></span>详情</button>' +
                                    '<button value="' + data + '" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only del"><span class="am-icon-trash-o"></span> 删除</button>' +
                                    '</div>' +
                                    '</div>';
                        },
                        "targets": 6
                    }
                ],
                serverSide: true,
                pagingType: "full_numbers",
                searching: false,
//              ordering:false
            });

            function formToUrlParm(obj) {
                // 用来保存所有的属性名称和值
                var props = "?";
                // 开始遍历
                for (var p in obj) { // 方法
                    if (typeof ( obj [p]) == " function ") {
                        obj [p]();
                    } else { // p 为属性名称，obj[p]为对应属性的值
                        if (obj [p] != null) {
                            props += p + "=" + obj [p] + "&";
                        }
                    }
                } // 最后显示所有的属性
                props = props.substr(0, props.length - 1);
                return props
            }

            $('#parentSelect').on("change", function () {
                if ($('#parentSelect').val() != -1) {
                    orderFilterForm.state = $('#parentSelect').val();
                } else {
                    orderFilterForm.state = null;
                }
                var url = formToUrlParm(orderFilterForm);
                var reloadObj = table.ajax.url(prefix + "/admin/orders/ordersList" + url);
                reloadObj.load();
                table.draw();
            })


            $('#search-btn').on("click", function () {
                if ($("#endTime").val() != "") {
                    orderFilterForm.endTime = praseDate($("#endTime").val());
                }
                if ($("#startTime").val() != "") {
                    orderFilterForm.startTime = praseDate($("#startTime").val());
                }
                if ($("#search-input").val() != "") {
                    orderFilterForm.sn = $("#search-input").val();
                } else {
                    orderFilterForm.sn = null;
                }
                var url = formToUrlParm(orderFilterForm);
                console.log(url);
                var reloadObj = table.ajax.url(prefix + "/admin/orders/ordersList" + url);
                reloadObj.load();
                table.draw();
            })

            $("#add-coupon-ok").click(function () {
                $.messager.confirm('添加优惠券', '确认添加?', function (r) {
                    if (r) {
                        var title = $("#add-title").val();
                        var price = $("#add-price").val();
                        var threshold = $("#add-threshold").val();
                        var limitDays = $('#add-limitDays').val();
                        var num = $('#add-num').val();
                        var parentCatsId = getTagsInputId($("#add-cats"));
                        var couponAddForm = {
                            title: title,
                            price: price,
                            threshold: threshold,
                            limitDays: limitDays,
                            num: num,
                            parentCatsId: parentCatsId
                        }
                        $.ajax({
                            type: "POST",
                            url: prefix + "/admin/coupon/add/",
                            data: JSON.stringify(couponAddForm),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                if (data.code == "0") {
                                    $.messager.show({
                                        title: '新增操作',
                                        msg: '已成功添加.！',
                                        timeout: 2000,
                                        showType: 'fade',
                                        style: {
                                            right: '',
                                            top: document.body.scrollTop + document.documentElement.scrollTop,
                                            bottom: ''
                                        }
                                    });
                                    $("#addWin").window("close");
                                    table.ajax.reload();
                                }
                            },
                            error: function (msg) {
                                $.messager.show({
                                    title: '新增操作',
                                    msg: JSON.stringify(msg),
                                    showType: 'fade',
                                    style: {
                                        right: '',
                                        top: document.body.scrollTop + document.documentElement.scrollTop,
                                        bottom: ''
                                    }
                                });
                            }
                        })
                    }
                })

            });

            $("#send-ok").click(function () {
                $.messager.confirm('发送优惠券', '确认发送?', function (r) {
                    if (r) {
                        var couponId = $(".couponRadio:checked").val();
                        var userIds = getTagsInputId($("#send-user-tag"));
                        var couponSendForm = {
                            couponId: couponId,
                            userIds: userIds,
                        }
                        $.ajax({
                            type: "POST",
                            url: prefix + "/admin/coupon/send/",
                            data: JSON.stringify(couponSendForm),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                if (data.code == "0") {
                                    $.messager.show({
                                        title: '发送操作',
                                        msg: '已成功发送.！',
                                        timeout: 2000,
                                        showType: 'fade',
                                        style: {
                                            right: '',
                                            top: document.body.scrollTop + document.documentElement.scrollTop,
                                            bottom: ''
                                        }
                                    });
                                    $("#sendWin").window("close");
                                }
                            },
                            error: function (msg) {
                                $.messager.show({
                                    title: '发送操作',
                                    msg: JSON.stringify(msg),
                                    showType: 'fade',
                                    style: {
                                        right: '',
                                        top: document.body.scrollTop + document.documentElement.scrollTop,
                                        bottom: ''
                                    }
                                });
                            }
                        })
                    }
                })

            });
            $("#send-batch-ok").click(function () {
                $.messager.confirm('发送优惠券', '确认发送?', function (r) {
                    if (r) {
                        var couponId = $(".couponBatchRadio:checked").val();
                        var num = $("#batch-send-num").val();
                        var type = $("#pushSelector").val();
                        var couponSendForm = {
                            couponId: couponId,
                            sendType: type,
                            num: num,
                        }
                        $.ajax({
                            type: "POST",
                            url: prefix + "/admin/coupon/batchSend/",
                            data: couponSendForm,
                            contentType: "application/x-www-form-urlencoded; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                if (data.code == "0") {
                                    $.messager.show({
                                        title: '发送操作',
                                        msg: '已成功发送.！',
                                        timeout: 2000,
                                        showType: 'fade',
                                        style: {
                                            right: '',
                                            top: document.body.scrollTop + document.documentElement.scrollTop,
                                            bottom: ''
                                        }
                                    });
                                    $("#batchSendWin").window("close");
                                }
                            },
                            error: function (msg) {
                                $.messager.show({
                                    title: '发送操作',
                                    msg: JSON.stringify(msg),
                                    showType: 'fade',
                                    style: {
                                        right: '',
                                        top: document.body.scrollTop + document.documentElement.scrollTop,
                                        bottom: ''
                                    }
                                });
                            }
                        })
                    }
                })

            });

            var detailTagValue = "";
            $('#editor-cats').tagsInput({
                width: 'auto',
                defaultText: '',
                'interactive': false,
            });
            function deatilAddTag(tagValue) {
                if (!$("#editor-cats").tagExist(tagValue)) {
                    if (detailTagValue != "") {
                        detailTagValue = detailTagValue + "," + tagValue;
                    } else {
                        detailTagValue = tagValue + ",";
                    }
                    $("#editor-cats").importTags(detailTagValue);
                }
            }

            $('#table').find('tbody').on("click", "tr .editor", function () {
                var tr = $(this).parents("tr");
                var oData = table.row(tr).data();
                console.log(oData);
                $('#DetailWin').window('open');
                if ($('#detail-id').val() != oData.id) {
                    $("#editor-title").val(oData.title);
                    $("#editor-price").val(oData.price);
                    $("#editor-threshold").val(oData.threshold);
                    $('#editor-limitDays').val(oData.limitDays);
                    $('#editor-num').val(oData.num);
                    $("#editor-cats").removeTag(detailTagValue);
                    detailTagValue = "";
                    $.ajax({
                        type: "GET",
                        url: prefix + "/admin/coupon/cats/",
                        data: {couponId: oData.id},
                        contentType: "application/x-www-form-urlencoded; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            if (typeof (data.code) == "undefined") {
                                if (data.length == 0) {
                                    deatilAddTag("所有类别");
                                } else {
                                    $(data).each(function (i, e) {
                                        deatilAddTag(e.parentName);
                                    })
                                }

                            }
                        },
                        error: function (msg) {
                            alert(msg);
                            }
                    })
                    $('#detailChart').remove(); // this is my <canvas> element
                    $('#detailChart-parent').append('<canvas width="120" height="40" id="detailChart"></canvas>');
                    $.ajax({
                        type: "GET",
                        url: prefix + "/admin/coupon/counter/",
                        data: {couponId: oData.id},
                        contentType: "application/x-www-form-urlencoded; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            if (data.code == null) {
                                console.log(data);
                                var ctx = $("#detailChart");
                                var chart = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ["未使用", "已使用", "已过期"],
                                        datasets: [{
                                            label: '使用情况',
                                            data: [data.unuse, data.used, data.fade],
                                            backgroundColor: [
                                                'rgba(255, 99, 132, 0.2)',
                                                'rgba(54, 162, 235, 0.2)',
                                                'rgba(255, 206, 86, 0.2)',
                                                'rgba(75, 192, 192, 0.2)',
                                            ],
                                            borderColor: [
                                                'rgba(255,99,132,1)',
                                                'rgba(54, 162, 235, 1)',
                                                'rgba(255, 206, 86, 1)',
                                                'rgba(75, 192, 192, 1)',
                                            ],
                                            borderWidth: 1
                                        }]
                                    },
                                    options: {
                                        scales: {
                                            yAxes: [{
                                                ticks: {
                                                    beginAtZero: true
                                                }
                                            }]
                                        }
                                    }
                                });
                            }
                        },
                        error: function (msg) {
                            alert(msg);
                        }
                    })
                }
            });
            $('#table').find('tbody').on("click", "tr .del", function () {
                var tr = $(this).parents("tr");
                var data = table.row(tr).data();
                var id = data.id;
                $.messager.confirm('删除商品', '确认删除该优惠券?用户的优惠券也会消失', function (r) {
                    if (r) {
                        $.ajax({
                            type: "POST",
                            url: prefix + "/admin/coupon/del",
                            data: {couponId: id},
                            contentType: "application/x-www-form-urlencoded; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                if (data.code == "0") {
                                    $.messager.show({
                                        title: '删除',
                                        msg: '已删除优惠券.！',
                                        timeout: 2000,
                                        showType: 'fade',
                                        style: {
                                            right: '',
                                            top: document.body.scrollTop + document.documentElement.scrollTop,
                                            bottom: ''
                                        }
                                    });
                                    table.ajax.reload();
                                }
                            },
                            error: function (msg) {
                                alert(msg);
                            }
                        })
                    }
                });
            });

        })();
    </script>
</html>
