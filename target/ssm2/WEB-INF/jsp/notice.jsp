<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>公告通知</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <link href="${pageContext.request.contextPath}/resources/css/notice.css" rel="stylesheet">
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.min.js"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/ueditor/lang/zh-cn/zh-cn.js"></script>
    <script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
</head>

<body>
<%@ include file="common_top.jsp"%>
<div id="center1">
    <%@ include file="common_left.jsp"%>
    <div id="right">
        <h2 style="text-align: center">公告发布</h2>
        <form action="sumbit">
            <span style="margin-left: 20px;font-size: 20px">主题：<input type="text" name="topic"/></span>
            <span style="margin-left: 333px;font-size: 20px">时间：<input type="date" name="time"/></span><br><br>
            <span style="margin-left: 20px;font-size: 20px">内容：<script id="editor" type="text/plain"></script></span>
            <input id="sumbit" type="submit" value="发布">
        </form>
    </div>

</div>

<%@ include file="common_bottom.jsp"%>
</body>

<script type="text/javascript">
    // 实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');
</script>
</html>

