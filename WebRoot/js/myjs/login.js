/** *******************登录******************* */

function login() {
	var username = $.trim($("#user_login").val());
	var password = $("#user_password").val();
	if (!checkLoginInfo(username, password))
		return false;
	$.ajax({
		type : 'post',
		url :  basePath+'user/loginCheck.do',
		data : {
			'username' : username,
			'password' : password
		},
		dataType : 'text',
		success : function(data) {
			if (data === 'true') {
				window.location.href = basePath + "main.jsp";
			} else {
				$.Notify({
					keepOpen : false,
					type : 'alert',
					caption : '警告',
					content : "登录名或密码错误！ "
				});
				return;
			}
		}
	})
}

function checkLoginInfo(userName, password) {

	if (!userName || userName == "") {
		$.Notify({
			keepOpen : false,
			type : 'warning',
			caption : '警告',
			content : "登录名为空！ "
		});
		return false;
	}

	if (!password || password == "") {
		$.Notify({
			keepOpen : false,
			type : 'warning',
			caption : '警告',
			content : "密码为空！ "
		});
		return false;
	}
	return true;
}

$(function() {
	var form = $(".login-form");
	form.css({
		opacity : 1,
		"-webkit-transform" : "scale(1)",
		"transform" : "scale(1)",
		"-webkit-transition" : ".5s",
		"transition" : ".5s"
	});
	
	$("#user_login").focus();
	
	$("body").keydown(function(){
		if(event.keyCode=="13")$("#login_btn").click()
	});

	$("#login_btn").click(login);

})
