<!DOCTYPE html>
<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/top.jsp"%>

<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection"/>
<meta content="yes" name="apple-touch-fullscreen"/>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
 

<!-- jquery引入 -->
	<script type="text/javascript"
		src="${basePath}dingdingweb/public/js/jquery/jquery.js"></script>
	<script type="text/javascript"
		src="${basePath}dingdingweb/public/js/jquery/flexible.js"></script>
	<link rel="stylesheet" type="text/css" href="${basePath}dingdingweb/HUI/css/hui.css" />
	<script src="${basePath}dingdingweb/HUI/js/hui.js" type="text/javascript" charset="utf-8"></script>
	
	<script type="text/javascript">


		$(document).ready(function(){

			getDepart1();
			getDepart2();
			getcorpUserDetail();
			
		})
		function getDepart1(){
			$.ajax({
				url:'${basePath}Department/getDepartmentdetail?DeptId='+$("#borrowde1_1").attr("value"),
				type:'GET',
				dataType:"text",		
				success:function(data){
					var depart = JSON.parse(data)		
					$("#borrowde1").val(depart.name)					
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
		function getcorpUserDetail(){
			
			$.ajax({
				url:'${basePath}CorpUserdetailList/getCorpUserdetail?departmentId='+$("#borrowde1_1").attr("value")+'&offset=0&size=10&order=entry_asc',
				type:'GET',
				dataType:'text',
				success:function(data){
					var corpuser=JSON.parse(data)
					var userlist = corpuser.userlist
					$("#link_spname").val(userlist[0].name)
					for (var int = 0; int < userlist.length; int++) {
						var name = userlist[int].name
						var isAdmin = userlist[int].isAdmin
						var jobnumber = userlist[int].jobnumber
							
							$("#select_name").append("<option value='"+jobnumber+"'>"+name+"</option>");		
					}
					
				},
				error:function(){
					alert("审批人列表获取失败")
				}

			})
			
		}
		
	</script>
	
<title>报修申请</title>

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
		
	<div class="hui-wrap" >
			<form  style="padding:28px 10px;" id = "apply_repair_form" action="${basePath}Repair/toaplyRepair" method="post" name="apply_repair_form" class="hui-form">
				<c:forEach items="${userinfoList}" var="u">

					
						<div class="hui-form-items">
							<div class="hui-form-items-title">报修人员工号:</div>
							<input type ="text" id ="repair_jobnum" class="hui-input" name="repair_jobnum" value="${u.jobnumber}" readonly="readonly">
						</div>
					
					
						<div class="hui-form-items">
							<div class="hui-form-items-title">报修人员姓名:</div>
							 <input type ="text" id ="repair_people" class="hui-input" name="repair_people" value="${u.name}" readonly="readonly">
						</div>
					
					
				</c:forEach>
				<c:forEach items="${departList}" var="d">
				<div class="borrowde1_">
					<input type ="hidden" id ="borrowde1_1" name="borrowde1_1" value="${d.fid}" readonly="readonly">
					<input type ="hidden" id ="borrowde1_2" name="borrowde1_2" value="${d.zid}" readonly="readonly">
				</div>
					
				</c:forEach>
					
						<div class="hui-form-items">	
							<div class="hui-form-items-title">报修人员父部门</div>
							<input type ="text" id ="borrowde1" class="hui-input" name="borrowde1" value="defult" readonly="readonly">
						</div>
					
					
						<div class="hui-form-items">
							<div class="hui-form-items-title">报修人员子部门</div>
							<input type ="text" id ="borrowde2" class="hui-input" name="borrowde2" value="defult" readonly="readonly">
						</div>			
						<div class="hui-form-items">
							<div class="hui-form-items-title">报修位置</div>
							<input type="hidden" id="repair_location"  name ="repair_location" readonly="readonly" > <br>
							<select id="follow" name="follow" >
                       			 <option value ="1">1</option>
 								 <option value ="2">2</option>
							</select>楼
							<select id="location" name="location" >
                       			 <option value ="东">东</option>
 								 <option value ="南">南</option>
							</select>侧
							</div>	
					
						<div class="hui-form-items">
							<div class="hui-form-items-title">报修内容</div>
							<input type = "text" id ="repair_content" class="hui-input" name ="repair_content" checkType="string" checkData="1,50" checkMsg="事由应为1-50个字符" required="required">
						</div>
					
						<div class="hui-form-items">
							<div class="hui-form-items-title">维修方</div>
							<input type="hidden" id="repair_repairer"  name ="repair_repairer" readonly="readonly" > <br>
							<select id="repairer" name="repairer" >
                       			 <option value ="内部">内部</option>
 								 <option value ="物业">物业</option>
							</select>
							</div>			


		
				
						<div class="list-wrap-third" align="center">
							<ul>
								<li><input type = "submit" id = "submit" value = "提交申请" class="hui-button hui-fl"></li>
							</ul>
						</div>
		</form>
	</div>
	



</body>
</html>