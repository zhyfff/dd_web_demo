<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%@include file="/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection"/>
<meta content="yes" name="apple-touch-fullscreen"/>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />
<meta content="telephone=no,email=no" name="format-detection">
<meta name="wap-font-scale" content="no">
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta content="yes" name="apple-touch-fullscreen" />    
<meta name="data-spm" content="a215s" />
<meta content="telephone=no,email=no" name="format-detection" />    
<meta content="fullscreen=yes,preventMove=no" name="ML-Config" />
<link href="icon114-114.png" rel="apple-touch-icon-precomposed">
<link href="icon.png" rel="Shortcut Icon" type="image/x-icon" />
<title>信息</title>
</head>
<body>
					<input type="hidden" id="username" value="${u.name}">


<div class="hui-wrap" >
	<input  type="hidden" id = "info" value="${userjson}">
			<c:forEach items="${applycarlist}" var="a">
				<div class="hui-accordion">
					<div class="hui-accordion-title">申请时间：${a.apply_time}-
					<c:choose>
						<c:when test="${a.audit_opinion eq null &&audit_time eq null}">
							正在审批
						</c:when>
						<c:when test="${a.audit_opinion != null &&audit_time != null&&audit_type eq'是'}">
							已审批同意
						</c:when>
						<c:when test="${a.audit_opinion != null &&audit_time != null&&audit_type eq'否'}">
							已审批拒绝
						</c:when>	
						<c:when test="${a.evaluation!=null&&over_time eq null}">
							已归还未确认
						</c:when>
						<c:when test="${a.evaluation!=null&&over_time != null}">
							已归还并确认
						</c:when>
					</c:choose>	
					</div>
					<div class="hui-accordion-content hui-list">
						<div class="hui-form-items">
							<div class="hui-form-items-title">单据号</div>
							<input type="text" name="dcnumber" id="dcnumber"
								class="hui-input" value="${a.dcnumber}" readonly="readonly">
						</div>

						<div class="hui-form-items">
							<div class="hui-form-items-title">申请人工号</div>
							<input type="text" name="jobnumber" id="jobnumber"
								class="hui-input" value="${a.jobnumber}" readonly="readonly">
						</div>

						<div class="hui-form-items">
							<div class="hui-form-items-title">申请人姓名</div>
							<input type="text" name="name" id="name" class="hui-input"
								value="${a.name}" readonly="readonly">
						</div>

						<div class="hui-form-items">
							<div class="hui-form-items-title">申请人部门</div>
							<input type="text" name="borrowde" id="borrowde"
								class="hui-input" value="${a.borrowde}" readonly="readonly">
						</div>

						<div class="hui-form-items">
							<div class="hui-form-items-title">申请时间</div>
							<input type="text" name="apply-time" id="apply-time"
								class="hui-input" value="${a.apply_time}" readonly="readonly">
						</div>

						<div class="hui-form-items">
							<div class="hui-form-items-title">使用时间</div>
							<input type="text" name="use-time" id="use-time"
								class="hui-input" value="${a.use_time}" readonly="readonly">
						</div>

						<div class="hui-form-items">
							<div class="hui-form-items-title">申请事由</div>
							<input type="text" name="apply-reason" id="apply-reason"
								class="hui-input" value="${a.apply_reason}" readonly="readonly">
						</div>

						<div class="hui-form-items">
							<div class="hui-form-items-title">乘坐人数</div>
							<input type="text" name="pnum" id="pnum" value="${a.pnum}"
								class="hui-input" readonly="readonly">
						</div>


						<div class="hui-form-items">
							<div class="hui-form-items-title">是否需要司机</div>
							<input type="text" name="driver" id="driver" class="hui-input"
								value="${a.driver}" readonly="readonly">
						</div>


								<div class="hui-form-items">
									<div class="hui-form-items-title">审批意见</div>
									<input type="text" readonly="readonly" id="audit-opinion" name="audit-opinion"
										required="required" class="hui-input"
										value="${a.audit_opinion}">
								</div>

								<div class="hui-form-items">
									<div class="hui-form-items-title">审批人</div>
									<input type="text" readonly="readonly" id="audit-name" name="audit-name"
										required="required" class="hui-input" value="${a.audit_name}">
								</div>

								<div class="hui-form-items">
									<div class="hui-form-items-title">审批时间</div>
									<input type="text" readonly="readonly" id="audit-time" name="audit-time"
										required="required" class="hui-input" value="${a.audit_time}">
								</div>

								<div class="hui-form-items">
									<div class="hui-form-items-title">备注</div>
									<input type="text" readonly="readonly" id="note" name="note" class="hui-input"
										required="required" value="${a.note}">
								</div>


								<!-- 						<div class="hui-form-items"> -->
								<!-- 							<div class="hui-form-items-title">是否同意</div> -->
								<input type="hidden" id="radio" name="radio" value="${a.audit_type}">
								<!-- 						</div>  -->
								

								<div class="hui-form-items">
									<div class="hui-form-items-title">服务评价</div>
									<input type="text" readonly="readonly" class="hui-input" id="evaluation" name="evaluation" required="required" value="${a.evaluation}">
								</div>

				</div>
				</div>
			</c:forEach>
		</div>

</body>
</html>