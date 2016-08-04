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
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="Author" content="杨恺">
<meta name="Copyright" content="江苏有线">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<link type="text/css" rel="stylesheet"
	href="<%=basePath%>css/extern/metro.css">
<link type="text/css" rel="stylesheet"
	href="<%=basePath%>css/extern/metro-icons.css">
<link type="text/css" rel="stylesheet"
	href="<%=basePath%>css/extern/metro-responsive.css">
<link type="text/css" rel="stylesheet"
	href="<%=basePath%>css/mycss/util.css">

<script>
var basePath="<%=basePath%>";
var loginusername="${logininfo.username}";
</script>

<style>
body,table,td,li,th,ul,input,textarea,a,span,h1,h2,h3,h4,button,select {
	font-family: "宋体", sans-serif
}
.table1 td{
	padding:0.5rem;
	font-size:14
}
</style>

</head>

<div style="width:960px;margin:0 auto">
	<div class="margin20 no-margin-left no-margin-right">
		<div class="clear-float">
			<div class="place-right">
				<form>
					<div class="input-control text margin10" style="width: 300px">
						<input type="text" name="q" placeholder="快速搜索...">
						<button class="button">
							<span class="mif-search"></span>
						</button>
					</div>
				</form>
			</div>
			<h2 class="place-left fg-blue">您好，${logininfo.name}!</h2>
		</div>
	</div>

	<div class="main-content clear-float">
		<div class="tile-area no-padding" style="height:70%">
			<div class="tile-group no-margin no-padding" style="width: 100%">
				<div class="tile-large ol-transparent" style="float: right;">
				<div class="panel warning">
						<div class="heading">
							<span class="title"><span class="mif-tag"></span> 目前已上线功能</span>
						</div>
						<div class="content">【权限管理】【报销管理】</div>
					</div>
					<div data-role="calendar" data-week-start="1" data-locale="zhCN"></div>
				</div>


				<div class="tile-large ol-transparent" data-role="tile">
					<div class="tile-content">
						<div class="carousel" data-role="carousel" data-height="100%"
							data-width="100%" data-controls="false">
							<div class="slide">
								<img src="<%=basePath%>image/newbuilding2.png"
									data-role="fitImage" data-format="fill">
							</div>
							<div class="slide">
								<img src="<%=basePath%>image/newbuilding3.png"
									data-role="fitImage" data-format="fill">
							</div>
							<div class="slide">
								<img src="<%=basePath%>image/clouds.png"
									data-role="fitImage" data-format="fill">
							</div>
						</div>
					</div>
				</div>

				<a href="travelreimberse.jsp" class="tile bg-lightBlue fg-white" data-role="tile">
					<div class="tile-content iconic">
						<span class="icon mif-drive-eta"></span>
					</div>
					<span class="tile-label">出差报销申请</span>
				</a>
				<a href="http://www.google.cn/chrome/browser/desktop/index.html" class="tile bg-orange fg-white" data-role="tile">
					<div class="tile-content iconic">
						<span class="icon mif-chrome"></span>
					</div>
					<span class="tile-label">推荐使用Chrome</span>
				</a>
				<a href="javascript:window.location.href=basePath+'travel/queryTravelReimberse.do?username='+loginusername;" class="tile bg-teal fg-white" data-role="tile">
					<div class="tile-content iconic">
						<span class="icon mif-user"></span>
					</div>
					<span class="tile-label">我的报销</span>
				</a>
				<a href="http://exmail.qq.com/login" class="tile bg-green fg-white" data-role="tile">
					<div class="tile-content iconic">
						<span class="icon mif-envelop"></span>
					</div>
					<span class="tile-label">腾讯企业邮箱</span>
				</a>
			</div>
		</div>
	</div>
	
	<div>
	<table class="table1"><tr>
	<td>快捷访问</td>
	<td><a href="http://portal.jscnnet.com" target="_blank">门户网站</a></td>
	<td><a href="http://www.jscnnet.com" target="_blank">官方网站</a></td>
	<td><a href="http://www.js96296.com" target="_blank">网上营业厅</a></td>
	<td><a href="http://172.31.83.40:8090/requirement" target="_blank">需求管理平台</a></td>
	<td><a href="http://172.31.81.122/boss" target="_blank">省BOSS1</a></td>
	<td><a href="http://172.31.81.234/boss" target="_blank">省BOSS2</a></td>
	<td><a href="http://172.31.86.136:8080/index3.jsp" target="_blank">省经分</a></td>
	<td><a href="http://172.31.84.208:8081/CrmWeb" target="_blank">省网格</a></td>
	<td><a href="http://172.20.254.122/boss/login.do" target="_blank">老BOSS</a></td>
	<td><a href="http://172.31.83.40:8000/alm_csc" target="_blank">IT信息化平台</a></td>
	<td><a href="http://172.20.89.204/default_main.asp" target="_blank">值班呼叫平台</a></td>
	
	
	
	
	</tr></table>
	</div>
	
	<div style="text-align:center;margin-top:0.425rem">

		<label><font face='Arial'>©</font> Copyright 2015 JSCN.
			Designed by yangkai.</label>
	</div>
</div>

<script language="javascript" type="text/javascript"
	src="<%=basePath%>js/extern/jquery-3.0.0.min.js"></script>
<script language="javascript" type="text/javascript"
	src="<%=basePath%>js/extern/metro.js"></script>
<script language="javascript" type="text/javascript" 
	src="<%=basePath%>js/myjs/home.js"></script>
	
</body>
</html>
