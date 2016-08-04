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
var basePath="<%=basePath%>"
</script>
<style>
body,table,td,li,th,ul,input,textarea,a,span,h1,h2,h3,h4,button,select{font-family:"宋体",sans-serif}
</style>
</head>
  
 <body>
 <div style="width:960;margin:0 auto">
	<div class="cell auto-size padding20 bg-white" id="cell-content">
		<h1 class="text-light">
			编辑角色 <span class="mif-cogs place-right"></span>
		</h1>
		<hr class="thin bg-grayLighter">
		<button class="button success" onclick="editrolesubmit()">
			<span class="mif-checkmark"></span> 提交信息
		</button>
		<button class="button warning" onclick="reset()">
			<span class="mif-loop2"></span> 清空重填
		</button>
		<button class="button primary" onclick="goback()">
			<span class="mif-undo"></span> 返回上级
		</button>
		<hr class="thin bg-grayLighter">
	</div>
	<div class="auto-size padding20">
		<table>
			<tr>
				<td>角色名：</td>
				<td>
					<div class="input-control text">
						<input type="text" id="rolename" value="${role.rolename}" disabled>
					</div>
				</td>
			</tr>
			<tr>
				<td>描述：</td>
				<td>
					<div class="input-control textarea">
						<textarea id="roledescription" style="width:10.875rem;height:60;font-family:'宋体'">${role.roledescription}</textarea>
					</div>
				</td>
			</tr>
			<tr>
				<td>状态：</td>
				<td>
				<input type="hidden" id="statehide" value="${role.state}">
					<div class="input-control select">
						<select id="state">
							<option value="0">生效</option>
							<option value="1">失效</option>
						</select>
					</div></td>
			</tr>
		</table>
	</div>
                    
	</div>

	<script language="javascript" type="text/javascript"
		src="<%=basePath%>js/extern/jquery-3.0.0.min.js"></script>
	<script language="javascript" type="text/javascript"
		src="<%=basePath%>js/extern/metro.js"></script>
	<script language="javascript" type="text/javascript"
		src="<%=basePath%>js/myjs/util.js"></script>
	<script language="javascript" type="text/javascript"
		src="<%=basePath%>js/myjs/editrole.js"></script>
	<script language="javascript" type="text/javascript">
	$(function(){
		$("#state").val($("#statehide").val());
	})
	</script>

</body>
</html>
