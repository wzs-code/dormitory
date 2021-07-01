<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%--
  Created by IntelliJ IDEA.
  User: 王志帅
  Date: 2021/1/28
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/resources/css/stu_select.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">
    <script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="common_top.jsp"%>
<div id="center1">
    <%@ include file="common_left.jsp"%>
    <div id="right">
        <br>
        <strong id="chaxun" >&nbsp;&nbsp;※<a style="text-decoration: none;color: black">当前位置》学生管理》学生详细信息</a>※</strong><br><hr>
        <div id="right2" style="margin-top: 40px">
            <img src="/image/${students.photo}" style="position:absolute;width: 90px;height: 100px;margin-left: 830px">
            <div id="selectstudent">
                <p>
                    <span>学&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp号：</span>${students.sno}
                    <a id="studentright" ><span>姓&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp名：</span>${students.name}</a>
                </p>

                <p>
                    <span>性&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp别：</span>${students.sex}
                    <a id="studentright" ><span>年&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp龄：</span>${students.age}</a>
                </p>
                <p>
                    <span>民&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp族：</span>${students.nation}
                    <a id="studentright"><span>政治面貌：</span>${students.politicalOutlook}</a>
                </p>
                <p>
                    <span>身&nbsp&nbsp份&nbsp证：</span>${students.idcard}
                    <a id="studentright"><span>联系电话：</span>${students.telephone}</a>
                </p>
                <p>
                    <span>出生时间：</span><fmt:formatDate value="${students.birthday}"  pattern="yyyy-MM-dd"/>
                    <a id="studentright" ><span>学&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp历: </span>&nbsp本科</a>
                </p>
                <p>
                    <span>学&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp院：</span>${students.college}
                    <a id="studentright" ><span>专&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp业：</span>${students.major}</a>
                </p>
                <p>
                    <span>班&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp级：</span>${students.classes}
                    <a id="studentright" ><span>导&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp员：</span>${students.teacher}</a>
                </p>
                <p>
                    <span>公&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp寓：</span>${students.dormitory}
                    <a id="studentright"><span>寝&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp室：</span>${students.dorm}</a>
                </p>
                <p>
                    <span>入宿时间：</span><fmt:formatDate value="${students.entrance_time}" pattern="yyyy-MM-dd"/>
                    <a id="studentright" ><span>离宿时间：</span><fmt:formatDate value="${students.graduation_time}" pattern="yyyy-MM-dd"/></a>
                </p>

                <p>
                    <span>联&nbsp&nbsp系&nbsp人：</span>${students.emergency_contact_person}
                    <a id="studentright"><span>联系人电话：</span>${students.emergency_contact_number}</a>
                </p>
                <p>
                    <span>地&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp址：</span>${students.province}${students.city}${students.area}
                </p>
                <p>
                    <span>个人介绍：</span>${students.introduction}<br>
                </p>


            </div>



        </div>



</div>

</body>
</html>
