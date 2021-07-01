<%--
  Created by IntelliJ IDEA.
  User: 王志帅
  Date: 2021/2/1
  Time: 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<?xml version="1.0" encoding="UTF-8"?>
<html>
<head>
    <title>宿舍信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/resources/css/dormitory.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/dormitory.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">
</head>
<body>
<%@ include file="common_top.jsp"%>
<div id="center1">
    <%@ include file="common_left.jsp"%>
    <div id="right">
        <br><br>
        <div id="buttonwidth">
            <c:forEach items="${dormitoies.iterator()}" var="data">
                <button onclick="selectdormitory()" name="dormitory" value="${data}">${data}</button>

            </c:forEach>
            <c:if test="${'管理员'== sessionScope.admin}">
                <button>
                    <a STYLE="text-decoration: none" href = "javascript:void(0)" onclick = "document.getElementById('light1').style.display='block';
                                document.getElementById('fade').style.display='block';updatepw()" class="upatepw">
                        <span style="font-size:20px;color: black"><i class="fa fa-home"></i>&nbsp;&nbsp;+添加</span></a>
                </button>
            </c:if>
        </div>



    </div>
</div>


<div id="light1" class="white_content">
    <div class="light_1">
        <div id="light_11"><strong>公寓建造信息</strong></div>
    </div>
    <div class="second">
        <form id="formId">

            <SPAN>*</SPAN>公&nbsp&nbsp&nbsp&nbsp&nbsp寓: <input type="text" placeholder="公寓名称" id="dormitory" name="dormitory"/><br>
            <SPAN>*</SPAN>寝&nbsp&nbsp&nbsp&nbsp&nbsp室: <input type="text" placeholder="寝室号" id="dorm" name="dorm"/><br>
            &nbsp;床&nbsp&nbsp&nbsp&nbsp&nbsp位: <input type="text" value="默认1——6号床" readonly="readonly" id="bunk" name="bunk"/><br>
            &nbsp;状&nbsp&nbsp&nbsp&nbsp&nbsp态: <input type="text" value="0" id="status" name="status" readonly="readonly"/><br>
            <SPAN>*</SPAN>设&nbsp&nbsp&nbsp&nbsp&nbsp备: <input type="text" placeholder="寝室内配备设备" id="equipment" name="equipment"/><br>
            <SPAN>*</SPAN>位&nbsp&nbsp&nbsp&nbsp&nbsp置: <input type="text" placeholder="该公寓位置" id="site" name="site"/><br>
            <SPAN>*</SPAN>负&nbsp责&nbsp人: <input type="text"  name="leader" id="leader" placeholder="当前公寓负责人"/><br>
            <span class="error" style="margin-top: 12px;display: block"></span><br>
            <input class="second1" type="button" value="建  造"  onclick="insertdormitory()"/>
            <input class="second2" type="button" value="取  消"  onclick = "document.getElementById('light1').style.display='none';document.getElementById('fade').style.display='none'"/>
        </form>

    </div>
</div>



<div id="fade" class="black_overlay"></div>

<%@ include file="common_bottom.jsp"%>


</body>
</html>