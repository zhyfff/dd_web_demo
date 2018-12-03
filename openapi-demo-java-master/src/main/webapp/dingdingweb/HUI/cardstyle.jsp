<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%@include file="/top2.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-W3CDTD HTML 4.01 TransitionalEN" "http:www.w3.org/TR/html4/loose.dtd">
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
<style type="text/css">
.hui-list {
	background-color: #F8F8FF;
	margin-top: 30px;
	margin-left: 10px;
	margin-right: 10px;
	margin-bottom: 10px;
	height: 200px;
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center;
	/* 	background-size: 120px 120px; */
	/* 	border:2px solid; */
	border-radius: 5px;
	-moz-border-radius: 25px; /* Old Firefox */
	box-shadow: 5px 5px 10px #888888;
}

.hui-media-content {
	background-image: url("dingdingweb/HUI/img/success.png");
	background-position: 80% 10%;
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: 120px 120px;
	border-radius: 5px;
}
</style>
<title>${name}的名片</title>
</head>
<body>

<div class="hui-list">
		<a style="height:auto; height:120px; padding-bottom:8px;">
			<div class="hui-list-icons" style="width:110px; height:80px;">
				<img src="${uimg}" style="width:66px; margin:0px; border-radius:50%;">
			</div>
			<div class="hui-list-text" style="height:79px; line-height:79px;">
		    	<div class="hui-list-text-content" style="font-size: 25px;color: #2F4F4F;">${name}</div>
		    </div>
		</a>
		<a style="margin-left: 20px;">
			 <div class="hui-list-text" >工号：${jobnumber} | 部门：${borrowde}</div>
		</a>
	</div>


	<div class="hui-form" style="margin-left: 10px;margin-right: 10px;border-radius: 5px;">
<!-- 				<div class="hui-form-items"> -->
<!--  					<div class="hui-form-items-title">工号</div> -->
<!--  					<input type="text" name="jobnumber" id="jobnumber" -->
<%--  						class="hui-input" value="${jobnumber}" readonly="readonly"> --%>
<!--  				</div> -->
				
<!--  				<div class="hui-form-items"> -->
<!--  					<div class="hui-form-items-title">姓名</div> -->
<!--  					<input type="text" name="name" id="name" class="hui-input" -->
<%--  						value="${name}" readonly="readonly"> --%>
<!--  				</div> -->
				
<!--  				<div class="hui-form-items"> -->
<!--  					<div class="hui-form-items-title">部门</div> -->
<!--  					<input type="text" name="borrowde" id="borrowde" -->
<%--  						class="hui-input" value="${borrowde}" readonly="readonly"> --%>
<!--  				</div> -->
				
 				<div class="hui-form-items">
 				<div class="hui-form-items-title">邮箱</div>
 				<input type="text" name="email" id="email"
 					class="hui-input" value="${email}" readonly="readonly">
 				</div>
				
 				<div class="hui-form-items">
 				<div class="hui-form-items-title">公司名称</div>
 				<input type="text" name="company" id="company"
 					class="hui-input" value="${company}" readonly="readonly">
 				</div>
				
 				<div class="hui-form-items">
 				<div class="hui-form-items-title">公司网址</div>
 				<input type="text" name="web" id="web"
 					class="hui-input" value="${web}" readonly="readonly">
 				</div>
				
 				<div class="hui-form-items">
 				<div class="hui-form-items-title">客服电话</div>
 				<input type="text" name="customertel" id="customertel"
 					class="hui-input" value="${customertel}" readonly="readonly">
 				</div>
		</div>



		
</body>
</html>