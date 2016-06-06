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
                <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">成交额统计-类别</strong> /
                    <small>Sum By Cats</small>
                </div>
            </div>

            <hr>

            <div class="am-g">
                <div class="am-u-sm-12">
                    大类别成交额/Parent Cats
                </div>
            </div>


            <div class="am-g">
                <div class="am-u-sm-12">
                    <canvas width="120" height="40" id="myChart"></canvas>
                </div>
            </div>

            <div class="am-g">
                <div class="am-u-sm-12">
                    子类别成交额/Cats
                </div>
                <div class="am-margin-vertical-xl">
                    <label class="am-u-sm-4 control-label">所属父类别:</label>
                    <div class="am-u-sm-8">
                        <select id="parentSelect"
                                data-am-selected="{btnWidth: '100%', btnSize: 'sm', btnStyle: 'secondary',dropUp: 0}">
                        </select>
                    </div>
                </div>
            </div>


            <div class="am-g">
                <div id="monthChartParent" class="am-u-sm-12">
                    <canvas width="120" height="40" id="monthChart"></canvas>
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

        var getRandomColor = function () {
            return '#' +
                    (function (color) {
                        return (color += '0123456789abcdef'[Math.floor(Math.random() * 16)])
                        && (color.length == 6) ? color : arguments.callee(color);
                    })('');
        }

        function loadParent() {
            $.ajax({
                type: "POST",
                url: prefix + "/admin/count/catsParent/",
                data: {type: 1},
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    var labelsArray = new Array()
                    var datasArray = new Array();
                    var colorsArray = new Array();
                    $(data).each(function (i, e) {
                        var label = e.catsName;
                        labelsArray.push(label);
//                        if(e.counter == null){
//                            datasArray.push(0);
//                        }else{
                        datasArray.push(e.counter);
//                        }
                        colorsArray.push(getRandomColor());
                    })

                    var data = {
                        labels: labelsArray,
                        datasets: [
                            {
                                data: datasArray,
                                backgroundColor: colorsArray,
                                hoverBackgroundColor: colorsArray
                            }]
                    };
                    var ctx = $("#myChart");
                    var myPieChart = new Chart(ctx, {
                        type: 'pie',
                        data: data,
                        options: {}
                    });
                },
                error: function (msg) {
                    alert(msg);
                }
            })
        }

        loadParent();

        var loadSelectBox = function () {
            $("#parentSelect").html("");
            var allOp = '<option>请选择类别</option>';
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

        $(document).on("change", "#parentSelect", function () {
            loadCats($(this).val());
        })

        function loadCats(parentId) {
            $.ajax({
                type: "POST",
                url: prefix + "/admin/count/cats/" + parentId,
                data: {type: 1},
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.length > 0) {
                        var labelsArray = new Array()
                        var datasArray = new Array();
                        var colorsArray = new Array();
                        $(data).each(function (i, e) {
                            var label = e.catsName;
                            labelsArray.push(label);
//                        if(e.counter == null){
//                            datasArray.push(0);
//                        }else{
                            datasArray.push(e.counter);
//                        }
                            colorsArray.push(getRandomColor());
                        })

                        var data = {
                            labels: labelsArray,
                            datasets: [
                                {
                                    data: datasArray,
                                    backgroundColor: colorsArray,
                                    hoverBackgroundColor: colorsArray
                                }]
                        };
                        if ($("#monthChart").hasClass("init")) {
                            $('#monthChart').remove(); // this is my <canvas> element
                            $('#monthChartParent').append('<canvas width="120" height="40" id="monthChart"></canvas>');
                        }
                        var ctx = $("#monthChart");
                        var myPieChart = new Chart(ctx, {
                            type: 'pie',
                            data: data,
                            options: {}
                        });
                        $("#monthChart").addClass("init");
                    } else {
                        if ($("#monthChart").hasClass("init")) {
                            $('#monthChart').remove(); // this is my <canvas> element
                            $('#monthChartParent').append('<canvas width="120" height="40" id="monthChart"></canvas>');
                        }
                        $.messager.show({
                            title: '子类别统计查询',
                            msg: '暂无成交数据.！',
                            timeout: 2000,
                            showType: 'fade',
                        });
                    }
                },
                error: function (msg) {
                    alert(msg);
                }
            })
        }


    })();
</script>
</html>
