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
    <title>HOMALL | 评价管理 </title>
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
                <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">评价管理</strong> /
                    <small>Rate</small>
                </div>
            </div>

            <hr>

            <div class="am-g">
                <div class="am-u-sm-12 am-u-md-3">
                    <div class="am-form-group">
                        <select id="parentSelect" data-am-selected="{btnSize: 'sm'}">
                            <option value="-1">所有评价</option>
                            <option value="0">好评</option>
                            <option value="1">中评</option>
                            <option value="2">差评</option>
                        </select>
                    </div>
                </div>
                <div class="am-u-sm-12 am-u-md-3">
                    <input id="startTime" type="text" class="am-form-field" placeholder="设置起始时间"
                           data-am-datepicker/>
                </div>
                <div class="am-u-sm-12 am-u-md-3 ">
                    <input id="endTime" type="text" class="am-form-field" placeholder="设置结束时间"
                           data-am-datepicker/>
                </div>
                <div class="am-u-sm-12 am-u-md-3">
                          <span class="am-input-group-btn">
                            <button id="search-btn" class="am-btn am-btn-default" type="button">查询</button>
                          </span>
                </div>
            </div>


            <div class="am-g">
                <div class="am-u-sm-12">
                    <table id="table" class="am-table am-table-striped am-table-hover table-main">
                        <thead>
                        <tr>
                            <th data-field="id" class="table-title">id</th>
                            <th data-field="logo" class="table-title">用户名</th>
                            <th data-field="typeName" class="table-type">手机号</th>
                            <th data-field="typeName" class="table-type">商品名</th>
                            <th data-field="typeName" class="table-type">商品图</th>
                            <th data-field="cTime" class="table-author am-hide-sm-only">评价日期</th>
                            <th data-field="uTime" class="table-date am-hide-sm-only">评价等级</th>
                            <th data-field="id" class="table-set">操作</th>
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


    <div id="DetailWin" class="easyui-window" title="评价详情" data-options="iconCls:'icon-save',closed:true"
         style="width:60%;height:95%;padding:5px;">
        <div class="easyui-layout" data-options="fit:true">
            <div data-options="region:'center'" style="padding:10px;">
                <input id="detail-id" type="text" style="display: none"/>
                <div class="am-panel-group">
                    <div class="am-panel am-panel-default">
                        <div class="am-panel-hd">
                            <h3 class="am-panel-title">所评商品</h3>
                        </div>
                        <div class="am-g am-panel-bd">
                            <div data-am-widget="list_news" class="am-list-news am-list-news-default">
                                <div class="am-list-news-bd">
                                    <ul id="detail-goods" class="am-list">
                                        <li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left">
                                            <div class="am-u-sm-2 am-list-thumb">
                                                <img id="goods-pic" src="" width="80px" height="80px"/>
                                            </div>
                                            <div class=" am-u-sm-10  am-list-main">
                                                <h3 class="am-list-item-hd am-text-primary" id="goods-title"></h3>
                                                <div class="am-list-item-text">
                                                    <span id="goods-attr"></span>
                                                </div>
                                                <div class="am-list-item-text">
                                                    <span>x<span id="goods-num"></span> </span>
                                                    &nbsp;&nbsp;&nbsp;&yen;<span id="goods-price"></span>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="am-panel am-panel-default">
                        <div class="am-panel-hd">用户信息</div>
                        <div class="am-g am-panel-bd">
                            <div class="am-u-sm-6">手机号:<span class="am-margin-left-sm" id="detail-mobile"></span></div>
                            <div class="am-u-sm-6 am-u-end">用户名:<span class="am-margin-left-sm"
                                                                      id="detail-username"></span>
                            </div>
                        </div>
                    </div>
                    <div class="am-panel am-panel-default">
                        <div class="am-panel-hd">评价信息</div>
                        <div class="am-g am-panel-bd">
                            <div class="am-u-sm-6">
                                评价ID:<span class="am-margin-left-sm" id="detail-sn"></span></div>
                            <div class="am-u-sm-6 am-u-end">评级:<span class="am-margin-left-sm" id="detail-state"></span>
                            </div>
                            <div class="am-u-sm-6">评分:<span class="am-margin-left-sm" id="detail-score"></span></div>
                            <div class="am-u-sm-6">评价时间:<span class="am-margin-left-sm" id="detail-ctime"></span></div>
                            <div class="am-u-sm-12 am-form">
                                <div class="am-form-group">
                                    <label for="detail-comment">评价内容</label>
                                    <textarea id="detail-comment" class="" rows="5"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div data-options="region:'south',border:false" style="text-align:center;">
                <a id="detail-ok" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)"
                   style="width:80px">确认</a>
                <a id="detail-cancel" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
                   href="javascript:void(0)" style="width:80px">取消</a>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    (function () {
        var prefix = ""

        var statusEnum = new Array(
                '<span class="am-badge am-badge-success">好评</span>',
                '<span class="am-badge am-badge-warning">中评</span>',
                '<span class="am-badge am-badge-danger">差评</span>'
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
                url: prefix + "/admin/rate/list",
                type: "GET"
            },
            autoWidth: false,
            columns: [
                {
                    "data": "id",
                    "orderable": false,
                    "width": "10%"
                },
                {
                    "data": "userName",
                    "width": "10%"
                },
                {
                    "data": "mobile",
                    "width": "10%"
                },
                {
                    "data": "goodsTitle",
                    "width": "20%"
                },
                {
                    "data": "goodsPic",
                    "width": "10%"
                },
                {
                    "data": "cTimeStr",
                    "width": "15%"
                },
                {
                    "data": "level",
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
                    "targets": 4
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
                                '<button value="' + data + '" class="am-btn am-btn-default am-btn-xs am-text-secondary editor"><span class="am-icon-pencil"></span>详情</button>' +
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

        var rateFilterForm = {
            level: null,
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
                rateFilterForm.level = $('#parentSelect').val();
            } else {
                rateFilterForm.level = null;
            }
            var url = formToUrlParm(rateFilterForm);
            var reloadObj = table.ajax.url(prefix + "/admin/rate/list" + url);
            reloadObj.load();
            table.draw();
        })


        $('#search-btn').on("click", function () {
            if ($("#endTime").val() != "") {
                rateFilterForm.endTime = praseDate($("#endTime").val());
            }
            if ($("#startTime").val() != "") {
                rateFilterForm.startTime = praseDate($("#startTime").val());
            }
            var url = formToUrlParm(rateFilterForm);
            console.log(url);
            var reloadObj = table.ajax.url(prefix + "/admin/rate/list" + url);
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
                $("#detail-username").text(oData.uesrName);
                $("#detail-mobile").text(oData.mobile)
                $("#detail-sn").text(oData.id);
                $("#detail-score").text(oData.score + "分");
                $("#detail-state").html(statusEnum[oData.level]);
                $("#detail-ctime").text(oData.cTimeStr);
                $("#detail-comment").val(oData.comment);
                $("#goods-title").text(oData.goodsTitle);
                $("#goods-pic").attr("src", oData.goodsPic);
                $("#goods-attr").text(oData.salesAttr);
                $("#goods-price").text(oData.price);
                $("#goods-num").text(oData.num);
            }
        });
        $('#table').find('tbody').on("click", "tr .del", function () {
            var tr = $(this).parents("tr");
            var data = table.row(tr).data();
            var id = data.id;
            $.messager.confirm('删除商品', '确认删除该评价?', function (r) {
                if (r) {
                    $.ajax({
                        type: "POST",
                        url: prefix + "/admin/rate/del/",
                        data: {rateId: id},
                        contentType: "application/x-www-form-urlencoded; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            if (data.code == "0") {
                                $.messager.show({
                                    title: '删除',
                                    msg: '已删除该评价.！',
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
        $('#detail-cancel').click(function () {
            $("#DetailWin").window('close');
        })
        $('#detail-ok').click(function () {
            var id = $('#detail-id').val();
            var comment = $("#detail-comment").val();
            $.messager.confirm('确认', '是否修改评价内容?', function (r) {
                if (r) {
                    $.ajax({
                        type: "POST",
                        url: prefix + "/admin/rate/update/",
                        data: {id: id, comment: comment},
                        contentType: "application/x-www-form-urlencoded; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            if (data.code == "0") {
                                $.messager.show({
                                    title: '修改成功',
                                    msg: '已修改评价内容.！',
                                    timeout: 2000,
                                    showType: 'fade',
                                    style: {
                                        right: '',
                                        top: document.body.scrollTop + document.documentElement.scrollTop,
                                        bottom: ''
                                    }
                                });
                                table.ajax.reload();
                                $("#DetailWin").window('close');
                            }
                        },
                        error: function (msg) {
                            alert(msg);
                        }
                    })
                }
            })
        })
    })();
</script>
</html>
