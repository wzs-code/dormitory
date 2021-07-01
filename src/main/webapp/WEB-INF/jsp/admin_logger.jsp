<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<html>
<head>
    <title>日志管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/resources/css/admin_looger.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js"></script>
    <script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>

</head>
<body>

<%@ include file="common_top.jsp"%>

<div id="center1">
    <%@ include file="common_left.jsp"%>
    <div id="right">
        <br>
        <strong id="xueshe" >&nbsp;&nbsp;※<a href="visitor" style="text-decoration: none;color: black">当前位置》学生管理》日志登录信息</a>※</strong><br><hr>
<%--        <button class="btn2" style="height: 35px;width:100px;border: 1px solid #9BDAF5;border-radius: 5px;background-color: #FFFFFF;color:#3ebff5 " onclick="todelect()"><span style="font-size: 18px"><i class="fa fa-trash-o"></i></span>&nbsp;批量删除</button>--%>

        <center>
            <div id="right2">
                <table border="1">
                    <thead>
                    <tr style="background-color: #d6d6d6">
                        <td style="width: 80px">管理员</td>
                        <td style="width: 140px">操作时间</td>
                        <td style="width: 90px">IP</td>
                        <td style="width: 180px">路径</td>
                        <td style="width: 40px">执行时间</td>
                        <td style="width: 300px">操作方法</td>
                    </tr>
                    </thead>
                    <c:forEach items="${pageinfo.list}" var="data">
                        <tbody>
                        <tr>
                            <td>${data.username}</td>
                            <td><fmt:formatDate value="${data.visitTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td>${data.ip}</td>
                            <td style="width: 180px">${data.url}</td>
                            <td>${data.executionTime}s</td>
                            <td>${data.method}</td>
                        </tr>
                        </tbody>
                    </c:forEach>

                </table>

            </div>
        </center><br>
        <div id="right3">
            <ul>
                <li><a href="${pageContext.request.contextPath}/findLogger?page=1&size=10" aria-label="Previous">首頁</a></li>
                <li><a href="${pageContext.request.contextPath}/findLogger?page=${pageinfo.pageNum-1}&size=10" >上一頁</a></li>
                <c:forEach begin="1" end="${pageinfo.pages}" var="pageNum">
                    <a href="${pageContext.request.contextPath}/findLogger?page=${pageNum}&size="10></a>
                </c:forEach>
                <li><a href="${pageContext.request.contextPath}/findLogger?page=${pageinfo.pageNum+1}&size=10">下一頁</a></li>
                <li><a href="${pageContext.request.contextPath}/findLogger?page=${pageinfo.pages}&size=8" aria-label="Next">尾頁</a></li>
                <li style="font-size: 20px">共有${pageinfo.pages}頁，${number}条记录</li>
            </ul>
        </div>

    </div>
</div>

<%@ include file="common_bottom.jsp"%>
</body>
</html>





