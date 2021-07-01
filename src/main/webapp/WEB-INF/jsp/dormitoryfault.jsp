<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<html>
<head>
    <title>故障信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/resources/css/dormitoryfault.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/jquery-accordion-menu.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/resources/js/dormitoryfault.js"></script>
    <script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
    <script>
        function getDorm(){
            var pr_name = $("#dormitory").val();
            console.log(pr_name);
            $("#dorm").html('<option value="">选择宿舍</option>');
            $.ajax({
                url : "${pageContext.request.contextPath}/getDorm/"+pr_name,
                type : "GET",
                dataType : "json",
                success : function(data){
                    if(data!=null){
                        $(data).each(function(index){
                            $("#dorm").append(
                                '<option value="'+data[index].dorm+'">'+data[index].dorm+'</option>'
                            );
                        });
                    }
                }
            });
        }
    </script>
</head>
<body>

<%@ include file="common_top.jsp"%>

<div id="center1">
    <%@ include file="common_left.jsp"%>
    <div id="right">
        <br>
        <strong id="xueshe" >&nbsp;&nbsp;※<a href="stu_list" style="text-decoration: none;color: black">当前位置》学生管理》故障信息</a>※</strong><br><hr>
        <c:if test="${'负责人'== sessionScope.manager}">
            <button class="btn2" style="height: 35px;width:100px;border: 1px solid #9BDAF5;border-radius: 5px;background-color: #FFFFFF;color:#3ebff5 " onclick="todelect()"><span style="font-size: 18px">✈</span>批量删除</button>

            <button class="btn1" style="border: 1px solid #9BDAF5;border-radius: 5px;background-color: #FFFFFF" >
                <a href = "javascript:void(0)" onclick = "document.getElementById('light1').style.display='block';
                                document.getElementById('fade').style.display='block';updatepw()" class="upatepw">
                    <span style="height: 30px" width="75px"><i class="fa fa-plus"></i>&nbsp;&nbsp;故障</span></a>
            </button>
        </c:if>
        <form action="selectAll" method="post">
            <div id="btn3">
                <input type="text" name="sno" id="select_option" required="required" placeholder="按维修工人查询"/>
            </div>
        </form>
        <BR><br><br>
        <div class="selectall">
            <a href="/ssm2/selectAttendant?attendant=" id="select_attendant"><button>查询</button></a><br>
        </div>

        <center>
            <div id="right2">
                <table border="1">
                    <thead>
                    <tr style="background-color: #AAADB3">
                        <td style="width: 70px"><input type="checkbox"  name="selectall" onclick="selectall()"/></td>
                        <td style="width: 140px">故障编号</td>
                        <td style="width: 120px">故障公寓</td>
                        <td style="width: 120px">故障宿舍</td>
                        <td style="width: 120px">维修工人</td>
                        <td style="width: 200px">联系电话</td>
                        <td style="width: 180px">维修时间</td>
                        <td style="width: 140px">故障问题</td>
                        <td style="width: 140px">维修状态</td>
                        <c:if test="${'负责人'== sessionScope.manager}">
                        <td style="width: 340px">操作</td>
                        </c:if>
                    </tr>
                    </thead>
                    <c:forEach items="${dormitoryFaults.list}" var="data">
                        <tbody>
                        <tr>
                            <td><input type="checkbox" name="faultIds" value="${data.faultId}"/></td>
                            <td>${data.faultId}</td>
                            <td>${data.dormitory}</td>
                            <td>${data.dorm}</td>
                            <td>${data.attendant}</td>
                            <td>${data.attendantTel}</td>
                            <td><fmt:formatDate value="${data.fixTime}" pattern="yyyy-MM-dd"/></td>
                            <td>${data.fault}</td>
                            <td>${data.faultStatus}</td>
                            <c:if test="${'负责人'== sessionScope.manager}">
                            <td>
                                <button style="border-radius: 5px;background-color: #FFFFFF;border: 1px solid #3f5964;">
                                        <%--                            <button onclick="delete?sno=${data.sno}">删除</button>--%>
                                        <%--                        <a href="update?sno=${data.sno}">更新 </a>--%>
                                        <%--                                <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='block';--%>
                                        <%--                                    document.getElementById('fade').style.display='block'">更新</a>--%>
                                        <%--                                <a href="update?sno=${data.sno}">更新 </a>--%>
                                    <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='block';
                                            document.getElementById('fade').style.display='block';fault_update(${data.faultId})"><i class="fa fa-edit" style="color: black;width: 50px;height: 20px;font-size: 15px;margin-top: 7px">维修</i></a>


                                </button>
                                <button id="" style="border-radius: 5px;background-color: #FFFFFF;border: 1px solid #6e6e6e;margin-top: -52px">
                                    <!-- 删除当前项 -->
                                    <a href="deletefault?faultId=${data.faultId}"><i class="fa fa-trash-o" style="color: black;width: 50px;height: 20px;font-size: 15px;margin-top: 7px">删除</i></a>
                                </button>
                            </td>
                            </c:if>
                        </tr>
                        </tbody>
                    </c:forEach>

                </table>

            </div>
        </center>
        <div id="right3">
            <ul>
                <li><a href="${pageContext.request.contextPath}/dormitoryFaultInformation?page=1&size=8" aria-label="Previous">首頁</a></li>
                <li><a href="${pageContext.request.contextPath}/dormitoryFaultInformation?page=${dormitoryFaults.pageNum-1}&size=8" >上一頁</a></li>
                <c:forEach begin="1" end="${dormitoryFaults.pages}" var="pageNum">
                    <a href="${pageContext.request.contextPath}/dormitoryFaultInformation?page=${pageNum}&size="5></a>
                </c:forEach>
                <li><a href="${pageContext.request.contextPath}/dormitoryFaultInformation?page=${dormitoryFaults.pageNum+1}&size=8">下一頁</a></li>
                <li><a href="${pageContext.request.contextPath}/dormitoryFaultInformation?page=${dormitoryFaults.pages}&size=8" aria-label="Next">尾頁</a></li>
                <li style="font-size: 20px">共有${dormitoryFaults.pages}頁，${number}条记录</li>
            </ul>
        </div>

    </div>
</div>




<div id="light" class="white_content">
    <div class="light_1">
        <div class="light_11"><strong>故障修理处理</strong></div>
    </div>
    <div class="second">
        <form action="dormitoryfault_update" method="post">
            <SPAN style="color: black">*</SPAN>故&nbsp障&nbsp编&nbsp号: <input type="text" id="faultId1" name="faultId"  readonly="readonly"/><br>
            <SPAN style="color: black">*</SPAN>故&nbsp障&nbsp公&nbsp寓: <input type="text" id="dormitory1" name="dormitory"  readonly="readonly"/><br>
            <SPAN style="color: black">*</SPAN>故&nbsp障&nbsp宿&nbsp舍: <input type="text" id="dorm1" name="dorm" readonly="readonly"/><br>
            <SPAN>*</SPAN>维&nbsp修&nbsp工&nbsp人: <input type="text" id="attendant1" name="attendant" placeholder="维修工人姓名" required="required"/><br>
            <SPAN>*</SPAN>联&nbsp系&nbsp电&nbsp话: <input type="text" id="attendantTel1" name="attendantTel" placeholder="维修工人联系电话" required="required"/><br>
            <SPAN>*</SPAN>维&nbsp修&nbsp时&nbsp间: <input type="date" id="fixTime1" name="fixTime" required="required"/><br>
            <SPAN style="color: black">*</SPAN>故&nbsp障&nbsp描&nbsp述: <input type="text" id="fault1" name="fault" style="margin-bottom: 18px" placeholder="故障描述"/><br>
            <SPAN>*</SPAN>维&nbsp修&nbsp状&nbsp态: &nbsp;&nbsp;&nbsp;已修:<input type="radio" style="position: absolute;margin-top: 1px;margin-left: 5px" name="faultStatus" value="true" checked="checked"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 未修:<input type="radio" style="position: absolute;margin-top: 1px;margin-left: 5px" name="faultStatus" value="false"/><br>

            <input CLASS="second1" type="submit" value="处理"  />
            <input CLASS="second2" type="button" value="取消"  onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'"/>

        </form>
    </div>
</div>





<div id="light1" class="white_content">
    <div class="light_1">
        <div id="light_11"><strong>故障信息上传</strong></div>
    </div>
    <div class="second">
        <form action="dormitoryfault_insert" method="post"><br>
            <SPAN>*</SPAN>故&nbsp障&nbsp宿&nbsp舍:&nbsp;&nbsp;&nbsp;
            <select name="dormitory"  id="dormitory"  onclick="getDorm()" required="required" style="height: 25px;width: 90px" style="top: 8px">
                <option value="" style="height: 30px">请选择公寓</option>
                <c:forEach items="${dormitorys}" var="c1">
                    <option value="${c1.dormitory}">${c1.dormitory}</option>
                </c:forEach>
            </select>
            <select name="dorm" id="dorm" required="required" style="height: 25px;width: 80px">
                <option value="">选择宿舍</option>
            </select><br>
            <SPAN style="color: black">*</SPAN>维&nbsp修&nbsp工&nbsp人: <input type="text" name="attendant" placeholder="维修工人姓名" readonly="readonly"/><br>
            <SPAN style="color: black">*</SPAN>联&nbsp系&nbsp电&nbsp话: <input type="text" name="attendantTel" placeholder="维修工人联系电话" readonly="readonly"/><br>
            <SPAN style="color: black">*</SPAN>维&nbsp修&nbsp时&nbsp间: <input type="date" name="fixTime" placeholder="维修的时间" readonly="readonly"/><br>
            <SPAN>*</SPAN>故&nbsp障&nbsp描&nbsp述: <input type="text" name="fault" style="margin-bottom: 18px" placeholder="故障描述" required="required"/><br>
            <SPAN>*</SPAN>维&nbsp修&nbsp状&nbsp态: &nbsp;&nbsp;&nbsp;已修:<input type="radio" style="position: absolute;margin-top: 1px;margin-left: 5px" name="faultStatus" value="true" readonly="readonly"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 未修:<input type="radio" style="position: absolute;margin-top: 1px;margin-left: 5px" name="faultStatus" value="false" checked="checked" readonly="readonly"/><br>
            <br>
            <input CLASS="second1" type="submit" value="通知 "  />
            <input CLASS="second2" type="button" value="取消"  onclick = "document.getElementById('light1').style.display='none';document.getElementById('fade').style.display='none'"/>

        </form>

    </div>
</div>



<div id="fade" class="black_overlay"></div>


<%@ include file="common_bottom.jsp"%>
</body>
</html>





