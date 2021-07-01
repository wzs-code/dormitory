<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>jQuery 3D 垂直多级菜单 可筛选菜单项DEMO演示</title>

<link href="${pageContext.request.contextPath}/resources/css/jquery-accordion-menu.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet" type="text/css" />

<style type="text/css">

.filterinput{
	background-color:rgba(249, 244, 244, 0);
	margin-top: 20px;
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

	<div id="jquery-accordion-menu" class="jquery-accordion-menu red">
		<div class="jquery-accordion-menu-header" id="form"></div>
		<ul id="demo-list">
			<li><a href="#"><i class="fa fa-cog"></i>Services </a>
				<ul class="submenu">
					<li><a href="#">Web Design </a></li>
					<li><a href="#">Hosting </a></li>
					<li><a href="#">Design </a></li>
					<li><a href="#">Consulting </a></li>
				</ul>
			</li>
			<li><a href="#"><i class="fa fa-suitcase"></i>Portfolio </a>
				<ul class="submenu">
					<li><a href="#">Web Design </a></li>
					<li><a href="#">Graphics </a></li>
					<li><a href="#">Photoshop </a></li>
					<li><a href="#">Programming </a></li>
				</ul>
			</li>

		   
		</ul>
		<div class="jquery-accordion-menu-footer">
			Footer
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



<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--	<title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div id="center1">--%>
<%--	<div id="left">--%>

<%--		<div class="left1">--%>
<%--			<a href='dorm'>☷菜单列表</a>--%>
<%--		</div>--%>

<%--		<ul class="left2">--%>
<%--			<hr>--%>
<%--			<li class="first"><button onclick="window.location.href='dorm'" style="font-size: 18px;margin-left: -3px;margin-top: -7px">宿舍管理</button><br></li>--%>
<%--			<hr>--%>
<%--			<li class="first">学生信息管理<br>--%>
<%--				<ul class="menu">--%>
<%--					<li><button onclick="window.location.href='stu_list'">学生信息</button><br></li>--%>
<%--					&lt;%&ndash;                    <li><button onclick="window.location.href='stu_insert'">添加</button><br></li>&ndash;%&gt;--%>

<%--				</ul>--%>
<%--			</li>--%>
<%--			<hr>--%>
<%--			<li class="first">宿舍信息管理<br>--%>
<%--				<ul class="menu">--%>
<%--					<li><button onclick="window.location.href='show'">首页</button><br></li>--%>
<%--					<li><button onclick="window.location.href='insert'">添加</button><br></li>--%>
<%--					<li><button onclick="window.location.href='select'">查询</button></li>--%>
<%--				</ul>--%>
<%--			</li>--%>
<%--			<hr>--%>
<%--			<li class="first">宿舍故障管理<br>--%>
<%--				<ul class="menu">--%>
<%--					<li><button onclick="window.location.href='show'">首页</button><br></li>--%>
<%--					<li><button onclick="window.location.href='insert'">添加</button><br></li>--%>
<%--					<li><button onclick="window.location.href='select'">查询</button></li>--%>
<%--				</ul>--%>
<%--			</li>--%>
<%--			<hr>--%>
<%--			<li class="first">宿舍负责人管理<br>--%>
<%--				<ul class="menu">--%>
<%--					<li><button onclick="window.location.href='show'">首页</button><br></li>--%>
<%--					<li><button onclick="window.location.href='insert'">添加</button><br></li>--%>
<%--					<li><button onclick="window.location.href='select'">查询</button></li>--%>
<%--				</ul>--%>
<%--			</li>--%>
<%--			<hr>--%>
<%--			<li class="first">来访管理<br>--%>
<%--				<ul class="menu">--%>
<%--					<li><button onclick="window.location.href='show'">首页</button><br></li>--%>
<%--					<li><button onclick="window.location.href='insert'">添加</button><br></li>--%>
<%--					<li><button onclick="window.location.href='select'">查询</button></li>--%>
<%--				</ul>--%>
<%--			</li>--%>
<%--			<hr>--%>
<%--			<li class="first">在线聊天<br>--%>
<%--				<ul class="menu">--%>
<%--					<li><button onclick="window.location.href='websocket'">首页</button><br></li>--%>
<%--					<li><button onclick="window.location.href='chat'">添加</button><br></li>--%>
<%--					<li><button onclick="window.location.href='select'">查询</button></li>--%>
<%--				</ul>--%>
<%--			</li>--%>
<%--			<hr>--%>
<%--			<li class="first">管理员<br>--%>
<%--				<ul class="menu">--%>
<%--					<li><button onclick="window.location.href='findLogger'">日志记录</button><br></li>--%>
<%--					<li><button onclick="window.location.href='known'">关于</button><br></li>--%>
<%--					<li><button onclick="window.location.href='index'">查询</button></li>--%>
<%--				</ul>--%>
<%--			</li>--%>
<%--			<hr>--%>
<%--		</ul>--%>

<%--	</div>--%>
<%--	<div id="center"></div>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>
