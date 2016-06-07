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
    <title>HOMALL | 类别管理 </title>
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
                <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">类别管理</strong> /
                    <small>Category</small>
                </div>
            </div>

            <hr>

            <div class="am-g">
                <div class="am-u-sm-12 am-u-md-6">
                    <div class="am-btn-toolbar">
                        <div class="am-btn-group am-btn-group-s">
                            <button onclick="$('#AddParentWin').window('open')" type="button"
                                    class="am-btn am-btn-default"><span class="am-icon-plus"></span>新增父类别
                            </button>
                            <button onclick="$('#AddWin').window('open')" type="button" class="am-btn am-btn-default">
                                <span class="am-icon-plus"></span>新增子类别
                            </button>
                        </div>
                    </div>
                </div>
                <div class="am-u-sm-12 am-u-md-3">
                    <div class="am-form-group">
                        <select id="parentSelect" data-am-selected="{btnSize: 'sm'}">
                            <option value="0">所有类别</option>
                        </select>
                    </div>
                </div>
                <div class="am-u-sm-12 am-u-md-3">
                    <div class="am-input-group am-input-group-sm">
                        <input type="text" class="am-form-field">
                          <span class="am-input-group-btn">
                            <button class="am-btn am-btn-default" type="button">搜索</button>
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
                            <th data-field="id" class="table-id">ID</th>
                            <th data-field="logo" class="table-title">LOGO</th>
                            <th data-field="typeName" class="table-type">类别名</th>
                            <th data-field="cTime" class="table-author am-hide-sm-only">创建时间</th>
                            <th data-field="uTime" class="table-date am-hide-sm-only">修改日期</th>
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

    <div id="EditorWin" class="easyui-window" title="编辑" data-options="iconCls:'icon-save',closed:true"
         style="width:50%;height:80%;padding:5px;">
        <div class="easyui-layout" data-options="fit:true">
            <div data-options="region:'center'" style="padding:10px;">
                <form id="editor-form" class="am-form">
                    <fieldset>
                        <input id="editor-id" type="text" style="display: none">
                        <div class="am-form-group">
                            <label for="editor-name">类别名</label>
                            <input id="editor-name" type="text" class="" placeholder="输入类别名">
                        </div>
                        <div class="am-form-group">
                            <label for="editor-parent">所属类别</label>
                            <select id="editor-parent">
                            </select>
                            <span class="am-form-caret"></span>
                        </div>
                        <div class="am-form-group am-form-file" id="editor-upload">
                            <label for="editor-logo">上传新的LOGO</label>
                            <div>
                                <button type="button" class="am-btn am-btn-default am-btn-sm">
                                    <i class="am-icon-cloud-upload"></i> 选择要上传的LOGO
                                </button>
                            </div>
                            <input id="editor-upload-btn" type="file" id="editor-logo">
                            <p class="am-form-help">预览:
                                <img id="editor-logo-review" src="" width="80px" height="80px">
                            </p>
                        </div>
                    </fieldset>
                </form>
            </div>
            <div data-options="region:'south',border:false" style="text-align:center;padding:5px 0 0;">
                <a id="editor-ok-btn" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
                   href="javascript:void(0)" style="width:80px">确认</a>
                <a id="editor-cancel-btn" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
                   href="javascript:void(0)" style="width:80px">取消</a>
            </div>
        </div>
    </div>

    <div id="AddWin" class="easyui-window" title="新增类别" data-options="iconCls:'icon-save',closed:true"
         style="width:50%;height:80%;padding:5px;">
        <div class="easyui-layout" data-options="fit:true">
            <div data-options="region:'center'" style="padding:10px;">
                <form id="add-form" class="am-form">
                    <fieldset>
                        <input id="add-id" type="text" style="display: none">
                        <div class="am-form-group">
                            <label for="editor-name">类别名</label>
                            <input id="add-name" type="text" class="" placeholder="输入类别名">
                        </div>
                        <div class="am-form-group">
                            <label for="editor-parent">所属类别</label>
                            <select id="add-parent">
                            </select>
                            <span class="am-form-caret"></span>
                        </div>
                        <div id="add-logo-div" class="am-form-group am-form-file">
                            <label for="add-logo">上传LOGO</label>
                            <div>
                                <button type="button" class="am-btn am-btn-default am-btn-sm">
                                    <i class="am-icon-cloud-upload"></i> 选择要上传的LOGO
                                </button>
                            </div>
                            <input id="add-logo-btn" type="file" id="add-logo">
                            <p class="am-form-help">预览:
                                <img id="add-logo-review" src="" width="80px" height="80px">
                            </p>
                        </div>
                    </fieldset>
                </form>
            </div>
            <div data-options="region:'south',border:false" style="text-align:center;padding:5px 0 0;">
                <a id="add-ok-btn" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)"
                   style="width:80px">确认</a>
                <a id="add-cancel-btn" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
                   href="javascript:void(0)" style="width:80px">取消</a>
            </div>
        </div>
    </div>

    <div id="AddParentWin" class="easyui-window" title="新增父类别" data-options="iconCls:'icon-save',closed:true"
         style="width:50%;height:40%;padding:5px;">
        <div class="easyui-layout" data-options="fit:true">
            <div data-options="region:'center'" style="padding:10px;">
                <form id="add-parent-form" class="am-form">
                    <fieldset>
                        <input id="add-parent-id" type="text" style="display: none">
                        <div class="am-form-group">
                            <label for="add-parent-name">类别名</label>
                            <input id="add-parent-name" type="text" class="" placeholder="输入类别名">
                        </div>
                    </fieldset>
                </form>
            </div>
            <div data-options="region:'south',border:false" style="text-align:center;padding:5px 0 0;">
                <a id="add-parent-ok-btn" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
                   href="javascript:void(0)" style="width:80px">确认</a>
                <a id="add-parent-cancel-btn" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
                   href="javascript:void(0)" style="width:80px">取消</a>
            </div>
        </div>
    </div>

</body>
<script src="<c:url value="../js/qiniu/plupload.full.min.js"/>"></script>
<script src="<c:url value="../js/qiniu/qiniu.min.js"/>"></script>
<script type="text/javascript">
    (function () {
        var prefix = "${pageContext.request.contextPath}"

        var loadSelectBox = function () {
            $('#add-parent').html("");
            $("#editor-parent").html("");
            $("#parentSelect").html("");
            var allOp = '<option value="0">所有类别</option>';
            $("#parentSelect").append(allOp);
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
                            $('#add-parent').append(op);
                            $("#editor-parent").append(op);
                            $("#parentSelect").append(op);
                        });
                    }
                },
                error: function (msg) {
                    alert(msg);
                }
            })
        }

        loadSelectBox();

        var table = $('#table').DataTable({
            ajax: {
                url: prefix + "/admin/cat/cats/0/",
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
                    "data": "id",
                    "orderable": false,
                    "width": "5%"
                },
                {
                    "data": "logo",
                    "width": "15%"
                },
                {
                    "data": "typeName",
                    "width": "15%"
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
                    "data": "id",
                    "width": "15%"
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
                    "targets": 2
                },
                {
                    "render": function (data, type, row, meta) {
                        return '<div class="am-btn-toolbar">' +
                                '<div class="am-btn-group am-btn-group-xs">' +
                                '<button value="' + data + '" class="am-btn am-btn-default am-btn-xs am-text-secondary editor"><span class="am-icon-pencil-square-o"></span> 编辑</button>' +
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

        $('#parentSelect').on("change", function () {
            var url = table.ajax.url(prefix + "/admin/cat/cats/" + $('#parentSelect').val() + "/");
            url.load();
            table.draw();
        })

        $('#table').find('tbody').on("click", "tr .editor", function () {
            var tr = $(this).parents("tr");
            var data = table.row(tr).data();
            console.log(data);
            $('#EditorWin').window('open');
            $('#editor-id').val(data.id);
            $('#editor-name').val(data.typeName);
            $("#editor-parent").val(data.parentId);
            $('#editor-logo-review').attr("src", data.logo);
        });

        $('#table').find('tbody').on("click", "tr .del", function () {
            var tr = $(this).parents("tr");
            var data = table.row(tr).data();
            console.log(data);
            $.messager.confirm('删除类别', '确认删除?', function (r) {
                if (r) {
                    $.ajax({
                        type: "POST",
                        url: prefix + "/admin/cat/del",
                        data: {
                            id: data.id
                        },
                        contentType: "application/x-www-form-urlencoded; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            if (data.code == "0") {
                                $.messager.show({
                                    title: '删除成功',
                                    msg: '已删除类别.！',
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
            })
        });

        $('#add-ok-btn').on("click", function () {
            var name = $('#add-name').val();
            var parentId = $("#add-parent").val();
            var logo = $('#add-logo-review').attr("src");
            var addForm = {
                typeName: name,
                parentId: parentId,
                logo: logo
            }
            console.log(addForm);
            $.messager.confirm('增加类别', '确认增加?', function (r) {
                if (r) {
                    $.ajax({
                        type: "POST",
                        url: prefix + "/admin/cat/add",
                        data: addForm,
                        contentType: "application/x-www-form-urlencoded; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            if (data.code == "0") {
                                $("#AddWin").window("close");
                                $.messager.show({
                                    title: '新增成功',
                                    msg: '已新增类别.！',
                                    timeout: 2000,
                                    showType: 'fade',
                                    style: {
                                        right: '',
                                        top: document.body.scrollTop + document.documentElement.scrollTop,
                                        bottom: ''
                                    }
                                });
                                table.ajax.reload();
                                $('#add-name').val("");
                                $('#add-logo-review').attr("src", "");
                            }
                        },
                        error: function (msg) {
                            alert(msg);
                        }
                    })
                }
            })
        })

        $('#add-parent-ok-btn').on("click", function () {
            var name = $('#add-parent-name').val();
            $.ajax({
                type: "POST",
                url: prefix + "/admin/cat/addParent",
                data: {
                    typeName: name
                },
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.code == "0") {
                        $("#AddParentWin").window("close");
                        $.messager.show({
                            title: '新增成功',
                            msg: '已添加父类别.！',
                            timeout: 2000,
                            showType: 'fade',
                            style: {
                                right: '',
                                top: document.body.scrollTop + document.documentElement.scrollTop,
                                bottom: ''
                            }
                        });
                        loadSelectBox();
                    }
                },
                error: function (msg) {
                    alert(msg);
                }
            })
        })

        $('#editor-ok-btn').on("click", function () {
            var id = $('#editor-id').val();
            var name = $('#editor-name').val();
            var parentId = $("#editor-parent").val();
            var logo = $('#editor-logo-review').attr("src");
            var editorForm = {
                id: id,
                typeName: name,
                parentId: parentId,
                logo: logo
            }
            console.log(editorForm);
            $.ajax({
                type: "POST",
                url: prefix + "/admin/cat/update",
                data: editorForm,
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.code == "0") {
                        $("#EditorWin").window("close");
                        $.messager.show({
                            title: '编辑成功',
                            msg: '已修改类别.！',
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
        })


        $('#add-cancel-btn').on("click", function () {
            $("#AddWin").window("close");
        })

        $('#add-parent-cancel-btn').on("click", function () {
            $("#AddParentWin").window("close");
        })

        $('#editor-cancel-btn').on("click", function () {
            $("#EditorWin").window("close");
        })

        var addOption = {
            runtimes: 'html5,flash,html4',      // 上传模式,依次退化
            browse_button: 'add-logo-btn',         // 上传选择的点选按钮，**必需**
            uptoken_url: prefix + '/admin/qiniu/uptoken',         // Ajax 请求 uptoken 的 Url，**强烈建议设置**（服务端提供）
            get_new_uptoken: false,             // 设置上传文件的时候是否每次都重新获取新的 uptoken
            domain: 'http://7xtgdy.com1.z0.glb.clouddn.com/',     // bucket 域名，下载资源时用到，**必需**
            container: 'add-logo-div',             // 上传区域 DOM ID，默认是 browser_button 的父元素，
            max_file_size: '100mb',             // 最大文件体积限制
            flash_swf_url:<c:url value="'../js/qiniu/Moxie.swf'"/>,  //引入 flash,相对路径
            max_retries: 3,                     // 上传失败最大重试次数
            dragdrop: false,                     // 开启可拖曳上传
            drop_element: 'add-logo-div',          // 拖曳上传区域元素的 ID，拖曳文件或文件夹后可触发上传
            chunk_size: '4mb',                  // 分块上传时，每块的体积
            auto_start: true,                   // 选择文件后自动上传，若关闭需要自己绑定事件触发上传,
            unique_names: true,              // 默认 false，key 为文件名。若开启该选项，JS-SDK 会为每个文件自动生成key（文件名）
            save_key: true,
            init: {
                'FilesAdded': function (up, files) {
                    plupload.each(files, function (file) {
                        // 文件添加进队列后,处理相关的事情
                    });
                },
                'BeforeUpload': function (up, file) {
                    // 每个文件上传前,处理相关的事情
                },
                'UploadProgress': function (up, file) {
                    // 每个文件上传时,处理相关的事情
                },
                'FileUploaded': function (up, file, info) {
                    var domain = up.getOption('domain');
                    var res = jQuery.parseJSON(info);
                    var sourceLink = domain + res.key;// 获取上传成功后的文件的Url
                    $('#add-logo-review').attr("src", sourceLink);
                    console.log(sourceLink);
                },
                'Error': function (up, err, errTip) {
                    //上传出错时,处理相关的事情
                },
                'UploadComplete': function () {
                    //队列文件处理完毕后,处理相关的事情
                },
                'Key': function (up, file) {
                    // 若想在前端对每个文件的key进行个性化处理，可以配置该函数
                    // 该配置必须要在 unique_names: false , save_key: false 时才生效

                    var key = "";
                    // do something with key here
                    return key
                }
            }
        }

        var editorOption = {
            runtimes: 'html5,flash,html4',      // 上传模式,依次退化
            browse_button: 'editor-upload-btn',         // 上传选择的点选按钮，**必需**
            uptoken_url: prefix + '/admin/qiniu/uptoken',         // Ajax 请求 uptoken 的 Url，**强烈建议设置**（服务端提供）
            get_new_uptoken: false,             // 设置上传文件的时候是否每次都重新获取新的 uptoken
            domain: 'http://7xtgdy.com1.z0.glb.clouddn.com/',     // bucket 域名，下载资源时用到，**必需**
            container: 'editor-upload',             // 上传区域 DOM ID，默认是 browser_button 的父元素，
            max_file_size: '100mb',             // 最大文件体积限制
            flash_swf_url:<c:url value="'../js/qiniu/Moxie.swf'"/>,  //引入 flash,相对路径
            max_retries: 3,                     // 上传失败最大重试次数
            dragdrop: false,                     // 开启可拖曳上传
            drop_element: 'editor-upload',          // 拖曳上传区域元素的 ID，拖曳文件或文件夹后可触发上传
            chunk_size: '4mb',                  // 分块上传时，每块的体积
            auto_start: true,                   // 选择文件后自动上传，若关闭需要自己绑定事件触发上传,
            unique_names: true,              // 默认 false，key 为文件名。若开启该选项，JS-SDK 会为每个文件自动生成key（文件名）
            save_key: true,
            init: {
                'FilesAdded': function (up, files) {
                    plupload.each(files, function (file) {
                        // 文件添加进队列后,处理相关的事情
                    });
                },
                'BeforeUpload': function (up, file) {
                    // 每个文件上传前,处理相关的事情
                },
                'UploadProgress': function (up, file) {
                    // 每个文件上传时,处理相关的事情
                },
                'FileUploaded': function (up, file, info) {
                    var domain = up.getOption('domain');
                    var res = jQuery.parseJSON(info);
                    var sourceLink = domain + res.key;// 获取上传成功后的文件的Url
                    $('#editor-logo-review').attr("src", sourceLink);
                    console.log(sourceLink);
                },
                'Error': function (up, err, errTip) {
                    //上传出错时,处理相关的事情
                },
                'UploadComplete': function () {
                    //队列文件处理完毕后,处理相关的事情
                },
                'Key': function (up, file) {
                    // 若想在前端对每个文件的key进行个性化处理，可以配置该函数
                    // 该配置必须要在 unique_names: false , save_key: false 时才生效

                    var key = "";
                    // do something with key here
                    return key
                }
            }
        };

        var uploader = Qiniu.uploader(addOption);
        var Qiniu2 = new QiniuJsSDK();
        var uploader2 = Qiniu2.uploader(editorOption)
    })();
</script>
</html>
