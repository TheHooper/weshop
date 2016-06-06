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
                <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">成交量统计-日期</strong> /
                    <small>Count By Date</small>
                </div>
            </div>

            <hr>

            <div class="am-g">
                <div class="am-u-sm-12">
                    周成交量/Week
                </div>
            </div>


            <div class="am-g">
                <div class="am-u-sm-12">
                    <canvas width="120" height="40" id="myChart"></canvas>
                </div>
            </div>

            <div class="am-g">
                <div class="am-u-sm-12">
                    月成交量/Month
                </div>
            </div>


            <div class="am-g">
                <div class="am-u-sm-12">
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


        function loadWeek() {
            $.ajax({
                type: "POST",
                url: prefix + "/admin/count/week/",
                data: {type: 0},
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    var labelsArray = new Array()
                    var datasArray = new Array();
                    $(data).each(function (i, e) {
                        var label = "周" + e.name;
                        labelsArray.push(label);
                        if (e.counter == null) {
                            datasArray.push(0);
                        } else {
                            datasArray.push(e.counter);
                        }
                    })

                    var ctx = $("#myChart");
                    var myChart = new Chart(ctx, {
                        type: 'bar',
                        data: {
                            labels: labelsArray,
                            datasets: [{
                                label: '本周成交量',
                                data: datasArray,
                                backgroundColor: [
                                    'rgba(255, 99, 132, 0.2)',
                                    'rgba(54, 162, 235, 0.2)',
                                    'rgba(255, 206, 86, 0.2)',
                                    'rgba(75, 192, 192, 0.2)',
                                    'rgba(153, 102, 255, 0.2)',
                                    'rgba(255, 159, 64, 0.2)'
                                ],
                                borderColor: [
                                    'rgba(255,99,132,1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(75, 192, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)'
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

                },
                error: function (msg) {
                    alert(msg);
                }
            })
        }

        loadWeek();

        function loadMonth() {
            $.ajax({
                type: "POST",
                url: prefix + "/admin/count/month/",
                data: {type: 0},
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    var labelsArray = new Array()
                    var datasArray = new Array();
                    $(data).each(function (i, e) {
                        var label = e.name + "月";
                        labelsArray.push(label);
                        if (e.counter == null) {
                            datasArray.push(0);
                        } else {
                            datasArray.push(e.counter);
                        }
                    })

                    var monthCtx = $("#monthChart");
                    var monthChart = new Chart(monthCtx, {
                        type: 'bar',
                        data: {
                            labels: labelsArray,
                            datasets: [{
                                label: '月成交量',
                                data: datasArray,
                                backgroundColor: [
                                    'rgba(255, 99, 132, 0.2)',
                                    'rgba(54, 162, 235, 0.2)',
                                    'rgba(255, 206, 86, 0.2)',
                                    'rgba(75, 192, 192, 0.2)',
                                    'rgba(153, 102, 255, 0.2)',
                                    'rgba(255, 159, 64, 0.2)'
                                ],
                                borderColor: [
                                    'rgba(255,99,132,1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(75, 192, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)'
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

                },
                error: function (msg) {
                    alert(msg);
                }
            })
        }

        loadMonth();

    })();
</script>
</html>
