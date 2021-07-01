<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更新</title>
    <link href="${pageContext.request.contextPath}/resources/css/stu_list.css" rel="stylesheet">
</head>
<body>
<div id="second">
    <%@ include file="common_left.jsp"%>
    <div id="right">
        <br>
        <strong id="dengji" >&nbsp;&nbsp;※<a href="stu_insert" style="text-decoration: none;color: black">当前位置》学生管理》学生入住登记</a>※</strong><br><hr>
        <div id="insert">
            <form action="/updateAll" method="post" enctype="multipart/form-data">
                <p>
                    <SPAN>*</SPAN>学&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp号: <input type="text" id="sno" name="sno" required="required" placeholder="类似于2017330322"  onblur="selecton()"/>
                    <SPAN style="margin-left: 120px">*</SPAN>姓&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp名: <input type="text" name="name"/>
                </p>
                <p>
                    <SPAN>*</SPAN>性&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp别:
                    <select name="sex" style="margin-left: 30px;height: 25px;width: 120px">
                        <option value="" style="height: 30px">请选择性别</option>
                        <option value="男" style="height: 30px">男</option>
                        <option value="女" style="height: 30px">女</option>
                    </select>
                    <SPAN style="margin-left: 174px">*</SPAN>年&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp龄: <input type="number" name="age"/>

                </p>
                <p>
                    <SPAN>*</SPAN>民&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp族: <input type="text" name="nation"/>
                    <SPAN style="margin-left: 120px">*</SPAN>政&nbsp治&nbsp面&nbsp貌: <input type="text" name="politicalOutlook"/>
                </p>
                <p>
                    <SPAN>*</SPAN>身&nbsp份&nbsp证&nbsp件: <input type="text" name="Idcard"/>
                    <SPAN style="margin-left: 120px">*</SPAN>电&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp话: <input type="text" id="tel" name="telephone" placeholder="手机号" onblur="tel()"/>
                </p>
                <p>
                    <SPAN>*</SPAN>出&nbsp生&nbsp时&nbsp间: <input type="date" name="birthday" style="width: 175px"/>
                    <SPAN  style="margin-left: 120px">*</SPAN>导&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp员: <input type="text" name="teacher"/>
                </p>
                <p> <SPAN>*</SPAN>专&nbsp业&nbsp班&nbsp级:
                    <select name="college"  id="college"  onclick="getMajor()" style="margin-left: 30px;height: 25px;width: 120px">
                        <option value="" style="height: 30px">请选择学院</option>
                        <c:forEach items="${colleges}" var="c1">
                            <option value="${c1.name}">${c1.name}</option>
                        </c:forEach>
                    </select>
                    <select name="major" id="major" onclick="getClasses()" style="height: 25px;width: 120px">
                        <option value="">选择专业</option>
                    </select>
                    <select name="classes" id="classes" style="height: 25px;width: 120px">
                        <option value="">选择班级</option>
                    </select>
                </p>

                <p> <SPAN>*</SPAN>宿&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp舍:
                    <select name="dormitory"  id="dormitory"  onclick="getDorm()" style="margin-left: 30px;height: 25px;width: 120px">
                        <option value="" style="height: 30px">请选择公寓</option>
                        <c:forEach items="${dormitorys}" var="c1">
                            <option value="${c1.dormitory}">${c1.dormitory}</option>
                        </c:forEach>
                    </select>
                    <select name="dorm" id="dorm" onclick="getBunk()" style="height: 25px;width: 120px">
                        <option value="">选择宿舍</option>
                    </select>
                    <select name="bunk" id="bunk" style="height: 25px;width: 120px">
                        <option value="">选择床位</option>
                    </select>
                </p>
                <p>
                    <SPAN>*</SPAN>入&nbsp宿&nbsp时&nbsp间: <input type="date" name="entrance_time"  style="width: 175px"/>
                    <span style="margin-left: 120px"></span>&nbsp离&nbsp宿&nbsp时&nbsp间:&nbsp <input type="date" name="graduation_time"  style="width: 175px"/>
                </p>
                <p>
                    <SPAN>*</SPAN>紧急联系人: <input type="text" name="emergency_contact_person" style="width: 172px"//>
                    <SPAN style="margin-left: 120px">*</SPAN>联&nbsp系&nbsp电&nbsp话: <input type="text" name="emergency_contact_number"/>
                </p>

                <p> <SPAN>*</SPAN>地&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp址:
                    <select name="province"  id="province"  onclick="getCity()" style="margin-left: 30px;height: 25px;width: 120px">
                        <option value="" style="height: 30px">请选择省份</option>
                        <c:forEach items="${chinas}" var="c1">
                            <option value="${c1.name}">${c1.name}</option>
                        </c:forEach>
                    </select>
                    <select name="city" id="city" onclick="getArea()" style="height: 25px;width: 120px">
                        <option value="">选择市份</option>
                    </select>
                    <select name="area" id="area" style="height: 25px;width: 120px">
                        <option value="">选择省份</option>
                    </select>
                </p>
                <p><span  style="position:absolute;padding-top: 23px;color: black">&nbsp&nbsp个&nbsp人&nbsp介&nbsp绍:</span> <textarea name="introduction" placeholder="请介绍你自己" style="height: 70px;width: 300px;margin-left: 137px"></textarea></p>
                <p>  &nbsp&nbsp照&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp片: <input type="file" name="file"/></p>

                <input CLASS="second1" type="submit" value="添加 " style="margin-left: 800px;width: 85px;height: 31px">
                <input CLASS="second2" type="reset" value="重置"  style="width: 85px;height: 31px">

            </form>
        </div>

    </div>
</div>

</body>
</html>
