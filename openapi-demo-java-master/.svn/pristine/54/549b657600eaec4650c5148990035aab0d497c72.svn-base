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
	getMyStamp();
})

function getMyStamp(){
	$.ajax({
		url:'${basePath}Office/StampCertificate/getMyStamp?userName='+$("#userName").text()+'&pageNum=1',
		type:'GET',
		dataType:'text',
		success:function (result){
			hui.closeLoading();
			var re = JSON.parse(JSON.stringify(result));
			var blist = JSON.parse(re).blist;
			for (var i = 0; i < blist.length; i++) {
				var dcnumber=blist[i].dcnumber;
				var jobnumber=blist[i].jobnumber;
				var name=blist[i].name;
				var borrowde=blist[i].borrowde;
				var stamp_name=blist[i].stamp_name;
				var stamp_company=blist[i].stamp_company;
				var stamp_type=blist[i].stamp_type;
				var manager=blist[i].manager;
				var apply_time=blist[i].apply_time;
				var use_time=blist[i].use_time;
				var reason=blist[i].reason;
				var back_time=blist[i].back_time;
				var audit_name=blist[i].audit_name;
				var audit_type=blist[i].audit_type;
				var audit_opinion=blist[i].audit_opinion;
				var audit_time=blist[i].audit_time;
				var issue_type=blist[i].issue_type;
				var evaluation=blist[i].evaluation;
				var s = '';
				if (audit_type=='是'&&evaluation==null&&issue_type==null) {
					s='审核通过';
				}else if(audit_type=='否'&&evaluation==null){
					s='审核拒绝';
				}else if (evaluation!=null) {
					s='已归还';
				}else if(audit_type==null&&audit_name!=null){
					s='审核中';
				}else if(issue_type=='是'&&audit_type=='是'&&evaluation==null){
					s='已发放';
				}
				var div = document.createElement('div');
				 div.innerHTML ='<div class="hui-accordion" onclick="auditY(this)">'+
					'<div class="hui-accordion-title" >'+name+'-'+borrowde+'_'+s+'</div>'+
					'<div class="hui-accordion-content hui-list">'+
							'<form action="${basePath}Office/StampCertificate/returnStamp" method="post" id="toReturn">'+
								'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">单据号</div>'+
									'<input type="text" name="dcnumber" id="dcnumber"'+
										'class="hui-input" value="'+dcnumber+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">印章证照</div>'+
								'<input type="text" name="stamp_name" id="stamp_name"'+
									'class="hui-input" value="'+stamp_name+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">证章所属公司</div>'+
								'<input type="text" name="stamp_company" id="stamp_company"'+
									'class="hui-input" value="'+stamp_company+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">证章类型</div>'+
								'<input type="text" name="stamp_type" id="stamp_type"'+
									'class="hui-input" value="'+stamp_type+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">申请时间</div>'+
								'<input type="text" name="apply_time" id="apply_time"'+
									'class="hui-input" value="'+apply_time+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">使用时间</div>'+
								'<input type="text" name="use_time" id="use_time"'+
									'class="hui-input" value="'+use_time+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">使用事由</div>'+
								'<input type="text" name="reason" id="reason"'+
									'class="hui-input" value="'+reason+'" readonly="readonly">'+
								'</div>'+
								
								'<div id="never">'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">评价</div>'+
								'<textarea id="evaluation" name="evaluation" required="required"></textarea>'+	
								'</div>'+
								
												
								'<div style="padding:15px 30px 50px 10px; ">'+
								'<div class="hui-form-items-title"></div>'+
								'<input type = "submit" id = "submit" value ="确认归还" class="hui-button hui-primary hui-fr">'+
								'</div>'+	
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
		}
	})
	hui.accordion(true, false);
}

function auditY(target){
	var y = $(target).children(".hui-accordion-title").text();
//		alert(y);
	if (y.indexOf("已发放")==-1) {
		$(target).children(".hui-accordion-content").children("#toReturn").children("#never").hide();
	}
}
</script>
<title>我的印章证照借用</title>
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
		url:'${basePath}Office/StampCertificate/getMyStamp?userName='+$("#userName").text()+'&pageNum='+page,
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
		url:'${basePath}Office/StampCertificate/getMyStamp?userName='+$("#userName").text()+'&pageNum='+page,
		type:'get',
		dataType:'text',
		success:function(result){
			hui.closeLoading();
			var re = JSON.parse(JSON.stringify(result));
			var blist = JSON.parse(re).blist;
			for (var i = 0; i < blist.length; i++) {
				var dcnumber=blist[i].dcnumber;
				var jobnumber=blist[i].jobnumber;
				var name=blist[i].name;
				var borrowde=blist[i].borrowde;
				var stamp_name=blist[i].stamp_name;
				var stamp_company=blist[i].stamp_company;
				var stamp_type=blist[i].stamp_type;
				var manager=blist[i].manager;
				var apply_time=blist[i].apply_time;
				var use_time=blist[i].use_time;
				var reason=blist[i].reason;
				var back_time=blist[i].back_time;
				var audit_name=blist[i].audit_name;
				var audit_type=blist[i].audit_type;
				var audit_opinion=blist[i].audit_opinion;
				var audit_time=blist[i].audit_time;
				var issue_type=blist[i].issue_type;
				var evaluation=blist[i].evaluation;
				var s = '';
				if (audit_type=='是'&&evaluation==null&&issue_type==null) {
					s='审核通过';
				}else if(audit_type=='否'&&evaluation==null){
					s='审核拒绝';
				}else if (evaluation!=null) {
					s='已归还';
				}else if(audit_type==null&&audit_name!=null){
					s='审核中';
				}else if(issue_type=='是'&&audit_type=='是'&&evaluation==null){
					s='已发放';
				}
				var div = document.createElement('div');
				 div.innerHTML ='<div class="hui-accordion" onclick="auditY(this)">'+
					'<div class="hui-accordion-title" >'+name+'-'+borrowde+'_'+s+'</div>'+
					'<div class="hui-accordion-content hui-list">'+
							'<form action="${basePath}Office/StampCertificate/returnStamp" method="post" id="toReturn">'+
								'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">单据号</div>'+
									'<input type="text" name="dcnumber" id="dcnumber"'+
										'class="hui-input" value="'+dcnumber+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">印章证照</div>'+
								'<input type="text" name="stamp_name" id="stamp_name"'+
									'class="hui-input" value="'+stamp_name+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">证章所属公司</div>'+
								'<input type="text" name="stamp_company" id="stamp_company"'+
									'class="hui-input" value="'+stamp_company+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">证章类型</div>'+
								'<input type="text" name="stamp_type" id="stamp_type"'+
									'class="hui-input" value="'+stamp_type+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">申请时间</div>'+
								'<input type="text" name="apply_time" id="apply_time"'+
									'class="hui-input" value="'+apply_time+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">使用时间</div>'+
								'<input type="text" name="use_time" id="use_time"'+
									'class="hui-input" value="'+use_time+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">使用事由</div>'+
								'<input type="text" name="reason" id="reason"'+
									'class="hui-input" value="'+reason+'" readonly="readonly">'+
								'</div>'+
								
								'<div id="never">'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">评价</div>'+
								'<textarea id="evaluation" name="evaluation" required="required"></textarea>'+	
								'</div>'+
								
												
								'<div style="padding:15px 30px 50px 10px; ">'+
								'<div class="hui-form-items-title"></div>'+
								'<input type = "submit" id = "submit" value ="确认归还" class="hui-button hui-primary hui-fr">'+
								'</div>'+	
								'</div>'+
								
							'<form>'+
						'</div>'+
					'</div>';
		            
		            hui(div).appendTo('#list');
				
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