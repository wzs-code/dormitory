<%--
  Created by IntelliJ IDEA.
  User: 王志帅
  Date: 2021/2/1
  Time: 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>公寓信息</title>
    <link href="${pageContext.request.contextPath}/resources/css/dormitory.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/dormitory.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">
    <script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="common_top.jsp"%>
<div id="center1">
    <%@ include file="common_left.jsp"%>
    <div id="right">
        <br>
        <strong id="xueshe" >&nbsp;&nbsp;※<a href="visitor" style="text-decoration: none;color: black">当前位置》宿舍管理》公寓信息</a>※</strong>
        <br><hr>
        <center>
            <div id="right2">
                <table border="1">
                    <thead>
                    <tr style="background-color: #AAADB3">
                        <td style="width: 50px">编号</td>
                        <td style="width: 80px">公寓</td>
                        <td style="width: 80px">负责人</td>
                        <td style="width: 100px">寝室</td>
                        <td style="width: 420px">所住学生</td>
                        <td style="width: 120px">位置</td>
                        <td style="width: 150px">设备</td>
                    </tr>
                    </thead>
                    <c:forEach items="${dormitorys.list}" var="data">
                        <tbody>
                        <tr>
                            <td>${data.id}</td>
                            <td>${data.dormitory}</td>
                            <td>${data.leader}</td>
                            <td>${data.dorm}</td>
                            <td style="text-align: left;padding-left: 7px">${data.student}</td>
                            <td>${data.site}</td>
                            <td>${data.equipment}</td>

                        </tr>
                        </tbody>
                    </c:forEach>

                </table>

            </div>
        </center>
        <div id="right3">
            <ul>
                <li><a href="${pageContext.request.contextPath}/dormitorys?page=1&size=10" aria-label="Previous">首頁</a></li>
                <li><a href="${pageContext.request.contextPath}/dormitorys?page=${dormitorys.pageNum-1}&size=10" >上一頁</a></li>
                <c:forEach begin="1" end="${dormitorys.pages}" var="pageNum">
                    <a href="${pageContext.request.contextPath}/dormitorys?page=${pageNum}&size="10></a>
                </c:forEach>
                <li><a href="${pageContext.request.contextPath}/dormitorys?page=${dormitorys.pageNum+1}&size=10">下一頁</a></li>
                <li><a href="${pageContext.request.contextPath}/dormitorys?page=${dormitorys.pages}&size=8" aria-label="Next">尾頁</a></li>
                <li style="font-size: 20px">共有${dormitorys.pages}頁，${number}条记录</li>
            </ul>
        </div>

    </div>
</div>

<%@ include file="common_bottom.jsp"%>
</body>
</html>





