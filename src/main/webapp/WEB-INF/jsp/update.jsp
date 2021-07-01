<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更新</title>
    <link href="${pageContext.request.contextPath}/resources/css/stu_list.css" rel="stylesheet">
</head>
<body>
<div id="second">
    <form action="updateAll" method="post" enctype="multipart/form-data">
        <SPAN>*</SPAN>学&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp号: <input type="text" name="sno"/><br>
        <c:if test="${fieldError!=null }">
            ${fieldError.sno}
        </c:if>
        <SPAN>*</SPAN>姓&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp名: <input type="text" name="name"/><br>
        <SPAN>*</SPAN>性&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp别: <input type="text" name="sex"/><br>
        <SPAN>*</SPAN>宿&nbsp&nbsp&nbsp&nbsp舍&nbsp&nbsp&nbsp号: <input type="text" name="dormitory"/><br>
        <SPAN>*</SPAN>寝&nbsp&nbsp&nbsp&nbsp室&nbsp&nbsp&nbsp号: <input type="text" name="dorm"/><br>
        <SPAN>*</SPAN>电&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp话: <input type="text" name="telephone"/><br>
        <SPAN>*</SPAN>入&nbsp宿&nbsp时&nbsp间: <input type="date" name="entrance_time"/><br>
        &nbsp离&nbsp宿&nbsp时&nbsp间:&nbsp <input type="date" name="graduation_time"/><br>
        <SPAN>*</SPAN>紧急联系人: <input type="text" name="emergency_contact_number"/><br>
        &nbsp&nbsp照&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp片: <input type="file" name="file"/><br><br>
        <input id="second1" type="submit" value="保存"  />
        <input id="second2" type="submit" value="取消"  />
        <%--            <a href = "javascript:void(0)"--%>
        <%--            &lt;%&ndash;               onclick = "document.getElementById('light').style.display='none';&ndash;%&gt;--%>
        <%--               onclick="window.location.href='login';--%>
        <%--                    document.getElementById('fade').style.display='none'">确认</a>a--%>
    </form>
</div>

</body>
</html>
