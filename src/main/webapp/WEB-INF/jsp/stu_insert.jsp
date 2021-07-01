<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>学生入住</title>
    <link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/stu_insert.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/stu_list.js"></script>
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

        function getMajor(){
            var name = $("#college").val();

            console.log(name);
            $("#major").html('<option value="">选择专业</option>');
            $.ajax({
                url : "${pageContext.request.contextPath}/getMajor/"+name,
                type : "GET",
                dataType : "json",
                success : function(data){
                    if(data!=null){
                        $(data).each(function(index){
                            $("#major").append(
                                '<option value="'+data[index].name+'">'+data[index].name+'</option>'
                            );
                        });
                    }
                }
            });
        }

        function  getClasses() {
            var name = $("#major").val();
            $("#classes").html('<option value="">选择班级</option>');
            $.ajax({
                url : "${pageContext.request.contextPath}/getClasses/"+name,
                type : "GET",
                dataType : "json",
                success : function(data){
                    if(data!=null){
                        $(data).each(function(index){
                            $("#classes").append(
                                '<option value="'+data[index].name+'">'+data[index].name+'</option>'
                            );
                        });
                    }
                }
            });
        }

        function getCity(){
            var Name = $("#province").val();
            console.log(Name);
            $("#city").html('<option value="">选择市份</option>');
            $.ajax({
                url : "${pageContext.request.contextPath}/getCity/"+Name,
                type : "GET",
                dataType : "json",
                success : function(data){
                    if(data!=null){
                        $(data).each(function(index){
                            $("#city").append(
                                '<option value="'+data[index].name+'">'+data[index].name+'</option>'
                            );
                        });
                    }
                }
            });
        }

        function  getArea() {
            var Name = $("#city").val();
            $("#area").html('<option value="">选择县份</option>');
            $.ajax({
                url : "${pageContext.request.contextPath}/getArea/"+Name,
                type : "GET",
                dataType : "json",
                success : function(data){
                    if(data!=null){
                        $(data).each(function(index){
                            $("#area").append(
                                '<option value="'+data[index].name+'">'+data[index].name+'</option>'
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
        <strong id="xueshe" >&nbsp;&nbsp;※<a href="stu_insert" style="text-decoration: none;color: black">当前位置》学生管理》学生入住登记</a>※</strong><br><hr>
        <div id="insert">
            <form action="stu_insertAll" method="post" enctype="multipart/form-data">
                <p>
                    <SPAN>*</SPAN>学&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp号: <input type="text" id="sno" name="sno" required="required" placeholder="类似于2017330322"  onblur="selecton()"/>
                    <SPAN style="margin-left: 120px">*</SPAN>姓&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp名: <input type="text" name="name"  class="error" onblur="error()"/>
                </p>
                <p>
                    <SPAN>*</SPAN>性&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp别:
                    <select name="sex" style="margin-left: 30px;height: 25px;width: 120px" required="required">
                        <option value="" style="height: 30px">请选择性别</option>
                        <option value="男" style="height: 30px">男</option>
                        <option value="女" style="height: 30px">女</option>
                    </select>
                    <SPAN style="margin-left: 174px">*</SPAN>年&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp龄: <input type="number" name="age" class="error" onblur="error()"/>

                </p>
                <p>
                    <SPAN>*</SPAN>民&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp族: <input type="text" name="nation" class="error" onblur="error()"/>
                    <SPAN style="margin-left: 120px">*</SPAN>政&nbsp治&nbsp面&nbsp貌: <input type="text" name="politicalOutlook" class="error" onblur="error()"/>
                </p>
                <p>
                    <SPAN>*</SPAN>身&nbsp份&nbsp证&nbsp件: <input type="text" name="Idcard" class="error" onblur="error()"/>
                    <SPAN style="margin-left: 120px">*</SPAN>电&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp话: <input type="text" id="tel" name="telephone" placeholder="手机号" class="error" onblur="error()""/>
                </p>
                <p>
                    <SPAN>*</SPAN>出&nbsp生&nbsp时&nbsp间: <input type="date" name="birthday" style="width: 175px" class="error" onblur="error()"/>
                    <SPAN  style="margin-left: 120px">*</SPAN>导&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp员: <input type="text" name="teacher" class="error" onblur="error()"/>
                </p>
                <p> <SPAN>*</SPAN>专&nbsp业&nbsp班&nbsp级:
                    <select name="college"  id="college"  onclick="getMajor()" style="margin-left: 30px;height: 25px;width: 120px"  required="required">
                        <option value="" style="height: 30px">请选择学院</option>
                        <c:forEach items="${colleges}" var="c1">
                            <option value="${c1.name}">${c1.name}</option>
                        </c:forEach>
                    </select>
                    <select name="major" id="major" onclick="getClasses()" style="height: 25px;width: 120px"  required="required">
                        <option value="">选择专业</option>
                    </select>
                    <select name="classes" id="classes" style="height: 25px;width: 120px"  required="required">
                        <option value="">选择班级</option>
                    </select>
                </p>

                <p> <SPAN>*</SPAN>宿&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp舍:
                    <select name="dormitory"  id="dormitory"  onclick="getDorm()" style="margin-left: 30px;height: 25px;width: 120px"  required="required">
                        <option value="" style="height: 30px">请选择公寓</option>
                        <c:forEach items="${dormitorys}" var="c1">
                            <option value="${c1.dormitory}">${c1.dormitory}</option>
                        </c:forEach>
                    </select>
                    <select name="dorm" id="dorm" onclick="getBunk()" style="height: 25px;width: 120px"  required="required">
                        <option value="">选择宿舍</option>
                    </select>
                    <select name="bunk" id="bunk" style="height: 25px;width: 120px"  required="required">
                        <option value="">选择床位</option>
                    </select>
                </p>
                <p>
                    <SPAN>*</SPAN>入&nbsp宿&nbsp时&nbsp间: <input type="date" name="entrance_time"  style="width: 175px" class="error" onblur="error()"/>
                    <span style="margin-left: 120px"></span>&nbsp离&nbsp宿&nbsp时&nbsp间:&nbsp <input type="date" name="graduation_time"  style="width: 175px"/>
                </p>
                <p>
                    <SPAN>*</SPAN>紧急联系人: <input type="text" name="emergency_contact_person" style="width: 172px" class="error" onblur="error()"/>
                    <SPAN style="margin-left: 120px">*</SPAN>联&nbsp系&nbsp电&nbsp话: <input type="text" name="emergency_contact_number" class="error" onblur="error()"/>
                </p>

                <p> <SPAN>*</SPAN>地&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp址:
                    <select name="province"  id="province"  onclick="getCity()" style="margin-left: 30px;height: 25px;width: 120px"  required="required">
                        <option value="" style="height: 30px">请选择省份</option>
                        <c:forEach items="${chinas}" var="c1">
                            <option value="${c1.name}">${c1.name}</option>
                        </c:forEach>
                    </select>
                    <select name="city" id="city" onclick="getArea()" style="height: 25px;width: 120px"  required="required">
                        <option value="">选择市份</option>
                    </select>
                    <select name="area" id="area" style="height: 25px;width: 120px">
                        <option value="">选择省份</option>
                    </select>
                </p>
                <p><span  style="position:absolute;padding-top: 23px;color: black">&nbsp&nbsp个&nbsp人&nbsp介&nbsp绍:</span> <textarea name="introduction" placeholder="请介绍你自己" style="height: 70px;width: 300px;margin-left: 137px"></textarea></p>
                <p>  &nbsp&nbsp照&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp片: <input type="file" name="file"/></p>
                <span id="error"></span>
                <input CLASS="second1" type="submit" value="添加 " style="margin-left: 800px;width: 85px;height: 31px" id="insertstudent">
                <input CLASS="second2" type="reset" value="重置"  style="width: 85px;height: 31px">

            </form>
        </div>

    </div>

</div>
<%@ include file="common_bottom.jsp"%>
</body>
</html>
