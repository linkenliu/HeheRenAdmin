<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="上海罗馥缇电子商务有限公司  内容管理系统">
<meta name="author" content="上海罗馥缇电子商务有限公司">
<!-- The styles -->
<style type="text/css">
body {
	padding-bottom: 40px;
}

.sidebar-nav {
	padding: 9px 0;
}
</style>
	<link href="<%=basePath%>js/webuploader-0.1.5/webuploader.css" rel="stylesheet">
    <link  href="css/bootstrap-cerulean.min.css" rel="stylesheet">
    <link href="<%=basePath%>css/charisma-app.css" rel="stylesheet">
    <link href='<%=basePath%>css/fullcalendar.css' rel='stylesheet'>
    <link href='<%=basePath%>css/fullcalendar.print.css' rel='stylesheet' media='print'>
    <link href='<%=basePath%>css/chosen.min.css' rel='stylesheet'>
    <link href='<%=basePath%>css/colorbox.css' rel='stylesheet'>
    <link href='<%=basePath%>css/responsive-tables.css' rel='stylesheet'>
    <link href='<%=basePath%>css/bootstrap-tour.min.css' rel='stylesheet'>
	<link href='<%=basePath%>css/jquery.noty.css' rel='stylesheet'>
	<link href='<%=basePath%>css/noty_theme_default.css' rel='stylesheet'>
    <link href='<%=basePath%>css/elfinder.min.css' rel='stylesheet'>
    <link href='<%=basePath%>css/elfinder.theme.css' rel='stylesheet'>
    <link href='<%=basePath%>css/jquery.iphone.toggle.css' rel='stylesheet'>
    <link href='<%=basePath%>css/uploadify.css' rel='stylesheet'>
    <link href='<%=basePath%>css/animate.min.css' rel='stylesheet'>
    <link href='<%=basePath%>css/style.css' rel='stylesheet'>
  <script src="<%=basePath%>js/jquery.min.js"></script>

<script type="text/javascript">
var basePath ="<%=basePath%>";
</script>
<%-- <link rel="shortcut icon" href="<%=basePath%>img/favicon.ico">
 --%>


	
<script src="<%=basePath%>js/bootstrap.min.js"></script>

<!-- library for cookie management -->
<script src="<%=basePath%>js/jquery.cookie.js"></script>
<!-- calender plugin -->
<script src='<%=basePath%>js/moment.min.js'></script>
<script src='<%=basePath%>js/fullcalendar.min.js'></script>
<!-- data table plugin -->
<script src='<%=basePath%>js/jquery.dataTables.min.js'></script>

<!-- select or dropdown enhancer -->
<script src="<%=basePath%>js/chosen.jquery.min.js"></script>
<!-- plugin for gallery image view -->
<script src="<%=basePath%>js/jquery.colorbox-min.js"></script>
<!-- notification plugin -->
<script src="<%=basePath%>js/jquery.noty.js"></script>
<!-- library for making tables responsive -->
<script src="<%=basePath%>js/responsive-tables.js"></script>
<!-- tour plugin -->
<script src="<%=basePath%>js/bootstrap-tour.min.js"></script>
<!-- star rating plugin -->
<script src="<%=basePath%>js/jquery.raty.min.js"></script>
<!-- for iOS style toggle switch -->
<script src="<%=basePath%>js/jquery.iphone.toggle.js"></script>
<!-- autogrowing textarea plugin -->
<script src="<%=basePath%>js/jquery.autogrow-textarea.js"></script>
<!-- multiple file upload plugin -->
<script src="<%=basePath%>js/jquery.uploadify-3.1.min.js"></script>
<!-- history.js for cross-browser state change on ajax -->
<script src="<%=basePath%>js/jquery.history.js"></script>
<!-- application script for Charisma demo -->
<script src="<%=basePath%>js/charisma.js"></script>
<script src="<%=basePath%>js/common.js"></script>
<script src="<%=basePath%>js/webuploader-0.1.5/webuploader.min.js"></script>
