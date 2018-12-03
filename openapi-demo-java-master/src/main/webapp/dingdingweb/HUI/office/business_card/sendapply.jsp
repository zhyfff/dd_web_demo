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
<title>提出申请</title>
<script type="text/javascript">
	//在此拿到jsAPI权限验证配置所需要的信息
	var _config = <%= com.alibaba.dingtalk.openapi.demo.auth.AuthHelper.getConfig(request) %>;
</script>
<script type="text/javascript" src="http://g.alicdn.com/dingding/open-develop/1.6.9/dingtalk.js"></script>
<script type="text/javascript" src="https://g.alicdn.com/dingding/dingtalk-pc-api/2.7.0/index.js"></script>
<%-- <script type="text/javascript" src="${basePath}dingdingweb/HUI/office/business_card/js/business_card.js"></script> --%>
<script type="text/javascript">
$(document).ready(function (){
	loadScript();
})

function loadScript(){
	if (os.isAndroid || os.isPhone) {
		var script=document.createElement("script");
		script.type="text/javascript";
		script.src="dingdingweb/HUI/office/business_card/js/business_card.js";
		document.getElementsByTagName('head')[0].appendChild(script); 
	// 	script.onload=function(){}//js加载完成执行方法
	}else {
		var script=document.createElement("script");
		script.type="text/javascript";
		script.src="dingdingweb/HUI/office/business_card/js/business_card_pc.js";
		document.getElementsByTagName('head')[0].appendChild(script); 
	// 	script.onload=function(){}
	}
}
</script>
</head>
<body>
	<header class="header">
		<div class="hui-list" align="center">
				<div  class="hui-list-icons" style="width:110px; height:80px;">
					<img id="userImg" alt="头像" src="${basePath}dingdingweb/HUI/img/head.png" style="width:66px; margin:0px; border-radius:50%;">
				</div>
				<div align="center" style="height:auto; height:40px; padding-bottom:8px;" id="userName">
					欢迎您 : 
				</div>
				<input type="hidden" id="userid">
				<input type="hidden" id ="info">
				<input type="hidden" id="username">
				
		</div>
	</header>
	
	<div class="hui-wrap" >
		<form style="padding: 28px 10px;" id="sendapply" name="sendapply" class="hui-form" onsubmit="return false;">
			<input type ="hidden" id ="jobnumber" class="hui-input" name="jobnumber" >
			<input type ="hidden" id ="name" class="hui-input" name="name">
			<input type ="hidden" id ="borrowde" class="hui-input" name="borrowde">
			<input type ="hidden" id = "email" class="hui-input" name="email">
			<input type="hidden" id="uimg" class="hui-input" name="uimg">
			
			<div class="hui-form-items">
				<div class="hui-form-items-title">公司名称</div>
				<select id="company" name="company" class="company" >
					<option value="海鑫科金(大连)智能有限公司">海鑫科金(大连)智能有限公司</option>
					<option value="海鑫科金(大连)智能有限公司">海鑫科金(大连)智能有限公司</option>
				</select>
			</div>
			
			<div class="hui-form-items">
				<div class="hui-form-items-title">公司网址</div>
				<select id="web" name="web" class="web" >
					<option value="hisign.com.cn">hisign.com.cn</option>
					<option value="hisign.com.cn">hisign.com.cn</option>
				</select>
			</div>
			
			<div class="hui-form-items">
				<div class="hui-form-items-title">客服电话</div>
				<select id="customertel" name="customertel" class="customertel" >
					<option value="400-885-7785">400-885-7785</option>
					<option value="400-885-7785">400-885-7785</option>
				</select>
			</div>
			
			<div class="hui-form-items">
				<div class="hui-form-items-title">申请数量</div>
				<select id="num" name="num" class="num" >
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
				</select>
			</div>
			
			<div class="hui-form-items">
					<div class="items-title" style="width:50%; line-height:40px; height:40px; flex-shrink:0;">审批人姓名</div>
					<input type ="hidden" id ="audit-name" class="hui-input" name="audit-name" required="required" >	
					<img alt="头像" src="${basePath}dingdingweb/HUI/img/add.png" style="height:40px;width:40px; margin:0px; border-radius:50%;" onclick="to2(this)" id="audit-img">	
			</div>
			
			<div style="padding:15px 30px 50px 10px; ">
					<div class="hui-form-items-title"></div>
					<input type = "submit" id = "submit" value ="提交申请" class="hui-button hui-primary hui-fr" onclick="sendDing()">
			</div>
			
		</form>	
	</div>

<script type="text/javascript">

	function sendDing(){
		if (myCheck()==true) {
			ding();
		}
		return false;
	}
	function myCheck()
    {//循环所有的表单元素； 也可以用jQuery：$("#表单id")[0].elements.length-1
       for(var i=0;i<document.sendapply.elements.length-1;i++) //下面减一是因为数组的下标为0
       {	
          if(document.sendapply.elements[i].value=="")
          {
             alert("当前表单不能有空项");
             document.sendapply.elements[i].focus();
             return false;
          }
       }
       return true;
      
    }
	

	function registered() {
			
		if (myCheck()==true) {
			$.ajax({
				url : "${basePath}SaveBusinessCard/toBase",
				data : $("#sendapply").serialize(),
				dataType : "text",
				type : "POST",
				success : function(data) {
					hui.iconToast(data, 'success');
					window.location.reload();//刷新当前页
					if (data=='失败') {
						hui.iconToast(data, 'error');
					}
				},
				error : function() {
					hui.iconToast(data, 'error');
				}
			})
		}	
		return false;
	}
	
	</script>

</body>
</html>