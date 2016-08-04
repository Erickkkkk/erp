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
	var loginorganize="${logininfo.organize}";
</script>

</head>

<body>
	<div data-role="dialog" id="travelreimbersedialog" data-overlay="true"
		data-overlay-color="op-dark" data-width="800"></div>
	<div style="width:960px;margin:auto">
	<div class="example">
	<div style="width:870px;margin:auto">
			<div class="wizard2" data-role="wizard2"
				data-button-labels='{"prev": "<span class=\"mif-arrow-left\"></span>", "next": "<span class=\"mif-arrow-right\"></span>", "finish": "<span class=\"mif-checkmark\"></span>"}'>
				<div class="step">
					<div class="step-content">
						<p class="text lowercase">出差报销申请</p>
						<h1 class="no-margin-top">出差信息</h1>
						<div class="text-small padding20 bg-grayLighter"
							style="height:420">
							<div class="clear-float">
								<div class="place-left">
									<div>
										<span class="mif-pencil"></span>
									</div>
									<table>
										<tr>
											<td><span class="mif-meter fg-green"
												style="margin-bottom:5"></span> 出差事由:&nbsp;</td>
											<td colspan="3"><div
													class="input-control text full-size" data-role="input">
													<input type="text" id="travelreason">
													<button class="button helper-button clear">
														<span class="mif-cross"></span>
													</button>
												</div>
											</td>
										</tr>
										<tr style="height:100">
											<td><span class="mif-alarm fg-green"
												style="margin-bottom:5"></span> 起止日期:&nbsp;</td>
											<td><div class="input-control text full-size"
													data-role="datepicker" data-week-start="1"
													data-locale="zhCN">
													<input type="text" id="startdate">
													<button class="button">
														<span class="mif-calendar"></span>
													</button>
												</div>
											</td>
											<td><span class="mif-arrow-right"></span>
											</td>
											<td><div class="input-control text full-size"
													data-role="datepicker" data-week-start="1"
													data-locale="zhCN">
													<input type="text" id="enddate">
													<button class="button">
														<span class="mif-calendar"></span>
													</button>
												</div>
											</td>

										</tr>
										<tr style="height:50">
											<td><span class="mif-drive-eta fg-green"
												style="margin-bottom:5"></span> 起止地点:&nbsp;</td>
											<td><div class="input-control text full-size"
													data-role="input">
													<input type="text" id="startplace">
													<button class="button helper-button clear">
														<span class="mif-cross"></span>
													</button>
												</div>
											</td>
											<td><span class="mif-arrow-right"></span>
											</td>
											<td><div class="input-control text full-size"
													data-role="input">
													<input type="text" id="endplace">
													<button class="button helper-button clear">
														<span class="mif-cross"></span>
													</button>
												</div>
											</td>
										</tr>
									</table>

								</div>
							</div>
						</div>

					</div>
				</div>


				<div class="step">
					<div class="step-content">
						<p class="text lowercase">出差报销申请</p>
						<h1 class="no-margin-top">车票信息</h1>
						<div class="text padding20 bg-grayLighter" style="height:420">
							<div>
								<span class="mif-pencil"></span>
							</div>
							<br />
							<div>
								<table>
									<tr style="height:50">
										<td><label style="color:green"><span
												class="mif-arrow-right mif-2x fg-green"></span> 去时</label>
										</td>
										<td><label style="color:red"><span
												class="mif-arrow-left mif-2x fg-red"></span> 归时</label>
										</td>
									</tr>
									<tr>
										<td><label class="input-control radio block"> <input
												type="radio" name="r1" value="火车"> <span
												class="check"></span> <span class="caption"><span
													class="mif-cart fg-green" style="margin-bottom:5"></span>
													火车</span> </label>
										</td>
										<td><label class="input-control radio block"> <input
												type="radio" name="r2" value="火车"> <span
												class="check"></span> <span class="caption"><span
													class="mif-cart fg-green" style="margin-bottom:5"></span>
													火车</span> </label>
										</td>
									</tr>
									<tr>
										<td><label class="input-control radio block"> <input
												type="radio" value="汽车" name="r1"> <span
												class="check"></span> <span class="caption"><span
													class="mif-truck fg-green" style="margin-bottom:5"></span>
													汽车</span> </label>
										</td>
										<td><label class="input-control radio block"> <input
												type="radio" value="汽车" name="r2"> <span
												class="check"></span> <span class="caption"><span
													class="mif-truck fg-green" style="margin-bottom:5"></span>
													汽车</span> </label>
										</td>
									</tr>
									<tr>
										<td><label class="input-control radio block"> <input
												type="radio" value="部门公车" name="r1"> <span
												class="check"></span> <span class="caption"><span
													class="mif-drive-eta fg-green" style="margin-bottom:5"></span>
													部门公车</span> </label>
										</td>
										<td><label class="input-control radio block"> <input
												type="radio" value="部门公车" name="r2"> <span
												class="check"></span> <span class="caption"><span
													class="mif-drive-eta fg-green" style="margin-bottom:5"></span>
													部门公车</span> </label>
										</td>
									</tr>
									<tr>
										<td><label class="input-control radio block"> <input
												type="radio" value="其他" name="r1"> <span
												class="check"></span> <span class="caption"><span
													class="mif-plus fg-green" style="margin-bottom:5"></span>
													其他</span> </label>
										</td>
										<td><label class="input-control radio block"> <input
												type="radio" value="其他" name="r2"> <span
												class="check"></span> <span class="caption"><span
													class="mif-plus fg-green" style="margin-bottom:5"></span>
													其他</span> </label>
										</td>
									</tr>
									<tr>
										<td><span style="color:red">￥</span>
											<div class="input-control modern text">
												<input type="text" id="leavevehiclecost"> <span
													class="label">去时车票费用</span> <span class="informer"></span>
												<span class="placeholder">去时车票费用</span>
											</div>
										</td>
										<td><span style="color:red">￥</span>
											<div class="input-control modern text">
												<input type="text" id="returnvehiclecost"> <span
													class="label">归时车票费用</span> <span class="informer"></span>
												<span class="placeholder">归时车票费用</span>
											</div>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>


				<div class="step">
					<div class="step-content">
						<p class="text lowercase">出差报销申请</p>
						<h1 class="no-margin-top">住宿费用</h1>
						<div class="text padding20 bg-grayLighter" style="height:420">
							<div>
								<span class="mif-pencil"></span>
							</div>
							<br /> <br />
							<div>
								<table>
									<tr>
									<td><label class="input-control radio block"> <input
												type="radio" value="无住宿费用" name="r3"> <span
												class="check"></span> <span class="caption"><span
													class="mif-blocked fg-green" style="margin-bottom:5"></span>
													无住宿费用</span> </label>
										<td><label class="input-control radio block"> <input
												type="radio" value="他人统一支付" name="r3"> <span
												class="check"></span> <span class="caption"><span
													class="mif-user-minus fg-green" style="margin-bottom:5"></span>
													他人统一支付</span> </label>
										</td>
										<td><label class="input-control radio block"> <input
												type="radio" value="仅含个人费用" name="r3"> <span
												class="check"></span> <span class="caption"><span
													class="mif-user fg-green" style="margin-bottom:5"></span>
													仅含个人费用</span> </label>
										</td>
										<td><label class="input-control radio block"> <input
												type="radio" value="包含他人费用" name="r3"> <span
												class="check"></span> <span class="caption"><span
													class="mif-user-plus fg-green" style="margin-bottom:5"></span>
													包含他人费用</span> </label>
										</td>
									</tr>
								</table>
							</div>
							<div id="personalaccommodation" style="display:none">
								<span style="color:red">￥</span>
								<div class="input-control modern text">
									<input type="text" id="personalaccommodationcost"> <span
										class="label">个人费用总计</span> <span class="informer"></span> <span
										class="placeholder">个人费用总计</span>
								</div>
							</div>

							<div id="allaccommodation" style="display:none">
								<span style="color:red">￥</span>
								<div class="input-control modern text">
									<input type="text" id="allaccommodationcost"> <span
										class="label">费用总计</span> <span class="informer"></span> <span
										class="placeholder">费用总计</span>
								</div>
								<div>
									<div class="input-control textarea">
										<textarea placeholder="请写明包含哪些人及对应日期，如：李明，20150906-20150908； "
											id="allaccommodationremark"
											style="width:12.25rem;height:60;font-family:'宋体';margin-left:23"></textarea>
									</div>
								</div>
							</div>
							<div id="otheraccommodation" style="display:none">
							<br><br>
								<div class="input-control textarea">
										<textarea placeholder="请写明由谁统一支付及对应日期，如：李明，20150906-20150908； "
											id="otheraccommodationremark"
											style="width:12.25rem;height:60;font-family:'宋体';margin-left:23"></textarea>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="step">
					<div class="step-content">
						<p class="text lowercase">出差报销申请</p>
						<h1 class="no-margin-top">其他费用</h1>
						<div class="text padding20 bg-grayLighter" style="height:420">
							<div>
								<span class="mif-pencil"></span>
							</div>
							<br /> <br />
							<div>
								<table>
									<tr>
										<td><span class="mif-home fg-green"
											style="margin-bottom:5"></span> 出差补助:&nbsp;</td>
										<td><div class="input-control select" style="width:120">
												<select id="subsidytype"><option value="请选择">请选择</option>
													<option value="一般地区">一般地区</option>
													<option value="特殊地区">特殊地区</option>
												</select>
											</div></td>
										<td><div class="input-control text" style="width:80">
												<input id="subsidyperday" type="text" disabled>
											</div>元/天</td>
										<td>，共出差
											<div class="input-control text" style="width:80">
												<input id="subsidydays" type="text" disabled>
											</div>天</td>
										<td>，合计
											<div class="input-control text" style="width:120">
												<input id="subsidysum" type="text" disabled>
											</div>元</td>
									</tr>
									<tr>
										<td colspan="4">(<span style="color:red">*</span>注:特殊地区包括广东省、海南省、上海市、北京市、厦门市)</td>
									</tr>
								</table>
							</div>
							<br />
							<br />
							<br />
							<br />
							<div>
								<table>
									<tr>
										<td><span class="mif-plus fg-green"
											style="margin-bottom:5"></span> 其他费用(非必填项):&nbsp;</td>
										<td><div class="input-control text" data-role="input">
												<input id="othercontent"  placeholder="填写费用名称" type="text">
												<button class="button helper-button clear">
													<span class="mif-cross"></span>
												</button>
											</div>
										</td>
										<td><span style="color:red">￥</span>
										<div class="input-control modern text">
												<input type="text" id="othercost"> <span
													class="label">金额</span> <span class="informer"></span> <span
													class="placeholder">金额</span>
											</div>
										</td>
									</tr>
								</table>
							</div>


						</div>

					</div>
				</div>
			</div>
		</div>
		</div>
		</div>


	<script language="javascript" type="text/javascript"
		src="<%=basePath%>js/extern/jquery-3.0.0.min.js"></script>
	<script language="javascript" type="text/javascript"
		src="<%=basePath%>js/extern/jquery.dataTables.min.js"></script>
	<script language="javascript" type="text/javascript"
		src="<%=basePath%>js/extern/metro.js"></script>
	<script language="javascript" type="text/javascript"
		src="<%=basePath%>js/myjs/util.js"></script>
	<script language="javascript" type="text/javascript"
		src="<%=basePath%>js/extern/cityselector.js"></script>
	<script language="javascript" type="text/javascript"
		src="<%=basePath%>js/myjs/travelreimberse.js"></script>
	<script>
		$(function() {
			$(":radio[name='r1']").click(function(){
			if($(":radio[name='r1']:checked").val()=="部门公车"){
				$("#leavevehiclecost").val("0.00");}
			else{$("#leavevehiclecost").val("");}			
			});
			$(":radio[name='r2']").click(function(){
			if($(":radio[name='r2']:checked").val()=="部门公车"){
				$("#returnvehiclecost").val("0.00");}
			else{$("#returnvehiclecost").val("");}			
			});
			$(":radio[value='无住宿费用']").click(function(){
				$("#personalaccommodation").hide();
				$("#otheraccommodation").hide();
				$("#allaccommodation").hide();
				$("#personalaccommodationcost").val("");
				$("#allaccommodationcost").val("");
				$("#allaccommodationremark").val("");
				$("#otheraccommodationremark").val("");
			});
			$(":radio[value='仅含个人费用']").click(function() {
				$("#personalaccommodation").show();
				$("#otheraccommodation").hide();
				$("#allaccommodation").hide();
				$("#allaccommodationcost").val("");
				$("#allaccommodationremark").val("");
				$("#otheraccommodationremark").val("");
			});
			$(":radio[value='包含他人费用']").click(function() {
				$("#personalaccommodation").hide();
				$("#otheraccommodation").hide();
				$("#allaccommodation").show();
				$("#personalaccommodationcost").val("");
				$("#otheraccommodationremark").val("");
			});
			$(":radio[value='他人统一支付']").click(function() {
				$("#personalaccommodation").hide();
				$("#allaccommodation").hide();
				$("#otheraccommodation").show();
				$("#personalaccommodationcost").val("");
				$("#allaccommodationcost").val("");
				$("#allaccommodationremark").val("");
			});
			$("#leavevehiclecost").bind('input propertychange', function() {
				$(this).moneymode();
			});
			$("#returnvehiclecost").bind('input propertychange', function() {
				$(this).moneymode();
			});
			$("#personalaccommodationcost").bind('input propertychange',
					function() {
						$(this).moneymode();
					});
			$("#allaccommodationcost").bind('input propertychange', function() {
				$(this).moneymode();
			});
			$("#subsidytype").bind(
					'click',
					function() {
						if ($(this).val() == "请选择") {
							$("#subsidyperday").val("");
							$("#subsidydays").val("");
							$("#subsidysum").val("")
						}
						if ($(this).val() == "一般地区") {
							objDate1 = new Date();
							objDate2 = new Date();
							arrDate = $("#startdate").val().split(".");
							objDate1.setFullYear(arrDate[0], arrDate[1],
									arrDate[2]);
							arrDate = $("#enddate").val().split(".");
							objDate2.setFullYear(arrDate[0], arrDate[1],
									arrDate[2]);
							$("#subsidyperday").val("60.00");
							if ($("#startdate").val() == ""
									|| $("#enddate").val() == "") {
								pushMessage("出差日期未选择！ ");
								$("#subsidydays").val("");
							} else if ($("#startdate").val() != ""
									&& $("#enddate").val() != ""
									&& objDate1 > objDate2) {
								pushMessage("结束日期小于开始日期！ ");
								$("#subsidydays").val("")
							} else {
								$("#subsidydays").val(getday() + 1);
								$("#subsidysum").val(((getday() + 1) * 60.00).toFixed(2))
							}
						}
						if ($(this).val() == "特殊地区") {
							objDate1 = new Date();
							objDate2 = new Date();
							arrDate = $("#startdate").val().split(".");
							objDate1.setFullYear(arrDate[0], arrDate[1],
									arrDate[2]);
							arrDate = $("#enddate").val().split(".");
							objDate2.setFullYear(arrDate[0], arrDate[1],
									arrDate[2]);
							$("#subsidyperday").val("100.00");
							if ($("#startdate").val() == ""
									|| $("#enddate").val() == "") {
								pushMessage("出差日期未选择！ ");
								$("#subsidydays").val("");
							} else if ($("#startdate").val() != ""
									&& $("#enddate").val() != ""
									&& objDate1 > objDate2) {
								pushMessage("结束日期小于开始日期！ ");
								$("#subsidydays").val("")
							} else {
								$("#subsidydays").val(getday() + 1);
								$("#subsidysum").val(((getday() + 1) * 100.00).toFixed(2))
							}
						}
					});
			$("#othercost").bind('input propertychange', function() {
				$(this).moneymode();
			});
			$(".wiz-btn-finish")
					.click(
							function() {
								var travelreason = $("#travelreason").val();
								if (travelreason == "") {
									pushMessage("请填写出差事由！ ");
									return;
								}

								var startdate = $("#startdate").val();
								if (startdate == "") {
									pushMessage("请填写开始日期！ ");
									return;
								}

								var enddate = $("#enddate").val();
								if (enddate == "") {
									pushMessage("请填写结束日期！ ");
									return;
								}

								var startplace = $("#startplace").val();
								if (startplace == "") {
									pushMessage("请填写开始地点！ ");
									return;
								}

								var endplace = $("#endplace").val();
								if (endplace == "") {
									pushMessage("请填写结束地点！ ");
									return;
								}

								if ($("input[name='r1']:checked").length == "0") {
									pushMessage("请选择去时交通类型！ ");
									return;
								}
								var leavevehicle = $("input[name='r1']:checked")
										.val();

								var leavevehiclecost = $("#leavevehiclecost")
										.val();
								if (leavevehiclecost == "") {
									pushMessage("请填写去时车票费用！ ");
									return;
								}

								if ($("input[name='r2']:checked").length == "0") {
									pushMessage("请选择归时交通类型！ ");
									return;
								}
								var returnvehicle = $(
										"input[name='r2']:checked").val();

								var returnvehiclecost = $("#returnvehiclecost")
										.val();
								if (returnvehiclecost == "") {
									pushMessage("请填写归时车票费用！ ");
									return;
								}

								if ($("input[name='r3']:checked").length == "0") {
									pushMessage("请选择住宿费用支付类型！ ");
									return;
								}
								var accommodationtype = $(
										"input[name='r3']:checked").val();

								var personalaccommodationcost = $(
										"#personalaccommodationcost").val();
								if (accommodationtype == "仅含个人费用"
										&& personalaccommodationcost == "") {
									pushMessage("请填写个人住宿费用！ ");
									return;
								}
								
								var otheraccommodationremark=$("#otheraccommodationremark").val();
								if (accommodationtype=="他人统一支付"&&otheraccommodationremark==""){
									pushMessage("请填写由他人统一支付的备注信息！ ");
									return;
								}

								var allaccommodationcost = $(
										"#allaccommodationcost").val();
								var allaccommodationremark = $(
										"#allaccommodationremark").val();
								if (accommodationtype == "包含他人费用"
										&& (allaccommodationcost == "" || allaccommodationremark == "")) {
									pushMessage("请填写含他人的住宿费用及备注！ ");
									return;
								}
								var accommodationcost = personalaccommodationcost
										+ allaccommodationcost;
										
								accommodationcost=accommodationcost==""?"0.00":accommodationcost;
								
								var accommodationremark=allaccommodationremark+otheraccommodationremark;
								
								var subsidytype =$("#subsidytype").val();
								var subsidyperday=$("#subsidyperday").val();
								var subsidydays=$("#subsidydays").val();
								var subsidysum=$("#subsidysum").val();
								
								if(subsidytype=="请选择"||subsidyperday==""||subsidydays==""||subsidysum==""){
									pushMessage("请填写出差补助！ ");
									return;
								}
								
								var othercontent=$("#othercontent").val();
								var othercost=$("#othercost").val();
								if(othercontent!=""&&othercost==""){
									pushMessage("其他费用填写不完整！ ");
									return;
								}
								
								othercost=(othercost=="")?"0.00":othercost;
								
								var sum=(parseFloat(leavevehiclecost)+parseFloat(returnvehiclecost)+(accommodationcost==""?parseFloat("0.00"):parseFloat(accommodationcost))+parseFloat(subsidysum)+(othercost==""?parseFloat("0.00"):parseFloat(othercost))).toFixed(2);
								
								var dialog=$("#travelreimbersedialog").data('dialog');
								var div=$("<div style=\"padding:30 20 10 20\"></div>").appendTo($("#travelreimbersedialog"));
								var div1=$("<div style=\"font-size:12px;text-align:center;color:#0072c6;letter-spacing:18px\"><span style=\"border-bottom:3px double #0072c6\">&nbsp;出差报销申请</span></div>").appendTo(div);
								var date=new Date();
								var mydate=date.getFullYear()+"年"+(date.getMonth()+1)+"月"+date.getDate()+"日";
								var div2=$("<div id=\"mydate\" style=\"font-size:12px;text-align:center;color:#0072c6;margin-top:15\"></div>").appendTo(div);
								div2.html(mydate);
								var div3=$("<div class=\"travelreimbersetable\" style=\"margin-top:5\"></div>").appendTo(div);
								var table=$("<table></table>").appendTo(div3);
								var table1=$("<table></table>").appendTo(table);
								$("<tr><td style=\"width:15%\">姓名</td><td style=\"width:25%\">"+loginname+"</td><td style=\"width:15%\" rowspan=\"2\">出差事由</td><td style=\"width:45%\" rowspan=\"2\">"+travelreason+"</td></tr><tr><td>部门</td><td>"+loginorganize+"</td></tr>").appendTo(table1);
								var table2=$("<table></table>").appendTo(table);
								$("<tr><td colspan=\"2\">出差日期</td><td colspan=\"2\">出差地址</td><td colspan=\"4\">车费</td><td>住宿费</td><td colspan=\"3\">出差补助</td><td colspan=\"2\">其他费用</td></tr>").appendTo(table2);
								$("<tr><td>起</td><td>止</td><td>起</td><td>止</td><td>去</td><td>金额</td><td>归</td><td>金额</td><td>金额</td><td>天数</td><td>标准</td><td>金额</td><td>名称</td><td>金额</td></tr>").appendTo(table2);
								$("<tr><td>"+startdate+"</td><td>"+enddate+"</td><td>"+startplace+"</td><td>"+endplace+"</td><td>"+leavevehicle+"</td><td>"+leavevehiclecost+"</td><td>"+returnvehicle+"</td><td>"+returnvehiclecost+"</td><td>"+accommodationcost+"</td><td>"+subsidydays+"</td><td>"+subsidyperday+"</td><td>"+subsidysum+"</td><td>"+othercontent+"</td><td>"+othercost+"</td></tr>").appendTo(table2);
								var table4=$("<table></table>").appendTo(table);
								$("<tr><td style=\"width:20%\">住宿备注</td><td>【"+accommodationtype+"】"+accommodationremark+"</td></tr>").appendTo(table4);
								var table3=$("<table></table>").appendTo(table);
								$("<tr><td style=\"width:20%\">合计</td><td>"+sum+"</td></tr>").appendTo(table3);
								var capital=convertCurrency(sum);
								$("<tr><td>总计人民币(大写)</td><td>"+capital+"</td></tr>").appendTo(table3);
								var div4=$("<div style=\"text-align:right;margin-top:10px\"><button type=\"button\" id=\"travelreimbersesubmit\" class=\"button success\"><span class=\"mif-checkmark\"></span>提交</button><button style=\"margin-left:10\" type=\"button\" id=\"travelreimbersecancel\" class=\"button alert\"><span class=\"mif-cross\"></span>取消</button></div>").appendTo(div);
								dialog.open();
								
								$("#travelreimbersecancel").click(function(){
									div.remove();
									dialog.close();
								});
								$("#travelreimbersesubmit").click(function(){
									$.ajax({
										type:'post',
										url:basePath+'travel/addTravelReimberse.do',
										data:{
											'username':loginusername,
											'name':loginname,
											'lastmodifyusername':loginusername,
											'travelreason':travelreason,
											'startdate':startdate,
											'enddate':enddate,
											'startplace':startplace,
											'endplace':endplace,
											'leavevehicle':leavevehicle,
											'leavevehiclecost':leavevehiclecost,
											'returnvehicle':returnvehicle,
											'returnvehiclecost':returnvehiclecost,
											'accommodationtype':accommodationtype,
											'accommodationcost':accommodationcost,
											'accommodationremark':accommodationremark,
											'subsidytype':subsidytype,
											'subsidyperday':subsidyperday,
											'subsidydays':subsidydays,
											'subsidysum':subsidysum,
											'othercontent':othercontent,
											'othercost':othercost,
											'sum':sum
										},
										dataType:'text',
										success:function(data){
											if(data==='true'){
												div.remove();
												dialog.close();
												window.location.href=basePath+'travel/queryTravelReimberse.do?username='+loginusername;
											}else{
												alert("新增失败！ ");
												return;
											}
										}
									
									});
								
								});

							});

		});
	</script>
</body>
</html>
