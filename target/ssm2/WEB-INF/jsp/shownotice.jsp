<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<html>
<head>
    <title>${notices.topic}</title>
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
        <br>
        <strong style="color:#870000;font-size: 25px;margin-left: 20px;margin-top: 30px;">${notices.topic}</strong><br>
        <span style="margin-left: 20px;display: block;margin-top: 15px;color: #8f8f8f">发布时间：<fmt:formatDate value="${notices.time}" pattern="yyyy-MM-dd"/></span><hr>
        <div  style="height:500px;margin-left: 90px;margin-right: 90px;overflow:auto;">${notices.notice}</div>
    </div>
</div>
<%@ include file="common_bottom.jsp"%>

</body>
</html>
