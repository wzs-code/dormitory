<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="utf-8">

    <title>宿舍菜单</title>

    <link href="${pageContext.request.contextPath}/resources/css/jquery-accordion-menu.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        
        .filterinput{
            background-color:rgba(249, 244, 244, 0);
            margin-top: 10px;
            border-radius:15px;
            width:90%;
            height:30px;
            border:thin solid #FFF;
            text-indent:0.5em;
            font-weight:bold;
            color:#FFF;
        }
        #demo-list a{
            overflow:hidden;
            text-overflow:ellipsis;
            -o-text-overflow:ellipsis;
            white-space:nowrap;
            width:100%;
        }
    </style>

    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-accordion-menu.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(function(){
            //顶部导航切换
            $("#demo-list li").click(function(){
                $("#demo-list li.active").removeClass("active")
                $(this).addClass("active");
            })
        })
    </script>
</head>
<body>
<div style="text-align:center;clear:both">
    <script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
    <script src="/follow.js" type="text/javascript"></script>
</div>
<div class="content">
    <div id="menu"><i class="fa fa-list-alt"></i>&nbsp&nbsp菜单列表</div>
    <div id="jquery-accordion-menu" class="jquery-accordion-menu red">
        <div class="jquery-accordion-menu-header" id="form"></div>
        <ul id="demo-list">
            <li><a href="dorm"><i class="fa fa-home"></i>宿舍介绍 </a>
            </li>
            <li><a href="#"><i class="fa fa-user"></i>学生管理 </a>
                <ul class="submenu">
                    <li><a href="stu_list">学生信息 </a></li>
                    <c:if test="${'负责人'== sessionScope.manager}">
                        <li><a href="stu_insert">学生入住 </a></li>
                    </c:if>
                </ul>
            </li>
            <li><a href="#"><i class="fa fa-home"></i>宿舍管理 </a>
                <ul class="submenu">
                    <li><a href="dormitory">宿舍信息 </a></li>
                    <li><a href="dormitoryscenery">宿舍风貌 </a></li>

                </ul>
            </li>
            <li><a href="#"><i class="fa fa-steam"></i>宿舍故障管理 </a>
                <ul class="submenu">
                    <li><a href="dormitoryFaultInformation">故障信息 </a></li>
                    <li><a href="statistical">故障统计 </a></li>
                </ul>
            </li>
            <li><a href="#"><i class="fa fa-user-md"></i>宿舍负责人管理 </a>
                <ul class="submenu">
                    <c:if test="${'管理员'== sessionScope.admin}">
                        <li><a href="principal">负责人信息 </a></li>
                    </c:if>
                    <c:if test="${'负责人'== sessionScope.manager}">
                        <li><a href="known">负责人须知 </a></li>
                    </c:if>

                </ul>
            </li>
            <c:if test="${'负责人'== sessionScope.manager}">
            <li><a href="#"><i class="fa fa-plane"></i>来访人员管理 </a>
                <ul class="submenu">
                    <li><a href="visitor">访客信息 </a></li>
                </ul>
            </li>
            </c:if>
            <li><a href="#"><i class="fa fa-wechat"></i>在线聊天 </a>
                <ul class="submenu">
                    <li><a href="chat">实时聊天 </a></li>
                </ul>
            </li>
            <c:if test="${'管理员'== sessionScope.admin}">
            <li><a href="#"><i class="fa fa-book"></i>日志管理 </a>
                <ul class="submenu">
                    <li><a href="findLogger">日志记录 </a></li>


                </ul>
            </li>
            </c:if>
            <li><a href="#"><i class="fa fa-key"></i>公告 </a>
                <ul class="submenu">
                    <li> <li><a href="shownotices">公告通知 </a></li>
                    <c:if test="${'管理员'== sessionScope.admin}">
                        <li> <li><a href="notice">公告撰写 </a></li>
                    </c:if>
                </ul>
            </li>

        </ul>

        <div class="jquery-accordion-menu-footer" style="font-size: 20px">
            <i class="fa fa-joomla"></i>&nbsp;&nbsp;Footer
        </div>
    </div>
</div>

<script type="text/javascript">
    (function($) {
        $.expr[":"].Contains = function(a, i, m) {
            return (a.textContent || a.innerText || "").toUpperCase().indexOf(m[3].toUpperCase()) >= 0;
        };
        function filterList(header, list) {
            //@header 头部元素
            //@list 无需列表
            //创建一个搜素表单
            var form = $("<form>").attr({
                "class":"filterform",
                action:"#"
            }), input = $("<input>").attr({
                "class":"filterinput",
                type:"text"
            });
            $(form).append(input).appendTo(header);
            $(input).change(function() {
                var filter = $(this).val();
                if (filter) {
                    $matches = $(list).find("a:Contains(" + filter + ")").parent();
                    $("li", list).not($matches).slideUp();
                    $matches.slideDown();
                } else {
                    $(list).find("li").slideDown();
                }
                return false;
            }).keyup(function() {
                $(this).change();
            });
        }
        $(function() {
            filterList($("#form"), $("#demo-list"));
        });
    })(jQuery);
</script>

<script type="text/javascript">

    jQuery("#jquery-accordion-menu").jqueryAccordionMenu();

</script>

</body>
</html>
