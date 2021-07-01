<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript">




        function getDorm(){
            var pr_name = $("#dormitory").val();
            console.log(pr_name);
            $("#dorm").html('<option value="">----请选择宿舍----</option>');
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


        <%--function testJson2(){--%>
        <%--    var ci_name = $("#city option:selected").val();--%>
        <%--    $("#county").html('<option value="">--请选择公寓--</option>');--%>
        <%--    $.ajax({--%>
        <%--        url : "${pageContext.request.contextPath }/getArea/"+ci_name,--%>
        <%--        type : "GET",--%>
        <%--        dataType : "json",--%>
        <%--        success : function(data){--%>
        <%--            if(data!=null){--%>
        <%--                $(data).each(function(index){--%>
        <%--                    $("#county").append(--%>
        <%--                        '<option value="'+data[index].area+'">'+data[index].area+'</option>'--%>
        <%--                    );--%>
        <%--                });--%>
        <%--            }--%>
        <%--        }--%>
        <%--    });--%>
        <%--}--%>
    </script>
</head>
<body>

<select name="dormitory"  id="dormitory"  onclick="getDorm()" >
    <option value="" >------请选择公寓-----</option>
    <c:forEach items="${dormitory}" var="c1">
        <option value="${c1.dormitory}">${c1.dormitory}</option>
    </c:forEach>
</select>
<select name="dorm" id="dorm">
    <option value="">------请选择宿舍-----</option>
</select>
<%--<select name="county" id="county" >--%>
<%--    <option value="">------请选择县城-----</option>--%>
<%--</select>--%>
</body>
</html>