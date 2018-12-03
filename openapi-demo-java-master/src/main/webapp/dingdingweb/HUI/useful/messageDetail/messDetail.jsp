<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%@include file="/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv=Content-Type content="text/html;charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta content="yes" name="apple-touch-fullscreen" />    
<meta name="data-spm" content="a215s" />
<meta content="telephone=no,email=no" name="format-detection" />    
<meta content="fullscreen=yes,preventMove=no" name="ML-Config" />
<link href="icon114-114.png" rel="apple-touch-icon-precomposed">
<link href="icon.png" rel="Shortcut Icon" type="image/x-icon" />
<script type="text/javascript">
	//在此拿到jsAPI权限验证配置所需要的信息
	var _config = <%= com.alibaba.dingtalk.openapi.demo.auth.AuthHelper.getConfig(request) %>;
</script>
<script type="text/javascript" src="${basePath}dingdingweb/HUI/useful/messageDetail/js/messageDetail.js"></script>
<script type="text/javascript" src="${basePath}dingdingweb/HUI/useful/messageDetail/js/messageDetail2.js"></script>
<script type="text/javascript">
$(document).ready(function (){
	
	hui.loading('加载中...');
	var ty = $("#type").attr("value");
	if (ty=="合同借用"){
		getContractMessageDetail();
	}else if(ty=="快递发放") {
		getCourierMessageDetail();
	}else if (ty=="车量申请") {
		getApplyCarMessageDetail();
	}else if (ty=="名片制作") {
		getBusinessCardDetail();
	}else if (ty=="印章证照") {
		getApplyStampMessageDetail();
	}else if(ty=="人力档案借用"){
		getApplyHrMessageDetail();
	}else if (ty=="耗材采购") {
		getconsumable_purDetail();
	}else if (ty=="设备借用") {
		getEBorrowing();
	}else if (ty=="耗材领用") {
		getConsumable_borrowingDetail();
		loadScript();
	}
})

</script>
<title>详情</title>
</head>
<body>


<header class="header">
		<div class="hui-list" align="center">
			<c:forEach items="${userinfoList}" var="u" varStatus="abc">
				<div  class="hui-list-icons" style="width:110px; height:80px;">
					<img id="userImg" alt="头像" src="${u.avatar}" style="width:66px; margin:0px; border-radius:50%;">
				</div>
				<div align="center" style="height:auto; height:40px; padding-bottom:8px;" id="userName">
					欢迎您 : ${u.name}
				</div>
					<input  type="hidden" id = "info" value="${userjson}">
					<input type="hidden" id="username" value="${u.name}">
					<input type="hidden" id="dcnumber" value="${dcnumber}">
					<input type="hidden" id="name" value="${name}">
					<input type="hidden" id="audit_name" value="${audit_name}">
					<input type="hidden" id="type" value="${type}">
					
			</c:forEach>
		</div>
	</header>


<div class="hui-wrap" style="padding-bottom: 50px;">
	<div id="list">
         
     </div>
</div>
<script type="text/javascript">

function loadScript(){
// 	alert("loadScript");
	var script=document.createElement("script");
	script.type="text/javascript";
	script.src="dingdingweb/HUI/itservices/consumable_borrowing/js/getdempartmentmember_pc.js";
	document.getElementsByTagName('head')[0].appendChild(script);
	var script=document.createElement("script");
	script.type="text/javascript";
	script.src="dingdingweb/HUI/itservices/consumable_borrowing/js/getDepartMentInfo.js";
	document.getElementsByTagName('head')[0].appendChild(script);
// 	var script=document.createElement("script");
// 	script.type="text/javascript";
// 	document.getElementsByTagName('head')[0].appendChild(script); 
// 	script.onload=function(){
// 		//在此拿到jsAPI权限验证配置所需要的信息
<%-- 		var _config = <%= com.alibaba.dingtalk.openapi.demo.auth.AuthHelper.getConfig(request) %>; --%>
// 		alert(_config);
// 	}
// 	if (os.isAndroid || os.isPhone) {
// 		var script=document.createElement("script");
// 		script.type="text/javascript";
// 		script.src="http://g.alicdn.com/dingding/open-develop/1.6.9/dingtalk.js";
// 		document.getElementsByTagName('head')[0].appendChild(script); 
// 		var script=document.createElement("script");
// 		script.type="text/javascript";
// 		script.src="dingdingweb/HUI/itservices/consumable_borrowing/js/getdempartmentmember.js";
// 		document.getElementsByTagName('head')[0].appendChild(script);
// 	// 	script.onload=function(){}//js加载完成执行方法
// 	}else {
// 		var script=document.createElement("script");
// 		script.type="text/javascript";
// 		script.src="https://g.alicdn.com/dingding/dingtalk-pc-api/2.7.0/index.js";
// 		document.getElementsByTagName('head')[0].appendChild(script); 
// 		var script=document.createElement("script");
// 		script.type="text/javascript";
// 		script.src="dingdingweb/HUI/itservices/consumable_borrowing/js/getdempartmentmember_pc.js";
// 		document.getElementsByTagName('head')[0].appendChild(script);
// 	// 	script.onload=function(){}
// 	}
}
</script>
</body>
</html>