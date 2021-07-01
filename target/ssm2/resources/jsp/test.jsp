<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 王志帅
  Date: 2020/9/29
  Time: 19:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <table>
        <thead>
        <tr>
            <td>ID</td>
            <td>姓名</td>
            <td>密码</td>
            <td>描述</td>
        </tr>

        </thead>
        <c:forEach items="${list}" var="data">
            <tbody>
            <tr>
                <td>${data.id}</td>
                <td>${data.name}</td>
                <td>${data.password}</td>
                <td>${data.remark}</td>
            </tr>

            </tbody>
        </c:forEach>


    </table>
</body>
</html>
