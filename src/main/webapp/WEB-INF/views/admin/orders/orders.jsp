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
                <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">订单管理</strong> /
                    <small>Order</small>
                </div>
            </div>

            <hr>

            <div class="am-g">
                <div class="am-u-sm-12 am-u-md-3">
                    <div class="am-form-group">
                        <select id="parentSelect" data-am-selected="{btnSize: 'sm'}">
                            <option value="-1">所有状态</option>
                            <option value="0">未付款</option>
                            <option value="1">待发货</option>
                            <option value="2">待收货</option>
                            <option value="3">待评价</option>
                            <option value="4">已完成</option>
                        </select>
                    </div>
                </div>
                <div class="am-u-sm-12 am-u-md-3">
                    <input id="startTime" type="text" class="am-form-field" placeholder="设置起始时间"
                           data-am-datepicker readonly/>
                </div>
                <div class="am-u-sm-12 am-u-md-3 ">
                    <input id="endTime" type="text" class="am-form-field" placeholder="设置结束时间"
                           data-am-datepicker readonly/>
                </div>
                <div class="am-u-sm-12 am-u-md-3">
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


    <div id="DetailWin" class="easyui-window" title="订单详情" data-options="iconCls:'icon-save',closed:true"
         style="width:60%;height:80%;padding:5px;">
        <div class="easyui-layout" data-options="fit:true">
            <div data-options="region:'center'" class="am-panel-group" style="padding:10px;">
                <input id="detail-id" type="text" style="display: none"/>
                <div class="am-panel am-panel-default">
                    <div class="am-panel-hd">用户信息</div>
                    <div class="am-g am-panel-bd">
                        <div class="am-u-sm-6">手机号:<span class="am-margin-left-sm" id="detail-mobile"></span></div>
                        <div class="am-u-sm-6 am-u-end">用户名:<span class="am-margin-left-sm" id="detail-username"></span>
                        </div>
                    </div>
                </div>
                <div class="am-panel am-panel-default">
                    <div class="am-panel-hd">订单信息</div>
                    <div class="am-g am-panel-bd">
                        <div class="am-u-sm-6">
                            订单SN:<span class="am-margin-left-sm" id="detail-sn"></span></div>
                        <div class="am-u-sm-6 am-u-end">状态:<span class="am-margin-left-sm" id="detail-state"></span>
                        </div>
                        <div class="am-u-sm-6">总价:<span class="am-margin-left-sm" id="detail-total"></span></div>
                        <div class="am-u-sm-6 am-u-end">实付:<span class="am-margin-left-sm" id="detail-rtotal"></span>
                        </div>
                        <div class="am-u-sm-6">创建时间:<span class="am-margin-left-sm" id="detail-ctime"></span></div>
                        <div class="am-u-sm-6">支付时间:<span class="am-margin-left-sm" id="detail-ptime"></span></div>
                        <div class="am-u-sm-6">物流公司:<span class="am-margin-left-sm" id="detail-dcom"></span></div>
                        <div class="am-u-sm-6 am-u-end">物流号:<span class="am-margin-left-sm" id="detail-dno"></span>
                        </div>
                        <div class="am-u-sm-12">发货时间:<span class="am-margin-left-sm" id="detail-dtime"></span></div>
                    </div>
                </div>
                <div class="am-panel am-panel-default">
                    <div class="am-panel-hd">地址信息</div>
                    <div class="am-g am-panel-bd">
                        <div class="am-u-sm-6">
                            收件人:<span class="am-margin-left-sm" id="detail-address-name"></span></div>
                        <div class="am-u-sm-6 am-u-end">电话:<span class="am-margin-left-sm"
                                                                 id="detail-address-mobile"></span></div>
                        <div class="am-u-sm-12">省市区:<span class="am-margin-left-sm" id="detail-address-pca"></span>
                        </div>
                        <div class="am-u-sm-12">详细地址:<span class="am-margin-left-sm" id="detail-address-detail"></span>
                        </div>
                    </div>
                </div>
                <%--<div class="am-panel am-panel-default">--%>
                <%--<div class="am-panel-hd">优惠券信息</div>--%>
                <%--<div class="am-g am-panel-bd">--%>
                <%--<div class="am-u-sm-6">--%>
                <%--优惠券标题:<span class="am-margin-left-sm" id="detailOrderId"></span></div>--%>
                <%--<div class="am-u-sm-6 am-u-end">用户ID:<span class="am-margin-left-sm" id="detailUserId"></span></div>--%>
                <%--<div class="am-u-sm-6">用户名:<span class="am-margin-left-sm" id="detailUserName"></span></div>--%>
                <%--<div class="am-u-sm-6 am-u-end">用户电话:<span  class="am-margin-left-sm" id="detailUserPhone"></span></div>--%>
                <%--<div class="am-u-sm-6">创建时间:<span class="am-margin-left-sm" id="detailOrderCreated"></span></div>--%>
                <%--<div class="am-u-sm-6 am-u-end">发货时间:<span class="am-margin-left-sm" id="detailOrderUpdated"></span></div>--%>
                <%--</div>--%>
                <%--</div>--%>
                <div class="am-panel am-panel-default">
                    <div class="am-panel-hd">
                        <h3 class="am-panel-title">订单商品</h3>
                    </div>
                    <div class="am-g am-panel-bd">
                        <div data-am-widget="list_news" class="am-list-news am-list-news-default">
                            <div class="am-list-news-bd">
                                <ul id="detail-goods" class="am-list">
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div data-options="region:'south',border:false" style="text-align:center;padding:5px 0 0;">
            <a id="add-ok" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)"
               style="width:80px">确认</a>
            <a id="add-cancel" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
               href="javascript:void(0)" style="width:80px">取消</a>
        </div>
    </div>
</div>


<script type="text/javascript">
    (function () {
        var prefix = "${pageContext.request.contextPath}"

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
                url: prefix + "/admin/orders/ordersList",
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

        var orderFilterForm = {
            sn: null,
            state: null,
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

        $('#table').find('tbody').on("click", "tr .editor", function () {
            var tr = $(this).parents("tr");
            var oData = table.row(tr).data();
            console.log(oData);
            $('#DetailWin').window('open');
            if ($('#detail-id').val() != oData.id) {
                $.ajax({
                    type: "GET",
                    url: prefix + "/admin/orders/detail/" + oData.id,
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
                        url: prefix + "/admin/goods/del/",
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

    })();
</script>
</html>
