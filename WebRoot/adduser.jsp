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
			新增用户 <span class="mif-user-plus place-right"></span>
		</h1>
		<hr class="thin bg-grayLighter">
		<button class="button success" onclick="addusersubmit()">
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
				<td>
					<div class="input-control modern text">
						<input type="text" id="username"> <span class="label">登录名</span>
						<span class="informer">英文字母及数字组成（20位以内）</span> <span
							class="placeholder">登录名</span>
					</div></td>
				<td>
					<div class="input-control modern password">
						<input type="password" id="password"> <span class="label">密码</span>
						<span class="informer"></span> <span class="placeholder">密码</span>
					</div>
				</td>

				<td>
					<div class="input-control modern password">
						<input type="password" id="passwordconfirm"> <span
							class="label">确认密码</span> <span class="informer"></span> <span
							class="placeholder">确认密码</span>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="input-control modern text">
						<input type="text" id="chinesename"> <span class="label">姓名</span>
						<span class="informer">中文名称</span> <span class="placeholder">姓名</span>
					</div></td>
				<td>
					<div class="input-control modern text">
						<input type="text" id="email"> <span class="label">邮箱</span>
						<span class="informer"></span> <span class="placeholder">邮箱</span>
					</div></td>
				<td>
					<div class="input-control select">
						<select id="sex">
							<option value="0">男</option>
							<option value="1">女</option>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="input-control modern text">
						<input type="text" id="organize"> <span class="label">组织</span>
						<span class="informer"></span> <span class="placeholder">组织</span>
					</div></td>
				<td>
					<div class="input-control modern text">
						<input type="text" id="duty"> <span class="label">岗位职责</span>
						<span class="informer"></span> <span class="placeholder">岗位职责</span>
					</div></td>
				<td>
					<div class="input-control modern text">
						<input type="text" id="phone"> <span class="label">手机</span>
						<span class="informer"></span> <span class="placeholder">手机</span>
					</div></td>

			</tr>
			<tr>
			<td style="text-align:right">请选择需要关联角色：</td>
				<td>
					<div class="input-control select">
						<select id="role">
						</select>
					</div>
				</td>
				<td>
					<div class="input-control select">
						<select id="state">
							<option value="0">生效</option>
							<option value="1">失效</option>
						</select>
					</div>
				</td>
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
		src="<%=basePath%>js/myjs/adduser.js"></script>
	<script language="javascript" type="text/javascript">
	$(function(){
		$.ajax({
			type:'post',
			url:basePath+'role/queryRoleAjax.do',
			data:{
			},
			dataType:'json',
			success:function(data){
			for(var i=0;i<data.length;i++){
				if(data[i].state!="1")
				$("#role").append("<option value='"+data[i].roleid+"'>"+data[i].rolename+"</option>");
			}
			}
		})
	})
	
	</script>

</body>
</html>
