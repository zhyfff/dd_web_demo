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
<title>联系人</title>

<script type="text/javascript">
	$(document).ready(function(){
		getDepartmentList();
	})
	
	function getDepartmentList(){
		$.ajax({
			url:"/Department/getDepartmentlist",
			type:"POST",
			dateType:"text",
			success:function(data){
				var d = JSON.parse(data);
				var html='';
				for (var i = 0; i < d.length; i++) {
					var name = d[i].name;
					var did = d[i].id;
					var pid = d[i].parentid;
					html+=	'<li>'+
			    			'<a href="javascript:toDepartuserDetail('+did+');">'+
					    		'<div class="hui-list-text">'+
					    			'<div class="hui-list-text-content">'+name+'</div>'+
					    			'<div class="hui-list-info">'+
					    				'<span class="hui-icons hui-icons-right"></span>'+
					    			'</div>'+
					    		'</div>'+
					    	'</a>'+
			    			'</li>';
				
				hui('.hui-wrap .hui-list ul').html(html);
				}
			},
			error:function(){
				alert("异常");
			}
		})
	}
	
	function toDepartuserDetail(did){
		window.location="/Userlist?did="+did+"&pathname="+$("#pathname").attr("value");
	}
	
</script>

</head>
<body>
	<div class="hui-wrap">
		 <div class="hui-list" style="margin-top:22px;">
	    	<ul>
	    	</ul>
    	</div>
	</div>
</body>

</html>