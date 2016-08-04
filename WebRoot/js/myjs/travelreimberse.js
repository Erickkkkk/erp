function getday() {
	var arrDate, objDate1, objDate2, intDays;

	objDate1 = new Date();
	objDate2 = new Date();

	arrDate = $("#startdate").val().split(".");
	objDate1.setFullYear(arrDate[0], arrDate[1], arrDate[2]);

	arrDate = $("#enddate").val().split(".");
	objDate2.setFullYear(arrDate[0], arrDate[1], arrDate[2]);

	return intDays = parseInt(Math.abs(objDate1 - objDate2) / 1000 / 60 / 60
			/ 24);

	// $("#天数").val(intDays + 1);
}

function pushMessage(mes) {
	$.Notify({
		caption : '警告',
		content : mes,
		type : 'warning'
	});
}
