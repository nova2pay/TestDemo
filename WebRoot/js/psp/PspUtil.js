
function saveOrUpdate(){
	$("#pwPspForm").validate({   
		rules: {
			providerName: {
				required: true,
				maxlength: 50
			},
			officialWebsite: {
				required: true,
				maxlength: 200
			}
		},
		messages: {
			providerName:{
				required: '请输入支付供应商名称！',
				maxlength:'名称过长，请不要超过50个字符！'
			},
			officialWebsite: {
				required: '请输入官方网站！',
				maxlength:'网址过长，请不要超过200个字符！'
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
			var param = {id:jQuery("#id").val(),providerName:jQuery("#providerName").val(),description:jQuery('#description').val(),officialWebsite:jQuery("#officialWebsite").val()};
			arvato.ajaxPost(app.path + "/admin/psp/saveOrUpdatePsp.html", param, function(data){
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


