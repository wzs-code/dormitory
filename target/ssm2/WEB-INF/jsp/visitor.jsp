<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<html>
<head>
    <title>访客信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/resources/css/visitor.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/visitor.js"></script>
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
        <strong id="xueshe" >&nbsp;&nbsp;※<a href="visitor" style="text-decoration: none;color: black">当前位置》学生管理》访客登记</a>※</strong><br><hr>
        <button class="btn2" style="height: 35px;width:100px;border: 1px solid #9BDAF5;border-radius: 5px;background-color: #FFFFFF;color:#3ebff5 " onclick="todelect()"><span style="font-size: 18px"><i class="fa fa-trash-o"></i></span>&nbsp;批量删除</button>

        <button class="btn1" style="border: 1px solid #9BDAF5;border-radius: 5px;background-color: #FFFFFF" >
            <a href = "javascript:void(0)" onclick = "document.getElementById('light1').style.display='block';
                            document.getElementById('fade').style.display='block';updatepw()" class="upatepw">
                <span style="height: 30px" width="75px"><i class="fa fa-plus"></i>&nbsp;&nbsp;登记</span></a>
        </button>
        <form action="selectAll" method="post">
            <div id="btn3">
                <input type="text" name="sno" id="select_option" required="required" placeholder="可按访客姓名查询"/>

            </div>
        </form>
        <BR>
        <div class="selectall">

            <a href="/ssm2/select_visitorname?visitor_name=" id="select_visitorname"><button>查询</button></a>
        </div>
<br><br>
        <center>
            <div id="right2">
                <table border="1">
                    <thead>
                    <tr style="background-color: #AAADB3">
                        <td style="width: 35px"><input type="checkbox"  name="selectall" onclick="selectall()"/></td>
                        <td style="width: 55px">编号</td>
                        <td style="width: 80px">访客姓名</td>
                        <td style="width: 80px">访客宿舍</td>
                        <td style="width: 80px">访问学生</td>
                        <td style="width: 80px">来访关系</td>
                        <td style="width: 110px">访客电话</td>
                        <td style="width: 85px">来访时间</td>
                        <td style="width: 85px">离去时间</td>
                        <td style="width: 100px">来访缘由</td>
                        <td style="width: 160px">操作</td>
                    </tr>
                    </thead>
                    <c:forEach items="${visitors.list}" var="visitor">
                        <tbody>
                        <tr>
                            <td><input type="checkbox" name="visitorID" value="${visitor.id}"/></td>
                            <td>${visitor.id}</td>
                            <td>${visitor.visitor_name}</td>
                            <td>${visitor.visitor_dormitory}</td>
                            <td>${visitor.visit_studentname}</td>
                            <td>${visitor.visitor_relation}</td>
                            <td>${visitor.visitor_telephone}</td>
                            <td><fmt:formatDate value="${visitor.visitor_cometime}" pattern="yyyy-MM-dd"/></td>
                            <td><fmt:formatDate value="${visitor.visitor_leavetime}" pattern="yyyy-MM-dd"/></td>
                            <td class="reason_content" title="${visitor.visitor_reason}">${visitor.visitor_reason}</td>

                            <td>
                                <button style="border-radius: 5px;background-color: #FFFFFF;border: 1px solid #3f5964;">
                                    <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='block';
                                            document.getElementById('fade').style.display='block';visitor_update(${visitor.id})"><i class="fa fa-edit" style="color: black;width: 50px;height: 20px;font-size: 15px;margin-top: 7px">离去</i></a>


                                </button>
                                <button id="" style="border-radius: 5px;background-color: #FFFFFF;border: 1px solid #6e6e6e;margin-top: -52px">
                                    <!-- 删除当前项 -->
                                    <a href="delete_visitor?id=${visitor.id}"><i class="fa fa-trash-o" style="color: black;width: 50px;height: 20px;font-size: 15px;margin-top: 7px">删除</i></a>
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
                <li><a href="${pageContext.request.contextPath}/visitor?page=1&size=8" aria-label="Previous">首頁</a></li>
                <li><a href="${pageContext.request.contextPath}/visitor?page=${visitors.pageNum-1}&size=8" >上一頁</a></li>
                <c:forEach begin="1" end="${visitors.pages}" var="pageNum">
                    <a href="${pageContext.request.contextPath}/visitor?page=${pageNum}&size="8></a>
                </c:forEach>
                <li><a href="${pageContext.request.contextPath}/visitor?page=${visitors.pageNum+1}&size=8">下一頁</a></li>
                <li><a href="${pageContext.request.contextPath}/visitor?page=${visitors.pages}&size=8" aria-label="Next">尾頁</a></li>
                <li style="font-size: 20px">共有${visitors.pages}頁，${number}条记录</li>
            </ul>
        </div>

    </div>
</div>




<div id="light" class="white_content">
    <div class="light_1">
        <div class="light_11"><strong>访客离去登记</strong></div>
    </div>
    <div class="second">
        <form action="update_visitor" method="post">
            <SPAN style="color: black">*</SPAN>访&nbsp客&nbsp编&nbsp号: <input type="text"  id="visitor_id1"name="id" readonly="readonly"/><br>
            <SPAN style="color: black">*</SPAN>访&nbsp问&nbsp公&nbsp寓: <input type="text"  id="visitor_dormitory1"name="dormitory" readonly="readonly"/><br>
            <SPAN style="color: black">*</SPAN>访&nbsp客&nbsp姓&nbsp名: <input type="text"  id="visitor_name1"name="visitor_name" readonly="readonly"/><br>
            <SPAN style="color: black">*</SPAN>访&nbsp问&nbsp学&nbsp生: <input type="text" id="visit_studentname1" name="visit_studentname" readonly="readonly"/><br>
            <SPAN style="color: black">*</SPAN>来&nbsp访&nbsp关&nbsp系: <input type="text" id="visitor_relation1" name="visitor_relation" readonly="readonly"/><br>
            <SPAN style="color: black">*</SPAN>访&nbsp客&nbsp电&nbsp话: <input type="text" id="visitor_telephone1" name="visitor_telephone" placeholder="手机号" readonly="readonly"/><br>
            <SPAN>*</SPAN>离&nbsp去&nbsp时&nbsp间: <input type="date" id="visitor_leavetime1"name="visitor_leavetime" required="required"/><br>
            <label class="reason"><SPAN style="color: black">*</SPAN>来&nbsp访&nbsp缘&nbsp由:</label> <textarea id="visitor_reason1" name="visitor_reason" class="visitor_reason" readonly="readonly"></textarea><br><br>
            <input CLASS="second1" type="submit" value="离访"  />
            <input CLASS="second2" type="button" value="取消"  onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'"/>
        </form>
    </div>
</div>





<div id="light1" class="white_content">
    <div class="light_1">
        <div id="light_11"><strong>访客登记信息</strong></div>
    </div>
    <div class="second">
        <form action="visitor_insert" method="post">
            <SPAN>*</SPAN>访&nbsp客&nbsp姓&nbsp名: <input type="text" name="visitor_name" style="margin-bottom: 14px;" class="error"/><br>
            <SPAN style="color: red">*</SPAN>故&nbsp障&nbsp宿&nbsp舍:&nbsp;&nbsp;
            <select name="visitor_dormitory"  id="dormitory"  onclick="getDorm()" required="required" style="height: 25px;width: 90px" style="top: 8px">
                <option value="" style="height: 30px">请选择公寓</option>
                <c:forEach items="${dormitorys}" var="c1">
                    <option value="${c1.dormitory}">${c1.dormitory}</option>
                </c:forEach>
            </select>
            <select name="visitor_dorm" id="dorm" required="required" style="height: 25px;width: 80px">
                <option value="">选择宿舍</option>
            </select><br>
            <SPAN>*</SPAN>访&nbsp问&nbsp学&nbsp生: <input type="text" name="visit_studentname" class="error"/><br>
            <SPAN>*</SPAN>来&nbsp访&nbsp关&nbsp系: <input type="text" name="visitor_relation" class="error"/><br>
            <SPAN>*</SPAN>访&nbsp客&nbsp电&nbsp话: <input type="text" id="tell" name="visitor_telephone" placeholder="手机号" class="error""/><br>
            <SPAN>*</SPAN>来&nbsp访&nbsp时&nbsp间: <input type="date" name="visitor_cometime" class="error"/><br>
            <label class="reason"><SPAN style="color: red">*</SPAN>来&nbsp访&nbsp缘&nbsp由:</label> <textarea name="visitor_reason" class="visitor_reason"></textarea><br><br>
            <input class="second1" type="submit" value="登  记 "  />
            <input class="second2" type="button" value="取  消"  onclick = "document.getElementById('light1').style.display='none';document.getElementById('fade').style.display='none'"/>

        </form>

    </div>
</div>



<div id="fade" class="black_overlay"></div>


<%@ include file="common_bottom.jsp"%>
</body>
</html>





