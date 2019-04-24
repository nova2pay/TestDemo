/**
 * 
 * @param obj
 * @returns {void}
 */
function homePageSubmit(obj){
	var begin = document.getElementById("beginDate"),end = document.getElementById("endDate");
	if(begin.value == ""){
		alert("请选择开始时间");
		return false;
	} else if(end.value == ""){
		alert("请选择结束时间");
		return false;
	} else if(begin.value.split("-").length < 2){
		alert("开始时间输入有误，请检查");
		return false;
	} else if(end.value.split("-").length < 2){
		alert("结束时间输入有误，请检查");
		return false;
	}
	obj.disabled = true;
	document.getElementById("analysisForm").submit();
};

var type = 0;
/**
 * 
 * @param obj
 * @returns {void}
 */
function radioClickAction(obj){
	obj.checked = 1;
	if(obj.value == type){
		return false;
	} else {
		type = obj.value;
	}
	homePageSubmit(document.getElementById("butQuery"));
};


function validateForMonth(){
	var begin = document.getElementById("beginDate"),end = document.getElementById("endDate");
	var beginDate = parseDayDate(begin.value,2);
	var endDate = parseDayDate(end.value,2);
	if(beginDate > endDate){
		alert("开始时间必须在结束时间之前");
		return false;
	}
	var time = (endDate.getTime() - beginDate.getTime())/ 1000 / 60 / 60 / 24 / 30 + 1;
	if(time > 13){
		alert("日期的跨度不能大于12个月");
		return false;
	}
	if(time <= 2){
		alert("日期的跨度必须大于2个月");
		return false;
	}
	
	return true;
}

function parseDayDate(base,type){
	var dts = base.split("-");
	var time = new Date();
	if(type == 1){
		time = new Date(dts[0],dts[1] - 1,dts[2]);
	} else if(type == 2){
		time = new Date(dts[0],dts[1] - 1);
	}
	return time;
};

function validateForDay(){
	var begin = document.getElementById("beginDate"),end = document.getElementById("endDate");
	var beginDate = parseDayDate(begin.value,1);
	var endDate = parseDayDate(end.value,1);
	if(beginDate > endDate){
		alert("开始时间必须在结束时间之前");
		return false;
	}
	var time = (endDate.getTime() - beginDate.getTime())/ 1000 / 60 / 60 / 24 + 1;
	
	if(time > 31){
		alert("日期的跨度不能大于31天");
		return false;
	}
	if(time <= 1){
		alert("日期的跨度必须大于1天");
		return false;
	}
	
	return true;
};

function validate(){
	var begin = document.getElementById("beginDate"),end = document.getElementById("endDate");
	if(begin.value == ""){
		alert("请选择开始时间");
		return false;
	} else if(end.value == ""){
		alert("请选择结束时间");
		return false;
	} else if(begin.value.split("-").length < 2){
		alert("开始时间输入有误，请检查");
		return false;
	} else if(end.value.split("-").length < 2){
		alert("结束时间输入有误，请检查");
		return false;
	}
	return true;
};
