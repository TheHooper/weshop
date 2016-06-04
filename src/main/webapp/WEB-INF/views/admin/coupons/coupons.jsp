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
                            <button type="button" class="am-btn am-btn-default"
                                    onclick="$('#batchSendWin').window('open');"><span class="am-icon-send-o"></span>批量发送
                            </button>
                            <button type="button" class="am-btn am-btn-default"><span class="am-icon-send"></span>单个发送
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
                            <th data-field="sn" class="table-title">流水号</th>
                            <th data-field="logo" class="table-title">主图</th>
                            <th data-field="typeName" class="table-type">商品数量</th>
                            <th data-field="typeName" class="table-type">金额</th>
                            <th data-field="typeName" class="table-type">实付</th>
                            <th data-field="cTime" class="table-author am-hide-sm-only">创建时间</th>
                            <th data-field="uTime" class="table-date am-hide-sm-only">状态</th>
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
                            <label for="doc-ipt-email-1">券名</label>
                            <input type="email" class="" id="doc-ipt-email-1" placeholder="输入优惠券标题">
                        </div>

                        <div class="am-form-group">
                            <label for="doc-ipt-pwd-1">面额</label>
                            <input type="password" class="" id="doc-ipt-pwd-1" placeholder="输入优惠券面额">
                        </div>

                        <div class="am-form-group">
                            <label for="doc-ipt-pwd-1">使用门槛</label>
                            <input type="password" class="" id="doc-ipt-pwd-1" placeholder="使用门槛">
                        </div>

                        <div class="am-form-group">
                            <label for="doc-ipt-pwd-1">有效天数</label>
                            <input type="password" class="" id="doc-ipt-pwd-1" placeholder="用户领取后有效天数">
                        </div>

                        <div class="am-form-group">
                            <label for="doc-ipt-pwd-1">券数量</label>
                            <input type="password" class="" id="doc-ipt-pwd-1" placeholder="优惠券数量">
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
                <a id="add-ok" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)"
                   style="width:80px">确认</a>
                <a id="add-cancel" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
                   href="javascript:void(0)" style="width:80px">取消</a>
            </div>
        </div>
    </div>

    <div id="batchSendWin" class="easyui-window" title="批量发送优惠券" data-options="iconCls:'icon-save',closed:true"
         style="width:100%;height:100%;padding:5px;">
        <div class="easyui-layout" data-options="fit:true">
            <div data-options="region:'center'" class="am-panel-group " style="padding:10px;">
                <table class="easyui-datagrid" style="width:100%;height:250px"
                       data-options="url:'datagrid_data.json',fitColumns:true,singleSelect:true">
                    <thead>
                    <tr>
                        <th data-options="field:'code',width:100">id</th>
                        <th data-options="field:'name',width:100">优惠券名</th>
                        <th data-options="field:'price',width:100,align:'right'">面额</th>
                        <th data-options="field:'price',width:100,align:'right'">门槛</th>
                        <th data-options="field:'price',width:100,align:'right'">数量</th>
                    </tr>
                    </thead>
                </table>
                <div class="form-group am-margin-top-xl">
                    <label class="col-sm-2 control-label">发放规则:</label>
                    <div class="col-sm-8 ">
                        <select id="pushSelector"
                                data-am-selected="{btnWidth: '100%', btnSize: 'sm', btnStyle: 'secondary',dropUp: 0}">
                            <optgroup label="成交量">
                                <option value="orderCountDesc">用户成交量降序</option>
                                <option value="orderCountAsc">用户成交量升序</option>
                            </optgroup>
                            <optgroup label="成交额">
                                <option value="costSumDesc">用户成交额降序</option>
                                <option value="costSumAsc">用户成交额升序</option>
                            </optgroup>
                            <optgroup label="注册时间">
                                <option value="registerDateDesc">用户注册时间降序</option>
                                <option value="registerDateAsc">用户注册时间升序</option>
                            </optgroup>
                        </select>
                    </div>
                </div>
            </div>
            <div data-options="region:'south',border:false" style="text-align:center;margin-bottom: 15px">
                <a id="add-ok" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)"
                   style="width:80px">确认</a>
                <a id="add-cancel" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
                   href="javascript:void(0)" style="width:80px">取消</a>
            </div>
        </div>
    </div>

    <link rel="stylesheet" href="<c:url value="${pageContext.request.contextPath}/h/css/tag/tagsinput.css"/>">
    <script src="<c:url value="${pageContext.request.contextPath}/h/js/tag/tagsinput.js"/>"></script>
    <link rel="stylesheet"
          href="<c:url value="${pageContext.request.contextPath}/h/admin/css/easyui/themes/metro/datagrid.css"/>"></link>
    <link rel="stylesheet"
          href="<c:url value="${pageContext.request.contextPath}/h/admin/css/easyui/themes/metro/pagination.css"/>"></link>
    <script src="<c:url value="${pageContext.request.contextPath}/h/admin/js/easyui/plugins/jquery.pagination.js"/>"></script>
    <script src="<c:url value="${pageContext.request.contextPath}/h/admin/js/easyui/plugins/jquery.datagrid.js"/>"></script>
    <script type="text/javascript">
        (function () {
            var prefix = "${pageContext.request.scheme}" + "://" + "${pageContext.request.serverName}" + ":" + "${pageContext.request.localPort}" + "/";

            var statusEnum = new Array(
                    '<span class="am-badge am-badge-danger">待付款</span>',
                    '<span class="am-badge am-badge-warning">待发货</span>',
                    '<span class="am-badge am-badge-primary">待收货</span>',
                    '<span class="am-badge am-badge-secondary">待评价</span>',
                    '<span class="am-badge am-badge-success">已完成</span>'
            )


            var loadSelectBox = function () {
                $('#add-parent').html("");
//                $("#editor-parent").html("");
                var allOp = '<option value="0">所有类别</option>';
                $("#add-parent").append(allOp);
//                $("#editor-parent").append(allOp);
                $.ajax({
                    type: "GET",
                    url: prefix + "/h/admin/cat/roots",
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
                    ids.push(idStr[1]);
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


            function praseDate(time) {
                if (time == "") {
                    return 0;
                }
                var nowTemp = new Date(time);
                return new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0).getTime();
            }

            var table = $('#table').DataTable({
                ajax: {
                    url: prefix + "/h/admin/orders/ordersList",
                    type: "GET"
                },
                autoWidth: false,
                columns: [
                    {
                        "data": "sn",
                        "orderable": false,
                        "width": "15%"
                    },
                    {
                        "data": "orderPic",
                        "width": "15%"
                    },
                    {
                        "data": "goodsNum",
                        "width": "10%"
                    },
                    {
                        "data": "totalAndDelivery",
                        "width": "10%"
                    },
                    {
                        "data": "rTotal",
                        "width": "10%"
                    },
                    {
                        "data": "cTime",
                        "width": "15%"
                    },
                    {
                        "data": "status",
                        "width": "10%"
                    },
                    {
                        "data": "id",
                        "width": "15%"
                    }
                ],
                "columnDefs": [
                    {
                        "render": function (data, type, row, meta) {
                            if (data != null && typeof(data) != "undefined") {
                                return '<img src="' + data + '" width="60px" height="60px"/>';
                            } else {
                                return '<img src="" width="60px" height="60px"/>';
                            }
                        },
                        "targets": 1
                    }, {
                        "render": function (data, type, row, meta) {
                            return statusEnum[data]
                        },
                        "targets": 6
                    },
                    {
                        "render": function (data, type, row, meta) {
                            return '<div class="am-btn-toolbar">' +
                                    '<div class="am-btn-group am-btn-group-xs">' +
                                    '<button value="' + data + '" class="am-btn am-btn-default am-btn-xs am-text-secondary editor"><span class="am-icon-eye"></span>详情</button>' +
                                    '<button value="' + data + '" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only del"><span class="am-icon-trash-o"></span> 删除</button>' +
                                    '</div>' +
                                    '</div>';
                        },
                        "targets": 7
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
                var reloadObj = table.ajax.url(prefix + "/h/admin/orders/ordersList" + url);
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
                var reloadObj = table.ajax.url(prefix + "/h/admin/orders/ordersList" + url);
                reloadObj.load();
                table.draw();
            })

            $('#table').find('tbody').on("click", "tr .editor", function () {
                var tr = $(this).parents("tr");
                var oData = table.row(tr).data();
                console.log(oData);
                $('#DetailWin').window('open');
                if ($('#detail-id').val() != oData.id) {
                    $.ajax({
                        type: "GET",
                        url: prefix + "/h/admin/orders/detail/" + oData.id,
                        data: {},
                        contentType: "application/x-www-form-urlencoded; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            if (typeof (data.code) == "undefined") {
                                console.log(data);
                                $("#detail-id").val(data.order.id);

                                $("#detail-mobile").text(data.user.mobile);
                                $("#detail-username").text(data.user.name);

                                $("#detail-sn").text(data.order.sn);
                                $("#detail-state").text(oData.statusStr);
                                $("#detail-total").text(data.order.totalAndDelivery);
                                $("#detail-rtotal").text(data.order.rTotal);
                                $("#detail-ctime").text(oData.cTime);
                                $("#detail-ptime").text(oData.pTime);
                                $("#detail-dcom").text(data.order.deliveryCom);
                                $("#detail-dno").text(data.order.deliveryNo);
                                $("#detail-dtime").text(oData.deliveryTime);

                                $("#detail-address-name").text(data.address.name);
                                $("#detail-address-mobile").text(data.address.mobile);
                                $("#detail-address-pca").text(data.address.province + "," + data.address.city + "," + data.address.area);
                                $("#detail-address-detail").text(data.address.detail);

                                $("#detail-goods").html("");
                                if (data.orderGoodses != null) {
                                    $(data.orderGoodses).each(function (i, e) {
                                        var li = getGoodsViewLi(e);
                                        $("#detail-goods").append($(li));
                                    })
                                }
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
                $.messager.confirm('删除商品', '确认删除该订单?', function (r) {
                    if (r) {
                        $.ajax({
                            type: "POST",
                            url: prefix + "/h/admin/goods/del/",
                            data: {goodsId: id},
                            contentType: "application/x-www-form-urlencoded; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                if (data.code == "0") {
                                    $.messager.show({
                                        title: '删除',
                                        msg: '已删除商品.！',
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
            function getGoodsViewLi(goods) {
                var li = '<li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left">'
                        + '<div class="am-u-sm-2 am-list-thumb">'
                        + '<img src="' + goods.goodsPic + '" width="80px" height="80px"/>'
                        + '</div>'
                        + '<div class=" am-u-sm-10  am-list-main">'
                        + '<h3 class="am-list-item-hd am-text-primary">' + goods.goodsTitle + '</h3>'
                        + '<div class="am-list-item-text">'
                        + '<span>' + goods.salesAttr + '</span>'
                        + '</div>'
                        + '<div class="am-list-item-text">'
                        + '<span>x ' + goods.num + '</span>'
                        + '&nbsp;&nbsp;&nbsp;&yen;<span>' + goods.price + '</span>'
                        + '</div>'
                        + '<div class="am-list-item-text">'
                        + '&yen;<span>' + (parseInt(goods.price) * parseInt(goods.num)) + '</span>'
                        + '</div>'
                        + '</div>'
                        + '</li>'
                return li;
            }

//
//            $(result.aaData).each(function(i,e) {
//                if (i == 0) {
//                    registerCouponId =  e.id.toString();
//                }else{
//                    registerCouponId = registerCouponId + "," + e.id;
//                }
//                var tag = "id:"+ e.id+";"+ e.title;
//                if (!$('#register_type_tag').tagExist(tag)) {
//                    var b = $('#register_type_tag').val() + "," + tag;
//                    $('#register_type_tag').importTags(b);
//                }
//            });
//        }
//        $("#register_type_tag").addClass("init");
//            //tag val


        })();
    </script>
</html>
