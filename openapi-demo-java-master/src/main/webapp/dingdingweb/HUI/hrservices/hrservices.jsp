<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%@include file="/top.jsp"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection"/>
<meta content="yes" name="apple-touch-fullscreen"/>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta content="telephone=no,email=no" name="format-detection">
<meta name="wap-font-scale" content="no">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">

<title>人力服务</title>
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
	var icons = ["icon-tubiaolunkuo_huaban","icon-chaxun"];
	
	var html  = '';
// 	for(var i = 0; i < icons.length; i++){
		html += '<li>'+
			'<div class="hui-speed-dial-icons" onclick="apply()">'+
	            '<span class="icon iconfont '+icons[0]+'"></span>'+
	        '</div>'+
	        '<div class="hui-speed-dial-text">合同/档案借用申请</div>';
		'</li>';
		hui('.hui-speed-dial ul').html(html);
		
		html += '<li>'+
		'<div class="hui-speed-dial-icons" onclick="search()">'+
            '<span class="icon iconfont '+icons[1]+'"></span>'+
        '</div>'+
        '<div class="hui-speed-dial-text">合同/档案借用查询</div>';
	'</li>';
	hui('.hui-speed-dial ul').html(html);
// 	}

function apply(){
	var url="HrServices/Apply";
	var args='';
	var form=$("<form method='post'></form>");
	form.attr({"action":url});
	var input=$("<input type='hidden'>");
	input.attr({"name":"info"});
	input.val(args);
	form.append(input);
	$("html").append(form);
    form.submit();
	
}

function search(){
	var info = Encrypt($("#info").attr("value"));
	if (info == "") {
		alert("请稍等")
	} else {
		window.location = 'HrServices/toSearch?info='
				+ encodeURIComponent(info)
	}	
}
</script>

</body>
</html>