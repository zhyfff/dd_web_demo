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
<!-- <!-- <style type="text/css"> -->
<!-- /* 	.message-dail{width:100%;} */ -->
<!-- /* 	.message-dail li{width:33%; text-align:center; float:left; margin-top:25px;} */ -->
<!-- /* 	.message-dail-icons{text-align:center; height:60px;} */ -->
<!-- /* 	.message-dail-text{text-align:center; line-height:19px; height:20px;} */ -->
<!-- /* 	.message-dail-icons span{font-size:45px; color:#656B79;} */ -->
<!-- <!-- </style> -->
<style type="text/css">
.hui-tab-item{border:0px;}
#hui-load-more {margin-bottom: 50px;}
</style>
<script type="text/javascript" src="${basePath}dingdingweb/HUI/useful/js/getmessage.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	getmessage_todo();
	getmessage_havedeal();
	hui.loadMore(active());
})
</script>
<title>消息</title>
</head>
<%-- ${sessionScope['org.springframework.web.servlet.support.SessionFlashMapManager.FLASH_MAPS'][0]['userinfoList']} --%>
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

					<input type="hidden" id="isAdmin" value="${u.isAdmin}">
					<input  type="hidden" id = "info" value="${userjson}">
					<input type="hidden" id="username" value="${u.name}">
				
			</c:forEach>
		</div>
	</header>
	
	<div class="hui-wrap">
		
        <div class="hui-tab">
            <div class="hui-tab-title">
                <div>待办</div>
                <div>已处理</div>
            </div>
            <div class="hui-tab-body">
            	<div class="hui-tab-body-items">
	            	
				           <div class="hui-tab-item hui-list" >
				           		<div id="refreshContainer" class="hui-refresh">
						        <div class="hui-refresh-icon"></div>
						        <div class="hui-refresh-content hui-list">   
					                <div id="todo">
					                </div>
				                </div>
				                </div>
				   		 	</div>
				           	
		          		
		               	 	
		               	 	<div class="hui-tab-item hui-list" >
			                    <div id="refreshContainer" class="hui-refresh">
						        <div class="hui-refresh-icon"></div>
						        <div class="hui-refresh-content hui-list">   
					                <div id="havedeal">
					                </div>
				                </div>
				                </div>
			                </div>
				    </div>
				   
		             
	            
            </div>
        </div>
   </div>

<script type="text/javascript" src="${basePath}dingdingweb/HUI/useful/js/hui-refresh-load-more.js"></script>

<script type="text/javascript" src="${basePath}dingdingweb/HUI/useful/js/getMoreMessage.js"></script>
<script src="${basePath}dingdingweb/HUI/useful/js/hui-tab.js" type="text/javascript"></script>

<script type="text/javascript">
function active(){
	var loadtext;
	if ($(".hui-tab-active").text()=="待办") {
		loadtext = nextTodoPage;
// 		alert(loadtext);
		
	}else{
		loadtext=nexthavedealPage
// 		alert(loadtext);
	}
	return loadtext;
}


</script>
<script type="text/javascript">
hui.tab('.hui-tab');
</script>	

<!-- 	<div class="hui-wrap"> -->
<!-- 	    <div style="padding:10px;"> -->
<!-- 			<div class="hui-speed-dial"> -->
<!-- 				<ul></ul> -->
<!-- 			</div> -->
<!-- 	    </div> -->
<!-- 	</div> -->


<!-- <script type="text/javascript"> -->

<!-- // var isAdmin=$("#isAdmin").attr("value"); -->
<!-- // var icons = ["hui-icons-success","hui-icons-eyes","hui-icons-check","hui-icons-forum"]; -->
<!-- // var html  = ''; -->
<!-- // html += '<li>'+ -->
<!-- // 	'<div class="hui-speed-dial-icons" onclick="mysend()">'+ -->
<!-- //         '<span class="hui-icons '+icons[0]+'"></span>'+ -->
<!-- //     '</div>'+ -->
<!-- //     '<div class="hui-speed-dial-text">我发出的</div>'; -->
<!-- // 	'</li>'; -->
<!-- // hui('.hui-speed-dial ul').html(html); -->

<!-- // // if (isAdmin==true) { -->
<!-- // 	html += '<li>'+ -->
<!-- // 	'<div class="hui-speed-dial-icons" onclick="myaudit()">'+ -->
<!-- // 	    '<span class="hui-icons '+icons[0]+'"></span>'+ -->
<!-- // 	'</div>'+ -->
<!-- // 	'<div class="hui-speed-dial-text">我的审批</div>'; -->
<!-- // 	'</li>'; -->
<!-- // 	hui('.hui-speed-dial ul').html(html); -->
<!-- // // } -->



<!-- // //跳转到我发出的 -->
<!-- // 	function mysend(){ -->
<!-- // 		var info =$("#info").attr("value"); -->
<!-- // 		if (info=="") { -->
<!-- // 		alert("请稍等") -->
<!-- // 	}else { -->
<%-- // 		window.location='${basePath}Office/Useful/toMySend?info='+encodeURIComponent(info); --%>
<!-- // 	} -->
<!-- // 	} -->

<!-- // 	var icons = ["hui-icons-success","hui-icons-eyes","hui-icons-check"]; -->

<!-- // //跳转到我的审批 -->
<!-- // 	function myaudit(){ -->
<!-- // 		var info =$("#info").attr("value"); -->
<!-- // 		if (info=="") { -->
<!-- // 		alert("请稍等") -->
<!-- // 	}else { -->
<%-- // 		window.location='${basePath}Office/Useful/toMyAudit?info='+encodeURIComponent(info); --%>
<!-- // 	} -->
<!-- // 	} -->
<!-- </script> -->

</body>
</html>