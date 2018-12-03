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
		<c:forEach items="${feedlist}" var="s" varStatus="abc">
			
				<form action="feedback/tobacked" method="post" class="hui-form">
				<div class="hui-accordion">
					<div class="hui-accordion-title">单 据 号：${s.dctid}-处理状态-	
				<c:choose>
							<c:when test="${s.back_time eq null}">
						    		未处理
						    </c:when>
						    
					 	    <c:when test="${s.back_time != null&&s.done_time eq null}">
						    		待评价
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
											value="${s.complaint_jobnum}"   class="hui-input">
											</div>
								</li>
								<li>
									<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
									<div class="hui-form-items">
									<div class="hui-form-items-title">借用人员姓名</div>
									<input type="text" readonly="readonly"
											value="${s.complaint_people}"    class="hui-input">
											</div>
								</li>
								<li>
									<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
									<div class="hui-form-items">
									<div class="hui-form-items-title">借用人员部门</div>
									<input type="text" readonly="readonly"
											value="${s.complaint_depart}"   class="hui-input">
											</div>
								</li>
						
								<li>
									<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
									<div class="hui-form-items">
									<div class="hui-form-items-title">投诉内容</div>
									<input type="text" readonly="readonly"
											value="${s.complaint_content}"    class="hui-input">
											</div>
								</li>
								<li>
									<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
									<div class="hui-form-items">
									<div class="hui-form-items-title">投诉时间</div>
									<input type="text" readonly="readonly"
											value="${s.complaint_time}"   class="hui-input">
											</div>
								</li>
								<c:choose>
								<c:when test="${s.back_time != null}">
								<li>
									<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
									<div class="hui-form-items">
									<div class="hui-form-items-title">处理结果反馈</div>
									<input type="text" readonly="readonly"
											  value="${s.back_content}" class="hui-input">
								</div>
								</li>
								</c:when>
								<c:when test="${s.back_time eq null}">
								<li>
									<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
									<div class="hui-form-items">
									<div class="hui-form-items-title">处理结果反馈</div>
									<input type="text" id="back_conent"  name="back_content"
											 value="请填写处理结果"  class="hui-input">
								</div>
								</li>
								</c:when>
								</c:choose>
								
								
							<c:choose>
							<c:when test="${s.back_time eq null}">
								 <li>
										<div align="center">
											<input type="submit" id="submit"  name="submit"  value="提交" class="hui-button hui-fl">
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