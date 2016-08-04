function adduserbtn() {
	window.location.href = basePath + "adduser.jsp";
}

function edituserbtn(username) {
	window.location.href = basePath + "user/queryByUsername.do?username="
			+ username;
}

function pushMessage(t) {
	var mes = 'Info|Implement independently';
	$.Notify({
		caption : mes.split("|")[0],
		content : mes.split("|")[1],
		type : t
	});
}

function refreshuserlist() {

	window.location.href = basePath + "user/queryUser.do";
}

function delUser(username) {
	if (confirm("即将删除此用户所有信息，确认删除吗？ ")) {
		window.location.href=basePath+"user/delUser.do?username="+username;
	}
}