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

<script type="text/javascript">
	$(document).ready(function(){
		hui.loading('加载中...');
		getAuditInfor();

	})
	function getAuditInfor(){
		
		$.ajax({
			url:'${basePath}Office/BusinessCard/getaudit?audit_name='+$("#userName").text()+'&pageNum=1',
			type:'GET',
			dataType:'text',
			success:function(result){
				hui.closeLoading();
				var re = JSON.parse(JSON.stringify(result));
// 				alert(re);
		    	var blist = JSON.parse(re).blist;
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
					var audit_type=blist[i].audit_type;
					var s = '';
					if (audit_type!=null) {
						s='已审批';
					}else{
						s='请审批'
					}
						
		    		var div = document.createElement('div');
// 		            li.innerHTML ='<a href="javascript:toDetailed('+dcnumber+');"><div class="hui-list-text">'+name+'-'+borrowde+'</div></a>'; 
		            div.innerHTML ='<div class="hui-accordion" onclick="auditY(this)">'+
					'<div class="hui-accordion-title" >'+name+'-'+borrowde+'_'+s+'</div>'+
					'<div class="hui-accordion-content hui-list">'+
							'<form action="${basePath}Office/BusinessCard/save2Desk" method="post" id="toDesk">'+
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
								
								
								'<div id="never">'+
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">审批意见</div>'+
								'<input type="text" name="audit_opinion" id="audit_opinion"'+
									'class="hui-input" required="required">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">审批时间</div>'+
								'<input type="date" name="audit_time" id="audit_time"'+
									'class="hui-input" required="required">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">是否同意</div>'+
								'<select id="audit_type" name="audit_type" class="audit_type" required="required">'+
									'<option value="是">是</option>'+
									'<option value="否">否</option>'+
								'</select>'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">制作人</div>'+
								'<input type="text" name="desk" id="desk"'+
									'class="hui-input" required="required">'+
								'</div>'+
								
								'<div style="padding:15px 30px 50px 10px; ">'+
								'<div class="hui-form-items-title"></div>'+
								'<input type = "submit" id = "submit" value ="提交" class="hui-button hui-primary hui-fr">'+
								'</div>'+	
								'</div>'+
								
							'<form>'+
						'</div>'+
					'</div>';
					
				
		            
		            hui(div).appendTo('#list');
					
// 					hui('#list').html(html);
					
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
	
	
	function auditY(target){
		
		
		var y = $(target).children(".hui-accordion-title").text();
// 		alert(y);
		if (y.indexOf("请审批")==-1) {
			$(target).children(".hui-accordion-content").children("#toDesk").children("#never").hide();
		}
	}
</script>
<title>名片制作审核</title>
</head>
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
				<input  type="hidden" id ="info" value="${userjson}">
				<input type="hidden" id="username" value="${u.name}">
			</c:forEach>
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
var page = 1;
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
		url:'${basePath}Office/BusinessCard/getaudit?audit_name='+$("#userName").text()+'&pageNum='+page,
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
					var audit_type=blist[i].audit_type;
					var s = '';
					if (audit_type!=null) {
						s='已审批';
					}else{
						s='请审批'
					}
		    		var div = document.createElement('div');
// 		            li.innerHTML ='<a href="javascript:toDetailed('+dcnumber+');"><div class="hui-list-text">'+name+'-'+borrowde+'</div></a>'; 
					 div.innerHTML='<div class="hui-accordion" onclick="auditY(this)">'+
						'<div class="hui-accordion-title" >'+name+'-'+borrowde+'_'+s+'</div>'+
						'<div class="hui-accordion-content hui-list">'+
								'<form action="${basePath}Office/BusinessCard/save2Desk" method="post" id="toDesk">'+
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
									
									
									'<div id="never">'+
									'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">审批意见</div>'+
									'<input type="text" name="audit_opinion" id="audit_opinion"'+
										'class="hui-input">'+
									'</div>'+
									
									'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">审批时间</div>'+
									'<input type="date" name="audit_time" id="audit_time"'+
										'class="hui-input">'+
									'</div>'+
									
									'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">是否同意</div>'+
									'<select id="audit_type" name="audit_type" class="audit_type" >'+
										'<option value="是">是</option>'+
										'<option value="否">否</option>'+
									'</select>'+
									'</div>'+
									
									'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">制作人</div>'+
									'<input type="text" name="desk" id="desk"'+
										'class="hui-input">'+
									'</div>'+
									
									'<div style="padding:15px 30px 50px 10px; ">'+
									'<div class="hui-form-items-title"></div>'+
									'<input type = "submit" id = "submit" value ="提交" class="hui-button hui-primary hui-fr">'+
									'</div>'+	
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

</body>
</html>