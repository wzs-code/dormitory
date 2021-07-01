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

<div id="center1">


    <div id="right">
        <center><strong style="height: 40px;font-size:20px;font-family: KaiTi">学生信息</strong></center><br>
        <button id="btn2" onclick="todelect()">批量删除</button>
        <a href = "javascript:void(0)" onclick = "document.getElementById('light1').style.display='block';document.getElementById('fade').style.display='block';updatepw()" class="upatepw">更新</a>

        <form action="selectAll" method="post">
            <div id="btn3">
                <input type="text" name="sno"/>
                <c:if test="${fieldError!=null }">
                    ${fieldError.sno}
                </c:if>
                <input type="submit" value="查询"/>
            </div>

        </form>

        <center>
            <div id="right2">
                <table border="1">
                    <thead>
                    <tr>
                        <td style="width: 70px"><input type="checkbox"  name="selectall" onclick="selectall()"/></td>
                        <td style="width: 120px">学号</td>
                        <td style="width: 120px">姓名</td>
                        <td style="width: 70px">性别</td>
                        <td style="width: 120px">宿舍楼</td>
                        <td style="width: 120px">寝室号</td>
                        <td style="width: 220px">电话</td>
                        <td style="width: 140px">入宿时间</td>
                        <td style="width: 140px">离宿时间</td>
                        <td style="width: 220px">紧急联系人 </td>
                        <td style="width: 120px">照片</td>
                        <td style="width: 200px">操作</td>
                    </tr>
                    </thead>
                    <c:forEach items="${pageinfo.list}" var="data">
                        <tbody>
                        <tr>
                            <td><input type="checkbox" name="Sno" value="${data.sno}"/></td>
                            <td>${data.sno}</td>
                            <td>${data.name}</td>
                            <td>${data.sex}</td>
                            <td>${data.dormitory}</td>
                            <td>${data.dorm}</td>
                            <td>${data.telephone}</td>
                            <td><fmt:formatDate value="${data.entrance_time}" pattern="yyyy-MM-dd"/></td>
                            <td><fmt:formatDate value="${data.graduation_time}" pattern="yyyy-MM-dd"/></td>
                            <td>${data.emergency_contact_number}</td>
                            <td><img src="/image/${data.photo}"  height="100%" width="30px"></td>

                            <td>
                                <button>
                                    <!-- 删除当前项 -->
                                    <a href="delete?sno=${data.sno}">删除|</a>
                                        <%--                            <button onclick="delete?sno=${data.sno}">删除</button>--%>
                                        <%--                        <a href="update?sno=${data.sno}">更新 </a>--%>
                                    <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='block';
                                    document.getElementById('fade').style.display='block'">更新</a>
                                    <a href="update?sno=${data.sno}">更新 </a>
                                    <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='block';
                                            document.getElementById('fade').style.display='block';stu_update(${data.sno})">更新</a>


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
                <li><a href="${pageContext.request.contextPath}/stu_list?page=1&size=5" aria-label="Previous">首頁</a></li>
                <li><a href="${pageContext.request.contextPath}/stu_list?page=${pageinfo.pageNum-1}&size=5" >上一頁</a></li>
                <c:forEach begin="1" end="${pageinfo.pages}" var="pageNum">
                    <a href="${pageContext.request.contextPath}/stu_list?page=${pageNum}&size="5></a>
                </c:forEach>
                <li><a href="${pageContext.request.contextPath}/stu_list?page=${pageinfo.pageNum+1}&size=5">下一頁</a></li>
                <li><a href="${pageContext.request.contextPath}/stu_list?page=${pageinfo.pages}&size=5" aria-label="Next">尾頁</a></li>
                <li style="font-size: 20px">共有${pageinfo.pages}頁，${number}条记录</li>
            </ul>
        </div>

    </div>
</div>





<div id="light" class="white_content">
    <div class="light_1">
        <div class="light_11"><strong>修改学生信息</strong></div>
    </div>
    <div class="second">
        <form action="updateAll" method="post" enctype="multipart/form-data">
            <SPAN>*</SPAN>学&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp号: <input type="text" name="sno" id="sno1" /><br>
            <c:if test="${fieldError!=null }">
                ${fieldError.sno}
            </c:if>
            <SPAN>*</SPAN>姓&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp名: <input type="text" name="name" id="name1"/><br>
            <SPAN>*</SPAN>性&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp别: <input type="text" name="sex"  id="sex1"/><br>
            <SPAN>*</SPAN>宿&nbsp&nbsp&nbsp&nbsp舍&nbsp&nbsp&nbsp号: <input type="text" name="dormitory"  id="dormitory1"/><br>
            <SPAN>*</SPAN>寝&nbsp&nbsp&nbsp&nbsp室&nbsp&nbsp&nbsp号: <input type="text" name="dorm" id="dorm1"/><br>
            <SPAN>*</SPAN>电&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp话: <input type="text" name="telephone" id="telephone1"/><br>
            <SPAN>*</SPAN>入&nbsp宿&nbsp时&nbsp间: <input type="date" name="entrance_time" id="entrance_time1"/><br>
            &nbsp离&nbsp宿&nbsp时&nbsp间:&nbsp <input type="date" name="graduation_time" id="graduation_time1"/><br>
            <SPAN>*</SPAN>紧急联系人: <input type="text" name="emergency_contact_number" id="emergency_contact_number1"/><br>
            &nbsp&nbsp照&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp片: <input type="file" name="file" id="file1"/><br><br>
            <input id="second1" type="submit" value="保存"  />
            <input id="second2" type="button" value="取消"  onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'"/>
        </form>
    </div>
</div>





<div id="light1" class="white_content">
    <div class="light_1">
        <div id="light_11"><strong>修改学生信息</strong></div>
    </div>
    <div id="second">
        <form action="stu_insertAll" method="post" enctype="multipart/form-data">

            学号:<input type="text" name="sno"/><br>
            <c:if test="${fieldError!=null }">
                ${fieldError.sno}
            </c:if>
            <SPAN>*</SPAN>姓名:<input type="text" name="name"/><br>
            <SPAN>*</SPAN>性别:<input type="text" name="sex"/><br>
            <SPAN>*</SPAN>宿舍号:<input type="text" name="dormitory"/><br>
            <SPAN>*</SPAN>寝室号:<input type="text" name="dorm"/><br>
            <SPAN>*</SPAN>联系电话:<input type="text" name="telephone"/><br>
            <SPAN>*</SPAN>入宿时间:<input type="date" name="entrance_time"/><br>
            <SPAN>*</SPAN>离宿时间:<input type="date" name="graduation_time"/><br>
            <SPAN>*</SPAN>紧急联系人:<input type="text" name="emergency_contact_number"/><br>
            <SPAN>*</SPAN>照片:<input type="file" name="file"/><br>
            <input type="submit" value="提交"/><br>
        </form>

    </div>
</div>



<div id="fade" class="black_overlay"></div>

</body>
</html>
