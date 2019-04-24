if (!window.businessAnalysis)
	window.businessAnalysis = {};

/**
 * 获取简单的阀值图形配置
 * 
 * @param {number}
 *            val
 * @param {String}
 *            caption
 * @returns {String}
 */
businessAnalysis.getDefaultGuageChartConfig = function(val, caption) {
	var result = [];
	result.push("<chart bgAlpha='0' bgColor='FFFFFF' rotateXAxisName='0' rotateYAxisName='0' baseFontColor='00676B' lowerLimit='0' upperLimit='200' numberSuffix='%25' showBorder='0'  toolTipBgColor='BFCAE6' gaugeFillMix='{dark-10},FFFFFF,{dark-10}' gaugeFillRatio='3'>");
	result.push("   <colorRange>");
	result.push("      <color minValue='0' maxValue='25' code='DF0029'/>");
	result.push("      <color minValue='25' maxValue='50' code='FF654F'/>");
	result.push("      <color minValue='50' maxValue='75' code='F6BD0F'/>");
	result.push("      <color minValue='75' maxValue='100' code='8BBA00'/>");
	result.push("   </colorRange>");
	result.push("   <dials>");
	result.push("      <dial value='" + val + "' rearExtension='10'/>");
	result.push("   </dials>");
	result.push("</chart>");
	return result.join("");

};

/**
 * 获取简单的漏斗图的图形配置
 * 
 * @param {Array}
 *            array
 * @param {String}
 *            caption
 * @returns {String} the funnel chart default config
 */
businessAnalysis.getDefaultFunnelChartConfig = function(array, caption) {
	var result = [];

	result.push("<chart caption='" + caption
			+ "' showPercentValues='1' decimals='1' baseFontSize='11' >");

	for ( var i = 0; i < array.length; i++) {
		var obj = array[i];
		result.push('<set label="' + obj.name + '" value="' + obj.value
				+ '" />');
	}
	result.push("   <styles>");
	result.push("      <definition>");
	result.push("         <style type='font' name='captionFont' size='15' />");
	result.push("      </definition>");
	result.push("      <application>");
	result.push("      <apply toObject='CAPTION' styles='captionFont' />");
	result.push("      </application>");
	result.push("   </styles>");
	result.push("</chart>");

	return result.join("");
};

businessAnalysis.getHomePagePieChart = function(array, caption) {
	
};

businessAnalysis.homePageSubmit = function(obj){
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

businessAnalysis.radioClickAction = function(obj){
	obj.checked = 1;
	if(obj.value == type){
		return false;
	} else {
		type = obj.value;
	}
	businessAnalysis.homePageSubmit(document.getElementById("butQuery"));
};

jQuery.fn.extend({
	elapsor : function(a) {
		var defaults = {
			color : '#fff',
			opacity : 100,
			func : null,
			text : '',
			text_style : {
				color : '#000',
				'font-size' : '11px'
			}
		};

		a = $.extend(defaults, a);
		this.w = [ this.innerWidth(), this.innerHeight() ];
		this.s = [ this.scrollLeft(), this.scrollTop() ];
		a.opacity = a.opacity ? '0.' + a.opacity.toString() : .65;
		a.color = a.color ? a.color : '#000';
		a.text_style = a.text_style ? a.text_style : {
			color : '#fff',
			'font-size' : '16px'
		};
		this.mask = this.find('.ternMask').get(0);
		this.elap = this.find('.ternElapsor').get(0);
		if (!this.mask) {
			this.mask = document.createElement('div');
			jQuery(this.mask).css(
					{
						'display' : 'none',
						'position' : 'absolute',
						'clear' : 'both',
						'overflow' : 'hidden',
						'z-index' : 10000,
						'top' : 0,
						'left' : 0,
						'width' : this.get(0).nodeName == "BODY" ? $(document)
								.width() : this.get(0).scrollWidth,
						'height' : this.get(0).nodeName == "BODY" ? $(document)
								.height() : this.get(0).scrollHeight
					});

			this.prepend(this.mask);
			jQuery(this.mask).addClass('ternMask');
		} else {
			jQuery(this.mask).css(
					{
						'width' : this.get(0).nodeName == "BODY" ? $(document)
								.width() : this.get(0).scrollWidth,
						'height' : this.get(0).nodeName == "BODY" ? $(document)
								.height() : this.get(0).scrollHeight
					});

		}
		if (a.text) {
			this.createElapsor(a);
		} else if (this.elap) {
			jQuery(this.elap).css('display', 'none');
		}
		jQuery(this.mask).css({
			'opacity' : a.opacity,
			'background-color' : a.color,
			'display' : 'block'
		});
		if (a.func) {
			a.func();
		}
	},
	createElapsor : function(a) {
		if (this.elap) {
			if (a.text) {
				this.elapsorText(a.text);
			}
		} else {
			this.elap = document.createElement('div');
			if (a.text) {
				this.text = document.createElement('span');
				this.text.className = "loading";
				this.text.appendChild(document.createTextNode(a.text));
				this.elap.appendChild(this.text);
			}
			this.prepend(this.elap);
			jQuery(this.elap).addClass('ternElapsor').css({
				'position' : 'absolute',
				'width' : 300,
				'z-index' : 10001,
				'text-align' : 'center'
			}).css(a.text_style);
		}

		jQuery(this.elap).css(
				{
					'top' : this.get(0).nodeName == "BODY" ? ($(window)
							.height() / 3)
							- ($(this.elap).height() / 3)
							+ $(document).scrollTop()
							: (this.s[1] + ((this.w[1]) / 2)),
					'left' : this.get(0).nodeName == "BODY" ? ($(window)
							.width() / 2)
							- ($(this.elap).width() / 2)
							+ $(document).scrollLeft()
							: (this.s[0] + ((this.w[0] - 300) / 2)),
					'display' : 'block'
				});
		return this.elap;
	},
	elapsorText : function(t) {
		$(this.elap).find('span').text(t);
	},
	hideElapsor : function() {
		this.mask = this.find('.ternMask').get();
		this.elap = this.find('.ternElapsor').get(0);
		if (this.mask) {
			$(this.mask).css({
				'display' : 'none'
			});
		}
		if (this.elap) {
			$(this.elap).css({
				'display' : 'none'
			});
		}
	}
});
