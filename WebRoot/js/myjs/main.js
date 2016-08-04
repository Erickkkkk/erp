

$(function() {
	$('.sidebar').on('click', 'li', function() {
		if (!$(this).hasClass('active')) {
			$('.sidebar li').removeClass('active');
			$(this).addClass('active');
		}
	})
})

function usercontroll(){
	self.frames['contents'].location.href="user/queryUser.do";
}

function rolecontroll(){
	self.frames['contents'].location.href="role/queryRole.do";
}

function travelreimbersecontroll(){
	self.frames['contents'].location.href="travelreimberse.jsp";
}

function myreimbersecontroll(){
	self.frames['contents'].location.href="travel/queryTravelReimberse.do?username="+loginusername;
}

function reimbursecheckcontroll(){
	self.frames['contents'].location.href="travel/queryAllTravelReimburse.do";
}

function aboutcontroll(){
	self.frames['contents'].location.href="about.jsp";
}

function contactcontroll(){
	self.frames['contents'].location.href="contact.jsp"
}

function helpcontroll(){
	self.frames['contents'].location.href="help.jsp";
}
function passwordmodify(){
	
	var dialog=$("#passwordmodify").data('dialog');
	var div=$("<div style=\"padding:10 20 10 20\"></div>").appendTo($("#passwordmodify"));
	var h=$("<h2 class=\"text-light\">修改密码</h2><hr class=\"thin\" /><br />").appendTo(div);
	$("<div class=\"input-control password full-size\" data-role=\"input\"><label for=\"passwordorigin\">原密码：</label> <input type=\"password\" id=\"passwordorigin\"><button class=\"button helper-button reveal\"><span class=\"mif-looks\"></span></button></div><br /> <br />").appendTo(div);
	$("<div class=\"input-control password full-size\" data-role=\"input\"><label for=\"passwordchange\">新密码：</label> <input type=\"password\" id=\"passwordchange\"><button class=\"button helper-button reveal\"><span class=\"mif-looks\"></span></button></div><br /> <br />").appendTo(div);
	$("<div class=\"input-control password full-size\" data-role=\"input\"><label for=\"passwordchangeconfirm\">确认密码：</label> <input type=\"password\" id=\"passwordchangeconfirm\"><button class=\"button helper-button reveal\"><span class=\"mif-looks\"></span></button></div><br />").appendTo(div);
	$("<div style=\"text-align:right\"><span id=\"msg\" style=\"color:red\"></span><button style=\"margin-left:10\" type=\"button\" id=\"passwordmodifysubmit\" class=\"button success\"><span class=\"mif-checkmark\"></span>提交</button><button style=\"margin-left:10\" type=\"button\" id=\"passwordmodifycancel\" class=\"button alert\"><span class=\"mif-cross\"></span>取消</button></div>").appendTo(div);
	dialog.open();
	$("#passwordorigin").focus();
	$("#passwordmodifycancel").click(function(){
		div.remove();
		dialog.close();
	});
	$("#passwordmodifysubmit").click(function(){
		var passwordorigin=$("#passwordorigin").val();
		if(passwordorigin==""){
			$("#msg").html("请输入原密码！ ");
			$("#passwordorigin").focus();
			return;
		}
		var passwordchange=$("#passwordchange").val();
		if(passwordchange==""){
			$("#msg").html("请输入新密码！ ");
			$("#passwordchange").focus();
			return;
		}
		var passwordchangeconfirm=$("#passwordchangeconfirm").val();
		if(passwordchangeconfirm==""){
			$("#msg").html("请输入确认密码！ ");
			$("#passwordchangeconfirm").focus();
			return;
		}
		if(passwordchange!=passwordchangeconfirm){
			$("#msg").html("两次密码输入不一致！ ");
			$("#passwordchangeconfirm").focus();
			return;
		}
		if(passwordorigin!=loginpassword){
			$("#msg").html("原密码不正确！ ");
			$("#passwordorigin").focus();
			return;
		}
		$("#msg").html("");
		$.ajax({
			type:'post',
			url:basePath+'user/changePassword.do',
			data:{'loginusername':loginusername,
				'passwordchange':passwordchange},
			dataType:'text',
			success:function(data){
				if(data==='true'){
					div.remove();
					dialog.close();
					window.location.reload();
				}else{
					$("#msg").html("修改失败！ ");
					return;
				}
			}
		});
		
	})
	
}
function personalinfomodify(){
	var dialog=$("#passwordmodify").data('dialog');
	var div=$("<div style=\"padding:10 20 10 20\"></div>").appendTo($("#passwordmodify"));
	var h=$("<h2 class=\"text-light\">修改个人资料</h2><hr class=\"thin\" /><br />").appendTo(div);
	$("<div class=\"input-control text full-size\" data-role=\"input\"><label for=\"emailchange\">邮箱：</label> <input type=\"text\" id=\"emailchange\"><button class=\"button helper-button clear\"><span class=\"mif-cross\"></span></button></div><br /> <br />").appendTo(div);
	$("<div class=\"input-control text full-size\" data-role=\"input\"><label for=\"phonechange\">手机：</label> <input type=\"text\" id=\"phonechange\"><button class=\"button helper-button clear\"><span class=\"mif-cross\"></span></button></div><br /> <br />").appendTo(div);
	$("<div style=\"text-align:right\"><span id=\"msg\" style=\"color:red\"></span><button style=\"margin-left:10\" type=\"button\" id=\"personalinfomodifysubmit\" class=\"button success\"><span class=\"mif-checkmark\"></span>提交</button><button style=\"margin-left:10\" type=\"button\" id=\"personalinfomodifycancel\" class=\"button alert\"><span class=\"mif-cross\"></span>取消</button></div>").appendTo(div);
	$("#emailchange").val(loginemail);
	$("#phonechange").val(loginphone);
	dialog.open();
	$("#personalinfomodifycancel").click(function(){
		div.remove();
		dialog.close();
	});
	$("#personalinfomodifysubmit").click(function(){
		var emailchange=$("#emailchange").val();
		if (!isEmail(emailchange)) {
			$("#msg").html("请输入正确的邮箱名称！ ");
			$("#emailchange").focus();
			return;
		}
		var phonechange=$("#phonechange").val();
		if (!isPhone(phonechange)) {
			$("#msg").html("请输入正确的手机号码！ ");
			$("#phonechange").focus();
			return;
		}
		$("#msg").html("");
		$.ajax({
			type:'post',
			url:basePath+'user/changePersonalInfo.do',
			data:{'loginusername':loginusername,
				'emailchange':emailchange,
				'phonechange':phonechange},
			dataType:'text',
			success:function(data){
				if(data==='true'){
					div.remove();
					dialog.close();
					window.location.reload();
				}else{
					$("#msg").html("修改失败！ ");
					return;
				}
			}
		});
		
	});
}