<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<html>
<head>
    <title>学生信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/resources/css/stu_list.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/stu_list.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/jquery-accordion-menu.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet" type="text/css" />
    <script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
    <script>


        function upload(){
            location.href="http://localhost:8080/ssm2/export";
        }

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

        function  getBunk() {
            var pr_name = $("#dormitory").val();
            var dorm = $("#dorm").val();
            $("#bunk").html('<option value="">选择床位</option>');
            $.ajax({
                url : "${pageContext.request.contextPath}/getBunk?dorm="+dorm+"&dormitory="+pr_name,
                type : "GET",
                dataType : "json",
                success : function(data){
                    if(data!=null){
                        $(data).each(function(index){
                            $("#bunk").append(
                                '<option value="'+data[index].bunk+'">'+data[index].bunk+'</option>'
                            );
                        });
                    }else if(data){
                        $("#bunk").append(
                            '<option value="">床位已满</option>'
                        );
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
        <strong id="xueshe" >&nbsp;&nbsp;
            ※<a href="stu_list" style="text-decoration: none;color: black">当前位置》宿舍管理》学生信息</a>※
            <button class="upload" style="height: 35px;width:90px;border: 1px solid #000000;border-radius: 5px;color:#f9fffd " onclick="upload()"><i class="fa fa-download">导出全部信息</i></button>

        </strong>

        <br><hr>
        <button class="btn2" style="height: 35px;width:100px;border: 1px solid #9BDAF5;border-radius: 5px;background-color: #FFFFFF;color:#3ebff5 " onclick="todelect()"><span style="font-size: 18px">✈</span>批量删除</button>

    <%--<button class="btn1" style="border: 1px solid #9BDAF5;border-radius: 5px;background-color: #FFFFFF" >
            <a href = "javascript:void(0)" onclick = "document.getElementById('light1').style.display='block';
                            document.getElementById('fade').style.display='block';updatepw()" class="upatepw">
                <span style="height: 30px" width="75px"><i class="fa fa-plus"></i>&nbsp;&nbsp;入住</span></a>
        </button>--%>
        <form action="selectAll" method="post">
            <div id="btn3">
                <input type="text" name="sno" id="select_option" required="required" placeholder="可按学号/公寓查询"/>
            </div>
        </form>
        <BR><br><br>
        <div class="selectall">
            <a href="/ssm2/selectSno?sno=" id="select_sno"><button style="width: 60px;height: 20px">学号</button></a><br>
            <a href="/ssm2/selectDorm?dormitory=" id="select_dormitory"><button style="width: 60px;height: 20px">公寓</button></a>
        </div>

        <center>
        <div id="right2">
            <table border="1">
                <thead>
                <tr style="background-color: #AAADB3">
                    <td style="width: 70px"><input type="checkbox"  name="selectall" onclick="selectall()"/></td>
                    <td style="width: 140px">学号</td>
                    <td style="width: 120px">姓名</td>
                    <td style="width: 70px">性别</td>
                    <td style="width: 120px">公寓</td>
                    <td style="width: 200px">寝室</td>
                    <td style="width: 180px">电话</td>
                    <td style="width: 140px">入宿时间</td>
                    <td style="width: 180px">紧急联系人 </td>
                    <td style="width: 120px">照片</td>
                    <td style="width: 340px">操作</td>
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
                        <td>${data.emergency_contact_number}</td>
                        <td><img src="/image/${data.photo}" alt="无图片" height="100%" width="30px"></td>

                        <td>
                            <button style="border-radius: 5px;background-color: #FFFFFF;border: 1px solid #3f5964;">
<%--                            <button onclick="delete?sno=${data.sno}">删除</button>--%>
<%--                        <a href="update?sno=${data.sno}">更新 </a>--%>
<%--                                <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='block';--%>
<%--                                    document.getElementById('fade').style.display='block'">更新</a>--%>
<%--                                <a href="update?sno=${data.sno}">更新 </a>--%>
                                <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='block';
                                    document.getElementById('fade').style.display='block';stu_update(${data.sno})"><i class="fa fa-edit" style="color: black;width: 50px;height: 20px;font-size: 15px;margin-top: 7px">换寝</i></a>


                            </button>
                            <button id="" style="border-radius: 5px;background-color: #FFFFFF;border: 1px solid #6e6e6e;margin-top: -52px">
                                <!-- 删除当前项 -->
                                <a href="delete?sno=${data.sno}"><i class="fa fa-trash-o" style="color: black;width: 50px;height: 20px;font-size: 15px;margin-top: 7px">删除</i></a>
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
                <li><a href="${pageContext.request.contextPath}/stu_list?page=1&size=10" aria-label="Previous">首頁</a></li>
                <li><a href="${pageContext.request.contextPath}/stu_list?page=${pageinfo.pageNum-1}&size=10" >上一頁</a></li>
                <c:forEach begin="1" end="${pageinfo.pages}" var="pageNum">
                    <a href="${pageContext.request.contextPath}/stu_list?page=${pageNum}&size="10></a>
                </c:forEach>
                <li><a href="${pageContext.request.contextPath}/stu_list?page=${pageinfo.pageNum+1}&size=10">下一頁</a></li>
                <li><a href="${pageContext.request.contextPath}/stu_list?page=${pageinfo.pages}&size=10" aria-label="Next">尾頁</a></li>
                <li style="font-size: 20px">共有${pageinfo.pages}頁，${number}条记录</li>
            </ul>
        </div>



    </div>
</div>





<div id="light" class="white_content">
    <div class="light_1">
        <div class="light_11"><strong>学生换寝操作</strong></div>
    </div>
    <div class="second">
        <form action="updateAll" method="post" enctype="multipart/form-data">
            <SPAN>*</SPAN><strong>学&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp号:</strong> <input type="text" name="sno" id="sno" readonly="readonly"/><br>
            <SPAN>*</SPAN><strong>姓&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp名:</strong> <input type="text" name="name" id="name" readonly="readonly"/><br>
            <SPAN>*</SPAN><strong>学&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp院:</strong> <input type="text" name="college" id="college" readonly="readonly"/><br>
            <SPAN>*</SPAN><strong>专&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp业:</strong> <input type="text" name="major" id="major" readonly="readonly"/><br>
            <SPAN>*</SPAN><strong>年&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp级:</strong> <input type="text" name="classes" id="classes" readonly="readonly"/><br>
            <SPAN>*</SPAN><strong>导&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp员:</strong> <input type="text" id="teacher" name="teacher" readonly="readonly"/><br>
            <br><SPAN style="color: red">*</SPAN><strong>宿&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp舍:</strong>&nbsp;&nbsp;&nbsp;
            <select name="dormitory"  id="dormitory"  onclick="getDorm()" required="required" style="height: 25px;width: 90px" style="top: 8px">
                <option value="" style="height: 30px">请选择公寓</option>
                <c:forEach items="${dormitorys}" var="c1">
                    <option value="${c1.dormitory}">${c1.dormitory}</option>
                </c:forEach>
            </select>
            <select name="dorm" id="dorm" onclick="getBunk()" required="required" style="height: 25px;width: 80px">
                <option value="">选择宿舍</option>
            </select>
            <select name="bunk" id="bunk" required="required" style="height: 25px;width: 80px">
                <option value="">选择床位</option>
            </select><br>


            <SPAN style="color: red">*</SPAN><strong>入&nbsp宿&nbsp时&nbsp间:</strong> <input type="date" name="entrance_time" id="entrance_time" required="required"/><br>


            <br>
            <input CLASS="second1" type="submit" value="调换"  />
            <input CLASS="second2" type="button" value="取消"   onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'"/>
        </form>
    </div>
</div>





<%--<div id="light1" class="white_content">--%>
<%--    <div class="light_1">--%>
<%--        <div id="light_11"><strong>添加学生信息</strong></div>--%>
<%--    </div>--%>
<%--    <div class="second">--%>
<%--        <form action="stu_insertAll" method="post" enctype="multipart/form-data">--%>
<%--            <SPAN>*</SPAN>学&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp号: <input type="text" id="sno1" name="sno" required="required" placeholder="类似于2017330322"  onblur="selecton()"/><br>--%>
<%--            <SPAN>*</SPAN>姓&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp名: <input type="text" name="name"/><br>--%>
<%--            <SPAN>*</SPAN>性&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp别: <input type="text" name="sex"/><br>--%>
<%--            <SPAN>*</SPAN>宿&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp舍:--%>
<%--                <select name="dormitory"  id="dormitory1"  onclick="getDorm()" >--%>
<%--                    <option value="" >请选择公寓</option>--%>
<%--                        <c:forEach items="${dormitory}" var="c1">--%>
<%--                            <option value="${c1.dormitory}">${c1.dormitory}</option>--%>
<%--                        </c:forEach>--%>
<%--                </select>--%>
<%--                <select name="dorm" id="dorm1">--%>
<%--                    <option value="">请选择宿舍</option>--%>
<%--                </select><br>--%>
<%--            <SPAN>*</SPAN>寝&nbsp&nbsp&nbsp&nbsp室&nbsp&nbsp&nbsp号: <input type="text" name="dorm"/><br>--%>
<%--            <SPAN>*</SPAN>电&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp话: <input type="text" id="tel" name="telephone" placeholder="手机号" onblur="tel()"/><br>--%>
<%--            <SPAN>*</SPAN>入&nbsp宿&nbsp时&nbsp间: <input type="date" name="entrance_time"/><br>--%>
<%--            &nbsp离&nbsp宿&nbsp时&nbsp间:&nbsp <input type="date" name="graduation_time"/><br>--%>
<%--            <SPAN>*</SPAN>紧急联系人: <input type="text" name="emergency_contact_number"/><br>--%>
<%--            &nbsp&nbsp照&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp片: <input type="file" name="file"/><br><br>--%>
<%--            <input CLASS="second1" type="submit" value="添加 "  />--%>
<%--            <input CLASS="second2" type="button" value="取消"  onclick = "document.getElementById('light1').style.display='none';document.getElementById('fade').style.display='none'"/>--%>

<%--        </form>--%>

<%--    </div>--%>
<%--</div>--%>



<div id="fade" class="black_overlay"></div>


<%@ include file="common_bottom.jsp"%>
</body>
</html>





