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
	$(document).ready(function (){
		hui.loading('加载中...');
		getAllstamp();
	})
	
	function getAllstamp(){
		$.ajax({
			url:'${basePath}Office/StampCertificate/getstampandcertificate?pageNum=1',
			type:'GET',
			dataType:'text',
			success:function(result){
				hui.closeLoading();
				var re = JSON.parse(JSON.stringify(result));
				var sl = JSON.parse(re).blist;
				for (var i = 0; i < sl.length; i++) {
					var stamp_id=sl[i].stamp_id;
					var stamp_name=sl[i].stamp_name;
					var manager=sl[i].manager;
					var state=sl[i].state;
					var stamp_company=sl[i].stamp_company;
					var stamp_type=sl[i].stamp_type;
					
					var div = document.createElement('div');
					 div.innerHTML ='<div class="hui-accordion">'+
						'<div class="hui-accordion-title" >'+stamp_name+'_状态：'+state+'</div>'+
						'<div class="hui-accordion-content hui-list">'+
								'<form action="${basePath}Office/StampCertificate/UpdateStamp" method="post" id="toStamp">'+
									'<input type="hidden" name="stamp_id" value="'+stamp_id+'">'+
									'<div class="hui-form-items">'+
										'<div class="hui-form-items-title">印章、证照</div>'+
										'<input type="text" name="stamp_name" id="stamp_name"'+
											'class="hui-input" value="'+stamp_name+'" required="required" readonly="readonly">'+
									'</div>'+
										
									'<div class="hui-form-items">'+
										'<div class="hui-form-items-title">管理员</div>'+
										'<input type="text" name="manager" id="manager" class="hui-input" value="'+manager+'" required="required" readonly="readonly">'+
										''+
									'</div>'+

									'<div class="hui-form-items">'+
										'<div class="hui-form-items-title">当前状态</div>'+
										'<input type="text" name="state" id="state" class="hui-input" value="'+state+'" required="required" readonly="readonly">'+
										'<select id="select_state" style="display: none;" name="select_state" class="select_state" required="required">'+
										'<option value="可用">可用</option>'+
										'<option value="不可用">不可用</option>'+
										'</select>'+
										
									'</div>'+
									
									'<div class="hui-form-items">'+
										'<div class="hui-form-items-title">所属公司</div>'+
										'<input type="text" name="stamp_company" id="stamp_company" class="hui-input" value="'+stamp_company+'" required="required" readonly="readonly">'+
										
									'</div>'+
								
									'<div class="hui-form-items">'+
										'<div class="hui-form-items-title">类型</div>'+
										'<input type="text" name="stamp_type" id="stamp_type" class="hui-input" value="'+stamp_type+'" required="required" readonly="readonly">'+
										
									'</div>'+
									
									'<div class="hui-form-items" id="update">'+
										'<div class="hui-form-items-title" onclick="updateInfo(this)"><button type="button">更新信息</button></div>'+
										'<div class="hui-form-items-title" id="cancel" onclick="hiden(this)" style="display: none;"><button type="button">取消</button></div>'+
									'</div>'+


									'<div style="padding:15px 30px 50px 10px;display: none; " id="change">'+
									'<div class="hui-form-items-title"></div>'+
									'<input type = "submit" id = "submit" value ="提交" class="hui-button hui-primary hui-fr" >'+
									'</div>'+
									
								'<form>'+
							'</div>'+
						'</div>';
					 hui(div).appendTo('#list');
				}
				hui.accordion(true, false);
			},
			error:function(){
				alert("error");
			}
			
		})
		hui.accordion(true, false); 
	}
	function hiden(target){
		$(target).parent().parent().children("#change").hide();
		$(target).parent().parent().children(".hui-form-items").children("#stamp_name").attr("readonly","readonly");
		$(target).parent().parent().children(".hui-form-items").children("#manager").attr("readonly","readonly");
		$(target).parent().parent().children(".hui-form-items").children("#state").attr("readonly","readonly");
		$(target).parent().parent().children(".hui-form-items").children("#select_state").hide();
		$(target).parent().parent().children(".hui-form-items").children("#state").show();
		$(target).parent().parent().children(".hui-form-items").children("#stamp_company").attr("readonly","readonly");
		$(target).parent().parent().children(".hui-form-items").children("#stamp_type").attr("readonly","readonly");
		$(target).parent().children("#cancel").hide();
	}
	
	function updateInfo(target){
		$(target).parent().parent().children("#change").show();
		$(target).parent().parent().children(".hui-form-items").children("#stamp_name").removeAttr("readonly");
		$(target).parent().parent().children(".hui-form-items").children("#manager").removeAttr("readonly");
		$(target).parent().parent().children(".hui-form-items").children("#state").removeAttr("readonly");
		$(target).parent().parent().children(".hui-form-items").children("#state").hide();
		$(target).parent().parent().children(".hui-form-items").children("#select_state").show();
		$(target).parent().parent().children(".hui-form-items").children("#stamp_company").removeAttr("readonly");
		$(target).parent().parent().children(".hui-form-items").children("#stamp_type").removeAttr("readonly");
		$(target).parent().children("#cancel").show();
	}
</script>
<title>印章及证照维护</title>
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
		url:'${basePath}Office/StampCertificate/getstampandcertificate?pageNum='+page,
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
		url:'${basePath}Office/StampCertificate/getstampandcertificate?pageNum='+page,
		type:'get',
		dataType:'text',
		success:function(result){
			hui.closeLoading();
			var re = JSON.parse(JSON.stringify(result));
			var sl = JSON.parse(re).blist;
			for (var i = 0; i < sl.length; i++) {
				var stamp_id=sl[i].stamp_id;
				var stamp_name=sl[i].stamp_name;
				var manager=sl[i].manager;
				var state=sl[i].state;
				var stamp_company=sl[i].stamp_company;
				var stamp_type=sl[i].stamp_type;
				
				var div = document.createElement('div');
				 div.innerHTML ='<div class="hui-accordion">'+
					'<div class="hui-accordion-title" >'+stamp_name+'_状态：'+state+'</div>'+
					'<div class="hui-accordion-content hui-list">'+
							'<form action="${basePath}Office/StampCertificate/UpdateStamp" method="post" id="toStamp">'+
								'<input type="hidden" name="stamp_id" value="'+stamp_id+'">'+
								'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">印章、证照</div>'+
									'<input type="text" name="stamp_name" id="stamp_name"'+
										'class="hui-input" value="'+stamp_name+'" required="required" readonly="readonly">'+
								'</div>'+
									
								'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">管理员</div>'+
									'<input type="text" name="manager" id="manager" class="hui-input" value="'+manager+'" required="required" readonly="readonly">'+
									''+
								'</div>'+

								'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">当前状态</div>'+
									'<input type="text" name="state" id="state" class="hui-input" value="'+state+'" required="required" readonly="readonly">'+
									'<select id="select_state" style="display: none;" name="select_state" class="select_state" required="required">'+
									'<option value="可用">可用</option>'+
									'<option value="不可用">不可用</option>'+
									'</select>'+
									
								'</div>'+
								
								'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">所属公司</div>'+
									'<input type="text" name="stamp_company" id="stamp_company" class="hui-input" value="'+stamp_company+'" required="required" readonly="readonly">'+
									
								'</div>'+
								
								'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">类型</div>'+
									'<input type="text" name="stamp_type" id="stamp_type" class="hui-input" value="'+stamp_type+'" required="required" readonly="readonly">'+
									
								'</div>'+
								
								
								'<div class="hui-form-items" id="update">'+
									'<div class="hui-form-items-title" onclick="updateInfo(this)"><button type="button">更新信息</button></div>'+
									'<div class="hui-form-items-title" id="cancel" onclick="hiden(this)" style="display: none;"><button type="button">取消</button></div>'+
								'</div>'+


								'<div style="padding:15px 30px 50px 10px;display: none; " id="change">'+
								'<div class="hui-form-items-title"></div>'+
								'<input type = "submit" id = "submit" value ="提交" class="hui-button hui-primary hui-fr" >'+
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