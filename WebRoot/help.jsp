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
body,table,td,li,th,ul,input,textarea,a,span,h1,h2,h3,h4,h5,button,select {
	font-family: "宋体", sans-serif
}
</style>
</head>

<body>
	<div style="width:960px;margin:0 auto">
	<div class="cell auto-size padding20 bg-white" id="cell-content">
			<h1 class="text-light">
				帮助文档 <span class="mif-help place-right"></span>
			</h1>
		<div class="panel" style="margin-top:20px">
			<div class="heading">
				<span class="icon mif-help"></span> <span class="title">帮助文档</span>
			</div>
		</div>
		
            <div class="grid">
                <div class="row ">
                    <div class="cell">
                        <h5>权限管理</h5>
                        <ul class="step-list">
                            <li>
                                <h2 class="no-margin-top">为功能菜单设置一个角色</h2>
                                <hr class="bg-red" />
                                <div>
                                    	系统管理人员可为一些功能菜单设置角色，在“权限管理-角色管理”中进行新增和编辑，可灵活控制不同角色的不同权限，使企业人员的权限可控，便于管理。
                                    <br />
                                    <br />
                                    <img src="<%=basePath%>image/role1.png">
                                </div>
                            </li>
                            <li>
                                <h2 class="no-margin-top">管理一个系统用户，并赋予其相应的权限</h2>
                                <hr class="bg-green" />
                                <div>
                                    可灵活增加、修改、删除系统用户，并能失效用户账号，通过赋予角色或调整角色来控制用户的权限，通过查看用户的最后登录时间掌握企业人员对系统的使用情况。
                                    <br />
                                    <br />
                                    <img src="<%=basePath%>image/user1.png">
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            
            
            
              <div class="grid">
                <div class="row ">
                    <div class="cell">
                        <h5>报销管理</h5>
                        <ul class="step-list">
                            <li>
                                <h2 class="no-margin-top">每个用户都能提交自己的报销信息</h2>
                                <hr class="bg-red" />
                                <div>
                                    企业人员通过“出差报销”申请进行提交自己的出差及报销信息，包含出差时间、地点、交通方式、交通费用、住宿方式、住宿费用、出差补助等报销费用清单。
                                    <br />
                                    <br />
                                    <img src="<%=basePath%>image/reimburse1.png">
                                    <img src="<%=basePath%>image/reimburse2.png">
                                </div>
                            </li>
                            <li>
                                <h2 class="no-margin-top">查看自己的报销记录，管理人员可查看变更日志</h2>
                                <hr class="bg-green" />
                                <div>
                                    “我的报销”“报销审核”可灵活查看自己的出差、报销历史记录及款项是否已发放等状态，管理人员可查看报销信息及相关数据变更日志，监管与核对。
                                    <br />
                                    <br />
                                    <img src="<%=basePath%>image/reimburse3.png">
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
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
