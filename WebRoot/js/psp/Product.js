
jQuery.validator.addMethod("num",function (value, element)  {       
	return   this.optional(element) || /^[0-9]{1,3}([.]{1}[0-9]{1,2})?$/.test(value);       
} ,  "只能包括中文字、英文字母、数字和下划线 " ); 
function addCheckToForm(){
	
	var rules = {
		providerName	: {
			required	: true,
			maxlength	: 50
		},
		
		productName 	: {
			required	: true,
			maxlength	: 50
		},
		"productType.id"	: {
			required	: true
		},
		serviceCharge	: {
			required	: true,
			number		: true
		},
		serviceChargeFixed	: {
			required	: true,
			number		: true
		},
		rate			: {
			required	: true,
			number		: true
		},
		rateFixed	: {
			required	: true,
			number		: true
		},
		minCommissionCharge			: {
			required	: true,
			number		: true
		},
		maxCommissionCharge			: {
			required	: true,
			number		: true
		},
		margin			: {
			required	: true,
			number		: true	
		},
		settlementCycle	: {
			required	: true,
			number		: 20
		},
//		cost			:{
//			required	: true,
//			number		: true
//		},
//		costFixed	: {
//			required	: true,
//			number		: true
//		},
//		refundCost			:{
//			required	: true,
//			number		: true
//		},
//		refundCostFixed	: {
//			required	: true,
//			number		: true
//		},
		refundRate			:{
			required	: true,
			number		: true
		},
		refundRateFixed			: {
			required	: true,
			number		: true
		},
		refundMinCharge			:{
			required	: true,
			number		: true
		},
		refundMaxCharge			: {
			required	: true,
			number		: true
		},
		refuseRate			:{
			required	: true,
			number		: true
		},
		refuseRateFixed			: {
			required	: true,
			number		: true
		},
		singlePaymentLimit : {
			required	: true,
			number		: true
		},
		quota			: {
			required	: true,
			number		: true
		}
	};
	var messages = {

			providerName:{
				required	: '必填！',
				maxlength	:'名称过长，请不要超过50个字符！'
			},
			productName : {
				required	: "必填",
				maxlength	: '名称过长，请不要超过50个字符！'
			},
			"productType.id"	: {
				required	: "请选择"
			},
			serviceCharge	: {
				required	: "必填",
				number		: "服务费必须是数字类型"
			},
			serviceChargeFixed	: {
				required	: "必填",
				number		: "费率必须是数字类型"
			},
			rate			: {
				required	: "必填",
				number		: "费率必须是数字类型"
			},
			rateFixed			: {
				required	: "必填",
				number		: "费率必须是数字类型"
			},
			minCommissionCharge			: {
				required	: "必填",
				number		: "最低手续费必须是数字类型"
			},
			maxCommissionCharge			: {
				required	: "必填",
				number		: "最高手续费必须是数字类型"
			},
			margin			: {
				required	: "必填",
				number		: "保证金必须是数字类型"	
			},
			settlementCycle	: {
				required	: "必填",
				number		: "结算周期必须是数字类型"
			},
//			cost			:{
//				required	: "必填",
//				number		: "成本必须是数字类型"
//			},
//			costFixed			: {
//				required	: "必填",
//				number		: "成本必须是数字类型"
//			},
//			refundCost			:{
//				required	: "必填",
//				number		: "成本必须是数字类型"
//			},
//			refundCostFixed			: {
//				required	: "必填",
//				number		: "成本必须是数字类型"
//			},
			refundRate			:{
				required	: "必填",
				number		: "费率必须是数字类型"
			},
			refundRateFixed			: {
				required	: "必填",
				number		: "费率必须是数字类型"
			},
			refundMinCharge			:{
				required	: "必填",
				number		: "费率必须是数字类型"
			},
			refundMaxCharge			: {
				required	: "必填",
				number		: "费率必须是数字类型"
			},
			refuseRate			:{
				required	: "必填",
				number		: "费率必须是数字类型"
			},
			refuseRateFixed			: {
				required	: "必填",
				number		: "费率必须是数字类型"
			},
			singlePaymentLimit : {
				required	: "必填",
				number		: "支付限额必须是数字类型"
			},
			quota			: {
				required	: "必填",
				number		: "满额结算必须是数字类型"
			}
	};
	$("#pwPspProductForm").validate({   
		rules: rules,
		messages: messages,  
		errorClass : "validateError",
		validClass: "validateSuccess",
		focusInvalid: false,    
		onkeyup: false,
		errorElement: "span",
		submitHandler	: function(form){
			form.banks.value = banks;
			form.supportCurrency.value = supportCurrency;
			form.qualification.value = qualification;
//			if(banks == "[]"){
//				top.dialogOfMine('请选择银行！','添加银行');
//				return false;
//			}  
			var url = form.id.value > 0 ? (app.path +"/admin/psp/updateProduct.html") : (app.path +"/admin/psp/saveProduct.html");
			/*var what = form.treatyTemp.value,tratyVal;
			if (what.indexOf('/') > -1)
				tratyVal = what.substring(what.lastIndexOf('/')+1,what.length);
			else
				tratyVal = what.substring(what.lastIndexOf('\\')+1,what.length);
			form.treaty.value = tratyVal;*/
			form.action = url;
			form.submit();
			/*var values = getFormValues();
			values.banks = banks;
			values.qualification = qualification;
			if(values.banks == "[]"){
				top.dialogOfMine('请选择银行！','添加银行');
				return false;
			}
			var url = values.id > 0 ? (app.path +"/admin/psp/updateProduct.html") : (app.path +"/admin/psp/saveProduct.html");
			arvato.ajaxPost(url, values, function(data){
				movePage(app.path + "/admin/psp/index.html?" + new Date().getTime(),"right");
			});*/
		}
	});
}

function getFormValues(){
	var values = {
		pspId		: jQuery("#pspId").val(),
		id			: jQuery("#id").val(),
		productName	: jQuery("#productName").val(),
		tempId		: jQuery("#productTypeTemp").val(),
		treaty		: jQuery("#treaty").val(),
		serviceCharge	: jQuery("#serviceCharge").val(),
		rate		: jQuery("#rate").val(),
		margin		: jQuery("#margin").val(),
		settlementCycle	: jQuery("#settlementCycle").val(),
		cost		: jQuery("#cost").val(),
		singlePaymentLimit	: jQuery("#singlePaymentLimit").val(),
		supportBankRemarks	: jQuery("#supportBankRemarks").val(),
		payUrl		: jQuery("#payUrl").val(),
		testUrl		: jQuery("#testUrl").val(),
		paymentType	: jQuery("#paymentType").val(),
		banks		: jQuery("#banks").val(),
		qualifications	: jQuery("#qualifications").val(),
		quota		: jQuery("#quota").val()
	};
	return values;
	
}

jQuery(document).ready(function(){
	addCheckToForm();
	jQuery('body').hide();
	jQuery('body').fadeIn(300);
});

