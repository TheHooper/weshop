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
    <title>HOMALL | 物品管理 </title>
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
                <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">物品管理</strong> /
                    <small>Goods</small>
                </div>
            </div>

            <hr>

            <div class="am-g">
                <div class="am-u-sm-12 am-u-md-6">
                    <div class="am-btn-toolbar">
                        <div class="am-btn-group am-btn-group-s">
                            <button id="add-goods-btn" type="button" class="am-btn am-btn-default"><span
                                    class="am-icon-plus"></span>添加商品
                            </button>
                        </div>
                    </div>
                </div>
                <div class="am-u-sm-12 am-u-md-3">
                    <div class="am-form-group">
                        <select id="parentSelect" data-am-selected="{btnSize: 'sm'}">
                            <option value="0">所有状态</option>
                            <option value="PULL_OFF">未上架</option>
                            <option value="SALEING">销售中</option>
                            <option value="SALD_OUT">售罄</option>
                        </select>
                    </div>
                </div>
                <div class="am-u-sm-12 am-u-md-3">
                    <div class="am-input-group am-input-group-sm">
                        <input id="search-input" type="text" class="am-form-field">
                          <span class="am-input-group-btn">
                            <button id="search-btn" class="am-btn am-btn-default" type="button">搜索</button>
                          </span>
                    </div>
                </div>
            </div>

            <div class="am-g">
                <div class="am-u-sm-12">
                    <table id="table" class="am-table am-table-striped am-table-hover table-main">
                        <thead>
                        <tr>
                            <th data-field="id" class="table-check"><input type="checkbox"/></th>
                            <th data-field="logo" class="table-title">主图</th>
                            <th data-field="typeName" class="table-type">标题</th>
                            <th data-field="typeName" class="table-type">价格</th>
                            <th data-field="typeName" class="table-type">库存</th>
                            <th data-field="typeName" class="table-type">销量</th>
                            <th data-field="cTime" class="table-author am-hide-sm-only">创建时间</th>
                            <th data-field="uTime" class="table-date am-hide-sm-only">修改日期</th>
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


    <div id="AddWin" class="easyui-window" title="新增商品" data-options="iconCls:'icon-save',closed:true"
         style="width:100%;height:100%;padding:5px;">
        <div class="easyui-layout" data-options="fit:true">
            <div data-options="region:'center'" style="padding:10px;">
                <form id="add-form" class="am-form">
                    <fieldset>
                        <div class="am-form-group am-g am-margin-bottom-xs">
                            <div class="am-u-sm-6 am-u-md-3">
                                <label for="add-list-review-div">商品列表图:(200*230 1:1.14)</label>
                                <div id="add-list-review-div">
                                    <img src="" width="115" height="142px">
                                </div>
                            </div>
                            <div class="am-u-sm-6 am-u-md-3">
                                <label for="add-main-review-div">商品详情主图:(600*600 1:1)</label>
                                <div id="add-main-review-div">
                                    <img src="" width="160" height="160px">
                                </div>
                            </div>
                            <div class="am-u-sm-6 am-u-md-3">
                                <label for="add-second-review-div">商品详情副图1:(600*600 1:1)</label>
                                <div id="add-second-review-div">
                                    <img src="" width="160px" height="160px">
                                </div>
                            </div>
                            <div class="am-u-sm-6 am-u-md-3">
                                <label for="add-thirth-review-div">商品详情副图2:(600*600 1:1)</label>
                                <div id="add-thirth-review-div">
                                    <img src="" width="160px" height="160px">
                                </div>
                            </div>
                        </div>
                        <div class="am-form-group am-margin-top-sm">
                            <div id="add-list-pic-div" class="am-u-sm-6 am-u-md-3">
                                <p>
                                    <button id="add-list-pic-btn" type="button" class="am-btn am-btn-default am-btn-sm">
                                        上传图片
                                    </button>
                                </p>
                            </div>
                            <div id="add-main-pic-div" class="am-u-sm-6 am-u-md-3">
                                <p>
                                    <button id="add-main-pic-btn" type="button" class="am-btn am-btn-default am-btn-sm">
                                        上传图片
                                    </button>
                                </p>
                            </div>
                            <div id="add-second-pic-div" class="am-u-sm-6 am-u-md-3">
                                <p>
                                    <button id="add-second-pic-btn" type="button"
                                            class="am-btn am-btn-default am-btn-sm">上传图片
                                    </button>
                                </p>
                            </div>
                            <div id="add-thirth-pic-div" class="am-u-sm-6 am-u-md-3">
                                <p>
                                    <button id="add-thirth-pic-btn" type="button"
                                            class="am-btn am-btn-default am-btn-sm">上传图片
                                    </button>
                                </p>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="add-name">商品标题</label>
                            <input id="add-name" type="text" class="" placeholder="输入商品名">
                        </div>
                        <div class="am-form-group">
                            <label for="add-intro">商品简介</label>
                            <textarea class="" rows="3" id="add-intro" placeholder="超过20字部分会被省略"></textarea>
                        </div>
                        <div class="am-form-group am-g">
                            <div class="am-u-sm-4 am-padding-left-0">
                                <label for="add-sale-price">商品销售价格</label>
                                <input id="add-sale-price" type="number" class="" placeholder="保留两位小数">
                            </div>
                            <div class="am-u-sm-4">
                                <label for="add-o-price">商品原价</label>
                                <input id="add-o-price" type="number" class="" placeholder="保留两位小数">
                            </div>
                            <div class="am-u-sm-4">
                                <label for="add-d-charge">商品运费</label>
                                <input id="add-d-charge" type="number" class="" placeholder="保留两位小数">
                            </div>
                        </div>
                        <div class="am-form-group">
                            <div class="am-g">
                                <div class="am-u-sm-6 am-u-md-4 am-padding-left-0">
                                    <label for="add-cats-parent">商品大类别</label>
                                    <select id="add-cats-parent">
                                        <option>选择商品类别</option>
                                    </select>
                                    <span class="am-form-caret"></span>
                                </div>
                                <div class="am-u-sm-6 am-u-md-4 am-u-end">
                                    <label for="add-cats">商品类别</label>
                                    <select id="add-cats">
                                        <option>选择子类别</option>
                                    </select>
                                    <span class="am-form-caret"></span>
                                </div>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <div class="am-g">
                                <div class="am-u-sm-6 am-u-md-4 am-padding-left-0">
                                    <select id="add-attr-parent">
                                        <option>选择属性类别</option>
                                    </select>
                                    <span class="am-form-caret"></span>
                                </div>
                                <div class="am-u-sm-3 am-u-md-4 am-cf">
                                    <button id="add-attr-parent-btn" type="button" class="am-btn am-btn-default">新建类别
                                    </button>
                                    <label id="add-attr-parent-new-error" class="color-warning am-fr"
                                           style="display: none">请选择属性类别</label>
                                </div>
                                <div id="add-attr-parent-new-div" class="am-u-sm-2 am-u-md-4" style="display: none">
                                    <div class="am-u-sm-8">
                                        <input id="add-attr-parent-new" type="text" placeholder="请输入新的属性类别,eg.颜色">
                                    </div>
                                    <div class="am-u-sm-4">
                                        <button id="add-attr-parent-new-comfirm-btn" type="button"
                                                class="am-btn am-btn-default">确认添加
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="add-attr-form-group" class="am-form-group">
                            <div class="am-g">
                                <div class="am-u-sm-6 am-u-md-4 am-padding-left-0">
                                    <select id="add-attr">
                                    </select>
                                    <span class="am-form-caret"></span>
                                </div>
                                <div class="am-u-sm-3 am-u-md-4 am-cf">
                                    <button id="add-attr-btn" type="button" class="am-btn am-btn-secondary">加入属性
                                    </button>
                                    <button id="add-attr-new-btn" type="button" class="am-btn am-btn-default">新建属性
                                    </button>
                                    <label id="add-attr-new-error" class="color-warning am-fr" style="display: none">请选择属性类别</label>
                                </div>
                                <div id="add-attr-new-div" class="am-u-sm-2 am-u-md-4" style="display: none">
                                    <div class="am-u-sm-8">
                                        <input id="add-attr-new" type="text" placeholder="请输入新的属性,例如M、XL">
                                    </div>
                                    <div class="am-u-sm-4">
                                        <button id="add-attr-new-comfirm-btn" type="button"
                                                class="am-btn am-btn-default">确认添加
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="attr-group" class="am-form-group am-g am-text-lg" style="display: none">
                        </div>
                        <div id="sku-group" class="am-form-group am-g am-text-lg am-margin-left-0"
                             style="display: none">
                        </div>
                        <div class="am-form-group">
                            <label for="addDetail">商品详情</label>
                            <textarea id="addDetail" name="addDetail" rows="5"></textarea>
                        </div>
                    </fieldset>
                </form>
            </div>
            <div data-options="region:'south',border:false" style="text-align:center;padding:5px 0 0;">
                <a id="add-ok" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)"
                   style="width:80px">确认</a>
                <a id="add-cancel" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
                   href="javascript:void(0)" style="width:80px">取消</a>
            </div>
        </div>
    </div>

    <div id="EditorWin" class="easyui-window" title="编辑商品" data-options="iconCls:'icon-save',closed:true"
         style="width:100%;height:100%;padding:5px;">
        <div class="easyui-layout" data-options="fit:true">
            <div data-options="region:'center'" style="padding:10px;">
                <form id="editor-form" class="am-form">
                    <fieldset>
                        <input id="editor-id" style="display: none">
                        <div class="am-form-group am-g am-margin-bottom-xs">
                            <div class="am-u-sm-6 am-u-md-3">
                                <label for="editor-list-review-div">商品列表图:(200*230 1:1.5)</label>
                                <div id="editor-list-review-div">
                                    <img src="" width="100px" height="115px">
                                </div>
                            </div>
                            <div class="am-u-sm-6 am-u-md-3">
                                <label for="editor-main-review-div">商品详情主图:(600*600 1:1)</label>
                                <div id="editor-main-review-div">
                                    <img src="" width="160px" height="160px">
                                </div>
                            </div>
                            <div class="am-u-sm-6 am-u-md-3">
                                <label for="editor-second-review-div">商品详情副图1:(600*600 1:2)</label>
                                <div id="editor-second-review-div">
                                    <img src="" width="160px" height="160px">
                                </div>
                            </div>
                            <div class="am-u-sm-6 am-u-md-3">
                                <label for="editor-thirth-review-div">商品详情副图2:(600*600 1:1)</label>
                                <div id="editor-thirth-review-div">
                                    <img src="" width="160px" height="160px">
                                </div>
                            </div>
                        </div>
                        <div class="am-form-group am-margin-top-sm">
                            <div id="editor-list-pic-div" class="am-u-sm-6 am-u-md-3">
                                <p>
                                    <button id="editor-list-pic-btn" type="button"
                                            class="am-btn am-btn-default am-btn-sm">上传图片
                                    </button>
                                </p>
                            </div>
                            <div id="editor-main-pic-div" class="am-u-sm-6 am-u-md-3">
                                <p>
                                    <button id="editor-main-pic-btn" type="button"
                                            class="am-btn am-btn-default am-btn-sm">上传图片
                                    </button>
                                </p>
                            </div>
                            <div id="editor-second-pic-div" class="am-u-sm-6 am-u-md-3">
                                <p>
                                    <button id="editor-second-pic-btn" type="button"
                                            class="am-btn am-btn-default am-btn-sm">上传图片
                                    </button>
                                </p>
                            </div>
                            <div id="editor-thirth-pic-div" class="am-u-sm-6 am-u-md-3">
                                <p>
                                    <button id="editor-thirth-pic-btn" type="button"
                                            class="am-btn am-btn-default am-btn-sm">上传图片
                                    </button>
                                </p>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="editor-name">商品标题</label>
                            <input id="editor-name" type="text" class="" placeholder="输入商品名">
                        </div>
                        <div class="am-form-group">
                            <label for="editor-intro">商品简介</label>
                            <textarea class="" rows="3" id="editor-intro" placeholder="超过20字部分会被省略"></textarea>
                        </div>
                        <div class="am-form-group am-g">
                            <div class="am-u-sm-4 am-padding-left-0">
                                <label for="editor-sale-price">商品销售价格</label>
                                <input id="editor-sale-price" type="number" class="" placeholder="保留两位小数">
                            </div>
                            <div class="am-u-sm-4">
                                <label for="editor-o-price">商品原价</label>
                                <input id="editor-o-price" type="number" class="" placeholder="保留两位小数">
                            </div>
                            <div class="am-u-sm-4">
                                <label for="editor-d-charge">商品运费</label>
                                <input id="editor-d-charge" type="number" class="" placeholder="保留两位小数">
                            </div>
                        </div>
                        <div class="am-form-group">
                            <div class="am-g">
                                <div class="am-u-sm-6 am-u-md-4 am-padding-left-0">
                                    <label for="editor-cats-parent">商品大类别</label>
                                    <select id="editor-cats-parent">
                                        <option>选择商品类别</option>
                                    </select>
                                    <span class="am-form-caret"></span>
                                </div>
                                <div class="am-u-sm-6 am-u-md-4 am-u-end">
                                    <label for="editor-cats">商品类别</label>
                                    <select id="editor-cats">
                                        <option>选择子类别</option>
                                    </select>
                                    <span class="am-form-caret"></span>
                                </div>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <div class="am-g">
                                <div class="am-u-sm-6 am-u-md-4 am-padding-left-0">
                                    <select id="editor-attr-parent">
                                        <option>选择属性类别</option>
                                    </select>
                                    <span class="am-form-caret"></span>
                                </div>
                                <div class="am-u-sm-3 am-u-md-4 am-cf">
                                    <button id="editor-attr-parent-btn" type="button" class="am-btn am-btn-default">
                                        新建类别
                                    </button>
                                    <label id="editor-attr-parent-new-error" class="color-warning am-fr"
                                           style="display: none">请选择属性类别</label>
                                </div>
                                <div id="editor-attr-parent-new-div" class="am-u-sm-2 am-u-md-4" style="display: none">
                                    <div class="am-u-sm-8">
                                        <input id="editor-attr-parent-new" type="text" placeholder="请输入新的属性类别,eg.颜色">
                                    </div>
                                    <div class="am-u-sm-4">
                                        <button id="editor-attr-parent-new-comfirm-btn" type="button"
                                                class="am-btn am-btn-default">确认添加
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="editor-attr-form-group" class="am-form-group">
                            <div class="am-g">
                                <div class="am-u-sm-6 am-u-md-4 am-padding-left-0">
                                    <select id="editor-attr">
                                    </select>
                                    <span class="am-form-caret"></span>
                                </div>
                                <div class="am-u-sm-3 am-u-md-4 am-cf">
                                    <button id="editor-attr-btn" type="button" class="am-btn am-btn-secondary">加入属性
                                    </button>
                                    <button id="editor-attr-new-btn" type="button" class="am-btn am-btn-default">新建属性
                                    </button>
                                    <label id="editor-attr-new-error" class="color-warning am-fr" style="display: none">请选择属性类别</label>
                                </div>
                                <div id="editor-attr-new-div" class="am-u-sm-2 am-u-md-4" style="display: none">
                                    <div class="am-u-sm-8">
                                        <input id="editor-attr-new" type="text" placeholder="请输入新的属性,例如M、XL">
                                    </div>
                                    <div class="am-u-sm-4">
                                        <button id="editor-attr-new-comfirm-btn" type="button"
                                                class="am-btn am-btn-default">确认添加
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="editor-attr-group" class="am-form-group am-g am-text-lg" style="display: none">
                        </div>
                        <div id="editor-sku-group" class="am-form-group am-g am-text-lg" style="display: none">
                        </div>
                        <div class="am-form-group">
                            <label for="editorDetail">商品详情</label>
                            <input id="editor-detail-id" style="display: none">
                            <textarea id="editorDetail" name="editorDetail" rows="5"></textarea>
                        </div>
                    </fieldset>
                </form>
            </div>
            <div data-options="region:'south',border:false" style="text-align:center;padding:5px 0 0;">
                <a id="editor-ok" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)"
                   style="width:80px">确认</a>
                <a id="editor-cancel" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
                   href="javascript:void(0)" style="width:80px">取消</a>
            </div>
        </div>
    </div>


    <script src="<c:url value="../js/qiniu/plupload.full.min.js"/>"></script>
    <script src="<c:url value="../js/qiniu/qiniu.min.js"/>"></script>
    <script type="text/javascript">
        (function () {
            var prefix = "${pageContext.request.contextPath}"

            var statusEnum = new Array(
                    '<span class="am-badge am-badge-primary">未上架</span>',
                    '<span class="am-badge am-badge-success">销售中</span>',
                    '<span class="am-badge am-badge-warning">售罄</span>'
            )

            var table = $('#table').DataTable({
                ajax: {
                    url: prefix + "/admin/goods/goodses",
                    type: "GET"
                },
                autoWidth: false,
                columns: [
                    {
                        "data": "id",
                        "orderable": false,
                        "width": "5%"
                    },
                    {
                        "data": "goodsMainPic",
                        "width": "7%"
                    },
                    {
                        "data": "title",
                        "width": "12%"
                    },
                    {
                        "data": "price",
                        "width": "8%"
                    },
                    {
                        "data": "orginalNum",
                        "width": "7%"
                    },
                    {
                        "data": "saledNum",
                        "width": "7%"
                    },
                    {
                        "data": "cTime",
                        "width": "10%"
                    },
                    {
                        "data": "uTime",
                        "width": "10%"
                    },
                    {
                        "data": "status",
                        "width": "8%"
                    },
                    {
                        "data": "id",
                        "width": "22%"
                    }
                ],
                "columnDefs": [
                    {
                        "render": function (data, type, row, meta) {
                            return '<input type="checkbox" value="' + data + ' name="idCheckbox" "/>';
                        },
                        "targets": 0
                    },
                    {
                        "render": function (data, type, row, meta) {
                            if (data != null && typeof(data) != "undefined") {
                                return '<img src="' + data + '" width="40px" height="40px"/>';
                            } else {
                                return '<img src="" width="40px" height="40px"/>';
                            }
                        },
                        "targets": 1
                    }, {
                        "render": function (data, type, row, meta) {
                            return '<label class="am-text-nowrap">' + data + '</label>'
                        },
                        "targets": 2
                    }, {
                        "render": function (data, type, row, meta) {
                            return statusEnum[data]
                        },
                        "targets": 8
                    },
                    {
                        "render": function (data, type, row, meta) {
                            var toggleBtn;
                            if (row.status == 1) {
                                toggleBtn = '<button  class="am-btn am-btn-default am-btn-xs  pulloff"><span class="am-icon-level-down"></span>下架</button>'
                            } else {
                                toggleBtn = '<button  class="am-btn am-btn-default am-btn-xs  pullon"><span class="am-icon-level-up"></span>上架</button>'
                            }
                            return '<div class="am-btn-toolbar">' +
                                    '<div class="am-btn-group am-btn-group-xs">' +
                                    '<button value="' + data + '" class="am-btn am-btn-default am-btn-xs am-text-secondary editor"><span class="am-icon-pencil-square-o"></span> 编辑</button>' +
                                    toggleBtn +
                                    '<button value="' + data + '" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only del"><span class="am-icon-trash-o"></span> 删除</button>' +
                                    '</div>' +
                                    '</div>';
                        },
                        "targets": 9
                    }
                ],
                serverSide: true,
                pagingType: "full_numbers",
                searching: false,
//              ordering:false
            });

            var addGoodsWinEvent = $('#add-goods-btn').on("click", function () {
                $('#AddWin').window('open');
                SKU.clean("sku-group");
            })

            $('#parentSelect').on("change", function () {
                var url = table.ajax.url(prefix + "/admin/goods/goodses/?statusStr=" + $('#parentSelect').val());
                url.load();
                table.draw();
            })


            $('#search-btn').on("click", function () {
                var url = table.ajax.url(prefix + "/admin/goods/goodses/?title=" + $('#search-input').val());
                url.load();
                table.draw();
            })


            $('#table').find('tbody').on("click", "tr .editor", function () {
                var tr = $(this).parents("tr");
                var data = table.row(tr).data();
                console.log(data);
                $('#EditorWin').window('open');
                if ($('#editor-id').val() != data.id) {
                    console.log(" load editor data");
                    $('#editor-id').val(data.id);
                    console.log($('#editor-id').val());
                    $('#editor-list-review-div').children("img").attr("src", data.goodsListPic);
                    $('#editor-main-review-div').children("img").attr("src", data.goodsMainPic);
                    $('#editor-second-review-div').children("img").attr("src", data.goodsSecondPic);
                    $('#editor-thirth-review-div').children("img").attr("src", data.goodsThirthPic);
                    $('#editor-name').val(data.title);
                    $('#editor-intro').val(data.intro);
                    $('#editor-o-price').val(data.oPrice);
                    $('#editor-sale-price').val(data.price);
                    $('#editor-d-charge').val(data.dCharge);
                    $('#editor-cats').val(data.catsId);
                    var goodsId = data.id;
                    //load cat
                    $.ajax({
                        type: "GET",
                        url: prefix + "/admin/goods/cats/" + data.id,
                        data: {},
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (datap) {
                            if (typeof (datap.code) == "undefined") {
                                $('#editor-cats-parent').val(datap.catsParentId);
                                $.ajax({
                                    type: "GET",
                                    url: prefix + "/admin/cat/cats",
                                    data: {parentId: datap.catsParentId},
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (data) {
                                        if (typeof (data.code) == "undefined") {
                                            $('#editor-cats').html("");
                                            $(data).each(function (i, e) {
                                                var op = '<option value="' + e.id + '">' + e.typeName + '</option>';
                                                $('#editor-cats').append(op);
                                            });
                                            $('#editor-cats').val(datap.cats);
                                            $('#editor-cats').attr("r-id", datap.id);
                                        }
                                    },
                                    error: function (msg) {
                                        alert(msg);
                                    }
                                })
                            }
                        },
                        error: function (msg) {
                            alert(msg);
                        }
                    })

                    //load attr sku
                    $.ajax({
                        type: "GET",
                        url: prefix + "/admin/goods/attrs/" + data.id,
                        data: {},
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            if (typeof (data.code) == "undefined") {
                                $('#editor-attr-group').html("");
                                editorArray = new Array();
                                SKU.clean("editor-sku-group");
                                $(data).each(function (ri, re) {
                                    var attr;
                                    var parentId = re.parentId;
                                    var parentName = re.parentName;
                                    var childId = re.attrId;
                                    var childName = re.attrName;
                                    if (editorArray.length < 1) {
                                        var attr = getAttr();
                                        attr.init(parentId, parentName, "editor-attr-group");
                                        attr.addATTR1(re.id, childId, childName, "editor-attr");
                                        editorArray.push(attr);
                                    } else {
                                        var isAdded = false;
                                        var maxAttrLength = editorArray[0].attrLenght;
                                        $(editorArray).each(function (i, e) {
                                            if (e.id == parentId) {
                                                e.addATTR1(re.id, childId, childName, "editor-attr");
                                                isAdded = true;
                                            }
                                            if (e.attrLenght > maxAttrLength) {
                                                maxAttrLength = e.attrLenght;
                                            }
                                        })
                                        if (!isAdded) {
                                            var attr = getAttr();
                                            attr.init(parentId, parentName, "editor-attr-group");
                                            attr.addATTR1(re.id, childId, childName, "editor-attr");
                                            editorArray.push(attr);
                                        }
                                    }
                                    if (editorArray.length <= 1) {
                                        SKU.init("#editor-sku-group");
                                        var skuLi = SKU.getSku("editor-sku", "A" + childId, childName);
                                        var row = SKU.getRow(1);
                                        $(row).append(skuLi)
                                        SKU.addRow(row);
                                    } else {
                                        var currentIndex;
                                        var secondIndex;
                                        $(editorArray).each(function (i, e) {
                                            if (e.id == parentId) {
                                                currentIndex = i;
                                            } else {
                                                secondIndex = i;
                                            }
                                        })
                                        var BLength = editorArray[currentIndex].attrLenght;//the newer
                                        var ALength = editorArray[secondIndex].attrLenght;
                                        if (BLength == 1 || ALength == 1) {
                                            if (BLength <= ALength) {
                                                var row = SKU.getRow(1);
                                                var lis = $(row.children("li"));
                                                $(lis).each(function (i, e) {
                                                    var input = $(e).children("input");
                                                    var label = $(e).children("label");
                                                    var id = $(input).attr("sku-id");
                                                    $(label).text($(label).text() + "-" + childName);
                                                    $(input).attr("sku-id", id + "AA" + childId);
                                                })
                                            } else {
                                                var span = editorArray[secondIndex].ul.children("ul").children("li").children("span");
                                                var skuLi = SKU.getSku("editor-sku", "A" + $(span).attr("value") + "AA" + childId, $(span).text() + "-" + childName);
                                                var row = SKU.getRow(1);
                                                $(row).append(skuLi)
                                                SKU.addRow(row);
                                            }
                                        } else {
                                            var spans = editorArray[secondIndex].ul.children("ul").children("li").children("span");
                                            if (spans.length <= $(SKU.getRow(1)).children("li").length) {
                                                var row = SKU.getNewRow();
                                                $(spans).each(function (i, e) {
                                                    var skuLi = SKU.getSku("editor-sku", "A" + $(e).attr("value") + "AA" + childId, $(e).text() + "-" + childName);
                                                    $(row).append(skuLi);
                                                })
                                                SKU.addRow(row);
                                            } else {
                                                var rows = SKU.rows;
                                                $(spans).each(function (i, e) {
                                                    var skuLi = SKU.getSku("editor-sku", "A" + $(e).attr("value") + "AA" + childId, $(e).text() + "-" + childName);
                                                    $(rows[i]).append(skuLi);
                                                })
                                                SKU.addRow(row);
                                            }
                                        }
                                    }
                                })
                                $.ajax({
                                    type: "GET",
                                    url: prefix + "/admin/goods/skus/" + goodsId,
                                    data: {},
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (data) {
                                        if (typeof (data.code) == "undefined") {
                                            var skus = $(".editor-sku");
                                            console.log("load server sku val success " + data.length + " skus :" + skus.length);
                                            $(data).each(function (i, e) {
                                                $(skus).each(function (si, se) {
                                                    console.log("server skuId: " + e.skuId + " client skuId" + $(se).attr("sku-id"));
                                                    if (e.skuId == $(se).attr("sku-id")) {
                                                        console.log("server skuId equals client skuId,put val");
                                                        $(se).val(e.orginalNum);
                                                        $(se).attr("r-id", e.id);
                                                    }
                                                })
                                            })
                                        }
                                    },
                                    error: function (msg) {
                                        alert(msg);
                                    }
                                })
                            }
                        },
                        error: function (msg) {
                            alert(msg);
                        }
                    })


                    //load detail
                    $.ajax({
                        type: "GET",
                        url: prefix + "/admin/goods/detail/" + data.id,
                        data: {},
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            if (typeof (data.code) == "undefined") {
                                $("#editor-detail-id").val(data.id);
                                CKEDITOR.instances.editorDetail.setData(data.context);
                            }
                        },
                        error: function (msg) {
                            alert(msg);
                        }
                    })
                }
            });
            $('#table').find('tbody').on("click", "tr .pullon", function () {
                var tr = $(this).parents("tr");
                var data = table.row(tr).data();
                var id = data.id;
                $.messager.confirm('商品上架', '确认上架?', function (r) {
                    if (r) {
                        $.ajax({
                            type: "POST",
                            url: prefix + "/admin/goods/status/",
                            data: {
                                goodsId: id,
                                status: "SALEING"
                            },
                            contentType: "application/x-www-form-urlencoded; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                if (data.code == "0") {
                                    $.messager.show({
                                        title: '上架操作',
                                        msg: '已上架商品.！',
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
            $('#table').find('tbody').on("click", "tr .pulloff", function () {
                var tr = $(this).parents("tr");
                var data = table.row(tr).data();
                var id = data.id;
                $.messager.confirm('商品下架', '确认下架?', function (r) {
                    if (r) {
                        $.ajax({
                            type: "POST",
                            url: prefix + "/admin/goods/status/",
                            data: {
                                goodsId: id,
                                status: "PULL_OFF"
                            },
                            contentType: "application/x-www-form-urlencoded; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                if (data.code == "0") {
                                    $.messager.show({
                                        title: '下架操作',
                                        msg: '已下架商品.！',
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
            $('#table').find('tbody').on("click", "tr .del", function () {
                var tr = $(this).parents("tr");
                var data = table.row(tr).data();
                var id = data.id;
                $.messager.confirm('删除商品', '确认删除该商品?', function (r) {
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

            //对象
            SKU = {
                title: $('<div class="am-u-sm-1"><h4>库存</h4></div>'),
                formDiv: $('<div class="am-form-group am-text-lg"><div class="am-g"></div></div>'),
                rowContent: $('<div class="am-u-sm-11"></div>'),
                rows: new Array(),
                skuLength: 0,
                getRow: function (index) {
                    if (index > SKU.rows.length) {
                        var newRow = $('<ul class="am-avg-sm-8 am-avg-md-12 am-thumbnails"></ul>');
                        SKU.rows.push(newRow);
                        return newRow;
                    } else {
                        return SKU.rows[index - 1];
                    }
                },
                getNewRow: function () {
                    var newRow = $('<ul class="am-avg-sm-8 am-avg-md-12 am-thumbnails"></ul>');
                    SKU.rows.push(newRow);
                    return newRow;
                },
                addRow: function (ul) {
                    $(SKU.rowContent).append(ul);
                },
                getSku: function (clas, id, labelName) {
                    var li = $('<li></li>');
                    var label = $('<label class="am-text-sm" for="' + id + '">' + labelName + '</label>');
                    var input = $('<input id="' + id + '" sku-id="' + id + '" class="' + clas + '" type="number" >');
                    this.skuLength++;
                    $(li).append(label);
                    $(li).append(input);
                    return li;
                },
                clean: function (divId) {
                    this.rows = new Array();
                    this.isInited = false;
                    this.formDiv = $('<div class="am-form-group am-text-lg"><div class="am-g"></div></div>');
                    this.rowContent = $('<div class="am-u-sm-11"></div>');
                    this.skuLength = 0;
                    $("#" + divId + "").html("");
                    $("#" + divId + "").css("display", "none");
                },
                isInited: false,
                init: function (divId) {
                    if (!this.isInited) {
                        $(this.formDiv).children(".am-g").append($(this.title));
                        $(this.formDiv).children(".am-g").append($(this.rowContent));
                        $(divId).append(this.formDiv);
                        $(divId).css("display", "block");
                        this.isInited = true;
                    }
                }
            }
            function getAttr(id, title) { //use factory
                var obj = new Object();
                obj.id = id;
                obj.row = $('<div class="am-form-group am-text-lg"><div class="am-g"></div></div>');
                obj.title = $('<div class="am-u-sm-1"><h4></h4></div>');
                obj.ul = $('<div class="am-u-sm-11"><ul class="am-avg-sm-8 am-avg-md-12 am-thumbnails"></ul></div>'),
                        obj.attrLenght = 0;
                obj.addATTR = function (id, name, attrClass) {
                    var li = $('<li></li>');
                    var span = $('<span value="' + id + '"  class="' + attrClass + '" >' + name + '</span>');
                    $(li).append(span);
                    $(this.ul.children("ul")).append(li);
                    this.attrLenght++;
                };
                obj.addATTR1 = function (rId, id, name, attrClass) {
                    var li = $('<li></li>');
                    var span = $('<span r-id="' + rId + '" value="' + id + '"  class="' + attrClass + '" >' + name + '</span>');
                    $(li).append(span);
                    $(this.ul.children("ul")).append(li);
                    this.attrLenght++;
                };
                obj.isInited = false;
                obj.init = function (id, title, attrGroupId) {
                    if (!this.isInited) {
                        this.id = id;
                        $(this.title.children('h4')).text(title);
                        $(this.row.children('.am-g')).append(this.title);
                        $(this.row.children('.am-g')).append(this.ul);
                        $('#' + attrGroupId + '').append(this.row);
                        $('#' + attrGroupId + '').css("display", "block");
                        this.isInited = true;
                    }
                }
                return obj;
            }

            //api
            AttrApi = {
                newAttrParentInAdd: function () {
                    $('#add-attr-parent-new-comfirm-btn').on("click", function () {
                        var attrName = $('#add-attr-parent-new').val();
                        if (attrName == "" || attrName == null) {
                            $('#add-attr-parent-new-error').text("请输入属性");
                            $('#add-attr-parent-new-error').css("display", "block");
                        } else {
                            $.ajax({
                                type: "POST",
                                url: prefix + "/admin/attr/insert/parent",
                                data: {
                                    attributeName: attrName
                                },
                                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                                dataType: "json",
                                success: function (data) {
                                    if (data.code == 0) {
                                        GoodsApi.loadAttrParent();
                                        $('#add-attr-parent-new-error').css("display", "none");
                                    }
                                },
                                error: function (msg) {
                                    alert(msg);
                                }
                            })
                        }
                    })
                },
                newAttrChildInAdd: function () {
                    $('#add-attr-new-comfirm-btn').on("click", function () {
                        var parentId = $('#add-attr-parent').val();
                        var attrName = $('#add-attr-new').val();
                        if (typeof(parentId) != "undefined" && parentId != null && !isNaN(parentId)) {
                            if (attrName == "" || attrName == null) {
                                $('#add-attr-new-error').text("请输入属性类别");
                                $('#add-attr-new-error').css("display", "block");
                            } else {
                                $.ajax({
                                    type: "POST",
                                    url: prefix + "/admin/attr/insert/child",
                                    data: {
                                        parentId: parentId,
                                        attributeName: attrName
                                    },
                                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                                    dataType: "json",
                                    success: function (data) {
                                        if (data.code == 0) {
                                            GoodsApi.loadAttrChild("add-attr", parentId);
                                            $('#add-attr-new-error').css("display", "none");
                                        }
                                    },
                                    error: function (msg) {
                                        alert(msg);
                                    }
                                })
                            }
                        } else {
                            $('#add-attr-new-error').text("请选择属性类别");
                            $('#add-attr-new-error').css("display", "block");
                        }
                    })
                },
                showAttrParentInAdd: function () {
                    $('#add-attr-parent-btn').on("click", function () {
                        if ($('#add-attr-parent-new-div').css("display") == "none") {
                            $('#add-attr-parent-new-div').css("display", "block");
                        } else {
                            $('#add-attr-parent-new-div').css("display", "none");
                        }
                    })
                },
                showAttrChildInAdd: function () {
                    $('#add-attr-new-btn').on("click", function () {
                        if ($('#add-attr-new-div').css("display") == "none") {
                            $('#add-attr-new-div').css("display", "block");
                        } else {
                            $('#add-attr-new-div').css("display", "none");
                        }
                    })
                },
                newAttrParentInEditor: function () {

                },
                newAttrChildInEditor: function () {

                },
                showAttrParentInEditor: function () {

                },
                showAttrChildInEditor: function () {

                },
                init: function () {
                    this.showAttrParentInAdd();
                    this.showAttrChildInAdd();
                    this.newAttrChildInAdd();
                    this.newAttrParentInAdd();
                    this.showAttrParentInEditor();
                    this.showAttrChildInEditor();
                    this.newAttrParentInEditor();
                    this.newAttrChildInEditor();
                }
            }
            AttrApi.init();

            var attrArray = new Array();//提交好清空
            var editorArray = new Array();//切换后清空
            function generateAttrSku(attrGroupId, attrParentId, attrId, skuClass, skuDivId, attrArrayTemp) {
                var attr;
                var parentId = $('#' + attrParentId + '').val();
                var parentName = $('#' + attrParentId + '').find("option:selected").text();
                var childId = $('#' + attrId + '').val();
                ;
                var childName = $('#' + attrId + '').find("option:selected").text();
                if (attrArrayTemp.length < 1) {
                    var attr = getAttr();
                    attr.init(parentId, parentName, attrGroupId);
                    attr.addATTR(childId, childName, attrId);
                    attrArrayTemp.push(attr);
                } else {
                    var isAdded = false;
                    var maxAttrLength = attrArrayTemp[0].attrLenght;
                    $(attrArrayTemp).each(function (i, e) {
                        if (e.id == parentId) {
                            e.addATTR(childId, childName, attrId);
                            isAdded = true;
                        }
                        if (e.attrLenght > maxAttrLength) {
                            maxAttrLength = e.attrLenght;
                        }
                    })
                    if (!isAdded) {
                        var attr = getAttr();
                        attr.init(parentId, parentName, attrGroupId);
                        attr.addATTR(childId, childName, attrId);
                        attrArrayTemp.push(attr);
                    }
                }
                if (attrArrayTemp.length <= 1) {
                    SKU.init("#" + skuDivId + "");
                    var skuLi = SKU.getSku(skuClass, "A" + childId, childName);
                    var row = SKU.getRow(1);
                    $(row).append(skuLi)
                    SKU.addRow(row);
                } else {
                    var currentIndex;
                    var secondIndex;
                    $(attrArrayTemp).each(function (i, e) {
                        if (e.id == parentId) {
                            currentIndex = i;
                        } else {
                            secondIndex = i;
                        }
                    })
                    var BLength = attrArrayTemp[currentIndex].attrLenght;//the newer
                    var ALength = attrArrayTemp[secondIndex].attrLenght;
                    if (BLength == 1 || ALength == 1) {
                        if (BLength <= ALength) {
                            var row = SKU.getRow(1);
                            var lis = $(row.children("li"));
                            $(lis).each(function (i, e) {
                                var input = $(e).children("input");
                                var label = $(e).children("label");
                                var id = $(input).attr("sku-id");
                                $(label).text($(label).text() + "-" + childName);
                                $(input).attr("sku-id", id + "AA" + childId);
                            })
                        } else {
                            var span = attrArrayTemp[secondIndex].ul.children("ul").children("li").children("span");
                            var skuLi = SKU.getSku(skuClass, "A" + $(span).attr("value") + "AA" + childId, $(span).text() + "-" + childName);
                            var row = SKU.getRow(1);
                            $(row).append(skuLi)
                            SKU.addRow(row);
                        }
                    } else {
                        var spans = attrArrayTemp[secondIndex].ul.children("ul").children("li").children("span");
                        if (spans.length <= $(SKU.getRow(1)).children("li").length) {
                            var row = SKU.getNewRow();
                            $(spans).each(function (i, e) {
                                var skuLi = SKU.getSku(skuClass, "A" + $(e).attr("value") + "AA" + childId, $(e).text() + "-" + childName);
                                $(row).append(skuLi);
                            })
                            SKU.addRow(row);
                        } else {
                            var rows = SKU.rows;
                            $(spans).each(function (i, e) {
                                var skuLi = SKU.getSku(skuClass, "A" + $(e).attr("value") + "AA" + childId, $(e).text() + "-" + childName);
                                $(rows[i]).append(skuLi);
                            })
                            SKU.addRow(row);
                        }
                    }
                }
            }

            $("#add-attr-btn").on('click', function () {
                generateAttrSku("attr-group", "add-attr-parent", "add-attr", "add-sku", "sku-group", attrArray);
            });
            $("#editor-attr-btn").on('click', function () {
                generateAttrSku("editor-attr-group", "editor-attr-parent", "editor-attr", "editor-sku", "editor-sku-group", editorArray);
            });

            $("#add-cancel").on("click", function () {
                $('#AddWin').window('close');
            });
            $("#editor-cancel").on("click", function () {
                $('#EditorWin').window('close');
            });
            GoodsApi = {
                loadAttrParent: function () {
                    $.ajax({
                        type: "GET",
                        url: prefix + "/admin/attr/parents",
                        data: {},
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            if (typeof (data.code) == "undefined") {
                                parentBox = data;
                                $('#add-attr-parent').html("");
                                $('#editor-attr-parent').html("");
                                var op = '<option>请选择属性类别</option>';
                                $('#add-attr-parent').append(op);
                                $("#editor-attr-parent").append(op);
                                $(data).each(function (i, e) {
                                    var op = '<option value="' + e.id + '">' + e.attributeName + '</option>';
                                    $('#add-attr-parent').append(op);
                                    $("#editor-attr-parent").append(op);
                                });
                            }
                        },
                        error: function (msg) {
                            alert(msg);
                        }
                    })
                },
                loadAttrChild: function (TargetId, ParentId) {
                    $.ajax({
                        type: "GET",
                        url: prefix + "/admin/attr/children/" + ParentId,
                        data: {},
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            if (typeof (data.code) == "undefined") {
                                parentBox = data;
                                $('#' + TargetId + '').html("");
                                $(data).each(function (i, e) {
                                    var op = '<option value="' + e.id + '">' + e.attributeName + '</option>';
                                    $('#' + TargetId + '').append(op);
                                });
                            }
                        },
                        error: function (msg) {
                            alert(msg);
                        }
                    })
                },
                dynmicAddAttrChild: function () {
                    $('#add-attr-parent').on("change", function () {
                        var id = $('#add-attr-parent').val();
                        if (typeof(id) != 'undefined' && id != null && id != 0) {
                            GoodsApi.loadAttrChild("add-attr", id);
                        }
                    })
                },
                dynmicEditorAttrChild: function () {
                    $('#editor-attr-parent').on("change", function () {
                        var id = $('#editor-attr-parent').val();
                        console.log("editor attr parent id " + id);
                        if (typeof(id) != 'undefined' && id != null && id != 0) {
                            console.log("editor attr parent id " + id);
                            GoodsApi.loadAttrChild("editor-attr", id);
                        }
                    })
                },
                loadCatsParent: function () {
                    $.ajax({
                        type: "GET",
                        url: prefix + "/admin/cat/roots",
                        data: {},
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            if (typeof (data.code) == "undefined") {
                                parentBox = data;
                                $(data).each(function (i, e) {
                                    var op = '<option value="' + e.id + '">' + e.typeName + '</option>';
                                    $('#add-cats-parent').append(op);
                                    $("#editor-cats-parent").append(op);
                                });
                            }
                        },
                        error: function (msg) {
                            alert(msg);
                        }
                    })
                },
                dynmicAddCatsChild: function () {
                    $('#add-cats-parent').on("change", function () {
                        var id = $('#add-cats-parent').val();
                        if (typeof(id) != 'undefined' && id != null && id != 0) {
                            $.ajax({
                                type: "GET",
                                url: prefix + "/admin/cat/cats",
                                data: {parentId: id},
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (data) {
                                    if (typeof (data.code) == "undefined") {
                                        parentBox = data;
                                        $('#add-cats').html("");
                                        $(data).each(function (i, e) {
                                            var op = '<option value="' + e.id + '">' + e.typeName + '</option>';
                                            $('#add-cats').append(op);
                                        });
                                    }
                                },
                                error: function (msg) {
                                    alert(msg);
                                }
                            })
                        }
                    })
                },
                dynmicEditorCatsChild: function () {
                    $('#editor-cats-parent').on("change", function () {
                        var id = $('#editor-cats-parent').val();
                        if (typeof(id) != 'undefined' && id != null && id != 0) {
                            $.ajax({
                                type: "GET",
                                url: prefix + "/admin/cat/cats",
                                data: {parentId: id},
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (data) {
                                    if (typeof (data.code) == "undefined") {
                                        parentBox = data;
                                        $('#editor-cats').html("");
                                        $(data).each(function (i, e) {
                                            var op = '<option value="' + e.id + '">' + e.typeName + '</option>';
                                            $('#editor-cats').append(op);
                                        });
                                    }
                                },
                                error: function (msg) {
                                    alert(msg);
                                }
                            })
                        }
                    })
                },
                addGoods: function () {
                    $("#add-ok").on("click", function () {
                        $.messager.confirm('添加商品', '确认添加?', function (r) {
                            if (r) {
                                var goodsListPic = $('#add-list-review-div').children("img").attr("src");
                                var goodsMainPic = $('#add-main-review-div').children("img").attr("src");
                                var goodsSecondPic = $('#add-second-review-div').children("img").attr("src");
                                var goodsThirthPic = $('#add-thirth-review-div').children("img").attr("src");
                                var goodsTitle = $('#add-name').val();
                                var goodsIntro = $('#add-intro').val();
                                var goodsSalesPrice = $('#add-sale-price').val();
                                var goodsOPrice = $('#add-o-price').val();
                                var goodsDCharge = $('#add-d-charge').val();
                                var goods = {
                                    title: goodsTitle,
                                    intro: goodsIntro,
                                    goodsListPic: goodsListPic,
                                    goodsMainPic: goodsMainPic,
                                    goodsSecondPic: goodsSecondPic,
                                    goodsThirthPic: goodsThirthPic,
                                    price: goodsSalesPrice,
                                    oPrice: goodsOPrice,
                                    dCharge: goodsDCharge
                                }
                                var goodsAttr = new Array();
                                $(attrArray).each(function (i, e) {
                                    var spans = e.ul.children("ul").children("li").children("span");
                                    $(spans).each(function (i, se) {
                                        var parentId = e.id;
                                        var id = $(se).attr("value");
                                        var name = $(se).text();
                                        var attr = {
                                            parentId: parentId,
                                            attrId: id,
                                            attrName: name
                                        }
                                        goodsAttr.push(attr);
                                    })
                                })
                                var goodsSkus = new Array();
                                var skuArray = $(".add-sku");
                                $(skuArray).each(function (i, e) {
                                    var id = $(e).attr("sku-id");
                                    var name = $(e).prev("label").text();
                                    var orginalNum = $(e).val();
                                    var goodsSku = {
                                        skuId: id,
                                        skuName: name,
                                        orginalNum: orginalNum
                                    }
                                    goodsSkus.push(goodsSku);
                                })
                                var goodsCat = {
                                    cats: $("#add-cats").val(),
                                    catsName: $("#add-cats").find("option:selected").text(),
                                    catsParentId: $("#add-cats-parent").val(),
                                };
                                var goodsDetail = CKEDITOR.instances.addDetail.getData();
                                var detail = {
                                    context: goodsDetail
                                }
                                var goodsForm = {
                                    goods: goods,
                                    goodsCat: goodsCat,
                                    goodsAttrs: goodsAttr,
                                    goodsSkus: goodsSkus,
                                    goodsDetail: detail,
                                }
                                $.ajax({
                                    type: "POST",
                                    url: prefix + "/admin/goods/add",
                                    data: $.customParam(goodsForm),
                                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
//                        contentType: "application/json",
                                    dataType: "json",
                                    success: function (data) {
                                        if (data.code == "0") {
                                            attrArray = new Array();//clean
                                            SKU.clean("sku-group");
                                            $("#attr-group").html("");
                                            $('#AddWin').window('close');
                                            $.messager.show({
                                                title: '新增成功',
                                                msg: '已添加商品.！',
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
                },
                updateGoods: function () {
                    $("#editor-ok").on("click", function () {
                        $.messager.confirm('编辑商品', '确认修改?', function (r) {
                            if (r) {
                                var goodsListPic = $('#editor-list-review-div').children("img").attr("src");
                                var goodsMainPic = $('#editor-main-review-div').children("img").attr("src");
                                var goodsSecondPic = $('#editor-second-review-div').children("img").attr("src");
                                var goodsThirthPic = $('#editor-thirth-review-div').children("img").attr("src");
                                var goodsTitle = $('#editor-name').val();
                                var goodsIntro = $('#editor-intro').val();
                                var goodsSalesPrice = $('#editor-sale-price').val();
                                var goodsOPrice = $('#editor-o-price').val();
                                var goodsDCharge = $('#editor-d-charge').val();
                                var goodsId = $("#editor-id").val();
                                console.log("goodsId :" + goodsId);
                                var goods = {
                                    id: goodsId,
                                    title: goodsTitle,
                                    intro: goodsIntro,
                                    goodsListPic: goodsListPic,
                                    goodsMainPic: goodsMainPic,
                                    goodsSecondPic: goodsSecondPic,
                                    goodsThirthPic: goodsThirthPic,
                                    price: goodsSalesPrice,
                                    oPrice: goodsOPrice,
                                    dCharge: goodsDCharge
                                }
                                var goodsAttr = new Array();
                                $(editorArray).each(function (i, e) {
                                    var spans = e.ul.children("ul").children("li").children("span");
                                    $(spans).each(function (i, se) {
                                        var parentId = e.id;
                                        var id = $(se).attr("value");
                                        var name = $(se).text();
                                        var rId = $(se).attr("r-id");
                                        if (typeof (rId) == "undefined") {
                                            rId = "";
                                        }
                                        var attr = {
                                            id: rId,
                                            parentId: parentId,
                                            attrId: id,
                                            attrName: name
                                        }
                                        goodsAttr.push(attr);
                                    })
                                })
                                var goodsSkus = new Array();
                                var skuArray = $(".editor-sku");
                                $(skuArray).each(function (i, e) {
                                    var id = $(e).attr("sku-id");
                                    var rId = $(e).attr("r-id");
                                    if (typeof (rId) == "undefined") {
                                        rId = "";
                                    }
                                    var name = $(e).prev("label").text();
                                    var orginalNum = $(e).val();
                                    var goodsSku = {
                                        id: rId,
                                        skuId: id,
                                        skuName: name,
                                        orginalNum: orginalNum,
                                    }
                                    goodsSkus.push(goodsSku);
                                })
                                var goodsCat = {
                                    id: $("#editor-cats").attr("r-id"),
                                    cats: $("#editor-cats").val(),
                                    catsName: $("#editor-cats").find("option:selected").text(),
                                    catsParentId: $("#editor-cats-parent").val(),
                                };
                                var goodsDetail = CKEDITOR.instances.editorDetail.getData();
                                var detail = {
                                    id: $("#editor-detail-id").val(),
                                    context: goodsDetail
                                }
                                var goodsForm = {
                                    goods: goods,
                                    goodsCat: goodsCat,
                                    goodsAttrs: goodsAttr,
                                    goodsSkus: goodsSkus,
                                    goodsDetail: detail,
                                }
                                $.ajax({
                                    type: "POST",
                                    url: prefix + "/admin/goods/update",
                                    data: $.customParam(goodsForm),
                                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
//                        contentType: "application/json",
                                    dataType: "json",
                                    success: function (data) {
                                        if (data.code == "0") {
                                            editorArray = new Array();//clean
                                            $('#EditorWin').window('close');
                                            $.messager.show({
                                                title: '编辑成功',
                                                msg: '修改成功.！',
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
                }
            }

            GoodsApi.loadAttrParent();
            GoodsApi.dynmicAddAttrChild();
            GoodsApi.dynmicEditorAttrChild();
            GoodsApi.loadCatsParent();
            GoodsApi.dynmicAddCatsChild();
            GoodsApi.dynmicEditorCatsChild();
            GoodsApi.addGoods();
            GoodsApi.updateGoods();
        })();
    </script>
    <script src="<c:url value="../js/homall/admin/goods/goods-qiniu.js"/>"></script>
    <script src="<c:url value="../js/ckeditor-h/ckeditor.js"/>"></script>
    <script>
        var CKeditor = CKEDITOR.replace('addDetail');
        var CKeditor = CKEDITOR.replace('editorDetail');
    </script>
</html>
