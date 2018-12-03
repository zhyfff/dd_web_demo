<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%@include file="/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=charset=utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />
<title>支持服务申请</title>

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
		          <div class="hui-accordion-title">单 据 号：${s.dctid}-审批状态-	
						<c:choose>

						    <c:when test="${s.process_result eq 'Success'&&s.donetime != null}">
						    		待评价
						    </c:when>
						    <c:when test="${s.process_result eq null&&s.complete_time eq null}">
						    		待审批
						    </c:when>
						    <c:when test="${s.donetime eq null&&s.process_result eq 'Success'}">
						    		待处理
						    </c:when>
						    <c:when test="${s.process_result eq 'Failed'}">
						    		未通过
						    </c:when>
						    
						</c:choose>
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
									<div class="hui-form-items-title">审批时间</div>
									<input type="text" readonly="readonly"
											value="${s.complete_time}"   class="hui-input">
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
									<input type="text" readonly="readonly" id="donetime" name="donetime"
											value="${s.donetime}"   class="hui-input">
											</div>
								</li>
							<c:choose>
	   					    <c:when test="${s.process_result eq 'Success'&&s.donetime != null}"> 
	   					    <li>
									<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
									<div class="hui-form-items">
									<div class="hui-form-items-title">服务评价</div>
									<input type=  id="evaluation" name="evaluation"  class="hui-input">
									</div>
							</li>
							<li>
										<div align="center">
											<input type="submit" id="submit"  name="submit"  value="提交评价" class="hui-button hui-fl">
										</div>
							</li>
						   	 </c:when>
						   	 
						   	 
							</c:choose>
						</ul>
					</div>
					</div>
				
				</form>
		</c:forEach>
	</div>
</body>

</html>