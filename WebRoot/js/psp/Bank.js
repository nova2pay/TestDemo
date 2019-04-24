

function canWrite(el){
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
jQuery(document).ready(function(){
	
});

function selectAllCheck(el){
	el.checked ? el.checked = true : el.checked = false;
	var bool = el.checked ;
	var checks = document.getElementsByName("bankId");
	for(var i = 0 ; i < checks.length ; i ++){
		checks[i].checked = bool;
		canWrite(checks[i]);
	}
	el.title = bool ? "取消全选" : "全选";
}

function getValue(){
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

function submitCheck(){
	parent.document.getElementById("dialogIframe").contentWindow.banks = getValue();
}




