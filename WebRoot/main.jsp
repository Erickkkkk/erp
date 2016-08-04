<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="Author" content="杨恺">
<meta name="Copyright" content="江苏有线">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<link href="<%=basePath%>css/extern/metro.css" rel="stylesheet">
<link href="<%=basePath%>css/extern/metro-icons.css" rel="stylesheet">
<link href="<%=basePath%>css/extern/metro-responsive.css"
	rel="stylesheet">
<link href="<%=basePath%>css/mycss/util.css" rel="stylesheet">

<style>
body,table,td,li,th,ul,input,textarea,a,span,h1,h2,h3,h4,button,select{font-family:"宋体",sans-serif}
body{overflow-y:hidden}
</style>

<script>
var basePath="<%=basePath%>";
var loginpassword="${logininfo.password}";
var loginusername="${logininfo.username}";
var loginemail="${logininfo.email}";
var loginphone="${logininfo.phone}";
var loginres=[];
loginres="${loginres}".split(",");
</script>

</head>

<body>
	<div data-role="dialog" id="passwordmodify" data-overlay="true"
		data-overlay-color="op-dark" data-width="450"></div>
	<div class="app-bar fixed-top darcula" data-role="appbar">
		<a class="app-bar-element branding" href="main.jsp"><img
			src="<%=basePath%>image/jscnwhite.png"
			style="width:30;margin-bottom:5;margin-right:10">运营支撑中心报销系统</a> <span
			class="app-bar-divider"></span>
		<ul class="app-bar-menu">
			<li><a href="main.jsp">主页</a></li>
			<!-- <li><a href="" class="dropdown-toggle">项目管理</a>
				<ul class="d-menu" data-role="dropdown">
					<li><a href="">新建项目</a></li>
					<li class="divider"></li>
					<li><a href="" class="dropdown-toggle">重新打开</a>
						<ul class="d-menu" data-role="dropdown">
							<li><a href="">项目1</a></li>
							<li><a href="">项目2</a></li>
							<li><a href="">项目3</a></li>
							<li class="divider"></li>
							<li><a href="">清除</a></li>
						</ul>
					</li>
				</ul>
			</li> -->
			<li><a href="" class="dropdown-toggle">报销管理</a>
				<ul class="d-menu" data-role="dropdown">
					<li><a href="javascript:myreimbersecontroll();">我的报销</a></li>
					<li><a href="javascript:travelreimbersecontroll();">报销申请</a></li>
					<li id="a3" style="display:none"><a href="javascript:reimbursecheckcontroll();">报销审核</a></li>
				</ul>
			</li>
			<li id="a4" style="display:none"><a href="" class="dropdown-toggle">权限管理</a>
				<ul class="d-menu" data-role="dropdown">
					<li id="a1" style="display:none"><a href="javascript:usercontroll();">用户管理</a></li>
					<li id="a2" style="display:none"><a href="javascript:rolecontroll();">角色管理</a></li>
				</ul>
			</li>
			<li><a href="" class="dropdown-toggle">帮助</a>
				<ul class="d-menu" data-role="dropdown">
					<li><a href="javascript:helpcontroll();">帮助文档</a></li>
					<li><a href="javascript:contactcontroll();">联系方式</a></li>
					<li class="divider"></li>
					<li><a href="javascript:aboutcontroll();">关于</a></li>
				</ul>
			</li>
		</ul>

		<div class="app-bar-element place-right">
			<span class="dropdown-toggle"><span class="mif-paw" style="margin-bottom:4"></span>&nbsp;${logininfo.duty}&nbsp;
				${logininfo.name}</span>
			<div
				class="app-bar-drop-container padding10 place-right no-margin-top block-shadow fg-dark"
				data-role="dropdown" data-no-close="true" style="width: 220px">
				<h2 class="text-light">个人设置</h2>
				<ul class="unstyled-list fg-dark">
					<li><a href="javascript:passwordmodify();" class="fg-white1 fg-hover-yellow">修改密码</a>
					</li>
					<li><a href="javascript:personalinfomodify();" class="fg-white2 fg-hover-yellow">修改个人资料</a>
					</li>
					<li><a href="<%=basePath%>user/exit.do" class="fg-white3 fg-hover-yellow">退出</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="page-content">
	<iframe id="iframe1" src="home.jsp" name="contents" class="iframe1"
					scrolling="auto"> </iframe>
	</div>

	<!-- <div class="page-content">
		<div class="flex-grid no-responsive-future" style="height: 100%;">
			<div class="row" style="height: 100%">
				<div class="cell size-x200" id="cell-sidebar"
					style="background-color: #71b1d1; height: 100%">
					<ul class="sidebar">
						<li><a href="#"> <span class="mif-apps icon"></span> <span
								class="title">待建板块</span> <span class="counter">0</span> </a></li>
						<li><a href="#"> <span class="mif-vpn-publ icon"></span>
								<span class="title">待建板块</span> <span class="counter">0</span> </a>
						</li>
						<li class="active"><a href="#"> <span
								class="mif-drive-eta icon"></span> <span class="title">待建板块</span>
								<span class="counter">0</span> </a></li>
						<li><a href="#"> <span class="mif-cloud icon"></span> <span
								class="title">待建板块</span> <span class="counter">0</span> </a></li>
						<li><a href="#"> <span class="mif-database icon"></span>
								<span class="title">待建板块</span> <span class="counter">0</span> </a>
						</li>
						<li><a href="#"> <span class="mif-cogs icon"></span> <span
								class="title">待建板块</span> <span class="counter">0</span> </a></li>
						<li><a href="#"> <span class="mif-apps icon"></span> <span
								class="title">待建板块</span> <span class="counter">0</span> </a></li>
					</ul>
				</div>
				

			</div>

		</div>
	</div>
 -->
	<script language="javascript" type="text/javascript"
		src="<%=basePath%>js/extern/jquery-3.0.0.min.js"></script>
	<script language="javascript" type="text/javascript"
		src="<%=basePath%>js/extern/jquery.dataTables.min.js"></script>
	<script language="javascript" type="text/javascript"
		src="<%=basePath%>js/extern/metro.js"></script>
	<script language="javascript" type="text/javascript"
		src="<%=basePath%>js/myjs/main.js"></script>
			<script language="javascript" type="text/javascript"
		src="<%=basePath%>js/myjs/util.js"></script>
	<script type="text/javascript">
		$(function(){
			for(var i=0;i<loginres.length;i++){
				if(loginres[i]!="")$("#a"+loginres[i]).show();
			}
		})
	</script>
</body>
</html>
