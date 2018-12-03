<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%@include file="/top2.jsp"%>
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
<title>查询名片制作申请</title>
</head>
<body>
	<header class="hui-header">
		
<!--     <div id="hui-back"></div> -->
    <div id="hui-header-sreach">
    	<div id="hui-header-sreach-icon"></div>
		<form><input type="search" id="searchKey" onkeydown="if(event.keyCode==13)return false;" placeholder="请输入姓名" /></form>
	</div>
	<div id="hui-header-menu" onclick="hui.showSlideMenu();"></div>
<!-- 	<div class="hui-header-sreach-txt" onclick="clearSearch();">清空</div> -->
	<input  type="hidden" id = "info" value="${userjson}">
	</header>
	<input type="hidden" id="username">
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
// document.activeElement.blur();

hui.loadMore(nextPage);
var page=1;
function nextPage(){
	var kwd = hui('#searchKey').val();
	kwd = kwd.trim();
	if(kwd.length < 2){
		hui.toast('关键字至少2个字符');
		hui('.hui-hot-sreach').show();
		return;
	}
	$.ajax({
		url:'${basePath}Office/BusinessCard/SearchBCardApply?searchkey='+kwd+'&pageNum='+page,
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
	var kwd = hui('#searchKey').val();
	kwd = kwd.trim();
	if(kwd.length < 2){
		hui.toast('关键字至少2个字符');
		hui('.hui-hot-sreach').show();
		return;
	}
 	hui.loading('加载更多');
	
    $.ajax({
		url:'${basePath}Office/BusinessCard/SearchBCardApply?searchkey='+kwd+'&pageNum='+page,
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
					var lq_time=blist[i].lq;
					var evaluation=blist[i].evaluation
					var over_time=blist[i].over_time
					var QR_note=blist[i].QR_note
					var s= '';
					if (evaluation!=null&&over_time!=null) {
						s='已收到名片';
					}else if(audit_opinion==null&&audit_time==null&&desk==null){
						s='未审批';
					}else if(desk!=null&&lq==null){
						s='制作未完成';
					}else if(lq!=null&&evaluation==null){
						s='制作完成';
					}
					
		    		var div = document.createElement('div');
// 		            li.innerHTML ='<a href="javascript:toDetailed('+dcnumber+');"><div class="hui-list-text">'+name+'-'+borrowde+'</div></a>'; 
					 div.innerHTML=div.innerHTML ='<div class="hui-accordion">'+
						'<div class="hui-accordion-title" >'+name+'-'+audit_time+'_'+s+'</div>'+
						'<div class="hui-accordion-content hui-list">'+
								'<form action="${basePath}Office/BusinessCard/saveBehandEvBcard" method="post" id="tolq">'+
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
									'<input type ="hidden" id ="lq" class="hui-input" name="lq" value="'+lq+'" required="required" >'+	
									'<input type="hidden" name="lq_time" id="lq_time" class="hui-input" value="'+lq_time+'" required="required">'+
									
									'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">评价</div>'+
									'<input type="text" name="evaluation" id="evaluation"'+
										'class="hui-input" value="'+evaluation+'">'+
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
//监听搜索事件
document.getElementById('searchKey').addEventListener('keyup', function(e){if(e.keyCode == 13){searchNow();}});
function hotSearch(k){
	hui('#searchKey').val(k);
	searchNow();
}
//核心搜索函数
function searchNow(){
	hui.loading('加载中...');
	document.activeElement.blur();
	var kwd = hui('#searchKey').val();
	kwd = kwd.trim();
	if(kwd.length < 2){
		hui.toast('关键字至少2个字符');
		hui('.hui-hot-sreach').show();
		return;
	}
// 	//关闭热搜
// 	hui('.hui-hot-sreach').hide();
// 	hui.toast('搜索 '+ kwd);
	$.ajax({
		url:'${basePath}Office/BusinessCard/SearchBCardApply?searchkey='+kwd+'&pageNum=1',
		type:'get',
		dataType:'text',
		success:function(result){
			hui.closeLoading();
			var re = JSON.parse(JSON.stringify(result));
			var blist = JSON.parse(re).blist;
			for (var i = 0; i < blist.length; i++) {
	    		var dcnumber = blist[i].dcnumber;
// 	     		alert(dcnumber);
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
				var lq_time=blist[i].lq;
				var evaluation=blist[i].evaluation
				var over_time=blist[i].over_time
				var QR_note=blist[i].QR_note
				var s= '';
				if (evaluation!=null&&over_time!=null) {
					s='已收到名片';
				}else if(audit_opinion==null&&audit_time==null&&desk==null){
					s='未审批';
				}else if(desk!=null&&lq==null){
					s='制作未完成';
				}else if(lq!=null&&evaluation==null){
					s='制作完成';
				}
				var div = document.createElement('div');
				 div.innerHTML ='<div class="hui-accordion">'+
					'<div class="hui-accordion-title" >'+name+'-'+audit_time+'_'+s+'</div>'+
					'<div class="hui-accordion-content hui-list">'+
							'<form action="${basePath}Office/BusinessCard/saveBehandEvBcard" method="post" id="tolq">'+
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
								'<input type ="hidden" id ="lq" class="hui-input" name="lq" value="'+lq+'" required="required" >'+	
								'<input type="hidden" name="lq_time" id="lq_time" class="hui-input" value="'+lq_time+'" required="required">'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">评价</div>'+
								'<input type="text" name="evaluation" id="evaluation"'+
									'class="hui-input" value="'+evaluation+'">'+
								'</div>'+
								

							'<form>'+
						'</div>'+
					'</div>';

		            hui(div).appendTo('#list');
		           
		    	}
			hui.accordion(true, false); 	
			},
		error:function(){
			alert("查询失败");
		}
		
	})
	hui.accordion(true, false);
}

</script>	

</body>
</html>