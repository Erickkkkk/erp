<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>运营支撑中心报销系统</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta name="Author" content="杨恺">
<meta name="Copyright" content="江苏有线">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

<link href="<%=basePath%>css/extern/metro.css" rel="stylesheet">
<link href="<%=basePath%>css/extern/metro-icons.css" rel="stylesheet">
<link href="<%=basePath%>css/extern/metro-responsive.css"
	rel="stylesheet">
<link href="<%=basePath%>css/mycss/util.css" rel="stylesheet">

<script>
var basePath="<%=basePath%>";
</script>
<style>
body,table,td,li,th,ul,input,textarea,a,span,h1,h2,h3,h4,button,select {
	font-family: "宋体", sans-serif
}
</style>
</head>

<body>
	<div style="width:960px;margin:0 auto">
	<div class="cell auto-size padding20 bg-white" id="cell-content">
			<h1 class="text-light">
				联系方式 <span class="mif-contacts-dialer place-right"></span>
			</h1>
		<div class="panel" style="margin-top:20px">
			<div class="heading">
				<span class="icon mif-contacts-dialer"></span> <span class="title">联系方式</span>
			</div>
			<div class="content">开发者联系方式：杨恺，025-84562903，13801599425。</div>
		</div>
		</div>
	</div>



	<script language="javascript" type="text/javascript"
		src="<%=basePath%>js/extern/jquery-3.0.0.min.js"></script>
	<script language="javascript" type="text/javascript"
		src="<%=basePath%>js/extern/metro.js"></script>
	<script language="javascript" type="text/javascript"
		src="<%=basePath%>js/myjs/util.js"></script>

</body>
</html>
