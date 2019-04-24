/**
 * 封裝了一些常用的方法，比如Ajax請求，創建form等
 * 
 * @type
 */
var arvato = {
	/**
	 * 
	 * @param {String}
	 *            url 请求的URL
	 * @param {String}
	 *            dataType 从服务器端返回的数据类型 可以是“json”，“XML”，“HTML”，“Script”
	 * @param {String/Object}
	 *            param 请求的参数，可以是key=1&key2=2 也可以是{key:1,key2:2}
	 * @param {Function}
	 *            callback 回调函数
	 * @param {String}
	 *            type 请求方式：可以是 “get”或“post”
	 */
	ajaxRequest : function(url, dataType, param, callback, type) {
		jQuery.ajax({
					url : url,
					data : param,
					dataType : dataType ? dataType : "json",
					type : type ? type.toUpperCase() : "POST",
					/*
					 * statusCode : { 404: function() {
					 * alert('请求的页面无法找到，请与管理员联系!'); }, 500:function(){
					 * alert("后台服务错误，请与管理员联系!"); }, 400: function() {
					 * alert('请求的页面无法找到，请与管理员联系!'); } },
					 */
					success : function(data) {
						callback(data);
					}
				});
	},
	/**
	 * 
	 * @param {String}
	 *            url 请求的URL
	 * @param {String}
	 *            dataType 从服务器端返回的数据类型 可以是“json”，“XML”，“HTML”，“Script”
	 * @param {String/Object}
	 *            param 请求的参数，可以是key=1&key2=2 也可以是{key:1,key2:2}
	 * @param {Function}
	 *            callback 回调函数
	 * @param {String}
	 *            type 请求方式：可以是 “get”或“post”
	 */
	ajax : function(reqObj) {
		jQuery.ajax({
					url : app.path + reqObj.url,
					data : reqObj.param,
					dataType : reqObj.dataType ? reqObj.dataType : "json",
					type : reqObj.type ? reqObj.type.toUpperCase() : "POST",
					statusCode : {
						404 : function() {
							alert('请求的页面无法找到，请与管理员联系!');
						},
						500 : function() {
							alert("后台服务错误，请与管理员联系!");
						}
					},
					success : function(data) {
						reqObj.callback(data);
					},
					error : function(data) {
						alert(data);
					}
				});
	},
	ajaxPost : function(url, data, callback, dataType) {
		jQuery.post(url, data, callback, dataType);
	},
	empty : {
		emptyStr : function(data) {
			return data ? data : "";
		}
	},
	toJsonObject : function(data) {
		return eval("(" + data + ")");
	}
}


/**
 * <去空格>
 */
String.prototype.trim = function() {
	return this.replace(/^\s*|\s*$/g, "");
}
/**
 * <为空>
 */
String.prototype.isEmpty = function() {
	return !(new RegExp(/.+/).test(this));
}
/**
 * <只能是字母、数字和下划线>
 */
String.prototype.isSafe = function() {
	return new RegExp(/^\w+$/).exec(this);
}
/**
 * <检查Email的合法性>
 */
String.prototype.checkEmail = function() {
	return new RegExp(/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/).exec(this);
}
/**
 * <提交表单是的字符串>
 */
function setQueryString() {
	var param = "";
	for (var i = 0; i < arguments.length; i++) {
		param += arguments[i] + "=" + encodeURI(arguments[i + 1]);
		if (i != arguments.length - 2) {
			param += "&";
			i++;
		} else {
			break;
		}
	}
	return param;
}

/**
 * <往集合里添加对象>
 * 
 * @param {Object}
 *            obj
 * @param {Object}
 *            nodup
 */
Array.prototype.append = function(obj, nodup) {
	if (!(nodup) && this.contains(obj)) {
		this[this.length] = obj;
	}
}

/**
 * <取对象在集合的索引>
 * 
 * @param {Object}
 *            obj
 */
Array.prototype.indexOf = function(obj) {
	var result = -1;
	for (var i = 0; i < this.length; i++) {
		if (this[i] === obj) {
			result = i;
			break;
		}
	}
	return result;
}

/**
 * <该对象在集合中是否存在>
 * 
 * @param {Object}
 *            obj
 */
Array.prototype.contains = function(obj) {
	return (this.indexOf(obj) >= 0);
}

/**
 * <清空集合>
 */
Array.prototype.clean = function() {
	this.length = 0;
}

/**
 * <将对象插入到集合的什么位置>
 * 
 * @param {Object}
 *            obj
 * @param {Object}
 *            index
 */
Array.prototype.insertAt = function(obj, index) {
	this.splice(index, 0, obj);
}

/**
 * <根据索引删除对象>
 * 
 * @param {Object}
 *            index
 */
Array.prototype.removeAt = function(index) {
	this.splice(index, 1);
}

/**
 * <删除指定的对象>
 * 
 * @param {Object}
 *            obj
 */
Array.prototype.remove = function(obj) {
	var index = this.indexOf(obj);
	if (index >= 0) {
		this.removeAt(index);
	}
}

function dialogOfMine(str,title){
	parent.dialogOfMine(str,title);
}
function countFactorag(amount,rate,fixedRate,maxVal,minVal){
		if (!amount) amount=0;
		if (!rate) rate=0;
		if (!fixedRate) fixedRate=0;
		if (!maxVal) maxVal=0;
		if (!minVal) minVal=0;
		var factorag=(amount*rate)+fixedRate;
		if (factorag>0){
			if (maxVal>0 && factorag>maxVal){
	
				factorag=maxVal;
			}
			if (minVal>0 && factorag<minVal){
				factorag=minVal;
			}
		}
			
		return factorag.toFixed(2);
		
}

$.ajaxSetup({cache:false});

jQuery(function($){
//	alert('t');
initreset();
	//setTimeout('initreset()',1000);
});

function initreset(){
	
	var rest_btn=$('input:reset');
	if (rest_btn && rest_btn.length>0 &&
	 rest_btn.val()!='重置' && rest_btn.val()!='reset' &&
	 typeof(window.TV)=='undefined' ){
		
		var reste_div=$('input:reset').parent();
		reste_div.css('height','55px');
		var reste_div_height=reste_div.height(),
				window_height=$(window).height(),
				first_div=null,
				first_div_total_height=0,
				space_height=0,
				dialog_title_height=30;
		$('body').wrapInner('<div id="inner"></div>');	
		first_div=$('body').children();
		//alert(first_div.length)
		first_div.each(function(){
			first_div_total_height+=$(this).height();
		});
		//alert(first_div_total_height+":"+window_height);
		if ($.browser.msie)
			dialog_title_height=0;
		if (first_div_total_height<window_height){
			space_height=window_height-first_div_total_height-dialog_title_height;
			reste_div.before('<div id="space_div" style="height:'+space_height+'px"></div>');
		}
		
	}
	}
	
function checkPrice(price){
	  return (/^(([1-9]\d*)|\d)(\.\d{1,5})?$/).test(price.toString());
	}