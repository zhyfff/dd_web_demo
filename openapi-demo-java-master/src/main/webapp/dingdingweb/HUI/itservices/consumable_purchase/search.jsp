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
<title>查询</title>
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
		url:'ITServices/getConsumableApplyInfor?searchkey='+kwd+'&pageNum='+page,
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
		url:'ITServices/getConsumableApplyInfor?searchkey='+kwd+'&pageNum='+page,
		type:'get',
		dataType:'text',
		success:function(result){
			hui.closeLoading();
			var re = JSON.parse(JSON.stringify(result));
			var blist = JSON.parse(re).blist;
			for (var i = 0; i < blist.length; i++) {
				var dcnumber=blist[i].dcnumber;
				var userId=blist[i].userId;
				var borrowid=blist[i].borrowid;
				var borrowname=blist[i].borrowname;
				var borrowde=blist[i].borrowde;
				var ptime=blist[i].ptime;
				var ptype=blist[i].ptype;
				var consumable_type=blist[i].consumable_type;
				var consumable_name=blist[i].consumable_name;
				var specifications=blist[i].specifications;
				var apply_num=blist[i].apply_num;
				var note=blist[i].note;
				var audit_name=blist[i].audit_name;
				var spid=blist[i].spid;
				var audit_type=blist[i].audit_type;
				var audit_opinion=blist[i].audit_opinion;
				var audit_time=blist[i].audit_time;
				var overdate=blist[i].overdate;
				var s = '';
				if (audit_type=='是'&&overdate==null) {
					s='审批通过';
				}else if(audit_type=='否'){
					s='审批拒绝';
				}else if(audit_type==null&&overdate==null){
					s='未审批';
				}else if (overdate!=null) {
					s='采购完成';
				}
				var div = document.createElement('div');
				div.innerHTML =
					'<div class="hui-accordion">'+
						'<div class="hui-accordion-title" >'+borrowname+'-'+borrowde+'['+s+']</div>'+
						'<div class="hui-accordion-content hui-list">'+
					 		'<div class="hui-form-items">'+
					 			'<div class="hui-form-items-title">处理状态</div>'+
					 				'<input type="text" name="cl" id="cl"'+
					 				'class="hui-input" value="'+s+'" readonly="readonly">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
						     	'<div class="hui-form-items-title">单据号</div>'+
								'<input type="text" readonly="readonly"'+
									'value="'+dcnumber+'" class="hui-input" id="dcnumber" name="dcnumber">'+
							'</div>'+
							
							
							'<div class="hui-form-items">'+
						     	'<div class="hui-form-items-title">申请人姓名</div>'+
								'<input type="text" readonly="readonly"'+
									'value="'+borrowname+'" class="hui-input" id="borrowname" name="borrowname">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
						     	'<div class="hui-form-items-title">部门</div>'+
								'<input type="text" readonly="readonly"'+
									'value="'+borrowde+'" class="hui-input" id="borrowde" name="borrowde">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
						     	'<div class="hui-form-items-title">采购日期</div>'+
								'<input type="text" readonly="readonly"'+
									'value="'+ptime+'" class="hui-input" id="ptime" name="ptime">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
						     	'<div class="hui-form-items-title">采购类型</div>'+
								'<input type="text" readonly="readonly"'+
									'value="'+ptype+'" class="hui-input" id="ptype" name="ptype">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
						     	'<div class="hui-form-items-title">耗材分类</div>'+
								'<input type="text" readonly="readonly"'+
									'value="'+consumable_type+'" class="hui-input" id="consumable_type" name="consumable_type">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
						     	'<div class="hui-form-items-title">耗材名称</div>'+
								'<input type="text" readonly="readonly"'+
								'value="'+consumable_name+'" class="hui-input" id="consumable_name" name="consumable_name">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
						     	'<div class="hui-form-items-title">规格型号</div>'+
								'<input type="text" readonly="readonly"'+
								'value="'+specifications+'" class="hui-input" id="specifications" name="specifications">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
					     		'<div class="hui-form-items-title">申请数量</div>'+
								'<input type="text" readonly="readonly"'+
								'value="'+apply_num+'" class="hui-input" id="apply_num" name="apply_num">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">备注</div>'+
								'<div class="hui-form-textarea">'+
									'<textarea placeholder="备注..." id="note" name="note" readonly="readonly" required="required">'+note+'</textarea>'+
								'</div>'+
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
		url:'ITServices/getConsumableApplyInfor?searchkey='+kwd+'&pageNum=1',
		type:'GET',
		dataType:'text',
		success:function (result){
			hui.closeLoading();
			var re = JSON.parse(JSON.stringify(result));
			var blist = JSON.parse(re).blist;
			for (var i = 0; i < blist.length; i++) {
				var dcnumber=blist[i].dcnumber;
				var userId=blist[i].userId;
				var borrowid=blist[i].borrowid;
				var borrowname=blist[i].borrowname;
				var borrowde=blist[i].borrowde;
				var ptime=blist[i].ptime;
				var ptype=blist[i].ptype;
				var consumable_type=blist[i].consumable_type;
				var consumable_name=blist[i].consumable_name;
				var specifications=blist[i].specifications;
				var apply_num=blist[i].apply_num;
				var note=blist[i].note;
				var audit_name=blist[i].audit_name;
				var spid=blist[i].spid;
				var audit_type=blist[i].audit_type;
				var audit_opinion=blist[i].audit_opinion;
				var audit_time=blist[i].audit_time;
				var overdate=blist[i].overdate;
				var s = '';
				if (audit_type=='是'&&overdate==null) {
					s='审批通过';
				}else if(audit_type=='否'){
					s='审批拒绝';
				}else if(audit_type==null&&overdate==null){
					s='未审批';
				}else if (overdate!=null) {
					s='采购完成';
				}
				var div = document.createElement('div');
				div.innerHTML =
					'<div class="hui-accordion">'+
						'<div class="hui-accordion-title" >'+borrowname+'-'+borrowde+'['+s+']</div>'+
						'<div class="hui-accordion-content hui-list">'+
					 		'<div class="hui-form-items">'+
					 			'<div class="hui-form-items-title">处理状态</div>'+
					 				'<input type="text" name="cl" id="cl"'+
					 				'class="hui-input" value="'+s+'" readonly="readonly">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
						     	'<div class="hui-form-items-title">单据号</div>'+
								'<input type="text" readonly="readonly"'+
									'value="'+dcnumber+'" class="hui-input" id="dcnumber" name="dcnumber">'+
							'</div>'+
							
							
							'<div class="hui-form-items">'+
						     	'<div class="hui-form-items-title">申请人姓名</div>'+
								'<input type="text" readonly="readonly"'+
									'value="'+borrowname+'" class="hui-input" id="borrowname" name="borrowname">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
						     	'<div class="hui-form-items-title">部门</div>'+
								'<input type="text" readonly="readonly"'+
									'value="'+borrowde+'" class="hui-input" id="borrowde" name="borrowde">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
						     	'<div class="hui-form-items-title">采购日期</div>'+
								'<input type="text" readonly="readonly"'+
									'value="'+ptime+'" class="hui-input" id="ptime" name="ptime">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
						     	'<div class="hui-form-items-title">采购类型</div>'+
								'<input type="text" readonly="readonly"'+
									'value="'+ptype+'" class="hui-input" id="ptype" name="ptype">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
						     	'<div class="hui-form-items-title">耗材分类</div>'+
								'<input type="text" readonly="readonly"'+
									'value="'+consumable_type+'" class="hui-input" id="consumable_type" name="consumable_type">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
						     	'<div class="hui-form-items-title">耗材名称</div>'+
								'<input type="text" readonly="readonly"'+
								'value="'+consumable_name+'" class="hui-input" id="consumable_name" name="consumable_name">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
						     	'<div class="hui-form-items-title">规格型号</div>'+
								'<input type="text" readonly="readonly"'+
								'value="'+specifications+'" class="hui-input" id="specifications" name="specifications">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
					     		'<div class="hui-form-items-title">申请数量</div>'+
								'<input type="text" readonly="readonly"'+
								'value="'+apply_num+'" class="hui-input" id="apply_num" name="apply_num">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">备注</div>'+
								'<div class="hui-form-textarea">'+
									'<textarea placeholder="备注..." id="note" name="note" readonly="readonly" required="required">'+note+'</textarea>'+
								'</div>'+
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
</body>
</html>