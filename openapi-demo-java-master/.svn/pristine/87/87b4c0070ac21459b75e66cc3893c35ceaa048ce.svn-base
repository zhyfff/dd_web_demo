<!DOCTYPE html>
<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%@include file="/top.jsp"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<title>IT服务支持</title>
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
	  	<div  align="center" style="height:auto; height:60px; padding-bottom:8px;">
				<!--您当前在钉钉的userId为 : ${u.userid}-->
				<input  type="hidden" id = "info" value="${userjson}">
			</div>	
			
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
		function newAddtInfo() {
			window.location ='${basePath}Service/toStandBy.do?info='+encodeURIComponent($("#info").attr("value"))
		}
		function newSelelectInfo(){
			window.location ='${basePath}Service/toFind.do?info='+encodeURIComponent($("#info").attr("value"))
		}
		function newTounInfo(){
			window.location ='${basePath}Service/toundone.do?info='+encodeURIComponent($("#info").attr("value"))
		}
		function newTodoInfo(){
			window.location ='${basePath}Service/todone.do?info='+encodeURIComponent($("#info").attr("value"))
		}
</script>

<script type="text/javascript">
	var icons = ["hui-icons-news","hui-icons-search"];
	
	var html  = '';
		html += '<li>'+
			'<div class="hui-speed-dial-icons" onclick="newAddtInfo()">'+
	            '<span class="hui-icons '+icons[0]+'"></span>'+
	        '</div>'+
	        '<div class="hui-speed-dial-text">'+icons[0].replace('hui-icons-', '')+'</div>';
		'</li>';
		hui('.hui-speed-dial ul').html(html);
		
		html += '<li>'+
		'<div class="hui-speed-dial-icons" onclick="newSelelectInfo()">'+
            '<span class="hui-icons '+icons[1]+'"></span>'+
        '</div>'+
        '<div class="hui-speed-dial-text">'+icons[1].replace('hui-icons-', '')+'</div>';
	'</li>';
	hui('.hui-speed-dial ul').html(html);
	
/*	html += '<li>'+
	'<div class="hui-speed-dial-icons" onclick="senduserjsontomyapply()">'+
        '<span class="hui-icons '+icons[0]+'"></span>'+
    '</div>'+
    '<div class="hui-speed-dial-text">合同借用申请</div>';
	'</li>';
hui('.hui-speed-dial ul').html(html);
	
	
    html += '<li>'+
	'<div class="hui-speed-dial-icons" onclick="newTodoInfo()">'+
    '<span class="hui-icons '+icons[0]+'"></span>'+
	'</div>'+
	'<div class="hui-speed-dial-text">查询已完成申请</div>';
	'</li>';
	hui('.hui-speed-dial ul').html(html);*/
	
  
// 	}
</script>
	
</body>
</html>