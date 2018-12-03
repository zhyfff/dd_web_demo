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
<!-- 			<div  align="center" style="height:auto; height:60px; padding-bottom:8px;"> -->
<%-- 				您当前在钉钉的userId为 : ${u.userid} --%>
<%-- 				<input  type="hidden" id = "info" value="${userjson}"> --%>
<!-- 			</div> -->
		</c:forEach>
	</div>
</header>
		
	<div class="hui-wrap">
	<c:forEach items="${shenpi_list}" var="s">
		<form action="rlfw/shenpijieguo" method="post" class="hui-form">
		<div class="hui-accordion">
			<div class="hui-accordion-title">单 据 号：${s.rlfw_doc_num}-审批状态-	
				<c:choose>
				     <c:when test="${s.rlfw_act_re_time != ''&&s.rlfw_end_time  != ''&&s.rlfw_doc_state eq '同意'}">
			        		已确认归还
				    </c:when>
				     <c:when test="${s.rlfw_doc_state eq '同意'&&s.rlfw_act_re_time eq ''&&s.rlfw_evaluate eq ''}">
				        	审核通过
				    </c:when>
  					    <c:when test="${s.rlfw_doc_state eq '拒绝'}">
				        	已拒绝
				    </c:when>
				    <c:when test="${s.rlfw_act_re_time eq ''&&s.rlfw_doc_state eq '待审批'}">
				    		请审核
				    </c:when>
				     <c:when test="${s.rlfw_act_re_time eq ''&&s.rlfw_doc_state eq '同意'&&s.rlfw_evaluate!=''}">
				    		未归还
				    </c:when>
				     <c:when test="${s.rlfw_doc_state eq '同意'&&s.rlfw_act_re_time != '' &&s.rlfw_end_time eq ''}">
				    		已归还未确认
				    </c:when>
				</c:choose>
			</div>
			<div class="hui-accordion-content hui-list" style="height: 900px">
			<ul>	
			<li>
							<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
							<div class="hui-form-items">
							<div class="hui-form-items-title">单 据 号</div>
							<input type="text" readonly="readonly"
									value="${s.rlfw_doc_num}"   id="rlfw_doc_num" name="rlfw_doc_num" class="hui-input">
							</div>
						</li>
						<li>
							<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
							<div class="hui-form-items">
							<div class="hui-form-items-title">借用人员工号</div>
							<input type="text" readonly="readonly"
									value="${s.rlfw_use_peo_num}"   id="rlfw_use_peo_num" name="rlfw_use_peo_num" class="hui-input">
									</div>
						</li>
						<li>
							<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
							<div class="hui-form-items">
							<div class="hui-form-items-title">借用人员姓名</div>
							<input type="text" readonly="readonly"
									value="${s.rlfw_use_peo_name}"   id="rlfw_use_peo_name" name="rlfw_use_peo_name" class="hui-input">
									</div>
						</li>
						<li>
							<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
							<div class="hui-form-items">
							<div class="hui-form-items-title">借用人员部门</div>
							<input type="text" readonly="readonly"
									value="${s.rlfw_use_peo_depart}"   id="rlfw_use_peo_depart" name="rlfw_use_peo_depart" class="hui-input">
									</div>
						</li>
						<li>
							<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
							<div class="hui-form-items">
							<div class="hui-form-items-title">借 用 合 同 名</div>
							<input type="text" readonly="readonly"
									value="${s.rlfw_use_doc}"   id="rlfw_use_doc" name="rlfw_use_doc" class="hui-input">
									</div>
						</li>
						<li>
							<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
							<div class="hui-form-items">
							<div class="hui-form-items-title">借 用 事 由</div>
							<input type="text" readonly="readonly"
									value="${s.rlfw_use_desc}"   id="rlfw_use_desc" name="rlfw_use_desc" class="hui-input">
									</div>
						</li>
						<li>
							<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
							<div class="hui-form-items">
							<div class="hui-form-items-title">预计还回时间</div>
							<input type="text" readonly="readonly"
									value="${s.rlfw_exp_re_time}"   id="rlfw_exp_re_time" name="rlfw_exp_re_time" class="hui-input">
									</div>
						</li>
						<li>
							<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
							<div class="hui-form-items">
							<div class="hui-form-items-title">审批人员工号</div>
							<input type="text" value="${s.rlfw_app_peo_num}"   id="rlfw_app_peo_num" name="rlfw_app_peo_num" readonly="readonly" class="hui-input">
							</div>
						</li>
						<li>
							<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
							<div class="hui-form-items">
							<div class="hui-form-items-title">审批人员姓名</div>
							<input type="text" value="${s.rlfw_app_peo_name}"   id="rlfw_app_peo_name" name="rlfw_app_peo_name" readonly="readonly" class="hui-input">
							</div>
						</li>
				<c:choose>
  					    <c:when test="${s.rlfw_doc_state eq '待审批'}">
						
						<li>
							<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
							<div class="hui-form-items">
							<div class="hui-form-items-title">审批意见</div>
<!-- 									<div class="hui-list-text">审批意见</div> -->
							<input  type="text" class="hui-input" id="rlfw_app_desc"  name="rlfw_app_desc" required="required" checkType="string" checkData="6,30" checkMsg="审批意见应为6-30个字符"><!-- 	审批意见 -->
							</div>
						</li>
						<li>
							<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
<!-- 									<div class="hui-form-items"> -->
<!-- 									<div class="hui-form-items-title">审批时间</div> -->
							<div class="hui-list-text">审批时间
								<input type="date" id="rlfw_app_time" name="rlfw_app_time" required="required" style="height:auto; height:22px; margin-left:30px; margin-top: 10px; margin_right:30px;"><!-- 审批时间 -->
								
							</div>
<!-- 									</div> -->
						</li>
						<li>
							<div class="hui-list-icons"><img src="${basePath}dingdingweb/HUI/img/index/number.png" /></div>
<!-- 									<div class="hui-form-items"> -->
<!-- 									<div class="hui-form-items-title">实际借出时间</div> -->
							<div class="hui-list-text">实际借出时间
								<input type="date" id="rlfw_act_borr_time" name="rlfw_act_borr_time" required="required" style="height:auto; height:22px;  margin-left:30px; margin-top: 10px; margin_right:30px;">
							
							</div>
<!-- 									</div>  -->
							<!-- 实际借出时间 -->
						</li>
						  <li>
							<div class="hui-form-radios">
								<input type="radio" id="rlfw_doc_state" name="rlfw_doc_state" value="同意" style="margin-left:40px; margin-top: 10px"><label for="rlfw_doc_state" >同意</label>
								<input type="radio" id="rlfw_doc_state" name="rlfw_doc_state" value="拒绝" style="margin-right:40px; margin-top: 10px"> <label for="rlfw_doc_state">拒绝</label>
							</div>
						
							</li>
						
							<li>
								<div align="center">
									<input type="submit" id="submit"  name="submit"  value="提交审核" class="hui-button hui-fl">
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