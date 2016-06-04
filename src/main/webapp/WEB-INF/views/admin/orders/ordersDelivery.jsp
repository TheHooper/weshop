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
    <title>HOMALL | 订单发货 </title>
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
                <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">订单发货</strong> /
                    <small>Order</small>
                </div>
            </div>

            <hr>

            <div class="am-g">
                <div class="am-u-sm-12 am-u-md-4">
                    <input id="startTime" type="text" class="am-form-field" placeholder="设置起始时间"
                           data-am-datepicker readonly/>
                </div>
                <div class="am-u-sm-12 am-u-md-4">
                    <input id="endTime" type="text" class="am-form-field" placeholder="设置结束时间"
                           data-am-datepicker readonly/>
                </div>
                <div class="am-u-sm-12 am-u-md-4">
                    <div class="am-input-group am-input-group-sm">
                        <input id="search-input" type="text" class="am-form-field" placeholder="订单流水号SN">
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


    <div id="DetailWin" class="easyui-window" title="订单发货" data-options="iconCls:'icon-save',closed:true"
         style="width:60%;height:80%;padding:5px;">
        <div class="easyui-layout" data-options="fit:true">
            <div data-options="region:'center'" style="padding:10px;">
                <input id="detail-id" type="text" style="display: none"/>
                <div class="am-form">
                    <div class="am-form-group">
                        <label for="detail-dcom">物流公司</label>
                        <input type="text" class="" id="detail-dcom" placeholder="输入物流公司">
                    </div>

                    <div class="am-form-group">
                        <label for="detail-dno">物流单号</label>
                        <input type="text" class="" id="detail-dno" placeholder="输入物流单号">
                    </div>
                </div>
            </div>
            <div data-options="region:'south',border:false" style="text-align:center;padding:15px 0 0;">
                <a id="Detail-ok" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)"
                   style="width:80px">确认</a>
                <a id="Detail-cancel" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
                   href="javascript:void(0)" style="width:80px">取消</a>
            </div>
        </div>
    </div>


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

            function praseDate(time) {
                if (time == "") {
                    return 0;
                }
                var nowTemp = new Date(time);
                return new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0).getTime();
            }

            var table = $('#table').DataTable({
                ajax: {
                    url: prefix + "/h/admin/orders/ordersList?state=1",
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
                                    '<button value="' + data + '" class="am-btn am-btn-default am-btn-xs am-text-secondary editor"><span class="am-icon-send"></span>发货</button>' +
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

            var orderFilterForm = {
                sn: null,
                state: 1,
                startTime: null,
                endTime: null
            }

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
                    $('#detail-id').val(oData.id);
                }
            });
            $("#Detail-ok").on("click", function () {
                $.messager.confirm('订单发货', '确认发货?', function (r) {
                    if (r) {
                        var dForm = {
                            orderId: $('#detail-id').val(),
                            deliveryCom: $("#detail-dcom").val(),
                            deliveryNo: $("#detail-dno").val()
                        }
                        $.ajax({
                            type: "POST",
                            url: prefix + "/h/admin/orders/ordersDelivery",
                            data: dForm,
                            contentType: "application/x-www-form-urlencoded; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                if (data.code == "0") {
                                    $('#DetailWin').window('close');
                                    table.ajax.reload();
                                    $.messager.show({
                                        title: '发货成功',
                                        msg: '已发货，并短信通知用户.！',
                                        timeout: 2000,
                                        showType: 'fade',
                                        style: {
                                            right: '',
                                            top: document.body.scrollTop + document.documentElement.scrollTop,
                                            bottom: ''
                                        }
                                    });
                                } else {
                                    $.messager.show({
                                        title: '出状况了',
                                        msg: data.msg,
                                        timeout: 10000,
                                        showType: 'fade',
                                        style: {
                                            right: '',
                                            top: document.body.scrollTop + document.documentElement.scrollTop,
                                            bottom: ''
                                        }
                                    });
                                }
                            },
                            error: function (msg) {
                                alert(msg);
                            }
                        })
                    }
                })
            })
            $("#Detail-cancel").on("click", function () {
                $('#DetailWin').window('close');
            })

        })();
    </script>
</html>
