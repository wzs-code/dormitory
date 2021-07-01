
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>

    <title>修改密码</title>
    <link href="${pageContext.request.contextPath}/resources/css/login1.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/jquery-accordion-menu.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/resources/js/jsencrypt.min.js"></script>
    <script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>
    <div style="width: 350px;height: 200px;background-color: #dbe4e9;border: 2px solid #7274A7;border-radius: 15px;margin: auto;margin-top: 200px">
        <span style="margin-left:127px;font-size: 25px;color: #134C7F">重设密码</span><br>
        <form action="updatepassword">
            <span style="display:block;margin-top: 15px;margin-left:30px;font-size: 20px">用户名称：<input style="height: 25px" type="text" value="${userName}" name="username" readonly="readonly"></span><br>
            <span style="display:block;margin-top: 17px;margin-left:30px;font-size: 20px">修改密码：<input style="height: 25px;" type="password" name="password" /></span><br>
            <input type="submit" value="修改"  style="width: 80px;height: 25px;margin-left: 140px;background-color: #134C7F">
        </form>
    </div>


</body>
