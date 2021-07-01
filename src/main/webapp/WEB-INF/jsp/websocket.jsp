<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Java后端WebSocket的Tomcat实现</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/websocket.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/websocket.js"></script>
    <script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/emoji_jQuery.min.js"></script>
</head>
<body>
<%@ include file="common_top.jsp"%>

<div id="center1">
    <%@ include file="common_left.jsp"%>
    <div id="right">
        <center id="nowDiv"></center>
        <hr>
        <div id="message">
            <div id="welcome">欢迎：<b id="admin">${admin}</b>进入聊天室</div>
            当前有${count}人
            <div id="nowDiv2"></div><br>
            <div id="nowDiv1"></div><br><hr>
            <div></div>
        </div>
        <input id="text" type="text"/>
        <button onclick="send()">发送消息</button>

        <hr/>
        <button onclick="closeWebSocket()">退出</button>

        <div id="test"></div>
        <div id="div-emoji">
            <p>
                <input id="input" type="text" name="${admin}">
            </p>
            <p>
                <button id="send">发送</button>
                <button id="btn">emojiBtn</button>
            </p>
        </div>
    </div>
</div>

<%@ include file="common_bottom.jsp"%>
</body>



</html>

