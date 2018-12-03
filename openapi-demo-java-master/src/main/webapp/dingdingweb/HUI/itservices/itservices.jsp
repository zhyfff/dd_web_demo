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
<title>IT服务</title>
</head>
<body>
<header class="header">
		<div class="hui-list" align="center">
			<c:forEach items="${userinfoList}" var="u" varStatus="abc">
				<div  class="hui-list-icons" style="width:110px; height:80px;">
					<img id="userImg" alt="头像" src="${u.avatar}" style="width:66px; margin:0px; border-radius:50%;">
				</div>
				<div align="center" style="height:auto; height:40px; padding-bottom:8px;">
					欢迎您 : ${u.name}
				</div>
					<input  type="hidden" id = "info" value="${userjson}">
					<input type="hidden" id="username" value="${u.name}">
			</c:forEach>
		</div>
</header>
<div class="hui-wrap">
	    <div style="padding:10px;">
			<div class="hui-speed-dial">
				<ul></ul>
			</div>
	    </div>
</div>
<script type="text/javascript">
	var icons = ["icon-haocaigoumai","icon-registration","icon-gudingzichan","icon-ziyuan"];
	var html  = '';
		html += '<li>'+
			'<div class="hui-speed-dial-icons" onclick="consumable()">'+
	            '<span class="icon iconfont '+icons[0]+'"></span>'+
	        '</div>'+
	        '<div class="hui-speed-dial-text">耗材采购</div>';
			'</li>';
		hui('.hui-speed-dial ul').html(html);
		
		html += '<li>'+
			'<div class="hui-speed-dial-icons" onclick="consumBorrow()">'+
	            '<span class="icon iconfont '+icons[1]+'"></span>'+
	        '</div>'+
	        '<div class="hui-speed-dial-text">耗材领用</div>';
			'</li>';
		hui('.hui-speed-dial ul').html(html);
		
		html += '<li>'+
			'<div class="hui-speed-dial-icons" onclick="Fixedassetstoapplyfor()">'+
	            '<span class="icon iconfont '+icons[2]+'"></span>'+
	        '</div>'+
	        '<div class="hui-speed-dial-text">固定资产申请</div>';
			'</li>';
		hui('.hui-speed-dial ul').html(html);
		
		html += '<li>'+
			'<div class="hui-speed-dial-icons" onclick="eborrowing()">'+
	            '<span class="icon iconfont '+icons[3]+'"></span>'+
	        '</div>'+
	        '<div class="hui-speed-dial-text">设备借用</div>';
			'</li>';
		hui('.hui-speed-dial ul').html(html);
	
		
		function consumable(){
			var info = Encrypt($("#info").attr("value"));
			if (info == "") {
				alert("请稍等")
			} else {
				window.location = 'ITServices/cou_pur?info='
						+ encodeURIComponent(info)
			}	
		}
		
		function eborrowing(){
			var info = Encrypt($("#info").attr("value"));
			if (info == "") {
				alert("请稍等")
			} else {
				window.location = 'ITServices/ToEBorrowing?info='
						+ encodeURIComponent(info)
			}	
		}
		
		function consumBorrow(){
			var info = Encrypt($("#info").attr("value"));
			if (info == "") {
				alert("请稍等")
			} else {
				window.location = 'ITServices/ToConsumableBorrow?info='
						+ encodeURIComponent(info)
			}
		}
		
		function Fixedassetstoapplyfor(){
			var info = Encrypt($("#info").attr("value"));
			if (info == "") {
				alert("请稍等")
			} else {
				window.location = 'ITServices/Fixedassets/ToFixedassets?info='
						+ encodeURIComponent(info)
			}
		}
</script>

</body>
</html>