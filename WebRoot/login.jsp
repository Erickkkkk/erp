<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="Author" content="杨恺">
<meta name="Copyright" content="江苏有线">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<link type="text/css" rel="stylesheet" href="<%=basePath%>css/extern/metro.css">
<link type="text/css" rel="stylesheet"
	href="<%=basePath%>css/extern/metro-icons.css">
<link type="text/css" rel="stylesheet"
	href="<%=basePath%>css/extern/metro-responsive.css">
<link type="text/css" rel="stylesheet" href="<%=basePath%>css/mycss/util.css">

<script>
var basePath="<%=basePath%>";
</script>

<style>
body,table,td,li,th,ul,input,textarea,a,span,h1,h2,h3,h4,button,select{font-family:"宋体",sans-serif}
</style>
</head>

<body>
<body class="bg-darkTeal">
	<div class="login-form padding20 block-shadow">
		<h1 class="text-light" style="font-size:38px">运营支撑中心报销系统</h1>
		<hr class="thin" />
		<br />
		<div class="input-control text full-size" data-role="input">
			<label for="user_login">登录名:</label> <input type="text"
				name="user_login" id="user_login">
			<button class="button helper-button clear">
				<span class="mif-cross"></span>
			</button>
		</div>
		<br /> <br />
		<div class="input-control password full-size" data-role="input">
			<label for="user_password">密码:</label> <input type="password"
				name="user_password" id="user_password">
			<button class="button helper-button reveal">
				<span class="mif-looks"></span>
			</button>
		</div>
		<br /> <br />
		<div class="form-actions">
			<button type="button" id="login_btn" class="button primary">进入</button>
			<label><font face='Arial'>©</font>Copyright2015 JSCN. Designed by yangkai.</label>
		</div>
	</div>

	<script type="text/javascript" src="<%=basePath%>js/extern/jquery-3.0.0.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/myjs/login.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/extern/metro.js"></script>
</body>
</html>
