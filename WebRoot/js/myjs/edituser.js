function editusersubmit() {

	var username = $("#username").val();

	var password = $.trim($("#password").val());
	var passwordAgain = $.trim($("#passwordconfirm").val());
	if (password == "") {
		pushMessage("请输入密码！");
		$("#password").focus();
		return;
	}
	if (password !== passwordAgain) {
		pushMessage("两次密码不一致！");
		$("#passwordconfirm").focus();
		return;
	}

	var chinesename = $.trim($("#chinesename").val());
	if (!isChinese(chinesename)) {
		pushMessage("请输入中文姓名！ ");
		$("#chinesename").focus();
		return;
	}

	var email = $.trim($("#email").val());
	if (!isEmail(email)) {
		pushMessage("请输入正确的邮箱名称！ ");
		$("#email").focus();
		return;
	}

	var phone = $.trim($("#phone").val());
	if (!isPhone(phone)) {
		pushMessage("请输入正确的手机号码！ ");
		$("#phone").focus();
		return;
	}
	
	$.ajax({
		type : 'post',
		url : basePath+'user/updateUser.do',
		data : {
			'username' : username,
			'password' : password,
			'name' : chinesename,
			'email' : email,
			'sex' : $("#sex").val(),
			'organize' : $("#organize").val(),
			'duty' : $("#duty").val(),
			'phone' : phone,
			'roleid' : $("#role").val(),
			'state' : $("#state").val()
		},
		dataType : 'text',
		success : function(data) {
			if (data === "true") {
				pushSuccessMessage("您已修改成功！ ");
			}
			else{
				pushMessage("修改失败 ！");
				return;
			}
		}
	})
}

function pushMessage(mes) {
	$.Notify({
		caption : '警告',
		content : mes,
		type : 'warning'
	});
}

function pushSuccessMessage(mes) {
	$.Notify({
		caption : '成功',
		content : mes,
		type : 'success'
	});
}

function reset() {
	var username = $("#username").val();
	$("input").val("");
	$("#username").val(username);
}

function goback() {
	window.history.go(-1);
}