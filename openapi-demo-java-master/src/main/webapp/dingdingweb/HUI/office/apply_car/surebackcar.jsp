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
	getSureBackCarInfor();
})
function getSureBackCarInfor(){
	$.ajax({
		url:'Office/ApplyCar/getSureBackCarInfor?name='+$("#userName").text()+'&pageNum=1',
		type:'GET',
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
				var car_id=blist[i].car_id;
				var car_name=blist[i].car_name;
				var license_plate=blist[i].license_plate;
				var apply_time=blist[i].apply_time;
				var use_time=blist[i].use_time;
				var apply_reason=blist[i].apply_reason;
				var pnum=blist[i].pnum;
				var driver=blist[i].driver;
				var audit_name=blist[i].audit_name;
				var audit_opinion=blist[i].audit_opinion;
				var audit_time=blist[i].audit_time;
				var note=blist[i].note;
				var audit_type=blist[i].audit_type;
				var evaluation=blist[i].evaluation;
				var over_time=blist[i].over_time;
				var div = document.createElement('div');
				div.innerHTML ='<div class="hui-accordion">'+
				'<div class="hui-accordion-title">'+name+'-'+apply_time+'</div>'+
				'<div class="hui-accordion-content hui-list">'+
				'<form style="padding: 28px 10px;" id="mycar" name="mycar"'+
					'action="Office/ApplyCar/savesure" method="post" class="hui-form">'+
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
						'<div class="hui-form-items-title">申请时间</div>'+
						'<input type="text" name="apply-time" id="apply-time"'+
							'class="hui-input" value="'+apply_time+'" readonly="readonly">'+
					'</div>'+

					'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">使用时间</div>'+
						'<input type="text" name="use-time" id="use-time"'+
							'class="hui-input" value="'+use_time+'" readonly="readonly">'+
					'</div>'+

					'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">申请事由</div>'+
						'<input type="text" name="apply-reason" id="apply-reason"'+
							'class="hui-input" value="'+apply_reason+'" readonly="readonly">'+
					'</div>'+

					'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">乘坐人数</div>'+
						'<input type="text" name="pnum" id="pnum" value="'+pnum+'"'+
							'class="hui-input" readonly="readonly">'+
					'</div>'+


					'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">是否需要司机</div>'+
						'<input type="text" name="driver" id="driver" class="hui-input"'+
							'value="'+driver+'" readonly="readonly">'+
					'</div>'+


							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">审批意见</div>'+
								'<input type="text" readonly="readonly" id="audit-opinion" name="audit-opinion"'+
									'required="required" class="hui-input"'+
									'value="'+audit_opinion+'">'+
							'</div>'+

							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">审批人</div>'+
								'<input type="text" readonly="readonly" id="audit-name" name="audit-name"'+
									'required="required" class="hui-input" value="'+audit_name+'">'+
							'</div>'+

							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">审批时间</div>'+
								'<input type="text" readonly="readonly" id="audit-time" name="audit-time"'+
									'required="required" class="hui-input" value="'+audit_time+'">'+
							'</div>'+

							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">备注</div>'+
								'<input type="text" readonly="readonly" id="note" name="note" class="hui-input"'+
									'required="required" value="'+note+'">'+
							'</div>'+



							'<input type="hidden" id="radio" name="radio" value="'+audit_type+'">'+
							

							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">服务评价</div>'+
								'<input type="text" readonly="readonly" class="hui-input" id="evaluation" name="evaluation" required="required" value="'+evaluation+'">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">车辆编号</div>'+
								'<input type="text" name="car_id" id="car_id" class="hui-input" value="'+car_id+'" readonly="readonly">'+
							'</div>'+
					
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">车辆名称</div>'+
								'<input type="text" name="car_name" id="car_name" class="hui-input" value="'+car_name+'" readonly="readonly">'+
							'</div>'+
						
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">车牌号</div>'+
								'<input type="text" name="license_plate" id="license_plate" class="hui-input" value="'+license_plate+'" readonly="readonly">'+
							'</div>'+
							'<input type="hidden" name="state" id="state" value="在库">'+
							
							'<div style="padding: 15px 30px 50px 10px;">'+
								'<div class="hui-form-items-title"></div>'+
								'<input type="submit" id="submit" value="确认归还"'+
									'class="hui-button hui-primary hui-fr">'+
							'</div>'+
					
				'</form>'+
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
</script>
<title>车辆归还确认</title>
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
		url:'Office/ApplyCar/getSureBackCarInfor?name='+$("#userName").text()+'&pageNum='+page,
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
		url:'Office/ApplyCar/getSureBackCarInfor?name='+$("#userName").text()+'&pageNum='+page,
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
				var car_id=blist[i].car_id;
				var car_name=blist[i].car_name;
				var license_plate=blist[i].license_plate;
				var apply_time=blist[i].apply_time;
				var use_time=blist[i].use_time;
				var apply_reason=blist[i].apply_reason;
				var pnum=blist[i].pnum;
				var driver=blist[i].driver;
				var audit_name=blist[i].audit_name;
				var audit_opinion=blist[i].audit_opinion;
				var audit_time=blist[i].audit_time;
				var note=blist[i].note;
				var audit_type=blist[i].audit_type;
				var evaluation=blist[i].evaluation;
				var over_time=blist[i].over_time;
				var div = document.createElement('div');
				div.innerHTML ='<div class="hui-accordion">'+
				'<div class="hui-accordion-title">'+name+'-'+apply_time+'</div>'+
				'<div class="hui-accordion-content hui-list">'+
				'<form style="padding: 28px 10px;" id="mycar" name="mycar"'+
					'action="Office/ApplyCar/savesure" method="post" class="hui-form">'+
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
						'<div class="hui-form-items-title">申请时间</div>'+
						'<input type="text" name="apply-time" id="apply-time"'+
							'class="hui-input" value="'+apply_time+'" readonly="readonly">'+
					'</div>'+

					'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">使用时间</div>'+
						'<input type="text" name="use-time" id="use-time"'+
							'class="hui-input" value="'+use_time+'" readonly="readonly">'+
					'</div>'+

					'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">申请事由</div>'+
						'<input type="text" name="apply-reason" id="apply-reason"'+
							'class="hui-input" value="'+apply_reason+'" readonly="readonly">'+
					'</div>'+

					'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">乘坐人数</div>'+
						'<input type="text" name="pnum" id="pnum" value="'+pnum+'"'+
							'class="hui-input" readonly="readonly">'+
					'</div>'+


					'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">是否需要司机</div>'+
						'<input type="text" name="driver" id="driver" class="hui-input"'+
							'value="'+driver+'" readonly="readonly">'+
					'</div>'+


							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">审批意见</div>'+
								'<input type="text" readonly="readonly" id="audit-opinion" name="audit-opinion"'+
									'required="required" class="hui-input"'+
									'value="'+audit_opinion+'">'+
							'</div>'+

							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">审批人</div>'+
								'<input type="text" readonly="readonly" id="audit-name" name="audit-name"'+
									'required="required" class="hui-input" value="'+audit_name+'">'+
							'</div>'+

							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">审批时间</div>'+
								'<input type="text" readonly="readonly" id="audit-time" name="audit-time"'+
									'required="required" class="hui-input" value="'+audit_time+'">'+
							'</div>'+

							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">备注</div>'+
								'<input type="text" readonly="readonly" id="note" name="note" class="hui-input"'+
									'required="required" value="'+note+'">'+
							'</div>'+



							'<input type="hidden" id="radio" name="radio" value="'+audit_type+'">'+
							

							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">服务评价</div>'+
								'<input type="text" readonly="readonly" class="hui-input" id="evaluation" name="evaluation" required="required" value="'+evaluation+'">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">车辆编号</div>'+
								'<input type="text" name="car_id" id="car_id" class="hui-input" value="'+car_id+'" readonly="readonly">'+
							'</div>'+
					
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">车辆名称</div>'+
								'<input type="text" name="car_name" id="car_name" class="hui-input" value="'+car_name+'" readonly="readonly">'+
							'</div>'+
						
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">车牌号</div>'+
								'<input type="text" name="license_plate" id="license_plate" class="hui-input" value="'+license_plate+'" readonly="readonly">'+
							'</div>'+
							'<input type="hidden" name="state" id="state" value="在库">'+
							
							'<div style="padding: 15px 30px 50px 10px;">'+
								'<div class="hui-form-items-title"></div>'+
								'<input type="submit" id="submit" value="确认归还"'+
									'class="hui-button hui-primary hui-fr">'+
							'</div>'+
					
				'</form>'+
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
<!-- 	<div class="hui-wrap" > -->
<%-- 			<c:forEach items="${applyCarInfor}" var="a"> --%>
<!-- 				<div class="hui-accordion"> -->
<%-- 					<div class="hui-accordion-title">申请时间：${a.apply_time}	 --%>
<!-- 					</div> -->
<!-- 					<div class="hui-accordion-content hui-list"> -->
<!-- 					<form style="padding: 28px 10px;" id="mycar" name="mycar" -->
<!-- 						action="Office/ApplyCar/savesure" method="post" class="hui-form"> -->
<!-- 						<div class="hui-form-items"> -->
<!-- 							<div class="hui-form-items-title">单据号</div> -->
<!-- 							<input type="text" name="dcnumber" id="dcnumber" -->
<%-- 								class="hui-input" value="${a.dcnumber}" readonly="readonly"> --%>
<!-- 						</div> -->

<!-- 						<div class="hui-form-items"> -->
<!-- 							<div class="hui-form-items-title">申请人工号</div> -->
<!-- 							<input type="text" name="jobnumber" id="jobnumber" -->
<%-- 								class="hui-input" value="${a.jobnumber}" readonly="readonly"> --%>
<!-- 						</div> -->

<!-- 						<div class="hui-form-items"> -->
<!-- 							<div class="hui-form-items-title">申请人姓名</div> -->
<!-- 							<input type="text" name="name" id="name" class="hui-input" -->
<%-- 								value="${a.name}" readonly="readonly"> --%>
<!-- 						</div> -->

<!-- 						<div class="hui-form-items"> -->
<!-- 							<div class="hui-form-items-title">申请人部门</div> -->
<!-- 							<input type="text" name="borrowde" id="borrowde" -->
<%-- 								class="hui-input" value="${a.borrowde}" readonly="readonly"> --%>
<!-- 						</div> -->

<!-- 						<div class="hui-form-items"> -->
<!-- 							<div class="hui-form-items-title">申请时间</div> -->
<!-- 							<input type="text" name="apply-time" id="apply-time" -->
<%-- 								class="hui-input" value="${a.apply_time}" readonly="readonly"> --%>
<!-- 						</div> -->

<!-- 						<div class="hui-form-items"> -->
<!-- 							<div class="hui-form-items-title">使用时间</div> -->
<!-- 							<input type="text" name="use-time" id="use-time" -->
<%-- 								class="hui-input" value="${a.use_time}" readonly="readonly"> --%>
<!-- 						</div> -->

<!-- 						<div class="hui-form-items"> -->
<!-- 							<div class="hui-form-items-title">申请事由</div> -->
<!-- 							<input type="text" name="apply-reason" id="apply-reason" -->
<%-- 								class="hui-input" value="${a.apply_reason}" readonly="readonly"> --%>
<!-- 						</div> -->

<!-- 						<div class="hui-form-items"> -->
<!-- 							<div class="hui-form-items-title">乘坐人数</div> -->
<%-- 							<input type="text" name="pnum" id="pnum" value="${a.pnum}" --%>
<!-- 								class="hui-input" readonly="readonly"> -->
<!-- 						</div> -->


<!-- 						<div class="hui-form-items"> -->
<!-- 							<div class="hui-form-items-title">是否需要司机</div> -->
<!-- 							<input type="text" name="driver" id="driver" class="hui-input" -->
<%-- 								value="${a.driver}" readonly="readonly"> --%>
<!-- 						</div> -->


<!-- 								<div class="hui-form-items"> -->
<!-- 									<div class="hui-form-items-title">审批意见</div> -->
<!-- 									<input type="text" readonly="readonly" id="audit-opinion" name="audit-opinion" -->
<!-- 										required="required" class="hui-input" -->
<%-- 										value="${a.audit_opinion}"> --%>
<!-- 								</div> -->

<!-- 								<div class="hui-form-items"> -->
<!-- 									<div class="hui-form-items-title">审批人</div> -->
<!-- 									<input type="text" readonly="readonly" id="audit-name" name="audit-name" -->
<%-- 										required="required" class="hui-input" value="${a.audit_name}"> --%>
<!-- 								</div> -->

<!-- 								<div class="hui-form-items"> -->
<!-- 									<div class="hui-form-items-title">审批时间</div> -->
<!-- 									<input type="text" readonly="readonly" id="audit-time" name="audit-time" -->
<%-- 										required="required" class="hui-input" value="${a.audit_time}"> --%>
<!-- 								</div> -->

<!-- 								<div class="hui-form-items"> -->
<!-- 									<div class="hui-form-items-title">备注</div> -->
<!-- 									<input type="text" readonly="readonly" id="note" name="note" class="hui-input" -->
<%-- 										required="required" value="${a.note}"> --%>
<!-- 								</div> -->


<!-- 														<div class="hui-form-items"> -->
<!-- 															<div class="hui-form-items-title">是否同意</div> -->
<%-- 								<input type="hidden" id="radio" name="radio" value="${a.audit_type}"> --%>
<!-- 														</div>  -->
								

<!-- 								<div class="hui-form-items"> -->
<!-- 									<div class="hui-form-items-title">服务评价</div> -->
<%-- 									<input type="text" readonly="readonly" class="hui-input" id="evaluation" name="evaluation" required="required" value="${a.evaluation}"> --%>
<!-- 								</div> -->
								
<!-- 									<div style="padding: 15px 30px 50px 10px;"> -->
<!-- 									<div class="hui-form-items-title"></div> -->
<!-- 									<input type="submit" id="submit" value="确认归还" -->
<!-- 										class="hui-button hui-primary hui-fr"> -->
<!-- 								</div> -->
						
<!-- 					</form> -->
<!-- 				</div> -->
<!-- 				</div> -->
			
<%-- 			</c:forEach> --%>
<!-- 	</div> -->

</body>
</html>