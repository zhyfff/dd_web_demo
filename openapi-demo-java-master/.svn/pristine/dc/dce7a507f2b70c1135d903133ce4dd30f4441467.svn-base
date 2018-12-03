<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%@include file="/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=charset=utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />
<title>我的审批</title>

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
				<!-- 您当前在钉钉的userId为 : ${u.userid}-->
				<input  type="hidden" id = "info" value="${userjson}">
			</div> 
		</c:forEach>
	</div>
</header>

		
		
		
	<div class="hui-wrap">
		<c:forEach items="${standbylist}" var="s" varStatus="abc">
			
				<form action="${basePath}Service/toCompletesp" method="post" class="hui-form">
				<div class="hui-accordion">
					<div class="hui-accordion-title">单 据 号：${s.dctid}-审批状态-	
				<c:choose>
							<c:when test="${s.process_result eq null}">
						    		请审核
						    </c:when>
						    
					 	    <c:when test="${s.process_result eq 'Success'&&donetime eq null}">
						    		未处理
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
									<div class="hui-form-items-title">借用人员工号</div>
									<input type="text" readonly="readonly"
											value="${s.job_number}"   class="hui-input">
											</div>
								</li>
								<li>
									<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
									<div class="hui-form-items">
									<div class="hui-form-items-title">借用人员姓名</div>
									<input type="text" readonly="readonly"
											value="${s.standby_people}"    class="hui-input">
											</div>
								</li>
								<li>
									<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
									<div class="hui-form-items">
									<div class="hui-form-items-title">借用人员部门</div>
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

						<c:choose>
	   					    <c:when test="${s.process_result eq null}">
								<li>
									<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>

									<div class="hui-list-text">预计处理时间
										<input type="date" id="process_time" name="process_time" required="required" style="height:auto; height:22px;  margin-left:30px; margin-top: 10px; margin_right:30px;">
									</div>
								</li>
							
								  <li>
									<div class="hui-form-radios">
										<input type="radio" id="success" name="radio" value="Success" style="margin-left:40px; margin-top: 10px"><label for="success" >同意</label>
										<input type="radio" id="fail" name="radio" value="Failed" style="margin-right:40px; margin-top: 10px"> <label for="fail">拒绝</label>
									</div>
									</li>
									<li>
										<div align="center">
											<input type="submit" id="submit"  name="submit"  value="提交审核" class="hui-button hui-fl">
										</div>
									</li>
						   	 </c:when>
						   	 <c:when test="${s.donetime eq null&&s.process_result != null}">
						
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
										<div align="center">
											<input type="submit" id="submit"  name="submit"  value="处理完成" class="hui-button hui-fl">
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