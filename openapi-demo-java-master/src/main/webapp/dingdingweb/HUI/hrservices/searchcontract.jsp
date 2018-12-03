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
<title>合同/档案借用查询</title>
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
	
	<div class="hui-wrap">
    <div id="refreshContainer" class="hui-refresh">
        <div class="hui-refresh-icon"></div>
        <div class="hui-refresh-content hui-list">
            <div id="list">
           
            </div>
        </div>
    </div>
	</div>
	
	<input type="hidden" id="username">
<script type="text/javascript" src="${basePath}dingdingweb/HUI/js/hui-refresh-load-more.js"></script>
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
		hui.closeLoading();
		hui('.hui-hot-sreach').show();
		return;
	}
	$.ajax({
		url:'HrServices/getContractApplyinfor?searchkey='+kwd+'&pageNum=1',
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
				var contractName=blist[i].contractName
				var reason=blist[i].reason
				var abacktime=blist[i].abacktime
				var spid=blist[i].spid
				var audit_name=blist[i].audit_name
				var spopinions=blist[i].spopinions
				var spdate=blist[i].spdate
				var abdate=blist[i].abdate
				var rdate=blist[i].rdate
				var note=blist[i].note
				var evaluation=blist[i].evaluation
				var overdate=blist[i].overdate
				var audittype=blist[i].audittype
				var s = '';
				if (rdate!= null&&overdate!= null&&audittype=='是') {
					s='已确认归还';
				}else if (audittype=='是'&&rdate==null&&evaluation==null) {
					s='审核通过';
				}else if (audittype=='否') {
					s='审核失败';
				}else if (audittype==null&&rdate==null) {
					s='审核中';
				}else if (rdate==null&&audittype=='是'&&evaluation!=null) {
					s='未归还';
				}else if (audittype=='是'&&rdate!= null &&overdate==null) {
					s='已归还未确认';
				}
				var div = document.createElement('div');
				 div.innerHTML ='<div class="hui-accordion">'+
					'<div class="hui-accordion-title" >'+borrowname+'-'+borrowde+'_'+s+'</div>'+
					'<div class="hui-accordion-content hui-list">'+
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
								'<input type="text" name="contractName" id="contractName"'+
									'class="hui-input" value="'+contractName+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">借用事由</div>'+
								'<input type="text" name="reason" id="reason"'+
									'class="hui-input" value="'+reason+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">预计还回时间</div>'+
								'<input type="text" name="abacktime" id="abacktime"'+
									'class="hui-input" value="'+abacktime+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">审批人员工号</div>'+
								'<input type="text" name="spid" id="spid"'+
									'class="hui-input" value="'+spid+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">审批人员姓名</div>'+
								'<input type="text" name="audit_name" id="audit_name"'+
									'class="hui-input" value="'+audit_name+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">审批意见</div>'+
								'<input type="text" name="spopinions" id="spopinions"'+
									'class="hui-input" value="'+spopinions+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">审批时间</div>'+
								'<input type="text" name="spdate" id="spdate"'+
									'class="hui-input" value="'+spdate+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">实际借出时间</div>'+
								'<input type="text" name="abdate" id="abdate"'+
									'class="hui-input" value="'+abdate+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">实际归还时间</div>'+
								'<input type="text" name="rdate" id="rdate"'+
									'class="hui-input" value="'+rdate+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">实际归还时间</div>'+
								'<input type="text" name="rdate" id="rdate"'+
									'class="hui-input" value="'+rdate+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">备注</div>'+
								'<input type="text" name="note" id="note"'+
									'class="hui-input" value="'+note+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">服务评价</div>'+
								'<input type="text" name="evaluation" id="evaluation"'+
									'class="hui-input" value="'+evaluation+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">结束时间</div>'+
								'<input type="text" name="overdate" id="overdate"'+
									'class="hui-input" value="'+overdate+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">审核是否通过</div>'+
								'<input type="text" name="audittype" id="audittype"'+
									'class="hui-input" value="'+audittype+'" readonly="readonly">'+
								'</div>'+
								
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
</script>

<script type="text/javascript">
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
		url:'HrServices/getContractApplyinfor?searchkey='+kwd+'&pageNum='+page,
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
		url:'HrServices/getContractApplyinfor?searchkey='+kwd+'&pageNum='+page,
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
				var contractName=blist[i].contractName
				var reason=blist[i].reason
				var abacktime=blist[i].abacktime
				var spid=blist[i].spid
				var audit_name=blist[i].audit_name
				var spopinions=blist[i].spopinions
				var spdate=blist[i].spdate
				var abdate=blist[i].abdate
				var rdate=blist[i].rdate
				var note=blist[i].note
				var evaluation=blist[i].evaluation
				var overdate=blist[i].overdate
				var audittype=blist[i].audittype
				var s = '';
				if (rdate!= null&&overdate!= null&&audittype=='是') {
					s='已确认归还';
				}else if (audittype=='是'&&rdate==null&&evaluation==null) {
					s='审核通过';
				}else if (audittype=='否') {
					s='审核失败';
				}else if (audittype==null&&rdate==null) {
					s='审核中';
				}else if (rdate==null&&audittype=='是'&&evaluation!=null) {
					s='未归还';
				}else if (audittype=='是'&&rdate!= null &&overdate==null) {
					s='已归还未确认';
				}
				var div = document.createElement('div');
				 div.innerHTML ='<div class="hui-accordion">'+
					'<div class="hui-accordion-title" >'+borrowname+'-'+borrowde+'_'+s+'</div>'+
					'<div class="hui-accordion-content hui-list">'+
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
								'<input type="text" name="contractName" id="contractName"'+
									'class="hui-input" value="'+contractName+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">借用事由</div>'+
								'<input type="text" name="reason" id="reason"'+
									'class="hui-input" value="'+reason+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">预计还回时间</div>'+
								'<input type="text" name="abacktime" id="abacktime"'+
									'class="hui-input" value="'+abacktime+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">审批人员工号</div>'+
								'<input type="text" name="spid" id="spid"'+
									'class="hui-input" value="'+spid+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">审批人员姓名</div>'+
								'<input type="text" name="audit_name" id="audit_name"'+
									'class="hui-input" value="'+audit_name+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">审批意见</div>'+
								'<input type="text" name="spopinions" id="spopinions"'+
									'class="hui-input" value="'+spopinions+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">审批时间</div>'+
								'<input type="text" name="spdate" id="spdate"'+
									'class="hui-input" value="'+spdate+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">实际借出时间</div>'+
								'<input type="text" name="abdate" id="abdate"'+
									'class="hui-input" value="'+abdate+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">实际归还时间</div>'+
								'<input type="text" name="rdate" id="rdate"'+
									'class="hui-input" value="'+rdate+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">实际归还时间</div>'+
								'<input type="text" name="rdate" id="rdate"'+
									'class="hui-input" value="'+rdate+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">备注</div>'+
								'<input type="text" name="note" id="note"'+
									'class="hui-input" value="'+note+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">服务评价</div>'+
								'<input type="text" name="evaluation" id="evaluation"'+
									'class="hui-input" value="'+evaluation+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">结束时间</div>'+
								'<input type="text" name="overdate" id="overdate"'+
									'class="hui-input" value="'+overdate+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">审核是否通过</div>'+
								'<input type="text" name="audittype" id="audittype"'+
									'class="hui-input" value="'+audittype+'" readonly="readonly">'+
								'</div>'+
								
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