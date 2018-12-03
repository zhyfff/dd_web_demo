<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%@include file="/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=charset=utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />
<title>申请历史</title>

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
			<div  align="center" style="height:auto; height:60px; padding-bottom:8px;">
				<!--  您当前在钉钉的userId为 : ${u.userid}-->
				<input  type="hidden" id = "info" value="${userjson}">
			</div>
		</c:forEach>
	</div>
</header>

		
		
		
	<div class="hui-wrap">
		<c:forEach items="${standbylist}" var="s" varStatus="abc">
			
				<form action="${basePath}Service/toevaluation" method="post" class="hui-form">
				<div class="hui-accordion">		
		          <div class="hui-accordion-title">单 据 号：${s.dctid}--	
					</div>
					<div class="hui-accordion-content hui-list">
					<ul>	
					       <li>
									<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
									<div class="hui-form-items">
									<div class="hui-form-items-title">单 据 号</div>
									<input type="text" readonly="readonly" id="dctid" name="dctid"
										   value="${s.dctid}"   class="hui-input">
									</div>
								</li>
								<li>
									<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
									<div class="hui-form-items">
									<div class="hui-form-items-title">申请人员工号</div>
									<input type="text" readonly="readonly"
											value="${s.job_number}"   class="hui-input">
											</div>
								</li>
								<li>
									<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
									<div class="hui-form-items">
									<div class="hui-form-items-title">申请人员姓名</div>
									<input type="text" readonly="readonly"
											value="${s.standby_people}"    class="hui-input">
											</div>
								</li>
								<li>
									<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
									<div class="hui-form-items">
									<div class="hui-form-items-title">申请人员部门</div>
									<input type="text" readonly="readonly"
											value="${s.standby_department}"   class="hui-input">
											</div>
								</li>
						
								<li>
									<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
									<div class="hui-form-items">
									<div class="hui-form-items-title">情况概述</div>
									<input type="text" readonly="readonly"
											value="${s.standby_note}"    class="hui-input">
									</div>
								</li>
								<li>
									<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
									<div class="hui-form-items">
									<div class="hui-form-items-title">申请时间</div>
									<input type="text" readonly="readonly"
											value="${s.standby_firstdate}"   class="hui-input">
											</div>
								</li>
								   <li>
									<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
									<div class="hui-form-items">
									<div class="hui-form-items-title">审批人</div>
									<input type="text" readonly="readonly"
											value="${s.process_people}"   class="hui-input">
											</div>
								</li>
					
								<li>
									<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
									<div class="hui-form-items">
									<div class="hui-form-items-title">审批时间</div>
									<input type="text" readonly="readonly"
											value="${s.complete_time}"   class="hui-input">
											</div>
								</li>
								<li>
									<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
									<div class="hui-form-items">
									<div class="hui-form-items-title">审批结果</div>
									<input type="text" readonly="readonly"
											value="${s.process_result}"   class="hui-input">
											</div>
								</li>
				             <li>
									<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
									<div class="hui-form-items">
									<div class="hui-form-items-title">预计处理时间</div>
									<input type="text" readonly="readonly"
											value="${s.process_time}"   class="hui-input">
											</div>
								</li>
									<li>
									<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
									<div class="hui-form-items">
									<div class="hui-form-items-title">实际完成时间</div>
									<input type="text" readonly="readonly"
											value="${s.donetime}"   class="hui-input">
											</div>
								</li>
							<li>
									<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
									<div class="hui-form-items">
									<div class="hui-form-items-title">服务评价</div>
											<input type="text" readonly="readonly"
											value="${s.evaluation}"   class="hui-input">
											</div>								
							</li>
							
						 
						</ul>
					</div>
					</div>
				
				</form>
		</c:forEach>
	</div>
</body>

</html>