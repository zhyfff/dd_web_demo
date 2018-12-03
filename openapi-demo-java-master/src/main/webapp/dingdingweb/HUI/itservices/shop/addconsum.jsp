<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%@include file="/top3.jsp"%>
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
<script type="text/javascript" src="${basePath}dingdingweb/HUI/itservices/shop/js/numberbox.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	getSelected();
})
</script>
<title>新增耗材种类</title>
</head>
<body>
<div class="hui-wrap" >
	<form action="ITServices/Addconsumable" method="post" style="padding: 28px 10px;" id="add" name="add" class="hui-form">

			<input type="hidden" name ="dcnumber" value="${dcnumber}">	
			<div class="hui-form-items">
				<div class="hui-form-items-title">采购日期</div>
				<input type="date" id="ptime" name="ptime"
					required="required" class="hui-input" value="${ptime}">
			</div>
			
			<div class="hui-form-items">
				<input type="hidden" id="pt" value="${ptype}">
	            <div class="hui-form-items-title">采购类型</div>
	            <div class="hui-form-select">
	                <select name="ptype" id="ptype">
	                    <option value="日常采购">日常采购</option>
	                    <option value="项目采购">专项采购</option>
	                </select>
	            </div>
       		 </div>
       		 
       		 <div class="hui-form-items">
       		 	<input type="hidden" id="ct" value="${consumable_type}">
	            <div class="hui-form-items-title">耗材分类</div>
	            <div class="hui-form-select">
	                <select name="consumable_type" id="consumable_type">
	                    <option value="打印耗材">打印耗材</option>
	                    <option value="电脑耗材">电脑耗材</option>
	                    <option value="印刷耗材">印刷耗材</option>
	                    <option value="输出介质">输出介质</option>
	                    <option value="手机周边耗材">手机周边耗材</option>
<!-- 	                    <option value="医用耗材">医用耗材</option> -->
	                </select>
	            </div>
       		 </div>
			
			<div class="hui-form-items">
				<div class="hui-form-items-title">耗材名称</div>
				<input type="text" id="consumable_name" name="consumable_name"
					required="required" class="hui-input" value="${consumable_name}">
			</div>
			
			<div class="hui-form-items">
				<div class="hui-form-items-title">规格型号</div>
				<input type="text" id="specifications" name="specifications"
					required="required" class="hui-input" value="${specifications}">
			</div>
			
			<div class="hui-form-items">
				<div class="hui-form-items-title">添加数量</div>
				<div class="hui-number-box" min="1" max="999">
					<div class="reduce" onclick="numberbox()">-</div>
					<input value="${consumable_num}" type=num id="consumable-num" name="consumable_num" onkeyup="this.value=this.value.replace(/[^0-9\.]/g,'');G('consum-tprice').value=G('consumable-num').value*G('consum-uprice').value;">
					<div class="add" onclick="numberbox()">+</div>
				</div>
			</div>
			
			<div class="hui-form-items">
				<div class="hui-form-items-title">耗材单价</div>
				<input type="text" id="consum-uprice" name="consum_uprice"
					required="required" class="hui-input" onkeyup="this.value=this.value.replace(/[^0-9\.]/g,'');G('consum-tprice').value=G('consumable-num').value*G('consum-uprice').value;">
			</div>
			
			<div class="hui-form-items">
				<div class="hui-form-items-title">耗材总价</div>
				<input type="text" id="consum-tprice" name="consum_tprice"
					required="required" class="hui-input"  readonly="readonly">
			</div>
			
			<div class="hui-form-items">
				<div class="hui-form-items-title">备注</div>
				<div class="hui-form-textarea">
					<textarea placeholder="备注..." id="note" name="note" required="required">${note}</textarea>
				</div>
			</div>


			

			<div style="padding: 15px 8px;">
				<div class="hui-form-items-title"></div>
				<input type="submit" id="submit" value="提交"
					class="hui-button hui-button-large hui-primary hui-fr">
			</div>
		</form>
</div>

<script type="text/javascript">
function myCheck()
{//循环所有的表单元素； 也可以用jQuery：$("#表单id")[0].elements.length-1
   for(var i=0;i<document.add.elements.length-1;i++) //下面减一是因为数组的下标为0
   {	
      if(document.add.elements[i].value=="")
      {
         alert("当前表单不能有空项");
         document.add.elements[i].focus();
         return false;
      }
   }
   return true;
  
}

function registered() {
	
	if (myCheck()==true) {
		$.ajax({
			url : "ITServices/Addconsumable",
			data : $("#add").serialize(),
			dataType : "text",
			type : "POST",
			success : function(data) {
				hui.iconToast(data, 'success');
				if (data=='失败') {
					hui.iconToast(data, 'error');
				}
				window.location.reload();//刷新当前页
			},
			error : function() {
				hui.iconToast(data, 'error');
			}
		})
	}	
	return false;
}

// hui.numberBox();
function G(e) {
	return document.getElementById(e);
}	

function getSelected(){
	var pt=$("#pt").attr("value");
	var ct=$("#ct").attr("value");
// 	alert(ct);
	$("#ptype").find("option:contains('"+pt+"')").attr("selected",true);
	$("#consumable_type").find("option:contains('"+ct+"')").attr("selected",true);

}
</script>
</body>
</html>