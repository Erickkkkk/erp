function refreshrolelist() {
	window.location.href = basePath + "role/queryRole.do";
}

function addrolebtn() {

	window.location.href = basePath + "addrole.jsp";
}

function showDialog(id, roleid) {
	var dialog = $(id).data('dialog');

	var div = $("<div style=\"padding:10 10 20 40\"></div>").appendTo($(id));
	var h5 = $("<h2>权限列表</h2>").appendTo(div);
	var div1 = $("<div class=\"cell\"></div>").appendTo(div);
	var div2 = $("<div class=\"treeview\" data-role=\"treeview\"></div>")
			.appendTo(div1);
	var ul1 = $("<ul></ul>").appendTo(div2);
	var li1 = $("<li class=\"node\" data-mode=\"checkbox\"></li>")
			.appendTo(ul1);
	var li1span1 = $("<span class=\"leaf\">所有权限</span>").appendTo(li1);
	var li1span2 = $("<span class=\"node-toggle\"></span>").appendTo(li1);
	var ul2 = $("<ul></ul>").appendTo(li1);

	$.ajax({
				type : 'post',
				url : basePath + 'role/queryResource.do',
				async : false,
				data : {},
				dataType : 'json',
				success : function(data) {
					var group = [];
					for ( var i = 0; i < data.length; i++)
						group.push(data[i].resgroup);
					var groupfilter = [];
					var repeatfilter = {};
					for ( var j = 0; j < group.length; j++) {
						if (!repeatfilter[group[j]]) {
							groupfilter.push(group[j]);
							repeatfilter[group[j]] = 1;
						}
					}
					for ( var k = 0; k < groupfilter.length; k++) {
						var li2 = $(
								"<li class=\"node\" data-mode=\"checkbox\"></li>")
								.appendTo(ul2);
						$("<span class=\"leaf\">" + groupfilter[k] + "</span>")
								.appendTo(li2);
						$("<span class=\"node-toggle\"></span>").appendTo(li2);
						var ultemp = $("<ul></ul>").appendTo(li2);
						for ( var m = 0; m < data.length; m++) {
							if (data[m].resgroup == groupfilter[k]) {
								var litemp = $(
										"<li data-mode=\"checkbox\" data-value=\""
												+ data[m].resid + "\"></li>")
										.appendTo(ultemp);
								$(
										"<span class=\"leaf\">"
												+ data[m].resname + "</span>")
										.appendTo(litemp);
							}
						}
					}
				}
			});
	var div3 = $("<div></div>").appendTo(div1);
	$("<button class=\"button\" id=\"reschecksubmit\"><span class=\"mif-checkmark fg-green\"></span></button>")
			.appendTo(div3);
	$("<button class=\"button\" style=\"margin-left:10\" id=\"cancel\"><span class=\"mif-cross fg-red\"></span></button>")
			.appendTo(div3);
	
	$.ajax({
		type : 'post',
		url : basePath + 'role/queryResByRoleid.do',
		data : {
			'roleid' : roleid
		},
		dataType : 'json',
		success : function(data) {
			for(var i=0;i<data.length;i++){
			$(":checkbox[value='"+data[i].resid+"']").prop("checked", true);
			}
		}
	});
	
	dialog.open();

	$("#cancel").click(function() {
		div.remove();
		dialog.close();
	});

	$("#reschecksubmit").click(function() {
		var checked="";
		$(":checkbox:checked").each(function(){
			if(!isNaN($(this).val()))
			checked += $(this).val()+",";
		});
		$.ajax({
			type:'post',
			url:basePath+'role/updateResByRoleid.do',
			data:{
				'roleid':roleid,
				'checked':checked.substring(0, checked.length-1)
			}
		});
		div.remove();
		dialog.close();
	});
}

function delRole(roleid) {
	if (confirm("即将删除此角色所有信息，确认删除吗？ ")) {
		window.location.href = basePath + "role/delRole.do?roleid=" + roleid;
	}
}

function editrolebtn(rolename) {
	window.location.href = basePath + "role/queryByRolename.do?rolename="
			+ rolename;
}