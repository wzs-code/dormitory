
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>

    <title>登录</title>
    <link href="${pageContext.request.contextPath}/resources/css/login1.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/jquery-accordion-menu.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/resources/js/jsencrypt.min.js"></script>
    <script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript">
        function onSub() {

            var password = $("#password").val();
            var encrypt = new JSEncrypt();
            encrypt.setPublicKey("MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAhQpLEvsZAgGgwIbWAJJ3Sp4B6sYvNhaYJdNRYrNmC+4FzbPXoGYaU4vL/vWbM9Nd+v53QacMJhkG/I4D+4a3QfSRjdyiNmYFG8kKgumVzvXtdV84UMG703v2VeVWl7MthN1jYMwWpJ49dp7IM4r/lLsckmLJz+H3xWeaFFF/sX6mnuUGRNbe/TrF9px+tqeDfklVbOlzKIGWgBo6+vTx8tdMdRoVUqWLeEVw/FdOYfxyKQ0t/6ySSKBY6sMZQv8Mz2tyNdbWQ0Du1d5WmLAz3KhVJ865sDReNB7Pfoy9T1MO8wKCO3xA2Te19tr/cq99fYajNd4xyrEhhmDNxphK/wIDAQAB");
            var encryptData = encrypt.encrypt(password);//加密后的字符串
            console.log(encryptData)
            $("#password").val(encryptData.toString());
            password = $("#password").val();
            return false;

        };

        function login() {
            if($("#username").val().length==0){
                alert("用户名不能为空")
            }else if($("#password").val().length==0){
                alert("密码不能为空")
            }else if($("#code").val().length==0){
                alert("验证码不能为空")
            }
        }
    </script>
</head>
<body>
<div id="title">山西大学商务学院宿舍系统</div>
<%session.invalidate();%>
<form action="login" method="post" onsubmit="onSub();">
    <div class="wrap" id="wrap">
        <div class="logGet">
            <!-- 头部提示信息 -->
            <div class="logD logDtip">
                <p class="p1">登录</p>
            </div>
            <!-- 输入框 -->
            <div class="lgD">
                <i class="fa fa-user-md"></i>
                <input type="text" name="username"  id="username" placeholder="输入用户名" >
                <br>

            </div>
            <div class="lgD">
                <i class="fa fa-unlock"></i>
                <input type="password" name="password" id="password"  placeholder="输入密码"><br>

            </div>
            <div class="lgE">
                <input type="text" name="code"  id="code" placeholder="输入验证码" >
                <img src="checkCode" alt="" width="100" height="32" class="passcode" onclick="this.src=this.src+'?'">
            </div>
            <div class="lgE">
                <i class="fa fa-google-plus-square">&nbsp;&nbsp;角色权限</i>
                <select id="user_type " name="role">
                    <option value="管理员">管理员</option>
                    <option value="负责人">负责人</option>
                </select>
            </div>
            <input type="submit" value="登录" class="logC" onclick="login()"/><br>
            <div class="insert_user">
                <a href = "javascript:void(0)" onclick = "document.getElementById('light1').style.display='block';document.getElementById('fade').style.display='block'">注册</a>
            </div>
            <div class="upatepw">
                <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">忘记密码</a>
            </div>

        </div>
    </div>
</form>

</div>

<div id="light" class="white_content">
    <div class="container">
        <div class="col-md-12">
            <i class="fa fa-times-circle-o" onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'" style="float: right;margin-right: 10px;margin-top: 5px;font-size: 25px;    cursor: pointer;"></i>
            <h1 class="margin-bottom-15" style="margin-left: 100px">重置您的密码</h1><br>
            <form  action="forgetpwd" method="post">
                <div class="form-group">
                    <div class="col-md-12" style="margin-left: 20px;margin-right: 20px">
                        请输入用户名，找回密码链接将发送至您用户对应的邮箱中，请及时查收！
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                        <input type="text" class="form-control" style="margin-left: 70px;height: 25px;width: 250px;margin-top: 20px" name="yhmoryx" placeholder="您的登录名">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                        <input type="submit" style="margin-left: 150px;width: 90px;height: 28px;margin-top: 20px;background-color: #7274A7;border-radius: 5px" value="确定" class="btn btn-danger">
                        <br><br>
                        <a href="sign" style="float: right;text-decoration: none">无需重置密码，现在登录？</a>
                        <!--<a href="login-2.html">用户名和注册邮箱已忘记，进行账号申诉？</a>-->
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


<div id="light1" class="white_content1">
    <div class="light_1">
        <div class="light_11"><strong>注册用户</strong></div>
    </div>
    <div class="second">
        <form action="user_insert" method="post" enctype="multipart/form-data">
            <SPAN>*</SPAN>用&nbsp&nbsp&nbsp&nbsp户&nbsp&nbsp&nbsp名: <input type="text" name="username" required="required" placeholder="类似于2017330322"  onblur="selecton()"/><br>
            <SPAN>*</SPAN>密&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp码: <input type="text" name="password"/><br>
            <SPAN>*</SPAN>性&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp别: <input type="text" name="sex"/><br>
            <SPAN>*</SPAN>电&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp话: <input type="text" id="tel" name="telephone" placeholder="手机号" onblur="tel()"/><br>
            <SPAN>*</SPAN>邮&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp邮 : <input type="text" id="email" name="email" placeholder="邮箱"/><br>
            &nbsp&nbsp照&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp片: <input type="file" name="file"/><br><br>
            <input CLASS="second1" type="submit" value="添加 "  style="  width: 70px;height: 30px;"/>
            <input CLASS="second2" type="button" value="取消"  style="  width: 70px;height: 30px;"  onclick = "document.getElementById('light1').style.display='none';document.getElementById('fade').style.display='none'"/>
        </form>

    </div>
</div>

<div id="fade" class="black_overlay"></div>
</body>
</html>
