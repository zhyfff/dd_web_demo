<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%@include file="/top3.jsp"%>
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
<script type="text/javascript">
function gettype(){
	$.ajax({
		url:'',
		type:'GET',
		dataType:'text',
		success:function(result){
			
			
		},
		error:function(){
			
		}
	})
}
</script>
<style type="text/css">
li {height:100px;}
</style>
<title>耗材仓库</title>
</head>
<body>
	<div class="hui-wrap" >
		<div id="refreshContainer" class="hui-refresh">
        <div class="hui-refresh-icon"></div>
        <div class="hui-refresh-content hui-list">
       		 <div class="hui-media-list" style="padding:10px;">
       			 <ul>
            		<li>
            			<a href="javascript:hui.toast('打印耗材');" style="height:100px;">
	                            <div class="hui-media-list-img"><img src="dingdingweb/HUI/img/shophome/printer.png" style="width:80px; margin:0px;"/></div>
	                            <div class="hui-media-content" onclick="ToConsumableList('打印耗材');">
	                                <h1>打印耗材</h1>
	                                <p>如激光打印机耗材，硒鼓;喷墨打印机耗材，墨盒;针式打印机耗材，色带</p>
	    	                        <p><span style="color:;font-weight:bold;"></span></p>
	                            </div>
	                        </a>
            		</li>
            		<li>
            			<a href="javascript:hui.toast('电脑耗材');" style="height:100px;">
	                            <div class="hui-media-list-img"><img src="dingdingweb/HUI/img/shophome/computer.png" style="width:80px; margin:0px;"/></div>
	                            <div class="hui-media-content" onclick="ToConsumableList('电脑耗材');">
	                                <h1>电脑耗材</h1>
	                                <p>如鼠标，键盘，音箱，耳麦，插座，电源等</p>
	    	                        <p><span style="color:;font-weight:bold;"></span></p>
	                            </div>
	                        </a>
            		</li>
            		<li>
            			<a href="javascript:hui.toast('印刷耗材');" style="height:100px;">
	                            <div class="hui-media-list-img"><img src="dingdingweb/HUI/img/shophome/printing.png" style="width:80px; margin:0px;"/></div>
	                            <div class="hui-media-content" onclick="ToConsumableList('印刷耗材');">
	                                <h1>印刷耗材</h1>
	                                <p>如油墨，版纸，及印刷设备配件等</p>
	    	                        <p><span style="color:;font-weight:bold;"></span></p>
	                            </div>
	                        </a>
            		</li>
            		<li>
            			<a href="javascript:hui.toast('输出介质');" style="height:100px;">
	                            <div class="hui-media-list-img"><img src="dingdingweb/HUI/img/shophome/paper.png" style="width:80px; margin:0px;"/></div>
	                            <div class="hui-media-content" onclick="ToConsumableList('输出介质');">
	                                <h1>输出介质</h1>
	                                <p>如彩喷纸，相片纸，背胶纸，卡纸，打印纸，复印纸，特殊用途纸等</p>
	    	                        <p><span style="color:;font-weight:bold;"></span></p>
	                            </div>
	                        </a>
            		</li>
            		<li>
            			<a href="javascript:hui.toast('手机周边耗材');" style="height:100px;">
	                            <div class="hui-media-list-img"><img src="dingdingweb/HUI/img/shophome/mobile.png" style="width:80px; margin:0px;"/></div>
	                            <div class="hui-media-content" onclick="ToConsumableList('手机周边耗材');">
	                                <h1>手机周边耗材</h1>
	                                <p>如屏保，膜，手机美容设备等</p>
	    	                        <p><span style="color:;font-weight:bold;"></span></p>
	                            </div>
	                        </a>
            		</li>
            		
	          	 </ul>
	          </div>
        </div>
    	</div>
	</div>

<script type="text/javascript">
function ToConsumableList(c){
	window.location ='ITServices/consumableList?c='+c;
}
</script>
</body>
</html>