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
    <title>HOMALL | 统计管理 </title>
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
                <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">成交量统计-商品</strong> /
                    <small>Count By Goods</small>
                </div>
            </div>

            <hr>

            <div class="am-g">
                <div class="am-u-sm-12">
                    <table id="table" class="am-table am-table-striped am-table-hover table-main">
                        <thead>
                        <tr>
                            <th data-field="logo" class="table-title">主图</th>
                            <th data-field="typeName" class="table-type">标题</th>
                            <th data-field="typeName" class="table-type">价格</th>
                            <th data-field="typeName" class="table-type">成交量</th>
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

</div>

<script src="<c:url value="../js/chart/Chart.js"/>"></script>
<script type="text/javascript">
    (function () {
        var prefix = "${pageContext.request.contextPath}"


        function praseDate(time) {
            if (time == "") {
                return 0;
            }
            var nowTemp = new Date(time);
            return new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0).getTime();
        }


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


        function loadCats(parentId) {
            $.ajax({
                type: "POST",
                url: prefix + "/admin/count/goods",
                data: {type: 0},
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var table = $('#table').DataTable({
                        data: data,
                        autoWidth: false,
                        columns: [
                            {
                                "data": "goodsMainPic",
                                "orderable": false,
                                "width": "25%"
                            },
                            {
                                "data": "title",
                                "width": "25%"
                            },
                            {
                                "data": "price",
                                "width": "25%"
                            },
                            {
                                "data": "counter",
                                "width": "25%"
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
                                "targets": 0
                            },
                            {
                                "render": function (data, type, row, meta) {
                                    return '<a class="am-badge am-badge-success">' + data + '</a>'
                                },
                                "targets": 3
                            }
                        ],
//            serverSide: true,
                        pagingType: "full_numbers",
                        searching: false,
//              ordering:false
                    });
                },
                error: function (msg) {
                    alert(msg);
                }
            })
        }

        loadCats();
    })();
</script>
</html>
