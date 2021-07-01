
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>登录</title>
    <link href="${pageContext.request.contextPath}/resources/css/login1.css" rel="stylesheet" />

</head>
<body>

<%session.invalidate();%>
<form action="login" method="post">
    <div class="wrap" id="wrap">
        <div class="logGet">
            <!-- 头部提示信息 -->
            <div class="logD logDtip">
                <p class="p1">登录</p>
            </div>
            <!-- 输入框 -->
            <div class="lgD">
                <img src="${pageContext.request.contextPath}/resources/images/logName.png" width="20" height="20" alt=""/>
                <input type="text" name="username"  placeholder="输入用户名" ><br>

            </div>
            <div class="lgD">
                <img src="${pageContext.request.contextPath}/resources/images/logPwd.png" width="20" height="20" alt=""/>
                <input type="password" name="password" placeholder="输入密码"><br>

            </div>
            <div class="lgE">
                <input type="text" name="code"  placeholder="输入验证码" >
                <img src="checkCode" alt="" width="100" height="32" class="passcode" onclick="this.src=this.src+'?'">
            </div>
            <div class="lgE">
                <select id="user_type " name="role">
                    <option value="管理员">管理员</option>
                    <option value="负责人">负责人</option>
                </select>
            </div>
            <input type="submit" value="登录" class="logC"/><br>
            <div class="insert_user">
                <a href = "javascript:void(0)" onclick = "document.getElementById('light1').style.display='block';document.getElementById('fade').style.display='block'">注册</a>
            </div>
            <div class="upatepw">
                <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">修改密码</a>
            </div>

        </div>
    </div>
</form>



<div class="footer" id="foot">
    <%--            <div class="copyright">--%>
    <%--                <p>Copyright © 2018 Qunar.com Inc. All Rights Reserved.</p>--%>
    <%--                <div class="img">--%>
    <%--                    <i class="icon"></i><span>联系邮箱：jiankangsun@yahoo.com</span>--%>
    <%--                </div>--%>

    <%--                <div class="img">--%>
    <%--                    <i class="icon1"></i><span>联系地址：山西大学商务学院大学</span>--%>
    <%--                </div>--%>

    <%--                <div class="img">--%>
    <%--                    <i class="icon2"></i><span>联系电话：18355042634</span>--%>
    <%--                </div>--%>




</div>

<div id="light" class="white_content">
    <div class="container">
        <div class="col-md-12">
            <h1 class="margin-bottom-15">重置您的密码</h1>
            <form  action="forgetpwd" method="post">
                <div class="form-group">
                    <div class="col-md-12">
                        请输入邮箱或用户名，点击确定。找回密码链接将发送至您的邮箱
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                        <input type="text" class="form-control" name="yhmoryx" placeholder="您的邮箱账号或用户名">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                        <input type="submit" value="确定" class="btn btn-danger">
                        <br><br>
                        <a href="#">无需重置密码，现在登录？</a>
                        <!--<a href="login-2.html">用户名和注册邮箱已忘记，进行账号申诉？</a>-->
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


<div id="light1" class="white_content">
    <div class="light_1">
        <div class="light_11"><strong>注册用户</strong></div>
    </div>
    <div class="second">
        <form action="user_insert" method="post" enctype="multipart/form-data">
            <SPAN>*</SPAN>用&nbsp&nbsp&nbsp&nbsp户&nbsp&nbsp&nbsp名: <input type="text" name="username" required="required" placeholder="类似于2017330322"  onblur="selecton()"/><br>
            <SPAN>*</SPAN>密&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp码: <input type="text" name="password"/><br>
            <SPAN>*</SPAN>性&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp别: <input type="text" name="sex"/><br>
            <SPAN>*</SPAN>电&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp话: <input type="text" id="tel" name="telephone" placeholder="手机号" onblur="tel()"/><br>
            <SPAN>*</SPAN>邮&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp邮 : <input type="text" id="email" name="email" placeholder="邮箱" /><br>
            &nbsp&nbsp照&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp片: <input type="file" name="file"/><br><br>
            <input CLASS="second1" type="submit" value="添加 "  />
            <input CLASS="second2" type="button" value="取消"  onclick = "document.getElementById('light1').style.display='none';document.getElementById('fade').style.display='none'"/>
        </form>

    </div>
</div>

<div id="fade" class="black_overlay"></div>
</body>
</html>
