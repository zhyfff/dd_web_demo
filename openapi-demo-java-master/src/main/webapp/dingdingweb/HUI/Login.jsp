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
<title>登录</title>
<script type="text/javascript" src="${basePath}dingdingweb/HUI/js/components/core-min.js"></script>
<script type="text/javascript" src="${basePath}dingdingweb/HUI/js/rollups/hmac-md5.js"></script>
<script type="text/javascript" src="${basePath}dingdingweb/HUI/useful/js/Useful.js"></script>
<style type="text/css">
.body{background-image: url("${basePath}dingdingweb/HUI/img/rigologin-bg.png");}
</style>
</head>
<body>
	<div class="hui-wrap">
		<div class="hui-center-title" style="margin-top:55px;"><h1 style="border:0px;">用户登录</h1></div>
		<form style="margin:20px 10px; margin-bottom:15px;" class="hui-form" id="save"
			name="save" onsubmit="return false;">
			<div class="hui-form-items">
					<div class="hui-form-items-title">工号(帐号):</div>
					<input type ="text" id ="borrowid" class="hui-input" name="borrowid">
			</div>

			<div class="hui-form-items">
				<div class="hui-form-items-title">密码:</div>
				<input type="password" placeholder="登录密码" checktype="string"
					class="hui-input hui-pwd-eye" checkmsg="密码应为6到20个字符"
					checkdata="6,20" id="pwd" name="pwd">
				<div class="hui-pwd-eyes   " onclick="hui.eyesChange(this);"></div>
			</div>
			<div style="padding:10px; padding-top:10px;">
				<input type="submit" class="hui-button hui-button-large hui-primary"
					onclick="Login()" id="submitBtn" value="登录">
			</div>

		</form>
	</div>
</body>

</html>