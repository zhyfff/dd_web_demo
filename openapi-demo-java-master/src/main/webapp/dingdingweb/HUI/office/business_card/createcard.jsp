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
<title>名片制作</title>
<script type="text/javascript">
	//在此拿到jsAPI权限验证配置所需要的信息
	var _config = <%= com.alibaba.dingtalk.openapi.demo.auth.AuthHelper.getConfig(request) %>;
</script>
<script type="text/javascript" src="http://g.alicdn.com/dingding/open-develop/1.6.9/dingtalk.js"></script>
<script type="text/javascript" src="https://g.alicdn.com/dingding/dingtalk-pc-api/2.7.0/index.js"></script>
<script type="text/javascript" src="${basePath}dingdingweb/HUI/office/business_card/js/business_card.js"></script>
<script type="text/javascript" src="${basePath}dingdingweb/public/js/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${basePath}dingdingweb/public/js/jquery/qrcode.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	hui.loading('加载中...');
	loadScript();
})

function loadScript(){
	if (os.isAndroid || os.isPhone) {
		var script=document.createElement("script");
		script.type="text/javascript";
		script.src="dingdingweb/HUI/office/business_card/js/business_card.js";
		document.getElementsByTagName('head')[0].appendChild(script); 
	// 	script.onload=function(){}//js加载完成执行方法
	}else {
		var script=document.createElement("script");
		script.type="text/javascript";
		script.src="dingdingweb/HUI/office/business_card/js/business_card_pc.js";
		document.getElementsByTagName('head')[0].appendChild(script); 
	// 	script.onload=function(){}
	}
}

function getCardInfor(){
		
		$.ajax({
			url:'${basePath}Office/BusinessCard/needcreatecard?desk='+$("#userName").text()+'&pageNum=1',
			type:'GET',
			dataType:'text',
			success:function(result){
				hui.closeLoading();
				var re = JSON.parse(JSON.stringify(result));
// 				alert(re);
		    	var blist = JSON.parse(re).blist;
// 		    	var html='';
		    	for (var i = 0; i < blist.length; i++) {
		    		var uimg = blist[i].uimg;
		    		var dcnumber = blist[i].dcnumber;
// 		     		alert(dcnumber);
					var jobnumber = blist[i].jobnumber;
		    		var name = blist[i].name; 
					var borrowde = blist[i].borrowde;
					var email =blist[i].email;
					var company=blist[i].company;
					var web =blist[i].web;
					var customertel=blist[i].customertel;
					var num=blist[i].num;
					var audit_name=blist[i].audit_name;
					var audit_opinion=blist[i].audit_opinion;
					var audit_time=blist[i].audit_time;
					var audit_type=blist[i].audit_type;
					var desk=blist[i].desk;
					var lq=blist[i].lq;
					var s='';
					if (lq==null) {
						s='需要制作';
					}else{
						s='已制作';
					}
					var imgurl='';
					if (s=='需要制作') {
						imgurl='dingdingweb/HUI/img/typelist/todo_icon.png';
					}else if (i==0) {
						imgurl='dingdingweb/HUI/img/typelist/new.png';
					}else {
						imgurl='dingdingweb/HUI/img/typelist/mkc.png';
					}
		    		var div = document.createElement('div');
// 		            li.innerHTML ='<a href="javascript:toDetailed('+dcnumber+');"><div class="hui-list-text">'+name+'-'+borrowde+'</div></a>'; 
		            div.innerHTML ='<div class="hui-accordion" onclick="needY(this);">'+
					'<div class="hui-accordion-title" style="background-image:url('+imgurl+');background-repeat:no-repeat;background-position:70% 20%;background-size:48px 48px;">'+name+'-'+audit_time+'</div>'+
					'<div class="hui-accordion-content hui-list">'+
							'<form action="${basePath}Office/BusinessCard/sendCreateMessage" method="post" id="tolq">'+
								
								'<input type="hidden" id="uimg" name="uimg" value="'+uimg+'">'+
								
								'<div class="hui-form-items">'+
						     	'<div class="hui-form-items-title">状态</div>'+
								'<input type="text" readonly="readonly"'+
									'value="'+s+'" class="hui-input" id="s" name="s">'+
								'</div>'+
								
								
								'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">单据号</div>'+
									'<input type="text" name="dcnumber" id="dcnumber"'+
										'class="hui-input" value="'+dcnumber+'" readonly="readonly">'+
								'</div>'+
									
								'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">申请人工号</div>'+
									'<input type="text" name="jobnumber" id="jobnumber"'+
										'class="hui-input" value="'+jobnumber+'" readonly="readonly">'+
								'</div>'+

								'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">申请人姓名</div>'+
									'<input type="text" name="name" id="name" class="hui-input"'+
										'value="'+name+'" readonly="readonly">'+
								'</div>'+

								'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">申请人部门</div>'+
									'<input type="text" name="borrowde" id="borrowde"'+
										'class="hui-input" value="'+borrowde+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">邮箱</div>'+
								'<input type="text" name="email" id="email"'+
									'class="hui-input" value="'+email+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">公司名称</div>'+
								'<input type="text" name="company" id="company"'+
									'class="hui-input" value="'+company+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">公司网址</div>'+
								'<input type="text" name="web" id="web"'+
									'class="hui-input" value="'+web+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">客服电话</div>'+
								'<input type="text" name="customertel" id="customertel"'+
									'class="hui-input" value="'+customertel+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">申请数量</div>'+
								'<input type="text" name="num" id="num"'+
									'class="hui-input" value="'+num+'" readonly="readonly">'+
								'</div>'+
								
								'<input type="hidden" name="audit-name" id="audit-name" value="'+audit_name+'">'+
								'<input type="hidden" name="audit_opinion" id="audit_opinion" class="hui-input" value="'+audit_opinion+'">'+
								'<input type="hidden" name="audit_time" id="audit_time" class="hui-input" value="'+audit_time+'">'+
								'<input type="hidden"id="audit_type" name="audit_type" class="audit_type" value="'+audit_type+'">'+	
								'<input type="hidden" name="desk" id="desk" class="hui-input" value="'+desk+'">'+
								
								
								'<div class="hui-form-items" id="yincang1">'+
								'<div class="items-title" style="width:50%; line-height:40px; height:40px; flex-shrink:0;">领取人</div>'+
								'<input type ="hidden" id ="lq" class="hui-input" name="lq" required="required" >'+	
								'<img alt="头像" src="/../dingdingweb/HUI/img/add.png" style="height:40px;width:40px; margin:0px; border-radius:50%;" onclick="to2(this)" id="lq-img">'+	
								'</div>'+
								
								'<div class="hui-form-items" id="yincang2">'+
								'<div class="hui-form-items-title">领取时间</div>'+
								'<input type="date" name="lq_time" id="lq_time"'+
									'class="hui-input" required="required">'+
								'</div>'+
								'<div class="hui-form-items" id="yincang3">'+
								'<div id = "qrcodeid" onclick="makeCode(this)">点击显示二维码</div>'+
								'</div>'+
								
								'<div style="padding:15px 30px 50px 10px; " id="yincang4">'+
								'<div class="hui-form-items-title"></div>'+
								'<input type = "submit" id = "submit" value ="发送" class="hui-button hui-primary hui-fr">'+
								'</div>'+	
							
								
							'<form>'+
						'</div>'+
					'</div>';

		            hui(div).appendTo('#list');
		           
		    	}
		    	hui.accordion(true, false); 
				
			},
			error:function(){
				alert("获取失败");
				hui.closeLoading();
			}
		})
		hui.accordion(true, false); 
	}
	
function needY(target){	
	var y = $(target).children(".hui-accordion-content").children("#tolq").children(".hui-form-items").find("#s").attr("value");
//		alert(y);
	if (y.indexOf("需要制作")==-1) {
		$(target).children(".hui-accordion-content").children("#tolq").find("#yincang1").remove();
		$(target).children(".hui-accordion-content").children("#tolq").find("#yincang2").remove();
		$(target).children(".hui-accordion-content").children("#tolq").find("#yincang3").remove();
		$(target).children(".hui-accordion-content").children("#tolq").find("#yincang4").remove();
		
	}
}
</script>
</head>
<body>
	<header class="header">
		<div class="hui-list" align="center">
				<div  class="hui-list-icons" style="width:110px; height:80px;">
					<img id="userImg" alt="头像" src="${basePath}dingdingweb/HUI/img/head.png" style="width:66px; margin:0px; border-radius:50%;">
				</div>
				<div align="center" style="height:auto; height:40px; padding-bottom:8px;" id="userName">
					欢迎您 : 
				</div>
				<input type="hidden" id ="info">
				<input type="hidden" id="username">
		</div>
	</header>
	<div class="hui-wrap">
    <div id="refreshContainer" class="hui-refresh">
        <div class="hui-refresh-icon"></div>
        <div class="hui-refresh-content hui-list">
            <div id="list">
            
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${basePath}dingdingweb/HUI/js/hui-refresh-load-more.js"></script>
<script type="text/javascript">
hui.loadMore(nextPage);
var page=1;
function nextPage(){
	$.ajax({
		url:'${basePath}Office/BusinessCard/getaudit?audit_name='+$("#userName").text()+'&pageNum='+page,
		type:'get',
		dataType:'text',
		success:function(result){
			var re = JSON.parse(JSON.stringify(result));
			  var pageInfo = JSON.parse(re).pageInfo;
				var hasNextPage = pageInfo.hasNextPage;
//		 			alert(hasNextPage);
				if(hasNextPage == false){
			        hui.endLoadMore(true, '已经到头了...');
//			        alert("已经到头了...");

			         return false;
			     }else {
			    	 page++;
			    	//hui.refresh('#refreshContainer', refresh);
			    	getMore(page);
				}
		},
		error:function(){}
	})
}


//加载更多
function getMore(page){
// 	alert(getmore);
 	hui.loading('加载更多');
	
    $.ajax({
		url:'${basePath}Office/BusinessCard/needcreatecard?desk='+$("#userName").text()+'&pageNum='+page,
		type:'get',
		dataType:'text',
		success:function(result){
			hui.closeLoading();
			var re = JSON.parse(JSON.stringify(result));
	    	var blist = JSON.parse(re).blist;
//	     	alert(blist)
// 	    	var html='';
	    	var d = '';
		    	for (var i = 0; i < blist.length; i++) {
		    		var uimg = blist[i].uimg;
		    		var dcnumber = blist[i].dcnumber;
// 		     		alert(dcnumber);
					var jobnumber = blist[i].jobnumber;
		    		var name = blist[i].name; 
					var borrowde = blist[i].borrowde;
					var email =blist[i].email;
					var company=blist[i].company;
					var web =blist[i].web;
					var customertel=blist[i].customertel;
					var num=blist[i].num;
					var audit_name=blist[i].audit_name;
					var audit_opinion=blist[i].audit_opinion;
					var audit_time=blist[i].audit_time;
					var audit_type=blist[i].audit_type;
					var desk=blist[i].desk;
					var lq=blist[i].lq;
					var s='';
					if (lq==null) {
						s='需要制作';
					}else{
						s='已制作';
					}
					
					var imgurl='';
					if (s=='需要制作') {
						imgurl='dingdingweb/HUI/img/typelist/todo_icon.png';
					}else {
						imgurl='dingdingweb/HUI/img/typelist/mkc.png';
					}
		    		var div = document.createElement('div');
// 		            li.innerHTML ='<a href="javascript:toDetailed('+dcnumber+');"><div class="hui-list-text">'+name+'-'+borrowde+'</div></a>'; 
					 div.innerHTML='<div class="hui-accordion" onclick="needY(this);makeCode(this)">'+
						'<div class="hui-accordion-title" style="background-image:url('+imgurl+');background-repeat:no-repeat;background-position:70% 20%;background-size:48px 48px;">'+name+'-'+audit_time+'</div>'+
						'<div class="hui-accordion-content hui-list">'+
								'<form action="${basePath}Office/BusinessCard/sendCreateMessage" method="post" id="tolq">'+
									'<input type="hidden" id="uimg" name="uimg" value="'+uimg+'">'+
									
									
									'<div class="hui-form-items">'+
							     	'<div class="hui-form-items-title">状态</div>'+
									'<input type="text" readonly="readonly"'+
										'value="'+s+'" class="hui-input" id="s" name="s">'+
									'</div>'+
									
									
									'<div class="hui-form-items">'+
										'<div class="hui-form-items-title">单据号</div>'+
										'<input type="text" name="dcnumber" id="dcnumber"'+
											'class="hui-input" value="'+dcnumber+'" readonly="readonly">'+
									'</div>'+
										
									'<div class="hui-form-items">'+
										'<div class="hui-form-items-title">申请人工号</div>'+
										'<input type="text" name="jobnumber" id="jobnumber"'+
											'class="hui-input" value="'+jobnumber+'" readonly="readonly">'+
									'</div>'+

									'<div class="hui-form-items">'+
										'<div class="hui-form-items-title">申请人姓名</div>'+
										'<input type="text" name="name" id="name" class="hui-input"'+
											'value="'+name+'" readonly="readonly">'+
									'</div>'+

									'<div class="hui-form-items">'+
										'<div class="hui-form-items-title">申请人部门</div>'+
										'<input type="text" name="borrowde" id="borrowde"'+
											'class="hui-input" value="'+borrowde+'" readonly="readonly">'+
									'</div>'+
									
									'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">邮箱</div>'+
									'<input type="text" name="email" id="email"'+
										'class="hui-input" value="'+email+'" readonly="readonly">'+
									'</div>'+
									
									'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">公司名称</div>'+
									'<input type="text" name="company" id="company"'+
										'class="hui-input" value="'+company+'" readonly="readonly">'+
									'</div>'+
									
									'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">公司网址</div>'+
									'<input type="text" name="web" id="web"'+
										'class="hui-input" value="'+web+'" readonly="readonly">'+
									'</div>'+
									
									'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">客服电话</div>'+
									'<input type="text" name="customertel" id="customertel"'+
										'class="hui-input" value="'+customertel+'" readonly="readonly">'+
									'</div>'+
									
									'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">申请数量</div>'+
									'<input type="text" name="num" id="num"'+
										'class="hui-input" value="'+num+'" readonly="readonly">'+
									'</div>'+
									
									'<input type="hidden" name="audit-name" id="audit-name" value="'+audit_name+'">'+
									'<input type="hidden" name="audit_opinion" id="audit_opinion" class="hui-input" value="'+audit_opinion+'">'+
									'<input type="hidden" name="audit_time" id="audit_time" class="hui-input" value="'+audit_time+'">'+
									'<input type="hidden"id="audit_type" name="audit_type" class="audit_type" value="'+audit_type+'">'+	
									'<input type="hidden" name="desk" id="desk" class="hui-input" value="'+desk+'">'+
									
									
									'<div class="hui-form-items" id="yincang1">'+
									'<div class="items-title" style="width:50%; line-height:40px; height:40px; flex-shrink:0;">领取人</div>'+
									'<input type ="hidden" id ="lq" class="hui-input" name="lq" required="required" >'+	
									'<img alt="头像" src="${basePath}dingdingweb/HUI/img/add.png" style="height:40px;width:40px; margin:0px; border-radius:50%;" onclick="to2()" id="lq-img">'+	
									'</div>'+
									
									'<div class="hui-form-items" id="yincang2">'+
									'<div class="hui-form-items-title">领取时间</div>'+
									'<input type="date" name="lq_time" id="lq_time"'+
										'class="hui-input" required="required">'+
									'</div>'+
									'<div class="hui-form-items" id="yincang3">'+
									'<div id = "qrcodeid" onclick="makeCode(this)">点击显示二维码</div>'+
									'</div>'+
									
									
									'<div style="padding:15px 30px 50px 10px; ">'+
									'<div class="hui-form-items-title"></div>'+
									'<input type = "submit" id = "submit" value ="发送" class="hui-button hui-primary hui-fr">'+
									
									'</div>'+
									
								'<form>'+
							'</div>'+
						'</div>';
		            
		            hui(div).appendTo('#list');
					
// 					hui('#list').html(html);
					
		    	}
		    	
	    		page++;
	            hui.endLoadMore();
	        var pageInfo = JSON.parse(re).pageInfo;
			var hasNextPage = pageInfo.hasNextPage;
//	 			alert(hasNextPage);
			if(hasNextPage == false){
		        hui.endLoadMore(true, '已经到头了...');
// 		        alert("已经到头了...");
				hui.accordion(true, false); 
		         return false;
		     }else {
		    	 hui.accordion(true, false);
			}
		},
		error:function(){
			alert("查询失败");
		}
	})
	hui.accordion(true, false);
}
</script>
<script type="text/javascript">

function makeCode (target) {	
	$(target).children("canvas").remove();
	$(target).children("img").remove();
	var uimg = $(target).parent().parent().children("#uimg").attr("value");
	var jobnumber=$(target).parent().parent().children(".hui-form-items").children("#jobnumber").attr("value");
// 	alert(jobnumber);
	var name=$(target).parent().parent().children(".hui-form-items").children("#name").attr("value");
// 	alert(name);
	var borrowde=$(target).parent().parent().children(".hui-form-items").children("#borrowde").attr("value");
// 	alert(borrowde);
	var email=$(target).parent().parent().children(".hui-form-items").children("#email").attr("value");
// 	alert(email);
	var company=$(target).parent().parent().children(".hui-form-items").children("#company").attr("value");
// 	alert(company);
	var web=$(target).parent().parent().children(".hui-form-items").children("#web").attr("value");
// 	alert(web);
	var customertel=$(target).parent().parent().children(".hui-form-items").children("#customertel").attr("value");
// 	alert(customertel);
	var qrcode = $(target).get(0);
// 	alert(qrcode);
// 	此处生成名片二维码（如要生成普通链接二维码 则 “text”参数值 直接替换成普通链接即可）
// 	var the_text = "BEGIN:VCARD \r\nFN:姓名 \r\nTEL;CELL,VOICE:15000000000 \r\nTITLE:职称 \r\nORG:公司（组织） \r\nEMAIL;INTERNET,HOME:123@qq.com \r\nADR;WORK,POSTAL:地球中国山东... \r\nURL:http://leerd.cn \r\nEND:VCARD";
// 	the_text = utf16to8(the_text);
	var the_text="${basePath}BusinessCard/getCardStyle?jobnumber="+encodeURIComponent(jobnumber)+
			"&uimg="+encodeURIComponent(uimg)+
			"&name="+encodeURIComponent(name)+
			"&borrowde="+encodeURIComponent(borrowde)+
			"&email="+encodeURIComponent(email)+
			"&company="+encodeURIComponent(company)+
			"&web="+encodeURIComponent(web)+
			"&customertel="+encodeURIComponent(customertel);

	//alert(the_text);
	var Q = new QRCode(qrcode,{
	width:140,
	height:140,
	render:"canvas", //设置渲染方式 table canvas
	typeNumber : -1,  //计算模式 
	correctLevel  : 0,//纠错等级 
	background   : "#000",//背景颜色 
	foreground   : "#3690ec",//前景颜色 
	}); 
	Q.makeCode(the_text);
};

function utf16to8(str) { //解决中文乱码
	  var out, i, len, c; 
	  out = ""; 
	  len = str.length; 
	  for(i = 0; i < len; i++) { 
	  c = str.charCodeAt(i); 
	  if ((c >= 0x0001) && (c <= 0x007F)) { 
	    out += str.charAt(i); 
	  } else if (c > 0x07FF) { 
	    out += String.fromCharCode(0xE0 | ((c >> 12) & 0x0F)); 
	    out += String.fromCharCode(0x80 | ((c >> 6) & 0x3F)); 
	    out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F)); 
	  } else { 
	    out += String.fromCharCode(0xC0 | ((c >> 6) & 0x1F)); 
	    out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F)); 
	  } 
	  } 
	  return out; 
	} 
</script>
</body>
</html>