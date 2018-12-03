<%-- <%@page import="Hisign.controller.util.SessionHelper"%> --%>
<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setAttribute("basePath", basePath);
request.setAttribute("path", path);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- jquery引入 -->
<script type="text/javascript" src="${basePath}dingdingweb/public/js/jquery/jquery.js"></script>
<script type="text/javascript" src="${basePath}dingdingweb/public/js/jquery/jquery.cookie.js"></script> 
<script type="text/javascript">var basePath='${basePath}';</script>
<link rel="stylesheet" type="text/css" href="${basePath}dingdingweb/HUI/css/hui.css" />
<link rel="stylesheet" type="text/css" href="${basePath}dingdingweb/HUI/css/font_kn57agctpf/iconfont.css">
<script src="${basePath}dingdingweb/HUI/js/hui.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="${basePath}dingdingweb/HUI/js/hui-form.js"></script>
<script type="text/javascript" src="${basePath}dingdingweb/HUI/js/hui-accordion.js"></script>
<script type="text/javascript" src="${basePath}dingdingweb/public/js/crypto-js/crypto-js.js"></script>
<script type="text/javascript" src="${basePath}dingdingweb/HUI/js/datepicker-zh-CN.js"></script>

<script type="text/javascript">
	hui.ready(function() {
		hui.accordion(true, false);
		var name=$("#username").attr("value");
		var userid = $("#userid").attr("value");
		getTodoPointMsg(name);
		getMyPointMsg(name,userid);
	});
	var os = function() {
	    var ua = navigator.userAgent,
	    isWindowsPhone = /(?:Windows Phone)/.test(ua),
	    isSymbian = /(?:SymbianOS)/.test(ua) || isWindowsPhone, 
	    isAndroid = /(?:Android)/.test(ua), 
	    isFireFox = /(?:Firefox)/.test(ua), 
	    isChrome = /(?:Chrome|CriOS)/.test(ua),
	    isTablet = /(?:iPad|PlayBook)/.test(ua) || (isAndroid && !/(?:Mobile)/.test(ua)) || (isFireFox && /(?:Tablet)/.test(ua)),
	    isPhone = /(?:iPhone)/.test(ua) && !isTablet,
	    isPc = !isPhone && !isAndroid && !isSymbian;
	    return {
	         isTablet: isTablet,
	         isPhone: isPhone,
	         isAndroid : isAndroid,
	         isPc : isPc
	    };
	}();	
	
</script>
<script type="text/javascript" src="${basePath}dingdingweb/HUI/useful/js/Useful.js"></script>
<%-- <script type="text/javascript" src="${basePath}dingdingweb/HUI/rlfw/js/Useful.js"></script> --%>

</head>

<body>
	<div id="hui-footer">
	   
	    <a href="javascript:toHome()" id="nav-home">
	        <div class="hui-footer-icons hui-icons-home"></div>
	        <div class="hui-footer-text">首页</div>
	    </a>
	     <a href="javascript:toMessage()" id="nav-message">
	        <div class="hui-footer-icons hui-icons-news"></div>
	        <div class="hui-footer-text">消息</div>
	    </a>
<!-- 	    <div style="width:20%; text-align:center;"> -->
<!-- 	        &nbsp; -->
<!-- 	    </div> -->
	    
	    <div style="width:20%; text-align:center; " class="hui-fl">
        	<img src="${basePath}dingdingweb/HUI/img/Hisign.png" style="margin:0px; border-radius:50%;" height="44" onclick="hui.back();" />
  		</div>
	    <a href="javascript:toFeedback()" id="nav-forum">
	        <div class="hui-footer-icons hui-icons-forum"></div>
	        <div class="hui-footer-text">反馈</div>
	    </a>
	     <a href="javascript:toMy()" id="nav-my">
	        <div class="hui-footer-icons hui-icons-my"></div>
	        <div class="hui-footer-text">我的</div>
	    </a>
	    
	</div>
<!-- 	<div id="footer-logo"> -->
<%-- 		<img src="${basePath}dingdingweb/HUI/img/Hisign.png" /> --%>
		
<!-- 	</div> -->

<script type="text/javascript">

function getTodoPointMsg(name){
	
	hui('#nav-message').removePointMsg();
	
// 	alert(name);
	$.ajax({
		url:'SearchPointMsg/PointMsg?name='+encodeURIComponent(name),
		type:'GET',
		dataType:'text',
		success:function (result){
			var count = result;	
			if (count!=0) {
				hui('#nav-message').pointMsg(parseInt(count), null, '2px', null, '1px');
			}
		},
		error:function(){
			alert("信息数量获取失败");
		}
	})
}

function getCourierPointMsg(name){
	var count =0;
	$.ajax({
		url:'SearchPointMsg/CourierPointMsg?name='+encodeURIComponent(name),
		type:'GET',
		async:false,
		dataType:'text',
		success:function (result){
			count = result;
			if (count!=0) {
				hui('#myCourier').pointMsg(parseInt(count), null, null, null, '1px');
			}
			
		},
		error:function (){
			alert("获取快递领取确认数量信息失败");
		}
	})
	return count
}

function getMyContractPointMsg(name){
	var count =0;
	$.ajax({
		url:'SearchPointMsg/MyContractPointMsg?name='+encodeURIComponent(name),
		type:'GET',
		dataType:'text',
		async:false,
		success:function(result){
			count = result;
			if (count!=0) {
				hui('#myContract').pointMsg(parseInt(count), null, null, null, '1px');
			}
		},
		error:function(){
			alert("获取我的合同借用数量信息失败")
		}
	})
	return count
}

function getMyCarPointMsg(name){
	var count =0;
	$.ajax({
		url:'SearchPointMsg/getMyCarPonintMsg?name='+encodeURIComponent(name),
		type:'GET',
		dataType:'text',
		async:false,
		success:function(result){
			count = result;
			if (count!=0) {
				hui('#myApplyCar').pointMsg(parseInt(count), null, null, null, '1px');
			}
		},
		error:function(){
			alert("获取我的车辆借用数量信息失败")
		}
	})
	return count
}

function getMyBusinessCardPointMsg(name){
	var count=0;
	$.ajax({
		url:'SearchPointMsg/getMyBusinessCardPointMsg?name='+encodeURIComponent(name),
		type:'GET',
		dataType:'text',
		async:false,
		success:function(result){
			count = result;
			if (count!=0) {
				hui('#myBusinessCard').pointMsg(parseInt(count), null, null, null, '1px');
			}
		},
		error:function(){
			alert("获取我的快递数量信息失败");
		}
	})
	return count
}

	function getCreateCardPointMsg(name){
		var count=0;
		$.ajax({
			url:'SearchPointMsg/getCreateCardPointMsg?name='+encodeURIComponent(name),
			type:'GET',
			dataType:'text',
			async:false,
			success:function(result){
				count = result;
				if (count!=0) {
					hui('#myCreateCard').pointMsg(parseInt(count), null, null, null, '1px');
				}
			},
			error:function(){
				alert("获取名片制作数量信息失败");
			}
		})
		return count
	}
	
	function getMyStampPointMsg(name){
		var count=0;
		$.ajax({
			url:'SearchPointMsg/getMyStampPointMsg?name='+encodeURIComponent(name),
			type:'GET',
			dataType:'text',
			async:false,
			success:function(result){
				count = result;
				if (count!=0) {
					hui('#myStamp').pointMsg(parseInt(count), null, null, null, '1px');
				}
			},
			error:function(){
				alert("获取印章证照数量信息失败");
			}
		})
		return count
	}
	
	
	function getMyHrContractPointMsg(userid){
		var count=0;
		$.ajax({
			url:'SearchPointMsg/getMyHrContractPointMsg?userid='+encodeURIComponent(userid),
			type:'GET',
			dataType:'text',
			async:false,
			success:function(result){
				count = result;
				if (count!=0) {
					hui('#hrContract').pointMsg(parseInt(count), null, null, null, '1px');
				}
			},
			error:function(){
				alert("获取人力档案借用数量信息失败");
			}
		})
		return count
	}
	
	function getMyEBorrow(userid){
		var count=0;
		$.ajax({
			url:'SearchPointMsg/getMyEBorrowPointMsg?userid='+encodeURIComponent(userid),
			type:'GET',
			dataType:'text',
			async:false,
			success:function(result){
				count = result;
				if (count!=0) {
					hui('#equipment').pointMsg(parseInt(count), null, null, null, '1px');
				}
			},
			error:function(){
				alert("获取我的设备借用信息数量失败")
			}
		})
		return count
	}

	function getMyPointMsg(name,userid){
		hui('#nav-my').removePointMsg();
		var count = parseInt(getCourierPointMsg(name))

				+ parseInt(getMyContractPointMsg(name))
				+ parseInt(getMyCarPointMsg(name))
				+ parseInt(getMyBusinessCardPointMsg(name))
				+ parseInt(getCreateCardPointMsg(name))
				+ parseInt(getMyStampPointMsg(name))
				+ parseInt(getMyHrContractPointMsg(userid))
				+ parseInt(getMyEBorrow(userid));
// 				alert(count);
		if (count != 0) {

			hui('#nav-my').pointMsg(count, null, '2px', null, '1px');
		}

	}

	//  	hui.ready(function(){
	//  	    hui.accordion(true, true);
	//  		hui('#nav-my').pointMsg();
	//  		hui('#nav-news').pointMsg('hot', null, null, null, '1px');
	//  		hui('#nav-forum').pointMsg('');
	//  	});

	function toHome() {
		
		var info = Encrypt($("#info").attr("value"))
		window.location = '${basePath}Home?info='
			+ encodeURIComponent(info);
	}

	//跳转到‘消息’
	function toMessage() {
		var info = Encrypt($("#info").attr("value"));
// 		alert(info);
		if (info == "") {
			alert("请稍等")
		} else {
			window.location = '${basePath}Message?info='
					+ encodeURIComponent(info)
		}
		
// 		$.post("${basePath}Message", { info: $("#info").attr("value")});
		

	}
	//跳转‘反馈’页面
	function toFeedback() {
		var info = $("#info").attr("value")
		if (info == "") {
			alert("请稍等")
		} else {
			window.location = '${basePath}Feedback?info='
					+ encodeURIComponent(info)
		}
	}

	//跳转到‘我的’页面
	function toMy() {
		var info = Encrypt($("#info").attr("value"));
		//  		alert(info);
		if (info == "") {
			alert("请稍等")
		} else {
			window.location = '${basePath}My?info=' + encodeURIComponent(info)
		}
	}
	
</script>

</body>
</html>
