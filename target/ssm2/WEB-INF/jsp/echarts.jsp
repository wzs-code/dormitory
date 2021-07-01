
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!-- 引入页面框架jsp文件 -->

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/stu_insert.css" rel="stylesheet">
    <!-- 导入echart图表的核心依赖库 -->
    <script src="${pageContext.request.contextPath}/resources/js/echart.js"></script>
    <script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
    <title>故障统计</title>

</head>
<body>
<%@ include file="common_top.jsp"%>

<div id="center1">
    <%@ include file="common_left.jsp"%>
    <div id="right">
        <article>
            <div class="container " style="margin: 10px 10px; float:left;width: 98%;height:330px; background-color: #F0F8FF;">
                <div id="zhu" style="margin: 10px 10px; float:left;width: 48%;height:330px;"></div>
                <div id="bing" style="margin: 10px 10px;float: right; width: 48%;height:330px;"></div>
            </div>
        </article>

        <div style="margin: 1px 10px;float: left; width: 98%;height:400px; background-color: #e7eef5;">
            <span style="display: block;text-align: center;margin-bottom: 50px;margin-top: 5px;font-size: 17px;color: #3b7780">选择你要查询的公寓：
                <select name="dormitory"  id="dormitory"  onclick="getDorm()" style="margin: auto;height: 25px;width: 120px"  required="required">
                    <option value="" style="height: 30px">请选择公寓</option>
                    <c:forEach items="${dormitorys}" var="c1">
                        <c:choose>
                            <c:when test="${c1.dormitory=='森博1'}">
                                <option value="${c1.dormitory}" selected>${c1.dormitory}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${c1.dormitory}">${c1.dormitory}</option>
                            </c:otherwise>
                        </c:choose>

                    </c:forEach>
                </select>
            </span>
            <article>
                <div class="container">
                    <div id="dormitoryzhu" style="float: left; width: 47%;height:330px;">
                    </div>
                    <div id="dormitorybing" style="float: left; width: 47%;height:330px;">
                    </div>
                </div>
            </article>
        </div>

    </div>
</div>
<%@ include file="common_bottom.jsp"%>
<script type="text/javascript">

    //从数据库读取数据赋值给echarts
    function getDorm(){

        var dormitory = $("#dormitory").val();

        var myChart2 = echarts.init(document.getElementById('dormitoryzhu'));
        var options = {

            title: {
                text: '故障统计柱形图',
                show: true, // 是否显示标题
                subtext: '数据显示',
                textStyle: {
                    fontSize: 18 // 标题文字大小
                }
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                }
            },
            legend: {
                data: ['故障次数']
            },
            // X轴
            xAxis: {
                data: [] // 异步请求时,

            },
            // Y轴
            yAxis: {},
            series: [{
                name: '故障次数',
                type: 'bar', // 设置图表类型为柱状图
                data: [] ,// 设置纵坐标的刻度(异步请求时,这里要置空)
                barWidth : 30,
                itemStyle: {
                    normal: {
                        //这里是重点
                        color: function(params) {
                            //注意，如果颜色太少的话，后面颜色不会自动循环，最好多定义几个颜色
                            var colorList = ['#c23531','#2f4554', '#61a0a8', '#d48265', '#91c7ae','#749f83', '#ca8622'];
                            return colorList[params.dataIndex]
                        }
                    }
                }

            }]
        };
        // 给图标设置配置的参数
        myChart2.setOption(options);
        myChart2.showLoading();

        $.ajax({

            url : "${pageContext.request.contextPath}/getdorms/"+dormitory,
            type : "GET",
            dataType : "json",
            success: function(data) {
                var names = [];
                var nums = [];
                $.each(data, function(index, obj) {
                    names.push(obj.dormitory);
                    nums.push(obj.count);
                })

                myChart2.hideLoading(); // 隐藏加载动画
                myChart2.setOption({
                    legend: {
                        data: ['故障次数']
                    },
                    xAxis: {
                        data: names
                    },
                    series: [{
                        name: '故障次数',
                        type: 'bar', // 设置图表类型为柱状图
                        data: nums // 设置纵坐标的刻度
                    }]
                });
            }
        });







        var myChart3 = echarts.init(document.getElementById('dormitorybing'));
        var option = {
            title: {
                text: '公寓故障饼状统计图',
                subtext: '未加载成功数据',
                x: 'center'
            },
            series:[{
                name:'故障次数',
                type:'pie',
                radius:'90%',
                data:[
                    {value:0,name:'无'},
                ]
            }]
        };

        myChart3.setOption(option);


        $.ajax({
            url : "${pageContext.request.contextPath}/getdorms/"+dormitory,
            type : "GET",
            dataType : "json",
            success : function(data) {
                //创建一个数组，用来装对象传给series.data，因为series.data里面不能直接鞋for循环
                var servicedata=[];
                var servicedata2=[];

                for(var i=0;i<data.length;i++){
                    var obj=new Object();
                    obj.name=data[i].dormitory;
                    obj.value=data[i].count;
                    servicedata[i]=obj;
                }
                console.log(servicedata);
                for(var j=0;j<data.length;j++){
                    var obj=new Object();
                    obj.name=data[j].dormitory;
                    servicedata2[j]=obj;
                }
                console.log(servicedata2);
                myChart3.setOption({
                    title: {
                        text: '公寓故障次数统计图',
                        subtext: '动态数据',
                        x: 'center'
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    /* 颜色和选项的对应关系 */
                    legend: {
                        orient: 'vertical',
                        left: 'left',
                        data:servicedata2,
                    },
                    series:[{
                        name:'故障量',
                        type:'pie',
                        radius:'60%',
                        data:servicedata,
                    }]

                });

            }
        });
    }
    //初始化echarts
    //初始化echarts实例
    var myChart = echarts.init(document.getElementById('bing'));
    chushihua(myChart);
    fuzhi(myChart);
    function chushihua(myChart){
        var option = {
            title: {
                text: '公寓故障饼状统计图',
                subtext: '未加载成功数据',
                x: 'center'
            },
            series:[{
                name:'故障次数',
                type:'pie',
                radius:'90%',
                data:[
                    {value:0,name:'无'},
                ]
            }]
        };

        myChart.setOption(option);
    }

    //从数据库读取数据赋值给echarts
    function fuzhi(myChart){
        $.ajax({
            url : "${pageContext.request.contextPath}/static",
            type : "GET",
            dataType : "json",
            success : function(data) {
                //创建一个数组，用来装对象传给series.data，因为series.data里面不能直接鞋for循环
                var servicedata=[];
                var servicedata2=[];

                for(var i=0;i<data.length;i++){
                    var obj=new Object();
                    obj.name=data[i].dormitory;
                    obj.value=data[i].count;
                    servicedata[i]=obj;
                }
                console.log(servicedata);
                for(var j=0;j<data.length;j++){
                    var obj=new Object();
                    obj.name=data[j].dormitory;
                    servicedata2[j]=obj;
                }
                console.log(servicedata2);
                myChart.setOption({
                    title: {
                        text: '公寓故障次数统计图',
                        subtext: '动态数据',
                        x: 'center'
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    /* 颜色和选项的对应关系 */
                    legend: {
                        orient: 'vertical',
                        left: 'left',
                        data:servicedata2,
                    },
                    series:[{
                        name:'故障量',
                        type:'pie',
                        radius:'60%',
                        data:servicedata,
                    }]

                });

            }
        });
    }



    var myChart1 = echarts.init(document.getElementById('zhu'));
    chushi(myChart1);
    fu(myChart1);
    function chushi(myChart){
        var options = {

            title: {
                text: '故障统计柱形图',
                show: true, // 是否显示标题
                subtext: '数据显示',
                textStyle: {
                    fontSize: 18 // 标题文字大小
                }
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                }
            },
            legend: {
                data: ['故障次数']
            },
            // X轴
            xAxis: {
                data: [] // 异步请求时,

            },
            // Y轴
            yAxis: {},
            series: [{
                name: '故障次数',
                type: 'bar', // 设置图表类型为柱状图
                data: [] ,// 设置纵坐标的刻度(异步请求时,这里要置空)
                barWidth : 30,
                itemStyle: {
                    normal: {
                        //这里是重点
                        color: function(params) {
                            //注意，如果颜色太少的话，后面颜色不会自动循环，最好多定义几个颜色
                            var colorList = ['#c23531','#2f4554', '#61a0a8', '#d48265', '#91c7ae','#749f83', '#ca8622'];
                            return colorList[params.dataIndex]
                        }
                    }
                }

            }]
        };
        // 给图标设置配置的参数
        myChart.setOption(options);
        myChart.showLoading();

    }

    //从数据库读取数据赋值给echarts
    function fu(myChart){

        $.ajax({
            url : "${pageContext.request.contextPath}/static",
            type : "GET",
            dataType : "json",
            success: function(data) {
                var names = [];
                var nums = [];
                $.each(data, function(index, obj) {
                    names.push(obj.dormitory);
                    nums.push(obj.count);
                })

                myChart.hideLoading(); // 隐藏加载动画
                myChart.setOption({
                    legend: {
                        data: ['故障次数']
                    },
                    xAxis: {
                        data: names
                    },
                    series: [{
                        name: '故障次数',
                        type: 'bar', // 设置图表类型为柱状图
                        data: nums // 设置纵坐标的刻度
                    }]
                });
            }
        });







    }



</script>
</body>
</html>
