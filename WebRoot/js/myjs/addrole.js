function reset() {
	$("input").val("");
	$("textarea").val("");
}

function goback() {
	window.history.go(-1);
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

function addrolesubmit() {
	var rolename = $.trim($("#rolename").val());
	if (rolename == "") {
		pushMessage("请输入角色名！ ");
		$("#rolename").focus();
		return;
	}
	
	var roledescription = $("#roledescription").val();
	if (roledescription == "") {
		pushMessage("请输入描述！ ");
		$("#roledescription").focus();
		return;
	}
	
	$.ajax({
		type : 'post',
		url : basePath + 'role/checkExist.do',
		data : {
			'rolename' : rolename
		},
		dataType : 'text',
		success : function(data) {
			if (data === "true") {
				pushMessage("该角色名已经存在！ ");
				$("#rolename").focus();
				return;
			} else {
				$.ajax({
					type : 'post',
					url : basePath + 'role/addRole.do',
					data : {
						'rolename' : rolename,
						'roledescription' : roledescription,
						'state' : $("#state").val()
					},
					dataType : 'text',
					success : function(data) {
						if (data === "true") {
							pushSuccessMessage("您已成功添加一个角色！ ");
							reset();
						}else{
							pushMessage("添加失败！ ");
							return;
						}
					}
				})
			}
		}
	});

	

	
}

