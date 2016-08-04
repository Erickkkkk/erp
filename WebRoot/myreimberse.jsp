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
body,table,td,li,th,ul,input,textarea,a,span,h1,h2,h3,h4,button,select {
	font-family: "宋体", sans-serif
}
</style>

<script>
	var basePath="<%=basePath%>";
	var loginusername = "${logininfo.username}";
	var loginname = "${logininfo.name}";
	var loginorganize = "${logininfo.organize}";
</script>

</head>

<body>

	<div data-role="dialog" id="myreimbursedialog" data-overlay="true"
		data-overlay-color="op-dark" data-width="800"></div>

	<div style="width:960;margin:0 auto">
		<div class="cell auto-size padding20 bg-white" id="cell-content">
			<h1 class="text-light">
				我的报销 <span class="mif-visa place-right"></span>
			</h1>

			<hr class="thin bg-grayLighter">
			<button class="button warning"
				onclick="javascript:window.location.href = basePath + 'travel/queryTravelReimberse.do?username='+loginusername;">
				<span class="mif-loop2"></span> 刷新列表
			</button>
			<hr class="thin bg-grayLighter">

			<table class="dataTable border bordered hovered"
				data-auto-width="false">
				<thead>
					<tr>
						<td class="sortable-column sort-asc" style="width: 8%">序号</td>
						<td class="sortable-column" style="width: 10%">姓名</td>
						<td class="sortable-column" style="width: 25%">出差日期</td>
						<td class="sortable-column" style="width:17%">出差地点</td>
						<td class="sortable-column" style="width: 12%">费用合计</td>
						<td class="sortable-column" style="width: 10%">状态</td>
						<td class="sortable-column" style="width: 18%">操作</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="s" varStatus="ss">
						<tr id="${s.id}">
							<td>${ss.count}</td>
							<td>${s.name}</td>
							<td>${s.startdate}<span style="margin-left:5;margin-right:5"
								class="mif-arrow-right"></span>${s.enddate}</td>
							<td>${s.startplace}<span
								style="margin-left:5;margin-right:5" class="mif-arrow-right"></span>${s.endplace}</td>
							<td style="text-align:right">${s.sum}</td>
							<td>${s.state}</td>
							<td><button class="button" onclick="javascript:editreimburse(${s.id});"
									style="border:none;background:none">
									<span data-role="hint" data-hint-background="bg-blue"
										data-hint-color="fg-white" data-hint-mode="2" data-hint="编辑"
										class="mif-pencil fg-blue"></span>
								</button>
								<button onclick="javascript:delreimburse(${s.id});" class="button"
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


	<script type="text/javascript"
		src="<%=basePath%>js/extern/jquery-3.0.0.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/extern/metro.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/extern/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/myjs/util.js"></script>
	<script>
	//时间戳格式化
		Date.prototype.format = function(format) {
			var o = {
				"M+" : this.getMonth() + 1,
				// month
				"d+" : this.getDate(),
				// day
				"h+" : this.getHours(),
				// hour
				"m+" : this.getMinutes(),
				// minute
				"s+" : this.getSeconds(),
				// second
				"q+" : Math.floor((this.getMonth() + 3) / 3),
				// quarter
				"S" : this.getMilliseconds()
			// millisecond
			};
			if (/(y+)/.test(format) || /(Y+)/.test(format)) {
				format = format.replace(RegExp.$1, (this.getFullYear() + "")
						.substr(4 - RegExp.$1.length));
			}
			for ( var k in o) {
				if (new RegExp("(" + k + ")").test(format)) {
					format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
							: ("00" + o[k]).substr(("" + o[k]).length));
				}
			}
			return format;
		};
		$(function() {
			$("tbody tr td:last-child").click(function(e){e.stopPropagation();}); 
			$("tbody tr td:last-child").prev().each(function(){
				if($(this).text()=="已审核")$(this).css("color","#60a917");
				if($(this).text()=="待审核")$(this).css("color","#fa6800");
				if($(this).text()=="已发放")$(this).css("color","#2086bf");
				if($(this).text()!="待审核"){
					$(this).next().children("button").attr("disabled",true);
					$(this).next().children("button").children().removeClass("fg-blue fg-red");
				}
			});
			$("tbody tr").click(function() {
				$.ajax({
					type:'post',
					url:basePath+'travel/queryTravelReimburseById.do',
					data:{'id':this.id},
					dataType:'json',
					success:function(data){
						var createtime = (new Date(parseFloat(data[0].createtime.time))).format("yyyy-MM-dd hh:mm:ss");
						var lastmodifytime = (new Date(parseFloat(data[0].lastmodifytime.time))).format("yyyy-MM-dd hh:mm:ss");
						var dialog = $("#myreimbursedialog").data('dialog');
						var div=$("<div style=\"padding:30 20 20 20\"></div>").appendTo($("#myreimbursedialog"));
						var div1=$("<div style=\"font-size:12px;text-align:center;color:#0072c6;letter-spacing:18px\"><span style=\"border-bottom:3px double #0072c6\">&nbsp;出差报销申请</span></div>").appendTo(div);
						var div2=$("<div style=\"font-size:12px;text-align:center;color:#0072c6;margin-top:15\">【创建时间】"+createtime+" 【最后修改时间】"+lastmodifytime+"</div>").appendTo(div);
						var div3=$("<div class=\"travelreimbersetable\" style=\"margin-top:5\"></div>").appendTo(div);
						var table=$("<table></table>").appendTo(div3);
						var table1=$("<table></table>").appendTo(table);
						$("<tr><td style=\"width:15%\">姓名</td><td style=\"width:25%\">"+data[0].name+"</td><td style=\"width:15%\" rowspan=\"2\">出差事由</td><td style=\"width:45%\" rowspan=\"2\">"+data[0].travelreason+"</td></tr><tr><td>部门</td><td>"+loginorganize+"</td></tr>").appendTo(table1);
						var table2=$("<table></table>").appendTo(table);
						$("<tr><td colspan=\"2\">出差日期</td><td colspan=\"2\">出差地址</td><td colspan=\"4\">车费</td><td>住宿费</td><td colspan=\"3\">出差补助</td><td colspan=\"2\">其他费用</td></tr>").appendTo(table2);
						$("<tr><td>起</td><td>止</td><td>起</td><td>止</td><td>去</td><td>金额</td><td>归</td><td>金额</td><td>金额</td><td>天数</td><td>标准</td><td>金额</td><td>名称</td><td>金额</td></tr>").appendTo(table2);
						$("<tr><td>"+data[0].startdate+"</td><td>"+data[0].enddate+"</td><td>"+data[0].startplace+"</td><td>"+data[0].endplace+"</td><td>"+data[0].leavevehicle+"</td><td>"+data[0].leavevehiclecost+"</td><td>"+data[0].returnvehicle+"</td><td>"+data[0].returnvehiclecost+"</td><td>"+data[0].accommodationcost+"</td><td>"+data[0].subsidydays+"</td><td>"+data[0].subsidyperday+"</td><td>"+data[0].subsidysum+"</td><td>"+data[0].othercontent+"</td><td>"+data[0].othercost+"</td></tr>").appendTo(table2);
						var table4=$("<table></table>").appendTo(table);
						$("<tr><td style=\"width:20%\">住宿备注</td><td>【"+data[0].accommodationtype+"】"+data[0].accommodationremark+"</td></tr>").appendTo(table4);
						var table3=$("<table></table>").appendTo(table);
						$("<tr><td style=\"width:20%\">合计</td><td>"+data[0].sum+"</td></tr>").appendTo(table3);
						var capital=convertCurrency(data[0].sum);
						$("<tr><td>总计人民币(大写)</td><td>"+capital+"</td></tr>").appendTo(table3);
						
						dialog.open();
						
						$("#myreimbursedialog").click(function(){
							div.remove();
							dialog.close();			
						});
					}
				});
			});
			$("table").DataTable({
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
		});
		function delreimburse(id){
			if(confirm("即将删除此条报销信息，您确认吗？"))
			window.location.href=basePath+"travel/delTravelReimburseById.do?id="+id+"&username="+loginusername;
		}
		function pushMessage(mes) {
			$.Notify({
			caption : '警告',
			content : mes,
			type : 'warning'
		})
		}
		function editreimburse(id){
			window.location.href=basePath+"travel/editTravelReimburseById.do?id="+id;
		}
	</script>
</body>
</html>

