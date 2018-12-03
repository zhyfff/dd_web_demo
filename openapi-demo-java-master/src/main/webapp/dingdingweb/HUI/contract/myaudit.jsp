<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%@include file="/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=charset=utf-8">
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
	getMyAuditController();
})

function getMyAuditController(){
	$.ajax({
		url:'${basePath}Contract/getMyAudit?audit_name='+$("#userName").text()+'&pageNum=1',
		type:'GET',
		dataType:'text',
		success:function (result){
			hui.closeLoading();
			var re = JSON.parse(JSON.stringify(result));
			var blist = JSON.parse(re).blist;
			for (var i = 0; i < blist.length; i++) {
				var dcnumber=blist[i].dcnumber
				var borrowid=blist[i].borrowid
				var borrowname=blist[i].borrowname
				var borrowde=blist[i].borrowde
				var link_contractName=blist[i].link_contractName
				var link_reason=blist[i].link_reason
				var link_abacktime=blist[i].link_abacktime
				var link_spid=blist[i].link_spid
				var link_spname=blist[i].link_spname
				var link_spopinions=blist[i].link_spopinions
				var link_spdate=blist[i].link_spdate
				var link_abdate=blist[i].link_abdate
				var link_rdate=blist[i].link_rdate
				var link_note=blist[i].link_note
				var link_evaluation=blist[i].link_evaluation
				var overdate=blist[i].overdate
				var audittype=blist[i].audittype
				var s = '';
				if (link_rdate != null&&overdate != null&&audittype== '是') {
					s='已确认归还';
				}else if (audittype=='是'&&link_rdate==null&&link_evaluation==null) {
					s='审核通过';
				}else if (audittype == '否') {
					s='已拒绝';
				}else if (audittype==null&&link_rdate==null) {
					s='请审批';
				}else if (link_rdate==null&&audittype=='是'&&link_evaluation!=null) {
					s='未归还';
				}else if (audittype=='是'&&link_rdate!= null &&overdate==null) {
					s='已归还未确认';
				}
				
				var div = document.createElement('div');
				 div.innerHTML ='<div class="hui-accordion" onclick="auditY(this)">'+
					'<div class="hui-accordion-title" >'+borrowname+'-'+borrowde+'_'+s+'</div>'+
					'<div class="hui-accordion-content hui-list">'+
					'<form action="${basePath}Contract/auditToBase" method="post" id="audit">'+
								'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">单据号</div>'+
									'<input type="text" name="dcnumber" id="dcnumber"'+
										'class="hui-input" value="'+dcnumber+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">借用人员工号</div>'+
								'<input type="text" name="borrowid" id="borrowid"'+
									'class="hui-input" value="'+borrowid+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">借用人员姓名</div>'+
								'<input type="text" name="borrowname" id="borrowname"'+
									'class="hui-input" value="'+borrowname+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">借用人员部门</div>'+
								'<input type="text" name="borrowde" id="borrowde"'+
									'class="hui-input" value="'+borrowde+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">借用合同名</div>'+
								'<input type="text" name="link_contractName" id="link_contractName"'+
									'class="hui-input" value="'+link_contractName+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">借用事由</div>'+
								'<input type="text" name="link_reason" id="link_reason"'+
									'class="hui-input" value="'+link_reason+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">预计还回时间</div>'+
								'<input type="text" name="link_abacktime" id="link_abacktime"'+
									'class="hui-input" value="'+link_abacktime+'" readonly="readonly">'+
								'</div>'+
								
								
								'<input type="hidden" name="link_spid" id="link_spid"'+
									'class="hui-input" value="'+link_spid+'" readonly="readonly">'+
								
								
								
								'<input type="hidden" name="link_spname" id="link_spname"'+
									'class="hui-input" value="'+link_spname+'" readonly="readonly">'+
								
								'<div id="never">'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">审批意见</div>'+
								'<input  type="text" class="hui-input" id="link_spopinions"  name="link_spopinions" required="required" checkType="string" checkData="6,30" checkMsg="审批意见应为6-30个字符">'+
								'</div>'+
							
								
								'<div class="hui-form-items">'+	
								'<div class="hui-form-items-title">审批时间</div>'+
								'<input type="date" id="link_spdate" name="link_spdate" required="required" class="hui-input">'+
								'</div>'+	
								
								'<div class="hui-form-items">'+						
								'<div class="hui-form-items-title">实际借出时间</div>'+
								'<input type="date" id="link_abdate" name="link_abdate" required="required" class="hui-input">'+
								'</div>'+	
								
							
						
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">是否同意</div>'+
								'<select id="radio" name="radio" class="radio" >'+
									'<option value="是">是</option>'+
									'<option value="否">否</option>'+
								'</select>'+
								'</div>'+
							
								'<div style="padding: 10px 30px 60px 10px;">'+
									'<div class="hui-form-items-title"></div>'+
									'<input type="submit" id="submit" name="submit" value="提交审核"'+
										'class="hui-button hui-primary hui-fr">'+
								'</div>'+
								
								
								'</div>'+
								'<form>'+
						'</div>'+
					'</div>';
		            
		            hui(div).appendTo('#list');
				
			}
			hui.accordion(true, false);
			
		},
		error:function (){
			alert("获取失败");
		}
	})
	hui.accordion(true, false);
	
}

function auditY(target){
	var y = $(target).children(".hui-accordion-title").text();
//		alert(y);
	if (y.indexOf("请审批")==-1) {
		$(target).children(".hui-accordion-content").children("#audit").children("#never").hide();
	}
}

</script>
<title>合同借用审批</title>

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
			<input  type="hidden" id = "info" value="${userjson}">
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
		url:'${basePath}Contract/getMyAudit?audit_name='+$("#userName").text()+'&pageNum='+page,
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
		url:'${basePath}Contract/getMyAudit?audit_name='+$("#userName").text()+'&pageNum='+page,
		type:'get',
		dataType:'text',
		success:function(result){
			hui.closeLoading();
			var re = JSON.parse(JSON.stringify(result));
			var blist = JSON.parse(re).blist;
			for (var i = 0; i < blist.length; i++) {
				var dcnumber=blist[i].dcnumber
				var borrowid=blist[i].borrowid
				var borrowname=blist[i].borrowname
				var borrowde=blist[i].borrowde
				var link_contractName=blist[i].link_contractName
				var link_reason=blist[i].link_reason
				var link_abacktime=blist[i].link_abacktime
				var link_spid=blist[i].link_spid
				var link_spname=blist[i].link_spname
				var link_spopinions=blist[i].link_spopinions
				var link_spdate=blist[i].link_spdate
				var link_abdate=blist[i].link_abdate
				var link_rdate=blist[i].link_rdate
				var link_note=blist[i].link_note
				var link_evaluation=blist[i].link_evaluation
				var overdate=blist[i].overdate
				var audittype=blist[i].audittype
				var s = '';
				if (link_rdate != null&&overdate != null&&audittype== '是') {
					s='已确认归还';
				}else if (audittype=='是'&&link_rdate==null&&link_evaluation==null) {
					s='审核通过';
				}else if (audittype == '否') {
					s='已拒绝';
				}else if (audittype==null&&link_rdate==null) {
					s='请审批';
				}else if (link_rdate==null&&audittype=='是'&&link_evaluation!=null) {
					s='未归还';
				}else if (audittype=='是'&&link_rdate!= null &&overdate==null) {
					s='已归还未确认';
				}
				
				var div = document.createElement('div');
				 div.innerHTML ='<div class="hui-accordion" onclick="auditY(this)">'+
					'<div class="hui-accordion-title" >'+borrowname+'-'+borrowde+'_'+s+'</div>'+
					'<div class="hui-accordion-content hui-list">'+
					'<form action="Contract/auditToBase" method="post" id="audit">'+
								'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">单据号</div>'+
									'<input type="text" name="dcnumber" id="dcnumber"'+
										'class="hui-input" value="'+dcnumber+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">借用人员工号</div>'+
								'<input type="text" name="borrowid" id="borrowid"'+
									'class="hui-input" value="'+borrowid+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">借用人员姓名</div>'+
								'<input type="text" name="borrowname" id="borrowname"'+
									'class="hui-input" value="'+borrowname+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">借用人员部门</div>'+
								'<input type="text" name="borrowde" id="borrowde"'+
									'class="hui-input" value="'+borrowde+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">借用合同名</div>'+
								'<input type="text" name="link_contractName" id="link_contractName"'+
									'class="hui-input" value="'+link_contractName+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">借用事由</div>'+
								'<input type="text" name="link_reason" id="link_reason"'+
									'class="hui-input" value="'+link_reason+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">预计还回时间</div>'+
								'<input type="text" name="link_abacktime" id="link_abacktime"'+
									'class="hui-input" value="'+link_abacktime+'" readonly="readonly">'+
								'</div>'+
								
								
								'<input type="hidden" name="link_spid" id="link_spid"'+
									'class="hui-input" value="'+link_spid+'" readonly="readonly">'+
								
								
								
								'<input type="hidden" name="link_spname" id="link_spname"'+
									'class="hui-input" value="'+link_spname+'" readonly="readonly">'+
								
								'<div id="never">'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">审批意见</div>'+
								'<input  type="text" class="hui-input" id="link_spopinions"  name="link_spopinions" required="required" checkType="string" checkData="6,30" checkMsg="审批意见应为6-30个字符">'+
								'</div>'+
							
								
								'<div class="hui-form-items">'+	
								'<div class="hui-form-items-title">审批时间</div>'+
								'<input type="date" id="link_spdate" name="link_spdate" required="required" class="hui-input">'+
								'</div>'+	
								
								'<div class="hui-form-items">'+						
								'<div class="hui-form-items-title">实际借出时间</div>'+
								'<input type="date" id="link_abdate" name="link_abdate" required="required" class="hui-input">'+
								'</div>'+	
								
							
						
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">是否同意</div>'+
								'<select id="radio" name="radio" class="radio" >'+
									'<option value="是">是</option>'+
									'<option value="否">否</option>'+
								'</select>'+
								'</div>'+
							
								'<div style="padding: 10px 30px 60px 10px;">'+
									'<div class="hui-form-items-title"></div>'+
									'<input type="submit" id="submit" name="submit" value="提交审核"'+
										'class="hui-button hui-primary hui-fr">'+
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
		     }else{
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