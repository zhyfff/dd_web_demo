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
<title>我的</title>
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
<!-- 				<div  align="center" style="height:auto; height:60px; padding-bottom:8px;"> -->
<%-- 					您当前在钉钉的userId为 : ${u.userid} --%>
					<input type="hidden" id="userid" value="${u.userid}">
					<input  type="hidden" id = "info" value="${userjson}">
					<input type="hidden" id="username" value="${u.name}">
<!-- 				</div> -->
			</c:forEach>
		</div>
	</header>
	
	<div class="hui-wrap">
	    <div style="padding:10px; margin-bottom: 50px;">
	    	<div class="hui-center-title" style="margin-top:15px;"><h1>帐号管理</h1></div>
			<div class="hui-speed-dial" id="account">
				<ul></ul>
			</div>
	   		<div class="hui-center-title" style="margin-top:15px;"><h1>行政办公</h1></div>
			<div class="hui-speed-dial" id="office">
				<ul></ul>
			</div>
			<div class="hui-center-title" style="margin-top:15px;"><h1>合同管理</h1></div>
			<div class="hui-speed-dial" id="contract">
				<ul></ul>
			</div>
			<div class="hui-center-title" style="margin-top:15px;"><h1>IT服务</h1></div>
			<div class="hui-speed-dial" id="ITservice">
				<ul></ul>
			</div>
			<div class="hui-center-title" style="margin-top:15px;"><h1>人力服务</h1></div>
			<div class="hui-speed-dial" id="hr">
				<ul></ul>
			</div>
	    </div>
	</div>
	
	
<script type="text/javascript">
	var icons = ["icon-hetongshenpi","icon-zizhanghaoguanli","icon-kuaidi","icon-yinzhang","icon-cheliangleixing","icon-mingpian","icon-iconset0147","icon-ziyuan"];
	
	
	var achtml='';
		achtml += '<li>'+
		'<div class="hui-speed-dial-icons" onclick="senduserjsontoaccount()">'+
	        '<span class="icon iconfont '+icons[1]+'"></span>'+
	    '</div>'+
	    '<div class="hui-speed-dial-text">密码设置</div>';
		'</li>';
		hui('#account ul').html(achtml);
	var html  = '';
		html += '<li>'+
		'<div class="hui-speed-dial-icons" onclick="senduserjsontomycourier()" >'+
            '<span class="icon iconfont '+icons[2]+'" id="myCourier"></span>'+
        '</div>'+
        '<div class="hui-speed-dial-text">快递</div>';
		'</li>';
		hui('#office ul').html(html);
		
		html += '<li>'+
		'<div class="hui-speed-dial-icons" onclick="myStamp()">'+
            '<span class="icon iconfont '+icons[3]+'" id="myStamp"></span>'+
        '</div>'+
        '<div class="hui-speed-dial-text">印章证照借用</div>';
		'</li>';
		hui('#office ul').html(html);
		
		
		html += '<li>'+
		'<div class="hui-speed-dial-icons" onclick="mycar()">'+
            '<span class="icon iconfont '+icons[4]+'" id="myApplyCar"></span>'+
        '</div>'+
        '<div class="hui-speed-dial-text">车辆借用</div>';
		'</li>';
		hui('#office ul').html(html);
		
		html += '<li>'+
		'<div class="hui-speed-dial-icons" onclick="mybussinessCard()">'+
            '<span class="icon iconfont '+icons[5]+'" id="myBusinessCard"></span>'+
        '</div>'+
        '<div class="hui-speed-dial-text">名片</div>';
		'</li>';
		hui('#office ul').html(html);
		
		html += '<li>'+
		'<div class="hui-speed-dial-icons" onclick="createcard()">'+
            '<span class="icon iconfont '+icons[6]+'" id="myCreateCard"></span>'+
        '</div>'+
        '<div class="hui-speed-dial-text">名片制作(前台)</div>';
		'</li>';
		hui('#office ul').html(html);
		
		var html2='';
		html2 += '<li>'+
		'<div class="hui-speed-dial-icons" onclick="senduserjsontoback()">'+
            '<span class="icon iconfont '+icons[0]+'" id="myContract"></span>'+
        '</div>'+
        '<div class="hui-speed-dial-text">合同借用</div>';
		'</li>';
		hui('#contract ul').html(html2);
		
		var html3='';
		html3+='<li>'+
			'<div class="hui-speed-dial-icons" onclick="hrtoback()">'+
		        '<span class="icon iconfont '+icons[0]+'" id="hrContract"></span>'+
		    '</div>'+
		    '<div class="hui-speed-dial-text">合同借用</div>';
			'</li>';
		hui('#hr ul').html(html3);
		
		var html='';
		html+='<li>'+
			'<div class="hui-speed-dial-icons" onclick="equipmentTobac()">'+
		        '<span class="icon iconfont '+icons[7]+'" id="equipment"></span>'+
		    '</div>'+
		    '<div class="hui-speed-dial-text">设备借用</div>';
			'</li>';
		hui('#ITservice ul').html(html);
	
</script>

	

</body>
</html>