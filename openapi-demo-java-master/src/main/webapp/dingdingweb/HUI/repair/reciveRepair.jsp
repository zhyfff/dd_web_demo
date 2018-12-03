<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%@include file="/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=charset=utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />

<!-- jquery引入 
	<script type="text/javascript"
		src="${basePath}dingdingweb/public/js/jquery/jquery.js"></script>
	<script type="text/javascript"
		src="${basePath}dingdingweb/public/js/jquery/flexible.js"></script>
	<link rel="stylesheet" type="text/css" href="${basePath}dingdingweb/HUI/css/hui.css" />
	<script src="${basePath}dingdingweb/HUI/js/hui.js" type="text/javascript" charset="utf-8"></script>-->
	
	<script type="text/javascript">


		$(document).ready(function(){

			getDepart1();
// 			getDepart2();
// 			getcorpUserDetail();
			
		})
		function getDepart1(target){
			$.ajax({
				url:'${basePath}Department/getDepartmentdetail?DeptId='+$("#borrowde1_1").attr("value"),
				type:'GET',
				dataType:"text",		
				success:function(data){
					var depart = JSON.parse(data)		
					$(target).children(".hui-accordion-content").children("ul").children("#borrowde1").val(depart.name)					
				},
				error:function(){
					alert("不合法的部门id")
				}
			})	
		}	
		function getDepart2(){
			$.ajax({
				url:'${basePath}Department/getDepartmentdetail?DeptId='+$("#borrowde1_2").attr("value"),
				type:'GET',
				dataType:"text",		
				success:function(data){
					var depart = JSON.parse(data)		
					$("#borrowde2").val(depart.name)					
				},
				error:function(){
					alert("不合法的部门id")
				}
			})
			
			
		}

		
	</script>
	
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
		<c:forEach items="${repairlist}" var="s" varStatus="abc">
			
				<form action="${basePath}Repair/tosubmitin" method="post" class="hui-form">
				<div class="hui-accordion" onclick="getDepart1(this);">
										
		     		
					<div class="hui-accordion-title">单 据 号：${s.dctid}-审批状态-	
				<c:choose>
							<c:when test="${s.process_donetime eq null}">
						    		待处理
						    </c:when>
						    
					 	    <c:when test="${s.process_donetime !=null&&s.repair_evaluation eq null}">
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
									<div class="hui-form-items-title">报修人员工号</div>
									<input type="text" readonly="readonly"
											value="${s.repair_jobnum}"   class="hui-input">
											</div>
								</li>
								<li>
									<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
									<div class="hui-form-items">
									<div class="hui-form-items-title">报修人员姓名</div>
									<input type="text" readonly="readonly"
											value="${s.repair_people}"    class="hui-input">
											</div>
								</li>
								<li>
									<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
									<div class="hui-form-items">
									<div class="hui-form-items-title">报修人员部门</div>
									<input type="text" readonly="readonly"
											value="${s.people_depart}"   class="hui-input">
											</div>
								</li>
						
								<li>
									<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
									<div class="hui-form-items">
									<div class="hui-form-items-title">报修位置</div>
									<input type="text" readonly="readonly"
											value="${s.repair_location}"    class="hui-input">
											</div>
								</li>
								<li>
									<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
									<div class="hui-form-items">
									<div class="hui-form-items-title">报修内容</div>
									<input type="text" readonly="readonly"
											value="${s.repair_content}"    class="hui-input">
											</div>
								</li>
								<li>
									<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
									<div class="hui-form-items">
									<div class="hui-form-items-title">报修时间</div>
									<input type="text" readonly="readonly"
											value="${s.repair_time}"   class="hui-input">
											</div>
								</li>
								<li>
									<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
									<div class="hui-form-items">
									<div class="hui-form-items-title">维修方</div>
									<input type="text" readonly="readonly"
											value="${s.repair_repairer}"    class="hui-input">
											</div>
								</li>

						<c:choose>
	   					    <c:when test="${s.process_donetime eq null}">
	   					    <c:forEach items="${userinfoList}" var="u">
					
						<!-- 	<div class="hui-form-items-title">处理人员工号:</div> -->
							<input type ="hidden" id ="process_jobnum" class="hui-input" name="process_jobnum" value="${u.jobnumber}" readonly="readonly">
					
					
					
						
							<!--<div class="hui-form-items-title">处理人员姓名:</div>-->
							 <input type ="hidden" id ="process_people" class="hui-input" name="process_people" value="${u.name}" readonly="readonly">
					
					
					
				</c:forEach>
				<c:forEach items="${departList}" var="d">
				<div class="borrowde1_">
					<input type ="hidden" id ="borrowde1_1" name="borrowde1_1" value="${d.fid}" readonly="readonly">
					<input type ="hidden" id ="borrowde1_2" name="borrowde1_2" value="${d.zid}" readonly="readonly">
				</div>
					
				</c:forEach>
					
						
							<!-- <div class="hui-form-items-title">报修人员父部门</div>-->
							<input type ="hidden" id ="borrowde1" class="hui-input" name="borrowde1" value="defult" >
						
					
					
						
							
							
									<li>
										<div align="center">
											<input type="submit" id="submit"  name="submit"  value="维修完成" class="hui-button hui-fl">
										</div>
									</li>
						   	 </c:when>
						   	 <c:when test="${s.process_donetime !=null&&s.repair_evaluation eq null}">
						
								   	<li>
									<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
									<div class="hui-form-items">
									<div class="hui-form-items-title">维修完成时间</div>
									<input type="text" readonly="readonly"
											value="${s.process_donetime}"   class="hui-input">
											</div>
								</li>
								<li>
									<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
									<div class="hui-form-items">
									<div class="hui-form-items-title">处理人姓名</div>
									<input type="text" readonly="readonly"
											value="${s.process_people}"   class="hui-input">
											</div>
								</li>
								<li>
									<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
									<div class="hui-form-items">
									<div class="hui-form-items-title">处理人部门</div>
									<input type="text" readonly="readonly"
											value="${s.process_depart}"   class="hui-input">
											</div>
								</li>
								<li>
									<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
									<div class="hui-form-items">
									<div class="hui-form-items-title">处理人工号</div>
									<input type="text" readonly="readonly"
											value="${s.process_jobnum}"   class="hui-input">
											</div>
								</li>
								<li>
									<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
									<div class="hui-form-items">
									<div class="hui-form-items-title">完成时间</div>
									<input type="text" readonly="readonly"
											value="${s.end_time}"   class="hui-input">
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