<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%@include file="/top.jsp"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta content="telephone=no,email=no" name="format-detection">
<meta name="wap-font-scale" content="no">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<script type="text/javascript">
	//在此拿到jsAPI权限验证配置所需要的信息
	var _config = <%= com.alibaba.dingtalk.openapi.demo.auth.AuthHelper.getConfig(request) %>;
</script>
<script type="text/javascript" src="http://g.alicdn.com/dingding/open-develop/1.6.9/dingtalk.js"></script>
<script type="text/javascript" src="https://g.alicdn.com/dingding/dingtalk-pc-api/2.7.0/index.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	loadScript();
})
function loadScript(){
	if (os.isAndroid || os.isPhone) {
		var script=document.createElement("script");
		script.type="text/javascript";
		script.src="dingdingweb/HUI/hrservices/js/hrservices.js";
		document.getElementsByTagName('head')[0].appendChild(script); 
	// 	script.onload=function(){}//js加载完成执行方法
	}else {
		var script=document.createElement("script");
		script.type="text/javascript";
		script.src="dingdingweb/HUI/hrservices/js/hrservices_pc.js";
		document.getElementsByTagName('head')[0].appendChild(script); 
	// 	script.onload=function(){}
	}
}

</script>
<title>劳动合同、人员档案借用申请</title>
</head>
<body>
<header class="header">
		<div class="hui-list" align="center">
				<div  class="hui-list-icons" style="width:110px; height:80px;">
					<img id="userImg" alt="头像" src="${basePath}dingdingweb/HUI/img/head.png" style="width:66px; margin:0px; border-radius:50%;">
				</div>
				<div align="center" style="height:auto; height:40px; padding-bottom:8px;" id="userName">
					欢迎您 : 
				</div>
				
				<input type="hidden" id ="info">
				<input type="hidden" id="username">	
		</div>
</header>
<div class="hui-wrap" >
<form style="padding: 28px 10px;" id="sendapply" name="sendapply" class="hui-form" onsubmit="return false;">				
						
						<input type="hidden" id="userId" name="userId">
						<div class="hui-form-items">
							<div class="hui-form-items-title">借用人员工号:</div>
							<input type ="text" id ="borrowid" class="hui-input" name="borrowid" readonly="readonly">
						</div>
					
					
						<div class="hui-form-items">
							<div class="hui-form-items-title">借用人员姓名:</div>
							 <input type ="text" id ="borrowname" class="hui-input" name="borrowname"  readonly="readonly">
						</div>
					
<!-- 						<div class="borrowde1_"> -->
<%-- 							<input type ="hidden" id ="borrowde1_1" name="borrowde1_1" value="${d.fid}" readonly="readonly"> --%>
<%-- 							<input type ="hidden" id ="borrowde1_2" name="borrowde1_2" value="${d.zid}" readonly="readonly"> --%>
<!-- 						</div> -->
					

<!-- 						<div class="hui-form-items">	 -->
<!-- 							<div class="hui-form-items-title">借用人员父部门</div> -->
							<input type ="hidden" id ="borrowde" class="hui-input" name="borrowde" value="defult" readonly="readonly">
<!-- 						</div> -->
					
					
<!-- 						<div class="hui-form-items"> -->
<!-- 							<div class="hui-form-items-title">借用人员部门</div> -->
<!-- 							<input type ="text" id ="borrowde2" class="hui-input" name="borrowde2" value="defult" readonly="readonly"> -->
<!-- 						</div> -->
					
					
					
						<div class="hui-form-items">
							<div class="hui-form-items-title">借用文件名</div>
							<input type ="text" id ="contractName" class="hui-input" checkType="string" checkData="6,30" checkMsg="合同名应为6-30个字符" name="contractName" required="required">
						</div>
					
					
						<div class="hui-form-items">
							<div class="hui-form-items-title">借用事由</div>
							<input type = "text" id ="reason" class="hui-input" name ="reason" checkType="string" checkData="1,50" checkMsg="事由应为1-50个字符" required="required">
						</div>
					
					
						<div class="hui-form-items">
							<div class="hui-form-items-title">预计归还时间</div>
							<input type="date" id="abacktime"  name="abacktime" required="required" class="hui-input">
						</div>
					
						<div class="hui-form-items">
							<div class="items-title" style="width:50%; line-height:40px; height:40px; flex-shrink:0;">审批人姓名</div>
							<input type ="hidden" id ="audit-name" class="hui-input" name="audit-name" required="required" >	
							<input type="hidden" id="spid"  name ="spid" readonly="readonly">
							<img alt="头像" src="${basePath}dingdingweb/HUI/img/add.png" style="height:40px;width:40px; margin:0px; border-radius:50%;" onclick="to2()" id="audit-img">	
						</div>
			
						<div style="padding:15px 8px 50px 15px;">
						<div class="hui-form-items-title"></div>
							<input type = "submit" id = "submit" value = "提交申请" class="hui-button hui-primary hui-fr" onclick="sendDing()">
						</div>
		</form>
	</div>
	
<script type="text/javascript">

	function sendDing(){
		if (myCheck()==true) {
			ding();
		}
		return false;
	}

	function myCheck()
    {//循环所有的表单元素； 也可以用jQuery：$("#表单id")[0].elements.length-1
       for(var i=0;i<document.sendapply.elements.length-1;i++) //下面减一是因为数组的下标为0
       {	
          if(document.sendapply.elements[i].value=="")
          {
             alert("当前表单不能有空项");
             document.sendapply.elements[i].focus();
             return false;
          }
       }
       return true;
      
    }
	

	function registered() {
			
		if (myCheck()==true) {
			$.ajax({
				url : "HrServices/saveApply",
				data : $("#sendapply").serialize(),
				dataType : "text",
				type : "POST",
				success : function(data) {
					hui.iconToast(data, 'success');
					window.location.reload();//刷新当前页
					if (data=='失败') {
						hui.iconToast(data, 'error');
					}
				},
				error : function() {
					hui.iconToast(data, 'error');
				}
			})
		}	
		return false;
	}
	
	</script>
</body>
</html>