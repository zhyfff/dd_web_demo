<!DOCTYPE html>
<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%@include file="/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv=Content-Type content="text/html;charset=utf-8">
<meta charset="gbk">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection"/>
<meta content="yes" name="apple-touch-fullscreen"/>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta content="yes" name="apple-touch-fullscreen" />    
<meta name="data-spm" content="a215s" />
<meta content="telephone=no,email=no" name="format-detection" />    
<meta content="fullscreen=yes,preventMove=no" name="ML-Config" />
<link href="icon114-114.png" rel="apple-touch-icon-precomposed">
<link href="icon.png" rel="Shortcut Icon" type="image/x-icon" />
<style>
	.hui-start-banner{width:100%; height:100%; position:fixed; z-index:9998; left:0px; top:0px; background:#FFFFFF; display:none;}
	#hui-start-banner-close{width:50px; height:50px; position:fixed; z-index:9999; top:50px; right:20px; background:#F5F6F7; display:none; text-align:center; border-radius:50px; line-height:50px; font-size:14px; color:#666;}
	.hui-start-banner .hui-swipe-indicator{width:96%; position:absolute; z-index:3; left:2%; bottom:20px; display:none;}
</style>
<script type="text/javascript">
//在此拿到jsAPI权限验证配置所需要的信息
	var _config = <%= com.alibaba.dingtalk.openapi.demo.auth.AuthHelper.getConfig(request) %>;
</script>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>海鑫服务中心</title>
<script type="text/javascript">
window.onerror = handleErr;
//捕获全局错误onerror

function handleErr(msg, url, line) {
	hui.closeLoading();
    var errorTxt = "";
    errorTxt += "Error: " + msg + "\n";
    
    errorTxt += "Line: " + line + "\n";
    errorTxt += "Url: " + url + "\n";
    alert(errorTxt);
    return true;
}
</script>
<script type="text/javascript" src="${basePath}dingdingweb/HUI/contract/js/zepto.min.js"></script>
<script type="text/javascript" src="http://g.alicdn.com/dingding/open-develop/1.6.9/dingtalk.js"></script>
<script type="text/javascript" src="https://g.alicdn.com/dingding/dingtalk-pc-api/2.7.0/index.js"></script>
<script type="text/javascript" src="${basePath}dingdingweb/HUI/contract/js/logger.js"></script>
<script type="text/javascript" src="${basePath}dingdingweb/HUI/js/homeLogin.js"></script>
<!--免登相关代码 -->
<!--  <script type="text/javascript" src="${basePath}dingdingweb/HUI/contract/js/getUserInfor.js"></script> -->
</head>

<body >
<header>
<%-- ${basePath}dingdingweb/HUI/img/head.png --%>
	<div class="hui-list" align="center">
		<div  class="hui-list-icons" style="width:110px; height:80px;">
			<img id="userImg" alt="头像" src="${basePath}dingdingweb/HUI/img/head.png" style="width:66px; margin:0px; border-radius:50%;">
		</div>
		<div align="center" style="height:auto; height:40px; padding-bottom:8px;" id="userName">
			欢迎您
		</div >
<!-- 		<div align="center" style="height:auto; height:60px; padding-bottom:8px;"> -->
<!-- 			您当前在钉钉的userId为  <div id="userId" ></div> -->
<!-- 		</div> -->
		
		<div align="center">
		<input type="hidden" id="userid" value="${sessionScope['org.springframework.web.servlet.support.SessionFlashMapManager.FLASH_MAPS'][0]['userid']}">
			<input id="info" type="hidden" value="${sessionScope['org.springframework.web.servlet.support.SessionFlashMapManager.FLASH_MAPS'][0]['usJson']}">
			<input type="hidden" id="username" value="${sessionScope['org.springframework.web.servlet.support.SessionFlashMapManager.FLASH_MAPS'][0]['name']}">
		</div>
		
	</div>
	
</header>
<br>
	

<div class="hui-wrap">
	    <div style="padding:10px;">
			<div class="hui-speed-dial">
				<ul></ul>
			</div>
	    </div>
</div>

<script type="text/javascript">
	var icons = ["icon-ITfuwu","icon-xingzhengbangongguanli","icon-hetongguanli","icon-renliziyuanzhutifenxi"];
	

	
	var html  = '';
	
		html += '<li>'+
		'<div class="hui-speed-dial-icons" onclick="tocenter()">'+
	        '<span class="icon iconfont '+icons[0]+'"></span>'+
	    '</div>'+
      '<div class="hui-speed-dial-text">IT服务（IT信息部）</div>';
		'</li>';
		hui('.hui-speed-dial ul').html(html);
	
		html += '<li>'+
			'<div class="hui-speed-dial-icons" onclick="send2Office()">'+
	            '<span class="icon iconfont '+icons[1]+'"></span>'+
	        '</div>'+
	        '<div class="hui-speed-dial-text">行政办公(行政部)</div>';
			'</li>';
		hui('.hui-speed-dial ul').html(html);
		
		html += '<li>'+
		'<div class="hui-speed-dial-icons" onclick="send2Contract()">'+
            '<span class="icon iconfont '+icons[2]+'"></span>'+
        '</div>'+
        '<div class="hui-speed-dial-text">合同管理(合同管理部)</div>';
		'</li>';
		hui('.hui-speed-dial ul').html(html);
		
		html += '<li>'+
		'<div class="hui-speed-dial-icons" onclick="toHR()">'+
            '<span class="icon iconfont '+icons[3]+'"></span>'+
        '</div>'+
        '<div class="hui-speed-dial-text">人力服务(人力资源中心)</div>';
		'</li>';
		hui('.hui-speed-dial ul').html(html);
	
</script>



</body>

</html>
