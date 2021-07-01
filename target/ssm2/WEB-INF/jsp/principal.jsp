<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<html>
<head>
    <title>负责人信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/resources/css/principal.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/principal.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/jquery-accordion-menu.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet" type="text/css" />
    <script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>

</head>
<body>

<%@ include file="common_top.jsp"%>

<div id="center1">
    <%@ include file="common_left.jsp"%>
    <div id="right">
        <br>
        <strong id="xueshe" >&nbsp;&nbsp;※<a href="stu_list" style="text-decoration: none;color: black">当前位置》宿舍负责人管理》负责人信息</a>※</strong><br><hr>
            <button class="btn2" style="height: 35px;width:100px;border: 1px solid #9BDAF5;border-radius: 5px;background-color: #FFFFFF;color:#3ebff5 " onclick="todelect()"><span style="font-size: 18px">✈</span>批量删除</button>
            <button class="btn1" style="border: 1px solid #9BDAF5;border-radius: 5px;background-color: #FFFFFF" >
                <a href = "javascript:void(0)" onclick = "document.getElementById('light1').style.display='block';
                            document.getElementById('fade').style.display='block';updatepw()" class="upatepw">
                    <span style="height: 30px" width="75px"><i class="fa fa-plus"></i>&nbsp;&nbsp;入职</span></a>
            </button>

        <form action="selectAll" method="post">
            <div id="btn3">
                <input type="text"  id="select_option" required="required" placeholder="按负责人姓名查询"/>
            </div>
        </form>
        <BR><br><br>
        <div class="selectall">
            <a href="/ssm2/selectPrincipal?principal=" id="select_principal"><button>查询</button></a><br>
        </div>

        <center>
            <div id="right2">
                <table border="1">
                    <thead>
                    <tr style="background-color: #AAADB3">
                        <td style="width: 40px"><input type="checkbox"  name="selectall" onclick="selectall()"/></td>
                        <td style="width: 40px">负责人编号</td>
                        <td style="width: 80px">负责人姓名</td>
                        <td style="width: 60px">所管公寓</td>
                        <td style="width: 40px">性别</td>
                        <td style="width: 120px">联系电话</td>
                        <td style="width: 200px">职责</td>
                        <td style="width: 100px">入职时间</td>
                        <td style="width: 100px">离职时间</td>
                        <td>操作</td>
                    </tr>
                    </thead>
                    <c:forEach items="${principals.list}" var="data">
                        <tbody>
                        <tr>
                            <td><input type="checkbox" name="principalIds" value="${data.principalId}"/></td>
                            <td>${data.principalId}</td>
                            <td>${data.principal}</td>
                            <td>${data.dormitory}</td>
                            <td>${data.principalSex}</td>
                            <td>${data.principalTel}</td>
                            <td>${data.duty}</td>
                            <td><fmt:formatDate value="${data.time}" pattern="yyyy-MM-dd"/></td>
                            <td><fmt:formatDate value="${data.leftTime}" pattern="yyyy-MM-dd"/></td>


                            <td>
                                <button style="border-radius: 5px;background-color: #FFFFFF;border: 1px solid #3f5964;">
                                        <%--                            <button onclick="delete?sno=${data.sno}">删除</button>--%>
                                        <%--                        <a href="update?sno=${data.sno}">更新 </a>--%>
                                        <%--                                <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='block';--%>
                                        <%--                                    document.getElementById('fade').style.display='block'">更新</a>--%>
                                        <%--                                <a href="update?sno=${data.sno}">更新 </a>--%>
                                    <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='block';
                                            document.getElementById('fade').style.display='block';principal_update(${data.principalId})"><i class="fa fa-edit" style="color: black;width: 50px;height: 20px;font-size: 15px;margin-top: 7px">离职</i></a>


                                </button>
                                <button id="" style="border-radius: 5px;background-color: #FFFFFF;border: 1px solid #6e6e6e;margin-top: -52px">
                                    <!-- 删除当前项 -->
                                    <a href="principal_delete?principalId=${data.principalId}"><i class="fa fa-trash-o" style="color: black;width: 50px;height: 20px;font-size: 15px;margin-top: 7px">删除</i></a>
                                </button>
                            </td>

                        </tr>
                        </tbody>
                    </c:forEach>

                </table>

            </div>
        </center>
        <div id="right3">
            <ul>
                <li><a href="${pageContext.request.contextPath}/principal?page=1&size=8" aria-label="Previous">首頁</a></li>
                <li><a href="${pageContext.request.contextPath}/principal?page=${principals.pageNum-1}&size=8" >上一頁</a></li>
                <c:forEach begin="1" end="${principals.pages}" var="pageNum">
                <%--    <a href="${pageContext.request.contextPath}/principal?page=${pageNum}&size="5></a>--%>

                    <c:if test="${num == principals.pageNum}">
                        【${principals.pageNum}】
                    </c:if>
                    <c:if test="${num != principals.pageNum}">
                        <a href="${pageContext.request.contextPath}/principal?page=${pageNum}"> ${num} </a>
                    </c:if>

                </c:forEach>
                <li><a href="${pageContext.request.contextPath}/principal?page=${principals.pageNum+1}&size=8">下一頁</a></li>
                <li><a href="${pageContext.request.contextPath}/principal?page=${principals.pages}&size=8" aria-label="Next">尾頁</a></li>
                <li style="font-size: 20px">共有${principals.pages}頁，${number}条记录</li>
            </ul>
        </div>

    </div>
</div>




<div id="light" class="white_content">
    <div class="light_1">
        <div class="light_11"><strong>负责人离职</strong></div>
    </div>
    <div class="second">
        <form action="principalUpdate" method="post">
            <SPAN style="color: black">*</SPAN>公&nbsp寓&nbsp负&nbsp责: <input type="text" id="principalId1" name="principalId" readonly="readonly"/><br>
            <SPAN style="color: black">*</SPAN>公&nbsp寓&nbsp负&nbsp责: <input type="text" id="principal1" name="principal" readonly="readonly"/><br>
            <SPAN style="color: black">*</SPAN>所&nbsp管&nbsp公&nbsp寓: <input type="text" id="dormitory1" name="dormitory" required="required" readonly="readonly"/><br>
            <SPAN style="color: black">*</SPAN>主&nbsp管&nbsp性&nbsp别: <input type="text" id="principalSex1" name="principalSex" readonly="readonly"/><br>
            <SPAN style="color: black">*</SPAN>联&nbsp系&nbsp电&nbsp话: <input type="text" id="principalTel1" name="principalTel" readonly="readonly"/><br>
            <SPAN style="color: black">*</SPAN>所&nbsp管&nbsp职&nbsp责: <input type="text" id="duty1" name="duty"/><br>
            <SPAN>*</SPAN>离&nbsp职&nbsp时&nbsp间: <input type="date"  name="leftTime"/><br>
            <input CLASS="second1" type="submit" value="添加 "  />
            <input CLASS="second2" type="button" value="取消"  onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'"/>

        </form>
    </div>
</div>





<div id="light1" class="white_content">
    <div class="light_1">
        <div id="light_11"><strong>负责人入岗</strong></div>
    </div>
    <div class="second">
        <form action="principal_insert" method="post" enctype="multipart/form-data">
            <SPAN>*</SPAN>公&nbsp寓&nbsp负&nbsp责: <input type="text" name="principal" required="required" placeholder="负责人姓名"/><br>
            <SPAN>*</SPAN>登&nbsp录&nbsp密&nbsp码: <input type="password" name="password" required="required" placeholder="登录密码"/><br>
            <SPAN>*</SPAN>所&nbsp管&nbsp公&nbsp寓: <input type="text" name="dormitory" required="required" placeholder="所管公寓"/><br>
            <SPAN>*</SPAN>主&nbsp管&nbsp性&nbsp别:
            <select name="principalSex" style="margin-top: 13px;margin-left:15px;height: 25px;width: 120px" required="required">
                <option value="" style="height: 30px">请选择性别</option>
                <option value="男" style="height: 30px">男</option>
                <option value="女" style="height: 30px">女</option>
            </select><br>
            <SPAN>*</SPAN>联&nbsp系&nbsp电&nbsp话: <input type="text" name="principalTel" required="required" placeholder="管理者联系电话"/><br>
            <SPAN>*</SPAN>所&nbsp管&nbsp职&nbsp责: <input type="text" name="duty" required="required" placeholder="职责描述"/><br>
            <SPAN>*</SPAN>入&nbsp岗&nbsp时&nbsp间: <input type="date" name="time" required="required"/><br>
            <SPAN>*</SPAN>邮&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp邮 : <input type="text" id="email" name="email" placeholder="邮箱" /><br>
            &nbsp&nbsp照&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp片: <input type="file" name="file" style="width: 183px"/><br>
            <input CLASS="second1" type="submit" value="添加 "  />
            <input CLASS="second2" type="button" value="取消"  onclick = "document.getElementById('light1').style.display='none';document.getElementById('fade').style.display='none'"/>

        </form>

    </div>
</div>



<div id="fade" class="black_overlay"></div>


<%@ include file="common_bottom.jsp"%>
</body>
</html>





