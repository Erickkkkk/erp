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
body,table,td,li,th,ul,input,textarea,a,span,h1,h2,h3,h4,button,select{font-family:"宋体",sans-serif}
</style>
</head>


<body>
<div style="width:960;margin:0 auto">
	<div class="cell auto-size padding20 bg-white" id="cell-content">
		<h1 class="text-light">
			用户管理 <span class="mif-users place-right"></span>
		</h1>
		<hr class="thin bg-grayLighter">
		<button class="button success" onclick="adduserbtn()">
			<span class="mif-plus"></span> 新增用户
		</button>
		<button class="button warning" onclick="refreshuserlist()">
			<span class="mif-loop2"></span> 刷新列表
		</button>
		<hr class="thin bg-grayLighter">

		<table id="usertable" class="dataTable border bordered hovered"
			data-auto-width="false">
			<thead>
				<tr>
					<td class="sortable-column sort-asc" style="width: 8%">序号</td>
					<td class="sortable-column" style="width: 15%">登录名</td>
					<td class="sortable-column" style="width:14%">姓名</td>
					<td class="sortable-column" style="width: 15%">角色</td>
					<td class="sortable-column" style="width:7%">状态</td>
					<td class="sortable-column" style="width: 23%">最后登录时间</td>
					<td style="width: 18%">操作</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="s" varStatus="ss">
					<tr>
						<td>${ss.count}</td>
						<td>${s.username}</td>
						<td>${s.name}</td>
						<td>${s.rolename}</td>
						<td><input id="userstate${s.id}" value="${s.state}"
							type="hidden"> <span></span>
						</td>
						<td>${s.lastlogintime}</td>
						<td><button class="button"
								onclick="edituserbtn('${s.username}')"
								style="border:none;background:none">
								<span data-role="hint" data-hint-background="bg-blue"
									data-hint-color="fg-white" data-hint-mode="2" data-hint="编辑"
									class="mif-pencil fg-blue"></span>
							</button>
							<button onclick="delUser('${s.username}')" class="button"
								style="border:none;background:none">
								<span data-role="hint" data-hint-background="bg-red"
									data-hint-color="fg-white" data-hint-mode="2" data-hint="删除"
									class="mif-cross fg-red"></span>
							</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</div>
	<script language="javascript" type="text/javascript"
		src="<%=basePath%>js/myjs/user.js"></script>
	<script language="javascript" type="text/javascript"
		src="<%=basePath%>js/myjs/util.js"></script>
	<script language="javascript" type="text/javascript"
		src="<%=basePath%>js/extern/jquery-3.0.0.min.js"></script>
	<script language="javascript" type="text/javascript"
		src="<%=basePath%>js/extern/jquery.dataTables.min.js"></script>
	<script language="javascript" type="text/javascript"
		src="<%=basePath%>js/extern/metro.js"></script>
	<script language="javascript" type="text/javascript">
		$(function() {
			$("input[id^='userstate']").each(function() {
			if($(this).val()=="0")
				{$(this).next().addClass("mif-checkmark fg-green")}
				else{$(this).next().addClass("mif-stop fg-red")}
			});
			$("#usertable").DataTable({
				language : {
					"sProcessing" : "处理中...",
					"sLengthMenu" : "显示 _MENU_ 项结果",
					"sZeroRecords" : "没有匹配结果",
					"sInfo" : "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
					"sInfoEmpty" : "显示第 0 至 0 项结果，共 0 项",
					"sInfoFiltered" : "(由 _MAX_ 项结果过滤)",
					"sInfoPostFix" : "",
					"sSearch" : "搜索:",
					"sUrl" : "",
					"sEmptyTable" : "表中数据为空",
					"sLoadingRecords" : "载入中...",
					"sInfoThousands" : ",",
					"oPaginate" : {
						"sFirst" : "首页",
						"sPrevious" : "上页",
						"sNext" : "下页",
						"sLast" : "末页"
					},
					"oAria" : {
						"sSortAscending" : ": 以升序排列此列",
						"sSortDescending" : ": 以降序排列此列"
					}
				}
			});
		})
		
	</script>
</body>
</html>
