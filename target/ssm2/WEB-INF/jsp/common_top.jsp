<%--
  Created by IntelliJ IDEA.
  User: 王志帅
  Date: 2021/1/10
  Time: 18:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/resources/css/common_top.css" rel="stylesheet" />
    <script type="text/javascript">
        function clear() {
            alert("ss");
            sessionStorage.clear();
            alert("cg");
            window.location.href = "http://localhost:8080/ssm2";
        }
    </script>
</head>
<body>

<div id="foot">
    <div id="foot1">
        <span id="foot11">山大商院</span>
        <span id="foot13">宿舍管理系统</span>
        <i class="fa fa-unlock" id="icon"></i><span style="color: white">欢迎：<img src="/image/${photo}" style="width:20px;height: 20px;position: absolute;margin-top: 13px;border-radius: 50%;overflow: hidden;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${name}<span style="font-size: 10px;color: #f9fffd;">(${admin}${manager})</span></span>

        <%--<i class="fa fa-user" id="user"><a href = "javascript:void(0)" onclick = "document.getElementById('adminlight').style.display='block';document.getElementById('adminfade').style.display='block'">用户信息</a></i>
        --%><i class="fa fa-lock" id="update"><a href = "javascript:void(0)" onclick = "document.getElementById('adminlight').style.display='block';document.getElementById('adminfade').style.display='block'">修改密码</a></i>
        <i class="fa fa-sign-out" id="exit"> <a href="sign" id="a">注销</a></i>
    </div>


</div>



<div id="adminlight" class="admin_white_content">
    <div class="admin_light_1">
        <div class="light_11"><strong>修改密码</strong></div>
    </div>
    <div class="admin_second">
        <form action="updatePw" method="post">
            <SPAN>*</SPAN>用&nbsp&nbsp&nbsp&nbsp户&nbsp&nbsp&nbsp名: <input type="text" id="username"  value="${name}" name="username" readonly="readonly"/><br>
            <SPAN>*</SPAN>原&nbsp始&nbsp密&nbsp码: <input type="text" name="password"/><br>
            <SPAN>*</SPAN>修&nbsp改&nbsp密&nbsp码: <input type="text" name="password1"/><br>
            <SPAN>*</SPAN>确&nbsp认&nbsp密&nbsp码: <input type="text" name="password2"/><br>
            <input CLASS="admin_second1" type="submit" value="确认 "  />
            <input CLASS="admin_second2" type="button" value="取消"  onclick = "document.getElementById('adminlight').style.display='none';document.getElementById('adminfade').style.display='none'"/>

        </form>
    </div>
</div>

<div id="adminfade" class="admin_black_overlay"></div>

</body>
</html>
