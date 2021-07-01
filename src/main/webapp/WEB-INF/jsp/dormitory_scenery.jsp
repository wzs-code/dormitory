<%--
  Created by IntelliJ IDEA.
  User: 王志帅
  Date: 2021/2/4
  Time: 18:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>宿舍风貌 </title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/resources/css/dormitoryscenery.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/dormitoryfault.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/jquery-accordion-menu.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet" type="text/css" />
    <script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript">
        var index=0;
        //改变图片
        function ChangeImg() {
        index++;
        var a=document.getElementsByClassName("img-slide");
        if(index>=a.length) index=0;
        for(var i=0;i<a.length;i++){
        a[i].style.display='none';
        }
        a[index].style.display='block';
        }
        //设置定时器，每隔两秒切换一张图片
        setInterval(ChangeImg,2000);
    </script>
</head>
<body>


<%@ include file="common_top.jsp"%>

<div id="center1">
    <%@ include file="common_left.jsp"%>
    <div id="right">
        <div id="right1">
            <img class="img-slide img1" src="${pageContext.request.contextPath}/resources/images/sdsy.jpg">
            <img class="img-slide img2" src="${pageContext.request.contextPath}/resources/images/bj1.png">
            <img class="img-slide img3" src="${pageContext.request.contextPath}/resources/images/xz2.png">
        </div>
        <div id="right2">
            <div class="tupian">
                <img src="${pageContext.request.contextPath}/resources/images/xz1.png" style="width: 90%;height: 85%;margin-left: 11px;margin-bottom: 5px">
                <strong style="margin-left: 25%;background-color: #dbe4e9" >森博1寝室102</strong>
            </div>
            <div class="tupian">
                <img src="${pageContext.request.contextPath}/resources/images/xz2.png" style="width: 90%;height: 85%;margin-left: 11px;margin-bottom: 5px">
                <strong style="margin-left: 25%;">森博2寝室101</strong>
            </div>
            <div class="tupian">
                <img src="${pageContext.request.contextPath}/resources/images/xz3.png" style="width: 90%;height: 85%;margin-left: 11px;margin-bottom: 5px">
                <strong style="margin-left: 25%;">行知2寝室301</strong>
            </div>
            <div class="tupian">
                <img src="${pageContext.request.contextPath}/resources/images/xz4.png" style="width: 90%;height: 85%;margin-left: 11px;margin-bottom: 5px">
                <strong style="margin-left: 25%;">森博3寝室101</strong>
            </div>
            <div class="tupian">
                <img src="${pageContext.request.contextPath}/resources/images/xz5.jpg" style="width: 90%;height: 85%;margin-left: 11px;margin-bottom: 5px">
                <strong style="margin-left: 25%;">森博2寝室211</strong>
            </div>
            <div class="tupian">
                <img src="${pageContext.request.contextPath}/resources/images/xz6.jpg" style="width: 90%;height: 85%;margin-left: 11px;margin-bottom: 5px">
                <strong style="margin-left: 25%;">行知3寝室101</strong>
            </div>
            <div class="tupian">
                <img src="${pageContext.request.contextPath}/resources/images/xz7.jpg" style="width: 90%;height: 85%;margin-left: 11px;margin-bottom: 5px">
                <strong style="margin-left: 25%;">行知2寝室101</strong>
            </div>
            <div class="tupian">
                <img src="${pageContext.request.contextPath}/resources/images/xz8.jpg" style="width: 90%;height: 85%;margin-left: 11px;margin-bottom: 5px">
                <strong style="margin-left: 25%;">行知1寝室101</strong>
            </div>
        </div>

    </div>
</div>
<%@ include file="common_bottom.jsp"%>
</body>
</html>





