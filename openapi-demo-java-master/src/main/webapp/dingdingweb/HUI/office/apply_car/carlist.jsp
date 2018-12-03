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
<style type="text/css">
 .hui-accordion-title{width:100%; margin:0 auto; text-align:left; border-bottom:1px solid #E3E3E3; height:100px; line-height:100px; font-size:17px; overflow:hidden; font-weight:400;} 
</style>
<script src="${basePath}dingdingweb/HUI/js/hui-popover-msg.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
$(document).ready(function(){
	hui.loading('加载中...');
	getcarlist();
})

function getcarlist(){
	$.ajax({
		url:'Office/ApplyCar/getCarList',
		type:'GET',
		dataType:'text',
		success:function(result){
			hui.closeLoading();
			var re = JSON.parse(JSON.stringify(result));
			var sl = JSON.parse(re).blist;
			for (var i = 0; i < sl.length; i++) {
				var id=sl[i].id;
// 				alert(id);
				var car_name=sl[i].car_name;
				var license_plate=sl[i].license_plate;
				var num=sl[i].num;
				var d_price=sl[i].d_price;
				var u_price=sl[i].u_price;
				var state=sl[i].state;
				var note=sl[i].note;
				var logo=sl[i].logo;
				
				var color='';
				if (state=="出库") {
					color="#DC143C";
				}else{
					color="#00FF7F";
				}
			
				
				var li = document.createElement("li");
				li.id='bu'+i;
				li.style.cssText="height:100px;"; 	
               	li.innerHTML=
	                        '<a href="javascript:hui.toast("'+car_name+'");" style="height:100px;">'+
	                            '<div class="hui-media-list-img"><img src="'+logo+'" style="width:80px; margin:0px;"/></div>'+
	                            '<div class="hui-media-content">'+
	                                '<h1>编号：'+id+'</h1>'+
	                                '<p>名称：'+car_name+'</p>'+
	    	                        '<p>状态：<span style="color:'+color+';font-weight:bold;">'+state+'</span></p>'+
	                            '</div>'+
	                        '</a>';
               	hui(li).appendTo('ul');	
				var menu ='<div class="car-content">'+
				
				'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">编号</div>'+
						'<input type="text" name="_id" id="_id" class="hui-input" value="'+id+'" readonly="readonly">'+
				'</div>'+
				
				'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">车名</div>'+
						'<input type="text" name="car_name" id="car_name" class="hui-input"  value="'+car_name+'" readonly="readonly">'+
				'</div>'+
				
				'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">车牌</div>'+
						'<input type="text" name="license_plate" id="license_plate" class="hui-input"  value="'+license_plate+'" readonly="readonly">'+
				'</div>'+
				
				'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">载客</div>'+
						'<input type="text" name="num" id="num" class="hui-input"  value="'+num+'" readonly="readonly">'+
				'</div>'+
				
				'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">每日租金</div>'+
						'<input type="text" name="d_price" id="d_price" class="hui-input"  value="'+d_price+'" readonly="readonly">'+
				'</div>'+
				
				'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">每公里租金</div>'+
						'<input type="text" name="u_price" id="u_price" class="hui-input"  value="'+u_price+'" readonly="readonly">'+
				'</div>'+
				
				'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">状态</div>'+
						'<input type="text" name="state" id="state" class="hui-input"  value="'+state+'" readonly="readonly">'+
				'</div>'+
				
				'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">备注</div>'+
						'<input type="text" name="note" id="note" class="hui-input"  value="'+note+'" readonly="readonly">'+
				'</div>'+
				'</div>';
			
			
				if (i>3) {
					hui('#bu'+i).popoverMsg('right', 'up', menu, 350, 200);	
				}else {
					hui('#bu'+i).popoverMsg('right', 'down', menu, 350, 200);
				}
				
			}
		},
		error:function(){
			
			alert("获取失败");
		}
		
	})
	
}
</script>
<title>车辆列表</title>
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
				<input  type="hidden" id ="info" value="${userjson}">
				<input type="hidden" id="username" value="${u.name}">
			</c:forEach>
		</div>
	</header>
	
	<div class="hui-wrap">
    <div id="refreshContainer" class="hui-refresh">
        <div class="hui-refresh-icon"></div>
        <div class="hui-refresh-content hui-list">
       		 <div class="hui-media-list" style="padding:10px;margin-bottom: 50px;">
       			 <ul>
            	
	          	</ul>
	          </div>
        </div>
    </div>
	</div>
	

</body>
</html>