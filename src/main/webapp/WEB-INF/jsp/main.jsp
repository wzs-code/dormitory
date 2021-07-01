<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet">
    <script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</head>
<body>
    <div id="foot">
        <div id="foot1">
            <span id="foot11">信息管理</span>
            <span id="foot12">
              ${admin} <a href="login.jsp" id="a">注销</a>
            </span>

        </div>
    </div>

    <div id="left">
            <ul>
                <li class="first">信息管理    <br>
                    <ul class="menu">
                        <li><button onclick="window.location.href='show'"><h2>首页</h2></button><br></li>
                        <li><button onclick="window.location.href='insert'">添加</button><br></li>
                        <li><button onclick="window.location.href='select'">查询</button></li>
                    </ul>
                </li>
            </ul>
    </div>



    <div id="center"></div>
    <div id="right">
        <div id="right1">
            主頁 》 查看消息
        </div>

        <div id="right2">
            <button id="btn2" onclick="todelect()">批量删除</button>
            <table border="1">
                <thead>
                <tr>
                    <td><input type="checkbox"  name="selectall" onclick="selectall()"/></td>
                    <td>ID</td>
                    <td>姓名</td>
                    <td>性别</td>
                    <td>年龄</td>
                    <td>生日</td>
                    <td>操作</td>
                </tr>
                </thead>
                <c:forEach items="${pageinfo.list}" var="data">
                    <tbody>
                    <tr>
                        <td><input type="checkbox" name="Id" value="${data.id}"/></td>
                        <td>${data.id}</td>
                        <td>${data.name}</td>
                        <td>${data.sex}</td>
                        <td>${data.age}</td>
                        <td>${data.date}</td>
                        <td><button type="button">
                            <!-- 删除当前项 -->
                            <a href="delete?id=${data.id}">删除|</a>
                            <a href="update?id=${data.id}">更新 </a>
                        </button></td>
                    </tr>
                    </tbody>
                </c:forEach>

            </table>

        </div >

        <div id="right3">
            <ul>
                <li><a href="${pageContext.request.contextPath}/show?page=1&size=5" aria-label="Previous">首頁</a></li>
                <li><a href="${pageContext.request.contextPath}/show?page=${pageinfo.pageNum-1}&size=5" >上一頁</a></li>
                <c:forEach begin="1" end="${pageinfo.pages}" var="pageNum">
                    <a href="${pageContext.request.contextPath}/show?page=${pageNum}&size="5></a>
                </c:forEach>
                <li><a href="${pageContext.request.contextPath}/show?page=${pageinfo.pageNum+1}&size=5">下一頁</a></li>
                <li><a href="${pageContext.request.contextPath}/show?page=${pageinfo.pages}&size=5" aria-label="Next">尾頁</a></li>
                <li>共有${pageinfo.pages}頁，${pageinfo.size}条记录</li>
            </ul>
        </div>

    </div>



</body>
</html>
