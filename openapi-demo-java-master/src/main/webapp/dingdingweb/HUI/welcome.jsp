<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/top3.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv=Content-Type content="text/html;charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta content="yes" name="apple-touch-fullscreen" />
<meta name="data-spm" content="a215s" />
<meta content="telephone=no,email=no" name="format-detection" />
<meta content="fullscreen=yes,preventMove=no" name="ML-Config" />
<link href="icon114-114.png" rel="apple-touch-icon-precomposed">
<link href="icon.png" rel="Shortcut Icon" type="image/x-icon" />
<style>
/* .hui-start-banner{width:100%; height:100%; position:fixed; z-index:9998; left:0px; top:0px; background:#FFFFFF; display:none;} */
/* #hui-start-banner-close{width:50px; height:50px; position:fixed; z-index:9999; top:50px; right:20px; background:#F5F6F7; display:none; text-align:center; border-radius:50px; line-height:50px; font-size:14px; color:#666;} */
/* .hui-start-banner .hui-swipe-indicator{width:96%; position:absolute; z-index:3; left:2%; bottom:20px; display:none;} */
</style>
<script type="text/javascript" src="http://g.alicdn.com/dingding/open-develop/1.6.9/dingtalk.js"></script>
<script type="text/javascript" src="https://g.alicdn.com/dingding/dingtalk-pc-api/2.7.0/index.js"></script>
<script type="text/javascript" >
window.onload=function(){
	setTimeout(OsFind(), 6000); 
}

function OsFind(){
	if (os.isAndroid || os.isPhone) {
		window.location ='${basePath}Home';
	}else if (DingTalkPC.ua.isDesktop&&DingTalkPC.ua.isInDingTalk) {
		window.location ='${basePath}Home';
	}else {
		window.location ='${basePath}WebLogin/tolongin';
	}
}

</script>

<title>欢迎</title>
</head>
<body>

<div class="hui-start-banner hui-swipe" id="startBanner">
	<div class="hui-swipe-items" >
		    <div class="hui-swipe-item" style="background:#FFFFFF;"><img src="${basePath}dingdingweb/HUI/img/startbanner/1.png" /></div>
<%-- 		    <div class="hui-swipe-item" style="background:#FFFFFF;"><img src="${basePath}dingdingweb/HUI/img/rigologin-bg.png" /></div> --%>
<!-- 		    <div class="hui-swipe-item" style="background:#FFFFFF;"><a href="javascript:huiStartBannerClose();"><img src="../img/startbanner/3.png" /></a></div> -->
	</div>
</div>
<!-- <div id="hui-start-banner-close" onclick="huiStartBannerClose();">关闭</div> -->
<%-- <script type="text/javascript" src="${basePath}dingdingweb/HUI/js/hui-swipe.js" charset="UTF-8"></script> --%>
<script type="text/javascript">
// var wininfo = hui.winInfo();
// hui('#startBanner').find('.hui-swipe-item').css({height:wininfo.height+'px'});
// hui('#startBanner').show();
// hui('#hui-start-banner-close').show();
// var swipe      = new huiSwpie('#startBanner');
// swipe.autoPlay = false;
// swipe.loop     = false;
// swipe.run();
// function huiStartBannerClose(){
//     hui('#startBanner').remove();
//     hui('#hui-start-banner-close').remove();
// }
</script>
</body>
</html>