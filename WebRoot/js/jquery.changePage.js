/*
 * jQuery 的页面加载,移出特效 方法库
 * version: 0.1 (2011-12-28)
 * @requires jQuery v1.4.2 or later
 *
 * Examples /WEB-INF/pages/admin/merchant/index.jsp
 */
$('body').hide();

function movePage(url,direction){
	if(direction == null){
		direction = 'left';
	}
	$('body').css('overflow-x','hidden');
	if(direction == 'left'){
		$('body').animate( { marginLeft: '-1500px',marginRight: '1500px' },{
			queue: false, 
			duration: 500, 
			complete: function(){
				location.href=url;
			} 
		});
	}else if(direction == 'right'){
		$('body').animate( { marginLeft: '1500px',marginRight: '-1500px' },{
			queue: false, 
			duration: 500, 
			complete: function(){
				location.href=url;
			} 
		});
	}
}
function loadPage(){
	//$('body').animate( { marginLeft: '0px',marginRight: '0px' },{queue: false, duration: 500});
	$('body').fadeIn(300);
}
$(function(){
	loadPage();
});