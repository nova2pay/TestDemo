

function bankCanWrite(el){
	el.checked ? el.checked = true : el.checked = false;
	var bool = el.checked ;
	var trEl = el.parentNode.parentNode;
	
	var tds = trEl.getElementsByTagName("td");
	
	var descInput = tds[2].getElementsByTagName("input")[0];
	
	var rmarkInput = tds[3].getElementsByTagName("input")[0];
	
	if(bool){
		descInput.disabled = false;
		rmarkInput.disabled = false;
	} else {
		descInput.value = "";
		rmarkInput.value = "";
		descInput.disabled = true;
		rmarkInput.disabled = true;
		document.getElementById("selectAll").checked = false;
	}
}

function uncheck(el){
	el.checked ? el.checked = true : el.checked = false;
	if(el.checked === false){
		document.getElementById("selectAll").checked = false;
	}
}

function selectAllCheck(currObj,el,opt){
	currObj.checked ? currObj.checked = true : currObj.checked = false;
	var bool = currObj.checked ;
	var checks = document.getElementsByName(el);
	for(var i = 0 ; i < checks.length ; i ++){
		checks[i].checked = bool;
		if(opt === 'bank')
			bankCanWrite(checks[i]);
	}
	currObj.title = bool ? "取消全选" : "全选";
}

function getBankValue(){
	var values = [];
	var checks = document.getElementsByName("bankId");
	for ( var i = 0; i < checks.length; i++) {
		var check = checks[i];
		if(check.checked){
			var trEl = check.parentNode.parentNode;
			
			var tds = trEl.getElementsByTagName("td");
			
			var descInput = tds[2].getElementsByTagName("input")[0];
			
			var rmarkInput = tds[3].getElementsByTagName("input")[0];
			values.push("{bankId:" + check.value + ",desc:'" + descInput.value + "',rmark:'" + rmarkInput.value + "'}");
		}
	}
	return "[" + values.join(",") + "]";
}

function submitBankCheck(){
	parent.document.getElementById("_MainArea").contentWindow.banks = getBankValue();
	top.productFrameClose();
}

function getCurrencyValue(){
	
	var values = [];
	var checks = document.getElementsByName("currencyId");
	for ( var i = 0; i < checks.length; i++) {
		var check = checks[i];
		if(check.checked){
			values.push(check.value);
		}
	}
	return values.join(",");
}

function submitCurrencyCheck(){
	parent.document.getElementById("_MainArea").contentWindow.supportCurrency = getCurrencyValue();
	top.productFrameClose();
}

function submitQualificationCheck(){
	parent.document.getElementById("_MainArea").contentWindow.qualification = getQualificationValue();
	top.productFrameClose();
}

function getQualificationValue(){
	var values = [];
	
	var checks = document.getElementsByName("qualificationId");
	
	for ( var i = 0; i < checks.length; i++) {
		var check = checks[i];
		if(check.checked){
			values.push(check.value);
		}
	}
	return "[" + values.join(",") + "]";
}
function movePage(url,direction,opr){
	if(direction == null){
		direction = 'left';
	}
	$('body').css('overflow-x','hidden');
	if(direction == 'left'){
		$('body').animate( { marginLeft: '-1500px',marginRight: '1500px' },{
			queue: false, 
			duration: 500, 
			complete: function(){
				if(typeof opr == "function")
					opr();
				else location.href=url;
			} 
		});
	}else if(direction == 'right'){
		$('body').animate( { marginLeft: '1500px',marginRight: '-1500px' },{
			queue: false, 
			duration: 500, 
			complete: function(){
				if(typeof opr == "function")
					opr();
				else location.href=url;
			} 
		});
	} else if(direction == "top"){
		$('body').animate( { marginBottom: '1500px',marginTop: '-1500px' },{
			queue: false, 
			duration: 500, 
			complete: function(){
				if(typeof opr == "function")
					opr();
				else location.href=url;
			} 
		});
	}
}
