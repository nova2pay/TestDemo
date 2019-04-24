
/**
 * 
 * @param cfg
 */
function Analysis(cfg){
	
	var self = this;
	for(var source in cfg){
		self[source] = cfg[source];
		delete cfg[source];
	}
	delete cfg;
	
	/**
	 * private
	 * 构造函数
	 */
	function init(){
		$("#beginDate").datepicker();
		$("#endDate").datepicker();
	}
	
	/**
	 * 
	 */
	this.validate = function(){
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
	
	/**
	 * public
	 * 验证日的日期
	 */
	this.validateForDay = function(){
		var begin = document.getElementById("beginDate"),end = document.getElementById("endDate");
		var beginDate = parseDayDate(begin.value,1);
		var endDate = parseDayDate(end.value,1);
		if(beginDate > endDate){
			alert("开始时间必须在结束时间之前");
			return false;
		}
		var time = (endDate.getTime() - beginDate.getTime())/ 1000 / 60 / 60 / 24 + 1;
		
		if(time > 30){
			alert("日期的跨度不能大于30天");
			return false;
		}
		if(time <= 1){
			alert("日期的跨度必须大于1天");
			return false;
		}
		
		return true;
	};
	
	/**
	 * public
	 * 验证月的日期
	 */
	this.validateForMonth = function(){
		var begin = document.getElementById("beginDate"),end = document.getElementById("endDate");
		var beginDate = parseDayDate(begin.value,2);
		var endDate = parseDayDate(end.value,2);
		if(beginDate > endDate){
			alert("开始时间必须在结束时间之前");
			return false;
		}
		var time = (endDate.getTime() - beginDate.getTime())/ 1000 / 60 / 60 / 24 / 30 + 1;
		
		if(time > 12){
			alert("日期的跨度不能大于12个月");
			return false;
		}
		if(time <= 1){
			alert("日期的跨度必须大于2个月");
			return false;
		}
		
		return true;
	};
	
	/**
	 * private
	 * 转换日期
	 * @param base
	 * @param type
	 * @returns {Date}
	 */
	function parseDayDate(base,type){
		var dts = base.split("-");
		var time = new Date();
		if(type == 1){
			time = new Date(dts[0],dts[1] - 1,dts[2]);
		} else if(type == 2){
			time = new Date(dts[0],dts[1] - 1);
		}
		return time;
	}
	
	/**
	 * 主页查询
	 */
	this.search = function(obj){
		this.validate();
		obj.disabled = true;
		document.getElementById("analysisForm").submit();
	};

	
	init.apply(this,arguments);
	
}





