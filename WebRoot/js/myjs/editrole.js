function reset() {
	var rolename=$("#rolename").val();
	$("input").val("");
	$("textarea").val("");
	$("#rolename").val(rolename);
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

function editrolesubmit(){
	var rolename=$("#rolename").val();
	var roledescription = $("#roledescription").val();
	if (roledescription == "") {
		pushMessage("请输入描述！ ");
		$("#roledescription").focus();
		return;
	}
	$.ajax({
		type : 'post',
		url : basePath + 'role/updateRole.do',
		data : {
			'rolename' : rolename,
			'roledescription' : roledescription,
			'state' : $("#state").val()
		},
		dataType : 'text',
		success : function(data) {
			if (data === "true") {
				pushSuccessMessage("您已修改成功！ ");
			}else{
				pushMessage("修改失败！ ");
				return;
			}
		}
	})
}