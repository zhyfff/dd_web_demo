<%-- <%@page import="Hisign.controller.util.SessionHelper"%> --%>
<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setAttribute("basePath", basePath);
request.setAttribute("path", path);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- jquery引入 -->
<script type="text/javascript" src="${basePath}dingdingweb/public/js/jquery/jquery.js"></script>
<script type="text/javascript" src="${basePath}dingdingweb/public/js/jquery/jquery.cookie.js"></script>
<script type="text/javascript">var basePath='${basePath}';</script>
<link rel="stylesheet" type="text/css" href="${basePath}dingdingweb/HUI/css/hui.css" />
<script src="${basePath}dingdingweb/HUI/js/hui.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="${basePath}dingdingweb/HUI/js/hui-form.js"></script>
<script type="text/javascript" src="${basePath}dingdingweb/HUI/js/hui-accordion.js"></script>
<script type="text/javascript" src="${basePath}dingdingweb/public/js/crypto-js/crypto-js.js"></script>
<script type="text/javascript">
	hui.ready(function() {
		hui.accordion(true, false);
		var name=$("#username").attr("value");

	});
	
	var os = function() {
	    var ua = navigator.userAgent,
	    isWindowsPhone = /(?:Windows Phone)/.test(ua),
	    isSymbian = /(?:SymbianOS)/.test(ua) || isWindowsPhone, 
	    isAndroid = /(?:Android)/.test(ua), 
	    isFireFox = /(?:Firefox)/.test(ua), 
	    isChrome = /(?:Chrome|CriOS)/.test(ua),
	    isTablet = /(?:iPad|PlayBook)/.test(ua) || (isAndroid && !/(?:Mobile)/.test(ua)) || (isFireFox && /(?:Tablet)/.test(ua)),
	    isPhone = /(?:iPhone)/.test(ua) && !isTablet,
	    isPc = !isPhone && !isAndroid && !isSymbian;
	    return {
	         isTablet: isTablet,
	         isPhone: isPhone,
	         isAndroid : isAndroid,
	         isPc : isPc
	    };
	}();
	
</script>
<script type="text/javascript" src="${basePath}dingdingweb/HUI/useful/js/Useful.js"></script>

<style type="text/css">
 #choose-data { 
  	font-size: 15px;  
 	font-weight: bold; 
/*   	color: #3388FF;   */
 	border-radius: 3px; 
  	width: 100%;  
 /* 	margin: 6px 6px 6px 6px; */ 
 	background: #FFFFFF; 
  	height: 44px;  */
  	line-height:44px !important; 
   	text-align: center;  
 	-webkit-appearance: none; 
 	-moz-appearance: none; 
 	appearance: none; 
  	border: 0;  
 /* 	display:inline-block; */ 
	
}
input[type=date]::-webkit-inner-spin-button { visibility: hidden; }
label{color: #FFFFFF;}
</style>
</head>

<body>

	<div class="hui-slide-menu">
	    <ul>
	        <li>
				<label for="choose-data">选择日期</label>
	        	<input type="date" id="choose-data"  name="choose-data">
			</li>
	        
	        <li style="padding-top:30px;">
	            <button type="button" class="hui-button hui-button-large" onclick="hui.closeSlideMenu();">关闭菜单</button>
	        </li>
	    </ul>
	</div>

<script type="text/javascript">
$("#choose-data").change(function(){
    $("#choose-data").attr("value",$(this).val()); //赋值
    var date = $("#choose-data").val();
//     alert(date);
    hui('#searchKey').val(date);
  	document.getElementById("list").innerHTML='';
    searchNow();
});


//清空
function clearSearch(){
	hui('#searchKey').val('');
}

/* slide menu */
hui.slideMenu();


</script>
</body>
</html>
