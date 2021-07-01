<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<html>
<head>
    <title>公告</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/resources/css/notice.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js"></script>
    <script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>

</head>
<body>
    <%@ include file="common_top.jsp"%>
    <div id="center1">
        <%@ include file="common_left.jsp"%>
        <div id="right">
            <div id="right1">
                <h2>公告通知</h2>
            </div>
            <div id="right2">
                <ul>
                    <c:forEach items="${pageinfo.list}" var="data">
                        <li>
                            <i class="fa fa-envelope">&nbsp;&nbsp;&nbsp;<a href="shownotice?id=${data.id}" target="_blank" style="text-decoration: none;color: black">${data.topic}</a></i>
                            <span style="float: right"><fmt:formatDate value="${data.time}" pattern="yyyy-MM-dd"/></span><hr>
                        </li>
                    </c:forEach>
                </ul>

            </div>
            <div id="right3">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/shownotices?page=1&size=12" aria-label="Previous">首頁</a></li>
                    <li><a href="${pageContext.request.contextPath}/shownotices?page=${pageinfo.pageNum-1}&size=12" >上一頁</a></li>
                    <c:forEach begin="1" end="${pageinfo.pages}" var="pageNum">
                        <a href="${pageContext.request.contextPath}/shownotices?page=${pageNum}&size="12></a>
                    </c:forEach>
                    <li><a href="${pageContext.request.contextPath}/shownotices?page=${pageinfo.pageNum+1}&size=12">下一頁</a></li>
                    <li><a href="${pageContext.request.contextPath}/shownotices?page=${pageinfo.pages}&size=12" aria-label="Next">尾頁</a></li>
                    <li style="font-size: 20px">共有${pageinfo.pages}頁，${number}条记录</li>
                </ul>
            </div>
        </div>

    </div>
    <%@ include file="common_bottom.jsp"%>
</body>
</html>
