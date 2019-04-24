
function saveOrUpdate(){
	$("#pwPspForm").validate({   
		rules: {
			providerName: {
				required: true,
				maxlength: 50
			},
			officialWebsite: {
				required: false,
				maxlength: 200
			},
			pspEmail	: {
				required	: true,
				email		: true,
				maxlength	: 150
			},
			code		: {
				required: true,
				maxlength: 50
			}
		},
		messages: {
			providerName:{
				required: '必填',
				maxlength:'名称过长，请不要超过50个字符'
			},
			officialWebsite: {
				required: '必填',
				maxlength:'网址过长，请不要超过200个字符'
			},
			pspEmail	: {
				required	: '必填',
				email		: 'email格式不正确',
				maxlength	: "邮件地址不要超过150个字符"
			},
			code		: {
				required: '必填',
				maxlength: "简码不要超过50个字符"
			}
		},  
		errorPlacement: function(error, element) {    
			error.appendTo( element.parent());    
		},    

		success: function(label) {
			label.html(" ").addClass("checked");    
		},    

		focusInvalid: false,    
		onkeyup: false,
		submitHandler	: function(form){
			var param = {id:jQuery("#id").val(),providerName:jQuery("#providerName").val(),
					description:jQuery('#description').val(),
					officialWebsite:jQuery("#officialWebsite").val(),
					email:jQuery("#pspEmail").val(),
					code : jQuery("#code").val(),
					fullName:jQuery("#fullName").val()};
			
			var id = param.id,url = "";
			if(id > 0){
				url = "/admin/psp/updatePsp.html";
			} else {
				url = "/admin/psp/savePsp.html";
			}
			
			arvato.ajaxPost(app.path + url, param, function(data){
				var result = arvato.toJsonObject(data);
				if(result.success){
					top.dialogOfMine(result.message,'支付产品');
					top.do_close('dialogFrame');
				} else {
					top.dialogOfMine("添加失败！",'支付产品');
					top.do_close('dialogFrame');
				}
				top.document.getElementById("_MainArea").src = app.path + "/admin/psp/index.html?" + new Date().getTime();
			});
		}
	});
	
}

jQuery(document).ready(function(){
	saveOrUpdate();
});


