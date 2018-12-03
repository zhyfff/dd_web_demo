/*合同借阅*/
function getContractMessageDetail(){
	var dc = $("#dcnumber").attr("value");
	var ty = $("#type").attr("value");
	$.ajax({
		url:'Message/getDetailMessage?dcnumber='+dc+'&type='+encodeURIComponent(ty),
		type:'GET',
		dataType:'text',
		success:function (result){
			hui.closeLoading();
			var re = JSON.parse(JSON.stringify(result));
			var blist = JSON.parse(re).blist;
			var s = '';
			for (var i = 0; i < blist.length; i++) {
				var dcnumber=blist[i].dcnumber
				var borrowid=blist[i].borrowid
				var borrowname=blist[i].borrowname
				var borrowde=blist[i].borrowde
				var link_contractName=blist[i].link_contractName
				var link_reason=blist[i].link_reason
				var link_abacktime=blist[i].link_abacktime
				var link_spid=blist[i].link_spid
				var link_spname=blist[i].link_spname
				var link_spopinions=blist[i].link_spopinions
				var link_spdate=blist[i].link_spdate
				var link_abdate=blist[i].link_abdate
				var link_rdate=blist[i].link_rdate
				var link_note=blist[i].link_note
				var link_evaluation=blist[i].link_evaluation
				var overdate=blist[i].overdate
				var audittype=blist[i].audittype
				var s = '';
				if (link_rdate != null&&overdate != null&&audittype== '是') {
					s='已确认归还';
				}else if (audittype=='是'&&link_rdate==null&&link_evaluation==null) {
					s='审核通过';
				}else if (audittype == '否') {
					s='已拒绝';
				}else if (audittype==null&&link_rdate==null) {
					s='未审批';
				}else if (link_rdate==null&&audittype=='是'&&link_evaluation!=null&&overdate==null) {
					s='未归还';
				}else if (audittype=='是'&&link_rdate!= null &&overdate==null) {
					s='已归还未确认';
				}
				
				var div = document.createElement('div');
				 div.innerHTML =
					 '<div id="audit-table" style="display:none">'+
					 			'<form action="Contract/auditToBase" method="post" id="audit" class="hui-form">'+
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">处理状态</div>'+
									'<input type="text" name="cl" id="cl"'+
										'class="hui-input" value="'+s+'" readonly="readonly">'+
								'</div>'+
								'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">单据号</div>'+
									'<input type="text" name="dcnumber" id="dcnumber"'+
										'class="hui-input" value="'+dcnumber+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">借用人员工号</div>'+
								'<input type="text" name="borrowid" id="borrowid"'+
									'class="hui-input" value="'+borrowid+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">借用人员姓名</div>'+
								'<input type="text" name="borrowname" id="borrowname"'+
									'class="hui-input" value="'+borrowname+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">借用人员部门</div>'+
								'<input type="text" name="borrowde" id="borrowde"'+
									'class="hui-input" value="'+borrowde+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">借用合同名</div>'+
								'<input type="text" name="link_contractName" id="link_contractName"'+
									'class="hui-input" value="'+link_contractName+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">借用事由</div>'+
								'<input type="text" name="link_reason" id="link_reason"'+
									'class="hui-input" value="'+link_reason+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">预计还回时间</div>'+
								'<input type="text" name="link_abacktime" id="link_abacktime"'+
									'class="hui-input" value="'+link_abacktime+'" readonly="readonly">'+
								'</div>'+
								
								
								'<input type="hidden" name="link_spid" id="link_spid"'+
									'class="hui-input" value="'+link_spid+'" readonly="readonly">'+
								
								
								
								'<input type="hidden" name="link_spname" id="link_spname"'+
									'class="hui-input" value="'+link_spname+'" readonly="readonly">'+
								
								'<div id="never">'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">审批意见</div>'+
								'<input  type="text" class="hui-input" id="link_spopinions"  name="link_spopinions" required="required" checkType="string" checkData="6,30" checkMsg="审批意见应为6-30个字符">'+
								'</div>'+
							
								
								'<div class="hui-form-items">'+	
								'<div class="hui-form-items-title">审批时间</div>'+
								'<input type="date" id="link_spdate" name="link_spdate" required="required" class="hui-input">'+
								'</div>'+	
								
								'<div class="hui-form-items">'+						
								'<div class="hui-form-items-title">实际借出时间</div>'+
								'<input type="date" id="link_abdate" name="link_abdate" required="required" class="hui-input">'+
								'</div>'+	
								
							
						
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">是否同意</div>'+
								'<div class="hui-form-select">'+
								'<select id="radio" name="radio" class="radio" >'+
									'<option value="是">是</option>'+
									'<option value="否">否</option>'+
								'</select>'+
								'</div>'+
								'</div>'+
							
								'<div style="padding: 10px 30px 60px 10px;">'+
									'<div class="hui-form-items-title"></div>'+
									'<input type="submit" id="submit" name="submit" value="提交审核"'+
										'class="hui-button hui-primary hui-fr">'+
								'</div>'+	
								'</div>'+
								'</form>'+
					'</div>'+
					
					'<div id ="myapply-table" style="display:none">'+
								'<form action="Contract/applyToBasse" method="post" id="myapply" class="hui-form">'+
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">处理状态</div>'+
									'<input type="text" name="cl" id="cl"'+
										'class="hui-input" value="'+s+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
						     	'<div class="hui-form-items-title">单据号</div>'+		
								'<input type="text" readonly="readonly"'+
									'value="'+dcnumber+'" id="dcnumber" name="dcnumber" class="hui-input">'+
								'</div>'+
			
								'<input type="hidden" readonly="readonly"'+
									'value="'+borrowid+'" id="borrowid" name="borrowid">'+
							
						
								'<input type="hidden" readonly="readonly"'+
									'value="'+borrowname+'" id="borrowname" name="borrowname">'+
							
								'<input type="hidden" readonly="readonly"'+
									'value="'+borrowde+'" id="borrowde" name="borrowde">'+
							
								'<div class="hui-form-items">'+
							    '<div class="hui-form-items-title">借用合同名</div>'+
								'<input type="text" readonly="readonly"'+
									'value="'+link_contractName+'" id="link_contractName" name="link_contractName" class="hui-input">'+
								'</div>'+
							
								'<input type="hidden" readonly="readonly"'+
									'value="'+link_reason+'" id="link_reason" name="link_reason">'+
							
								'<input type="hidden" readonly="readonly"'+
									'value="'+link_abacktime+'" id="link_abacktime" name="link_abacktime">'+
							
								'<input type="hidden" value="'+link_spid+'" id="link_spid" name="link_spid">'+
							
								'<input type="hidden" value="'+link_spname+'" id="link_spname" name="link_spname">'+
							
								'<input  type="hidden" id="link_spopinions" name="link_spopinions" value="'+link_spopinions+'">'+
							
								'<input type="hidden" id="link_spdate" name="link_spdate" value="'+link_spdate+'">'+
							
								'<input type="hidden" id="link_abdate" name="link_abdate" value="'+link_abdate+'">'+
							
								'<input type="hidden" id="radio" name="radio" value="'+audittype+'">'+
							
								'<div id="never">'+
								'<div class="hui-form-items">'+
						     	'<div class="hui-form-items-title">服务评价</div>'+
						     	'<div class="hui-form-textarea">'+
						     	'<textarea placeholder="服务评价" name="link_evaluation" required="required"></textarea>'+
						     	'</div>'+
						     	'</div>'+
			
						    
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">备注</div>'+
								'<div class="hui-form-textarea">'+
								 '<textarea placeholder="备注" name="link_note" required="required"></textarea>'+
								'</div>'+
								'</div>'+
							
								'<div  style="padding:15px 30px 50px 10px; ">'+
								'<div class="hui-form-items-title"></div>'+
									'<input id="submit" type="submit" value="提交评价" class="hui-button hui-primary hui-fr">'+
								'</div>'+
								'</div>'+
								'</form>'+
					'</div>'+
					
					'<div id="myback-table" style="display:none">'+
								'<form action="Contract/backToBase" method="post" id="myback" class="hui-form">'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">处理状态</div>'+
									'<input type="text" name="cl" id="cl"'+
										'class="hui-input" value="'+s+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
						     	'<div class="hui-form-items-title">单据号</div>'+
								'<input type="text" readonly="readonly"'+
									'value="'+dcnumber+'" class="hui-input" id="dcnumber" name="dcnumber">'+
								'</div>'+
								
								'<input type="hidden" readonly="readonly"'+
									'value="'+borrowid+'" id="borrowid" name="borrowid">'+
								'<input type="hidden" readonly="readonly"'+
									'value="'+borrowname+'" id="borrowname" name="borrowname">'+
								'<input type="hidden" readonly="readonly"'+
									'value="'+borrowde+'" id="borrowde" name="borrowde">'+
									
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">借用合同名</div>'+
								'<input type="text" readonly="readonly"'+
									'value="'+link_contractName+'" class="hui-input" id="link_contractName" name="link_contractName">'+
								'</div>'+
								
								'<input type="hidden" readonly="readonly"'+
									'value="'+link_reason+'" id="link_reason" name="link_reason">'+
								'<input type="hidden" readonly="readonly"'+
									'value="'+link_abacktime+'" id="link_abacktime" name="link_abacktime">'+
								'<input type="hidden" value="'+link_spid+'" id="link_spid" name="link_spid">'+
								'<input type="hidden" value="'+link_spname+'" id="link_spname" name="link_spname">'+
								'<input type="hidden" id="link_spdate" name="link_spdate" value="'+link_spdate+'">'+
								'<input type="hidden" id="link_abdate" name="link_abdate" value="'+link_abdate+'">'+
								'<input type="hidden" id="radio" name="radio" value="'+audittype+'">'+
									'<input type="hidden" id="link_evaluation"'+
									'name="link_evaluation" value="'+link_evaluation+'">'+
								'<input type="hidden" id="link_note" name="link_note" value="'+link_note+'">'+
			
								'<div id="never">'+
								'<div style="padding:15px 30px 50px 10px; ">'+
								'<div class="hui-form-items-title"></div>'+
									'<input type="submit" value="归还" class="hui-button hui-primary hui-fr">'+
								'</div>'+
								'</div>'+
			
								
								'</form>'+
					'</div>'+
								
								
								
					'<div id="findalback" style="display:none">'+
								'<form action="Contract/finalToBase" method="post" id="sureback" class="hui-form" >'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">处理状态</div>'+
									'<input type="text" name="cl" id="cl"'+
										'class="hui-input" value="'+s+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
						     	'<div class="hui-form-items-title">单据号</div>'+
								'<input type="text" readonly="readonly"'+
									'value="'+dcnumber+'" class="hui-input" id="dcnumber" name="dcnumber">'+
								'</div>'+
								
								'<input type="hidden" readonly="readonly"'+
									'value="'+borrowid+'" id="borrowid" name="borrowid">'+
								'<input type="hidden" readonly="readonly"'+
									'value="'+borrowname+'" id="borrowname" name="borrowname">'+
								'<input type="hidden" readonly="readonly"'+
									'value="'+borrowde+'" id="borrowde" name="borrowde">'+
									
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">借用合同名</div>'+
								'<input type="text" readonly="readonly"'+
									'value="'+link_contractName+'" class="hui-input" id="link_contractName" name="link_contractName">'+
								'</div>'+
								
								'<input type="hidden" readonly="readonly"'+
									'value="'+link_reason+'" id="link_reason" name="link_reason">'+
								'<input type="hidden" readonly="readonly"'+
									'value="'+link_abacktime+'" id="link_abacktime" name="link_abacktime">'+
								'<input type="hidden" value="'+link_spid+'" id="link_spid" name="link_spid">'+
								'<input type="hidden" value="'+link_spname+'" id="link_spname" name="link_spname">'+
								'<input type="hidden" id="link_spdate" name="link_spdate" value="'+link_spdate+'">'+
								'<input type="hidden" id="link_abdate" name="link_abdate" value="'+link_abdate+'">'+
								'<input type="hidden" id="radio" name="radio" value="'+audittype+'">'+
									'<input type="hidden" id="link_evaluation"'+
									'name="link_evaluation" value="'+link_evaluation+'">'+
								'<input type="hidden" id="link_note" name="link_note" value="'+link_note+'">'+
								'<div id="never">'+
								'<div style="padding:15px 30px 50px 10px; ">'+
								'<div class="hui-form-items-title"></div>'+
									'<input type="submit" value="确认归还" class="hui-button hui-primary hui-fr">'+
								'</div>'+
								'</div>'+
								'</form>'+
						'</div>';
		            
		            hui(div).appendTo('#list');
			}
			showContract(s);
			
		},
		error:function (){
			alert("合同借用获取失败");
		}
	})
	
	
}

function showContract(s){
//	alert(s);
//	alert("audit_name:"+$("#audit_name").attr("value"));
// 	alert("username:"+$("#username").attr("value"));
// 	alert($("#name").attr("value"));
	if (s=="未审批") {
		$("#audit-table").show();
		$("#myapply-table").remove();
		$("#myback-table").remove();
		$("#findalback").remove();
		if ($("#username").attr("value")!=$("#audit_name").attr("value")) {
			$("#never").remove();
		}
	}else if (s=="审核通过") {
		$("#myapply-table").show();
		$("#audit-table").remove();
		$("#myback-table").remove();
		$("#findalback").remove();
		if ($("#username").attr("value")!=$("#name").attr("value")) {
			$("#never").remove();
		}
	}else if (s=="未归还") {
		$("#myback-table").show();
		$("#findalback").remove();
		$("#audit-table").remove();
		$("#myapply-table").remove();
		if ($("#username").attr("value")!=$("#name").attr("value")) {
			$("#never").remove();
		}
	}else if (s=="已归还未确认") {
		$("#findalback").show();
		$("#audit-table").remove();
		$("#myback-table").remove();
		$("#myapply-table").remove();
		if ($("#username").attr("value")!=$("#audit_name").attr("value")) {
			$("#never").remove();
		}
	}else if (s=="已确认归还") {
		$("#findalback").show();
		$("#audit-table").remove();
		$("#myback-table").remove();
		$("#myapply-table").remove();
		$("#never").remove();
	}else if (s=="已拒绝") {
		$("#myapply-table").show();
		$("#audit-table").remove();
		$("#myback-table").remove();
		$("#findalback").remove();
		$("#never").remove();
	}
}

/******************************************************************************************************/
/*快递发放*/
function getCourierMessageDetail(){
	var dc = $("#dcnumber").attr("value");
	var ty = $("#type").attr("value");
	$.ajax({
		url:'Message/getDetailMessage?dcnumber='+dc+'&type='+encodeURIComponent(ty),
		type:'GET',
		dataType:'text',
		success:function (result){
			hui.closeLoading();
			var re = JSON.parse(JSON.stringify(result));
			var blist = JSON.parse(re).blist;
			var s = '';
			for (var i = 0; i < blist.length; i++) {
				var dcnumber=blist[i].dcnumber;
				var recipients=blist[i].recipients;
				var express_no=blist[i].express_no;
				var notice_time=blist[i].notice_time;
				var pay_type=blist[i].pay_type;
				var notice_word=blist[i].notice_word;
				var lq=blist[i].lq;
				var express=blist[i].express;
				var note=blist[i].note;
				var evaluation=blist[i].evaluation;
				var overtime=blist[i].overtime;
				
				if (lq!=null&&evaluation==null) {
					s='已领取需确认';
				}else if (lq==null) {
					s='未领取';
				}else if (evaluation!=null&&overtime!=null) {
					s='已领取';
				}
				var div = document.createElement('div');
				 div.innerHTML =
						'<form action="Office/SaveRelq" method="post" id="saveMyCourier" class="hui-form">'+
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">处理状态</div>'+
									'<input type="text" name="cl" id="cl"'+
										'class="hui-input" value="'+s+'" readonly="readonly">'+
								'</div>'+
						
								'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">单据号</div>'+
									'<input type="text" name="dcnumber" id="dcnumber"'+
										'class="hui-input" value="'+dcnumber+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">收件人</div>'+
								'<input type="text" name="recipients" id="recipients"'+
									'class="hui-input" value="'+recipients+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">快递号</div>'+
								'<input type="text" name="express_no" id="express_no"'+
									'class="hui-input" value="'+express_no+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">通知时间</div>'+
								'<input type="text" name="notice_time" id="notice_time"'+
									'class="hui-input" value="'+notice_time+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">是否到付</div>'+
								'<input type="text" name="pay_type" id="pay_type"'+
									'class="hui-input" value="'+pay_type+'" readonly="readonly">'+
								'</div>'+
								
								'<input type="hidden" id="notice-word" name="notice-word" value="'+notice_word+'">'+
								
								'<div id="hidden_lq">'+
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">领取人</div>'+
								'<input type="text" name="lqh" id="lqh"'+
									'class="hui-input" value="'+lq+'" readonly="readonly">'+
								'</div>'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">快递公司</div>'+
								'<input type="text" name="express" id="express"'+
									'class="hui-input" value="'+express+'" readonly="readonly">'+
								'</div>'+
								
								'<div id="never">'+
								
								'<input type="hidden" id="notice-word" name="notice-word" value="'+notice_word+'">'+
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">领取人</div>'+
								'<input type="text" name="lq" id="lq"'+
									'class="hui-input"  required="required">'+
								'</div>'+
								
	
								'<div style="padding:15px 30px 50px 10px; ">'+
								'<div class="hui-form-items-title"></div>'+
								'<input type = "submit" id = "submit" value ="确认登记领取人" class="hui-button hui-primary hui-fr">'+
								'</div>'+
								
								'</div>'+
							'<form>';
						
					
		            hui(div).appendTo('#list');
			}
			showCourier(s);
			
		},
		error:function (){
			alert("快递发放获取失败");
		}
		
	})
	
	
}


function showCourier(s){
// 	alert("audit_name:"+$("#audit_name").attr("value"));
// 	alert("username:"+$("#username").attr("value"));
	if (s!="未领取"||$("#username").attr("value")!=$("#audit_name").attr("value")) {
		$("#never").hide();
	}else {
		$("#hidden_lq").hide();
	}
}


/*****************************************************************************************************/
/*车辆借用*/
function getApplyCarMessageDetail(){
	var dc = $("#dcnumber").attr("value");
	var ty = $("#type").attr("value");
	$.ajax({
		url:'Message/getDetailMessage?dcnumber='+dc+'&type='+encodeURIComponent(ty),
		type:'GET',
		dataType:'text',
		success:function (result){
			hui.closeLoading();
			var re = JSON.parse(JSON.stringify(result));
			var blist = JSON.parse(re).blist;
			var s = '';
			for (var i = 0; i < blist.length; i++) {
				var dcnumber=blist[i].dcnumber;
				var jobnumber=blist[i].jobnumber;
				var name=blist[i].name;
				var borrowde=blist[i].borrowde;
				var car_id=blist[i].car_id;
				var car_name=blist[i].car_name;
				var license_plate=blist[i].license_plate;
				var apply_time=blist[i].apply_time;
				var use_time=blist[i].use_time;
				var apply_reason=blist[i].apply_reason;
				var pnum=blist[i].pnum;
				var driver=blist[i].driver;
				var audit_name=blist[i].audit_name;
				var audit_opinion=blist[i].audit_opinion;
				var audit_time=blist[i].audit_time;
				var note=blist[i].note;
				var audit_type=blist[i].audit_type;
				var evaluation=blist[i].evaluation;
				var over_time=blist[i].over_time;
				if (audit_opinion==null&&audit_time==null) {
					s='未审核';
				}else if (audit_opinion !=null&&audit_time !=null&&audit_type=='否') {
					s='审核未通过';
				}else if (evaluation!=null&& audit_type=='是'&&over_time==null) {
					s='已归还需确认';
				}else if (evaluation==null&& audit_type=='是'&&over_time==null) {
					s='未归还';
				}else if (evaluation!=null&& audit_type=='是'&&over_time!=null) {
					s='已归还';
				}
				
				var div = document.createElement('div');
				 div.innerHTML = '<div id="ApplyAudit-table" style="display:none; margin-bottom: 50px;">'+
					
						'<form style="padding: 28px 10px;" id="saveAudit" name="audit" action="Office/ApplyCar/saveAudit" method="post" class="hui-form">'+
							
							'<div class="hui-form-items">'+
							'<div class="hui-form-items-title">处理状态</div>'+
								'<input type="text" name="cl" id="cl"'+
									'class="hui-input" value="'+s+'" readonly="readonly">'+
							'</div>'+
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">单据号</div>'+
								'<input type="text" name="dcnumber" id="dcnumber" class="hui-input" value="'+dcnumber+'" readonly="readonly">'+
							'</div>'+
						
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">申请人工号</div>'+
								'<input type="text" name="jobnumber" id="jobnumber" class="hui-input" value="'+jobnumber+'" readonly="readonly">'+
							'</div>'+
						
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">申请人姓名</div>'+
								'<input type="text" name="name" id="name" class="hui-input" value="'+name+'" readonly="readonly">'+
							'</div>'+
						
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">申请人部门</div>'+
								'<input type="text" name="borrowde" id="borrowde" class="hui-input" value="'+borrowde+'" readonly="readonly">'+
							'</div>'+
							
							
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">车辆编号</div>'+
								'<input type="text" name="car_id" id="car_id" class="hui-input" value="'+car_id+'" readonly="readonly">'+
							'</div>'+
						
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">车辆名称</div>'+
								'<input type="text" name="car_name" id="car_name" class="hui-input" value="'+car_name+'" readonly="readonly">'+
							'</div>'+
						
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">车牌号</div>'+
								'<input type="text" name="license_plate" id="license_plate" class="hui-input" value="'+license_plate+'" readonly="readonly">'+
							'</div>'+
						
							'<input type="hidden" name="state" id="state" value="出库">'+
							
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">申请时间</div>'+
								'<input type="text" name="apply-time" id="apply-time" class="hui-input" value="'+apply_time+'" readonly="readonly">'+
							'</div>'+
						
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">使用时间</div>'+
								'<input type="text" name="use-time" id="use-time" class="hui-input" value="'+use_time+'" readonly="readonly">'+
							'</div>'+
						
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">申请事由</div>'+
								'<input type="text" name="apply-reason" id="apply-reason" class="hui-input" value="'+apply_reason+'" readonly="readonly">'+
							'</div>'+
						
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">乘坐人数</div>'+
								'<input type="text" name="pnum" id="pnum" value="'+pnum+'" class="hui-input" readonly="readonly">'+
							'</div>'+
						
						
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">是否需要司机</div>'+
								'<input type="text" name="driver" id="driver" class="hui-input" value="'+driver+'" readonly="readonly">'+
							'</div>'+
						
							'<div id ="never">'+
								
									'<div class="hui-form-items">'+
										'<div class="hui-form-items-title">审批意见</div>'+
										'<div class="hui-form-textarea">'+
										'<textarea id="audit-opinion" name="audit-opinion"  required="required"></textarea>'+
										'</div>'+
									'</div>'+
								
									'<div class="hui-form-items">'+
										'<div class="hui-form-items-title">审批时间</div>'+
										'<input type="date" id="audit-time" name="audit-time"  class="hui-input" required="required">'+
									'</div>'+
								
									'<div class="hui-form-items">'+
										'<div class="hui-form-items-title">备注</div>'+
										'<div class="hui-form-textarea">'+
										'<textarea id="note" name="note"  required="required"></textarea>'+
										'</div>'+
									'</div>'+
								
								
									'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">是否同意</div>'+
									'<select id="radio" name="radio" class="radio" >'+
										'<option value="是">是</option>'+
										'<option value="否">否</option>'+
									'</select>'+
									'</div>'+
								
								
									'<div style="padding:15px 30px 50px 10px; ">'+
									'<div class="hui-form-items-title"></div>'+
									'<input type = "submit" id = "submit" value ="确认" class="hui-button hui-primary hui-fr" >'+
									'</div>'+
							'</div>'+

						'</form>'+
				'</div>'+
				
				'<div id="sureback-table" style="display:none ;margin-bottom: 50px;">'+
				'<form style="padding: 28px 10px;" id="surebackcar" name="surebackcar"'+
					'action="Office/ApplyCar/savesure" method="post" class="hui-form">'+
					
					'<div class="hui-form-items">'+
					'<div class="hui-form-items-title">处理状态</div>'+
						'<input type="text" name="cl" id="cl"'+
							'class="hui-input" value="'+s+'" readonly="readonly">'+
					'</div>'+
					
					'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">单据号</div>'+
						'<input type="text" name="dcnumber" id="dcnumber"'+
							'class="hui-input" value="'+dcnumber+'" readonly="readonly">'+
					'</div>'+

					'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">申请人工号</div>'+
						'<input type="text" name="jobnumber" id="jobnumber"'+
							'class="hui-input" value="'+jobnumber+'" readonly="readonly">'+
					'</div>'+

					'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">申请人姓名</div>'+
						'<input type="text" name="name" id="name" class="hui-input"'+
							'value="'+name+'" readonly="readonly">'+
					'</div>'+

					'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">申请人部门</div>'+
						'<input type="text" name="borrowde" id="borrowde"'+
							'class="hui-input" value="'+borrowde+'" readonly="readonly">'+
					'</div>'+

					'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">申请时间</div>'+
						'<input type="text" name="apply-time" id="apply-time"'+
							'class="hui-input" value="'+apply_time+'" readonly="readonly">'+
					'</div>'+

					'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">使用时间</div>'+
						'<input type="text" name="use-time" id="use-time"'+
							'class="hui-input" value="'+use_time+'" readonly="readonly">'+
					'</div>'+

					'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">申请事由</div>'+
						'<input type="text" name="apply-reason" id="apply-reason"'+
							'class="hui-input" value="'+apply_reason+'" readonly="readonly">'+
					'</div>'+

					'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">乘坐人数</div>'+
						'<input type="text" name="pnum" id="pnum" value="'+pnum+'"'+
							'class="hui-input" readonly="readonly">'+
					'</div>'+


					'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">是否需要司机</div>'+
						'<input type="text" name="driver" id="driver" class="hui-input"'+
							'value="'+driver+'" readonly="readonly">'+
					'</div>'+


							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">审批意见</div>'+
								'<input type="text" readonly="readonly" id="audit-opinion" name="audit-opinion"'+
									'required="required" class="hui-input"'+
									'value="'+audit_opinion+'">'+
							'</div>'+

							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">审批人</div>'+
								'<input type="text" readonly="readonly" id="audit-name" name="audit-name"'+
									'required="required" class="hui-input" value="'+audit_name+'">'+
							'</div>'+

							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">审批时间</div>'+
								'<input type="text" readonly="readonly" id="audit-time" name="audit-time"'+
									'required="required" class="hui-input" value="'+audit_time+'">'+
							'</div>'+

							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">备注</div>'+
								'<input type="text" readonly="readonly" id="note" name="note" class="hui-input"'+
									'required="required" value="'+note+'">'+
							'</div>'+



							'<input type="hidden" id="radio" name="radio" value="'+audit_type+'">'+
							

							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">服务评价</div>'+
								'<input type="text" readonly="readonly" class="hui-input" id="evaluation" name="evaluation" required="required" value="'+evaluation+'">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">车辆编号</div>'+
								'<input type="text" name="car_id" id="car_id" class="hui-input" value="'+car_id+'" readonly="readonly">'+
							'</div>'+
					
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">车辆名称</div>'+
								'<input type="text" name="car_name" id="car_name" class="hui-input" value="'+car_name+'" readonly="readonly">'+
							'</div>'+
						
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">车牌号</div>'+
								'<input type="text" name="license_plate" id="license_plate" class="hui-input" value="'+license_plate+'" readonly="readonly">'+
							'</div>'+
							
							'<div id="never">'+
							'<input type="hidden" name="state" id="state" value="在库">'+
							
							'<div style="padding: 15px 30px 50px 10px;">'+
								'<div class="hui-form-items-title"></div>'+
								'<input type="submit" id="submit" value="确认归还"'+
									'class="hui-button hui-primary hui-fr">'+
							'</div>'+
							'</div>'+
					
				'</form>'+
			'</div>';
				hui(div).appendTo('#list');
			}
			
			showApplyCar(s);
		},
		error:function (){
			alert("车辆借用信息获取失败");
		}
	})
}

function showApplyCar(s){
//	alert(s);
	if (s=="未审核") {
		$("#ApplyAudit-table").show();
		$("#sureback-table").remove();
		if ($("#username").attr("value")!=$("#audit_name").attr("value")) {
			$("#never").remove();
		}
	}else if (s=="审核未通过"||s=="未归还"||s=="已归还") {
		$("#ApplyAudit-table").show();
		$("#sureback-table").remove();
		$("#never").remove();
	}else if (s=="已归还需确认") {
		$("#sureback-table").show();
		$("#ApplyAudit-table").remove();
		if ($("#username").attr("value")!=$("#audit_name").attr("value")) {
			$("#never").remove();
		}
	}
}

/*******************************************************************************************************/
/*名片制作*/
function getBusinessCardDetail(){
	var dc = $("#dcnumber").attr("value");
	var ty = $("#type").attr("value");
	$.ajax({
		url:'Message/getDetailMessage?dcnumber='+dc+'&type='+encodeURIComponent(ty),
		type:'GET',
		dataType:'text',
		success:function (result){
			hui.closeLoading();
			var re = JSON.parse(JSON.stringify(result));
			var blist = JSON.parse(re).blist;
			var s = '';
			for (var i = 0; i < blist.length; i++) {
				var dcnumber = blist[i].dcnumber;
				var jobnumber = blist[i].jobnumber;
	    		var name = blist[i].name; 
				var borrowde = blist[i].borrowde;
				var email =blist[i].email;
				var company=blist[i].company;
				var web =blist[i].web;
				var customertel=blist[i].customertel;
				var num=blist[i].num;
				var audit_name=blist[i].audit_name;
				var audit_opinion=blist[i].audit_opinion;
				var audit_time=blist[i].audit_time;
				var audit_type=blist[i].audit_type;
				var desk=blist[i].desk;
				var lq=blist[i].lq;
				var lq_time=blist[i].lq;
				var evaluation=blist[i].evaluation
				var over_time=blist[i].over_time
				var QR_note=blist[i].QR_note
				var s = '';
				if (audit_type==null) {
					s='未审核';
				}else if (audit_type=='否') {
					s='审核未通过';
				}else if (audit_type=='是'&&desk!=null&&lq==null) {
					s='制作中';
				}else if (audit_type=='是'&&desk!=null&&lq!=null) {
					s='已制作';
				}else if (over_time!=null) {
					s='已领取';
				}
				
				var div = document.createElement('div');
	            div.innerHTML =
				'<div id="bussincardAudit-table" style="display:none ;margin-bottom: 50px;">'+
						'<form action="Office/BusinessCard/save2Desk" method="post" id="toDesk" class="hui-form">'+
							
							'<div class="hui-form-items">'+
							'<div class="hui-form-items-title">处理状态</div>'+
								'<input type="text" name="cl" id="cl"'+
									'class="hui-input" value="'+s+'" readonly="readonly">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">单据号</div>'+
								'<input type="text" name="dcnumber" id="dcnumber"'+
									'class="hui-input" value="'+dcnumber+'" readonly="readonly">'+
							'</div>'+
								
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">申请人工号</div>'+
								'<input type="text" name="jobnumber" id="jobnumber"'+
									'class="hui-input" value="'+jobnumber+'" readonly="readonly">'+
							'</div>'+

							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">申请人姓名</div>'+
								'<input type="text" name="name" id="name" class="hui-input"'+
									'value="'+name+'" readonly="readonly">'+
							'</div>'+

							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">申请人部门</div>'+
								'<input type="text" name="borrowde" id="borrowde"'+
									'class="hui-input" value="'+borrowde+'" readonly="readonly">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
							'<div class="hui-form-items-title">邮箱</div>'+
							'<input type="text" name="email" id="email"'+
								'class="hui-input" value="'+email+'" readonly="readonly">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
							'<div class="hui-form-items-title">公司名称</div>'+
							'<input type="text" name="company" id="company"'+
								'class="hui-input" value="'+company+'" readonly="readonly">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
							'<div class="hui-form-items-title">公司网址</div>'+
							'<input type="text" name="web" id="web"'+
								'class="hui-input" value="'+web+'" readonly="readonly">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
							'<div class="hui-form-items-title">客服电话</div>'+
							'<input type="text" name="customertel" id="customertel"'+
								'class="hui-input" value="'+customertel+'" readonly="readonly">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
							'<div class="hui-form-items-title">申请数量</div>'+
							'<input type="text" name="num" id="num"'+
								'class="hui-input" value="'+num+'" readonly="readonly">'+
							'</div>'+
							
							'<input type="hidden" name="audit-name" id="audit-name" value="'+audit_name+'">'+
							
							
							'<div id="never">'+
							'<div class="hui-form-items">'+
							'<div class="hui-form-items-title">审批意见</div>'+
							'<input type="text" name="audit_opinion" id="audit_opinion"'+
								'class="hui-input" required="required">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
							'<div class="hui-form-items-title">审批时间</div>'+
							'<input type="date" name="audit_time" id="audit_time"'+
								'class="hui-input" required="required">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
							'<div class="hui-form-items-title">是否同意</div>'+
							'<select id="audit_type" name="audit_type" class="audit_type" required="required">'+
								'<option value="是">是</option>'+
								'<option value="否">否</option>'+
							'</select>'+
							'</div>'+
							
							'<div class="hui-form-items">'+
							'<div class="hui-form-items-title">前台人员</div>'+
							'<input type="text" name="desk" id="desk"'+
								'class="hui-input" required="required">'+
							'</div>'+
							
							'<div style="padding:15px 30px 50px 10px; ">'+
							'<div class="hui-form-items-title"></div>'+
							'<input type = "submit" id = "submit" value ="提交" class="hui-button hui-primary hui-fr">'+
							'</div>'+	
							'</div>'+
							
						'<form>'+
					'</div>';
				
				
			
	            
	            hui(div).appendTo('#list');
			}
			showBusinessCard(s);
		},
		error:function(){
			alert("名片制作申请获取失败");
		}
	})
}

function showBusinessCard(s){
	if (s=='未审核') {
		$("#bussincardAudit-table").show();
		if ($("#username").attr("value")!=$("#audit_name").attr("value")) {
			$("#never").remove();
		}
	}else if (s=='审核未通过'||s=='制作中'||s=='已制作'||s=='已领取') {
		$("#bussincardAudit-table").show();
		$("#never").remove();
	}
}


/************************************************************************************************************/
/*印章证照借用*/
function getApplyStampMessageDetail(){
	var dc = $("#dcnumber").attr("value");
	var ty = $("#type").attr("value");
	$.ajax({
		url:'Message/getDetailMessage?dcnumber='+dc+'&type='+encodeURIComponent(ty),
		type:'GET',
		dataType:'text',
		success:function (result){
			hui.closeLoading();
			var re = JSON.parse(JSON.stringify(result));
			var blist = JSON.parse(re).blist;
			var s = '';
			var mter='';
			for (var i = 0; i < blist.length; i++) {
				var dcnumber=blist[i].dcnumber;
				var jobnumber=blist[i].jobnumber;
				var name=blist[i].name;
				var borrowde=blist[i].borrowde;
				var stamp_name=blist[i].stamp_name;
				var stamp_company=blist[i].stamp_company;
				var stamp_type=blist[i].stamp_type;
				var manager=blist[i].manager;
				var apply_time=blist[i].apply_time;
				var use_time=blist[i].use_time;
				var reason=blist[i].reason;
				var back_time=blist[i].back_time;
				var audit_name=blist[i].audit_name;
				var audit_type=blist[i].audit_type;
				var audit_opinion=blist[i].audit_opinion;
				var audit_time=blist[i].audit_time;
				var issue_type=blist[i].issue_type;
				var evaluation=blist[i].evaluation;
				var sureback_time=blist[i].sureback_time;
				mter=manager;
				if (audit_type=='是'&&issue_type==null) {
					s='已审批';
				}else if (audit_type=='否'){
					s='已拒绝';
				}else if(audit_type==null){
					s='未审批'
				}else if (issue_type!=null&&audit_type=='是'&&evaluation==null) {
					s='已发放';
				}else if (evaluation!=null&&sureback_time==null) {
					s='已归还未确认';
				}else if(sureback_time!=null){
					s='已确认归还';
				}
				var div = document.createElement('div');
				 div.innerHTML =
					'<div id="ApplyStamp-table" style="display:none ;margin-bottom: 50px;">'+
							'<form action="Office/StampCertificate/toManger" method="post" id="tomanger" class="hui-form">'+
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">处理状态</div>'+
									'<input type="text" name="cl" id="cl"'+
										'class="hui-input" value="'+s+'" readonly="readonly">'+
								'</div>'+
							
								'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">单据号</div>'+
									'<input type="text" name="dcnumber" id="dcnumber"'+
										'class="hui-input" value="'+dcnumber+'" readonly="readonly">'+
								'</div>'+
									
								'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">申请人工号</div>'+
									'<input type="text" name="jobnumber" id="jobnumber"'+
										'class="hui-input" value="'+jobnumber+'" readonly="readonly">'+
								'</div>'+

								'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">申请人姓名</div>'+
									'<input type="text" name="name" id="name" class="hui-input"'+
										'value="'+name+'" readonly="readonly">'+
								'</div>'+

								'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">申请人部门</div>'+
									'<input type="text" name="borrowde" id="borrowde"'+
										'class="hui-input" value="'+borrowde+'" readonly="readonly">'+
								'</div>'+
								
								
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">印章证照</div>'+
								'<input type="text" name="stamp_name" id="stamp_name"'+
									'class="hui-input" value="'+stamp_name+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">证章所属公司</div>'+
								'<input type="text" name="stamp_company" id="stamp_company"'+
									'class="hui-input" value="'+stamp_company+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">证章类型</div>'+
								'<input type="text" name="stamp_type" id="stamp_type"'+
									'class="hui-input" value="'+stamp_type+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">申请时间</div>'+
								'<input type="text" name="apply_time" id="apply_time"'+
									'class="hui-input" value="'+apply_time+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">使用时间</div>'+
								'<input type="text" name="use_time" id="use_time"'+
									'class="hui-input" value="'+use_time+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">使用事由</div>'+
								'<input type="text" name="reason" id="reason"'+
									'class="hui-input" value="'+reason+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">计划归还时间</div>'+
								'<input type="text" name="back_time" id="back_time"'+
									'class="hui-input" value="'+back_time+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">印证管理员</div>'+
								'<input type="text" name="manager" id="manager"'+
									'class="hui-input"  value="'+manager+'" readonly="readonly">'+
								'</div>'+
								
								'<input type="hidden" name="audit-name" id="audit-name" value="'+audit_name+'">'+
								
								
								'<div id="never">'+
									'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">审批意见</div>'+
									'<input type="text" name="audit_opinion" id="audit_opinion"'+
										'class="hui-input" required="required">'+
									'</div>'+
									
									'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">审批时间</div>'+
									'<input type="date" name="audit_time" id="audit_time"'+
										'class="hui-input" required="required">'+
									'</div>'+
									
									'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">是否同意</div>'+
									'<select id="audit_type" name="audit_type" class="audit_type" required="required">'+
										'<option value="是">是</option>'+
										'<option value="否">否</option>'+
									'</select>'+
									'</div>'+
									
									'<div style="padding:15px 30px 50px 10px; ">'+
									'<div class="hui-form-items-title"></div>'+
									'<input type = "submit" id = "submit" value ="提交" class="hui-button hui-primary hui-fr">'+
									'</div>'+	
								'</div>'+
							'</form>'+
					'</div>'+
					
					
					'<div id="issue-table" style="display:none ;margin-bottom: 50px;">'+
					'<form action="Office/StampCertificate/toIssue" method="post" id="toIssue" class="hui-form">'+
						'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">处理状态</div>'+
							'<input type="text" name="cl" id="cl"'+
								'class="hui-input" value="'+s+'" readonly="readonly">'+
						'</div>'+
					
						'<div class="hui-form-items">'+
							'<div class="hui-form-items-title">单据号</div>'+
							'<input type="text" name="dcnumber" id="dcnumber"'+
								'class="hui-input" value="'+dcnumber+'" readonly="readonly">'+
						'</div>'+
							
						'<div class="hui-form-items">'+
							'<div class="hui-form-items-title">申请人工号</div>'+
							'<input type="text" name="jobnumber" id="jobnumber"'+
								'class="hui-input" value="'+jobnumber+'" readonly="readonly">'+
						'</div>'+

						'<div class="hui-form-items">'+
							'<div class="hui-form-items-title">申请人姓名</div>'+
							'<input type="text" name="name" id="name" class="hui-input"'+
								'value="'+name+'" readonly="readonly">'+
						'</div>'+

						'<div class="hui-form-items">'+
							'<div class="hui-form-items-title">申请人部门</div>'+
							'<input type="text" name="borrowde" id="borrowde"'+
								'class="hui-input" value="'+borrowde+'" readonly="readonly">'+
						'</div>'+
						
						'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">印章证照</div>'+
						'<input type="text" name="stamp_name" id="stamp_name"'+
							'class="hui-input" value="'+stamp_name+'" readonly="readonly">'+
						'</div>'+
						
						'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">证章所属公司</div>'+
						'<input type="text" name="stamp_company" id="stamp_company"'+
							'class="hui-input" value="'+stamp_company+'" readonly="readonly">'+
						'</div>'+
						
						'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">证章类型</div>'+
						'<input type="text" name="stamp_type" id="stamp_type"'+
							'class="hui-input" value="'+stamp_type+'" readonly="readonly">'+
						'</div>'+
						
						'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">申请时间</div>'+
						'<input type="text" name="apply_time" id="apply_time"'+
							'class="hui-input" value="'+apply_time+'" readonly="readonly">'+
						'</div>'+
						
						'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">使用时间</div>'+
						'<input type="text" name="use_time" id="use_time"'+
							'class="hui-input" value="'+use_time+'" readonly="readonly">'+
						'</div>'+
						
						'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">使用事由</div>'+
						'<input type="text" name="reason" id="reason"'+
							'class="hui-input" value="'+reason+'" readonly="readonly">'+
						'</div>'+
						
						'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">计划归还时间</div>'+
						'<input type="text" name="back_time" id="back_time"'+
							'class="hui-input" value="'+back_time+'" readonly="readonly">'+
						'</div>'+
						
						'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">印证管理员</div>'+
						'<input type="text" name="manager" id="manager"'+
							'class="hui-input"  value="'+manager+'" readonly="readonly">'+
						'</div>'+
						
						'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">审批人</div>'+
						'<input type="text" name="audit-name" id="audit-name" class="hui-input" value="'+audit_name+'" readonly="readonly">'+
						'</div>'+
						
						'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">审批意见</div>'+
						'<input type="text" name="audit_opinion" id="audit_opinion"'+
							'class="hui-input" value="'+audit_opinion+'" readonly="readonly">'+
						'</div>'+
						
						'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">审批时间</div>'+
						'<input type="date" name="audit_time" id="audit_time"'+
							'class="hui-input" value="'+audit_time+'" readonly="readonly">'+
						'</div>'+
						
						'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">是否同意</div>'+
						'<input id="audit_type" name="audit_type" class="hui-input" value="'+audit_type+'" readonly="readonly">'+	
						'</div>'+
						
						'<div id="never">'+
						
						
						'<input type="hidden" name="issue_type" id="issue_type"'+
						'class="hui-input" value="是" readonly="readonly">'+
										
						'<div style="padding:15px 30px 50px 10px; ">'+
						'<div class="hui-form-items-title"></div>'+
						'<input type = "submit" id = "submit" value ="确认发放" class="hui-button hui-primary hui-fr">'+
						'</div>'+	
						'</div>'+
						
					'</form>'+
				'</div>'+
				
				
				'<div id="returned-table" style="display:none ;margin-bottom: 50px;">'+
				'<form action="Office/StampCertificate/SureReturnStampApply" method="post" id="Return" class="hui-form">'+
					'<div class="hui-form-items">'+
					'<div class="hui-form-items-title">处理状态</div>'+
						'<input type="text" name="cl" id="cl"'+
							'class="hui-input" value="'+s+'" readonly="readonly">'+
					'</div>'+
				
					'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">单据号</div>'+
						'<input type="text" name="dcnumber" id="dcnumber"'+
							'class="hui-input" value="'+dcnumber+'" readonly="readonly">'+
					'</div>'+
					
					'<div class="hui-form-items">'+
					'<div class="hui-form-items-title">印章证照</div>'+
					'<input type="text" name="stamp_name" id="stamp_name"'+
						'class="hui-input" value="'+stamp_name+'" readonly="readonly">'+
					'</div>'+
					
					'<div class="hui-form-items">'+
					'<div class="hui-form-items-title">证章所属公司</div>'+
					'<input type="text" name="stamp_company" id="stamp_company"'+
						'class="hui-input" value="'+stamp_company+'" readonly="readonly">'+
					'</div>'+
					
					'<div class="hui-form-items">'+
					'<div class="hui-form-items-title">证章类型</div>'+
					'<input type="text" name="stamp_type" id="stamp_type"'+
						'class="hui-input" value="'+stamp_type+'" readonly="readonly">'+
					'</div>'+
					
					'<div class="hui-form-items">'+
					'<div class="hui-form-items-title">申请时间</div>'+
					'<input type="text" name="apply_time" id="apply_time"'+
						'class="hui-input" value="'+apply_time+'" readonly="readonly">'+
					'</div>'+
					
					'<div class="hui-form-items">'+
					'<div class="hui-form-items-title">使用时间</div>'+
					'<input type="text" name="use_time" id="use_time"'+
						'class="hui-input" value="'+use_time+'" readonly="readonly">'+
					'</div>'+
					
					'<div class="hui-form-items">'+
					'<div class="hui-form-items-title">使用事由</div>'+
					'<input type="text" name="reason" id="reason"'+
						'class="hui-input" value="'+reason+'" readonly="readonly">'+
					'</div>'+
					
					'<div class="hui-form-items">'+
					'<div class="hui-form-items-title">评价</div>'+
					'<input type ="text" id="evaluation" name="evaluation" class="hui-input" value="'+evaluation+'" readonly="readonly">'+	
					'</div>'+
					
					'<div id="never">'+
					
					'<div class="hui-form-items">'+
					'<div class="hui-form-items-title">确认归还时间</div>'+
					'<input type="date" id="sureback_time" name="sureback_time" class="hui-input" required="required">'+	
					'</div>'+
					
					'<div style="padding:15px 30px 50px 10px; ">'+
					'<div class="hui-form-items-title"></div>'+
					'<input type = "submit" id = "submit" value ="确认" class="hui-button hui-primary hui-fr">'+
					'</div>'+	
					'</div>'+
					
				'</form>'+
			'</div>';
		            
		            hui(div).appendTo('#list');
			}
			showStamp(s,mter);
		},
		error:function (){
			alert("印章证照信息获取失败");
		}
	})
	
}

function showStamp(s,mter){
//	alert(s);
	if (s=="未审批") {
		$("#ApplyStamp-table").show();
		$("#issue-table").remove();
		$("#returned-table").remove();
		if ($("#username").attr("value")!=$("#audit_name").attr("value")) {
			$("#never").remove();
		}
	}else if (s=='已审批') {
		$("#issue-table").show();
		$("#ApplyStamp-table").remove();
		$("#returned-table").remove();
		if ($("#username").attr("value")!=mter) {
			$("#never").remove();
		}
	}else if (s=='已发放'||s=='已确认归还') {
		$("#issue-table").show();
		$("#ApplyStamp-table").remove();
		$("#returned-table").remove();
		$("#never").remove();
	}else if (s=='已归还未确认') {
		$("#returned-table").show();
		$("#ApplyStamp-table").remove();
		$("#issue-table").remove();
		if ($("#username").attr("value")!=mter) {
			$("#never").remove();
		}
	}
	
}

/******************************************************************************************************/
/*人力资源档案借用*/
function getApplyHrMessageDetail(){
	var dc = $("#dcnumber").attr("value");
	var ty = $("#type").attr("value");
	$.ajax({
		url:'Message/getDetailMessage?dcnumber='+dc+'&type='+encodeURIComponent(ty),
		type:'GET',
		dataType:'text',
		success:function (result){
			hui.closeLoading();
			var re = JSON.parse(JSON.stringify(result));
			var blist = JSON.parse(re).blist;
			var s = '';
			for (var  i= 0;  i< blist.length; i++) {
				var dcnumber=blist[i].dcnumber;
				var userId=blist[i].userId;
				var borrowid=blist[i].borrowid;
				var borrowname=blist[i].borrowname;
				var borrowde=blist[i].borrowde;
				var contractName=blist[i].contractName;
				var reason=blist[i].reason;
				var abacktime=blist[i].abacktime;
				var audit_name=blist[i].audit_name;
				var spid=blist[i].spid;
				var spopinions=blist[i].spopinions;
				var spdate=blist[i].spdate;
				var abdate=blist[i].abdate;
				var rdate=blist[i].rdate;
				var note=blist[i].note;
				var evaluation=blist[i].evaluation;
				var overdate=blist[i].overdate;
				var audittype=blist[i].audittype;
				if (rdate != null&&overdate != null&&audittype== '是') {
					s='已确认归还';
				}else if (audittype=='是'&&rdate==null&&evaluation==null) {
					s='审核通过';
				}else if (audittype == '否') {
					s='已拒绝';
				}else if (audittype==null&&rdate==null) {
					s='未审批';
				}else if (rdate==null&&audittype=='是'&&evaluation!=null&&overdate==null) {
					s='未归还';
				}else if (audittype=='是'&&rdate!= null &&overdate==null) {
					s='已归还未确认';
				}
				var div = document.createElement('div');
				 div.innerHTML =
					 '<div id="audit-table" style="display:none">'+
					 			'<form action="HrServices/auditToBase" method="post" id="audit" class="hui-form">'+
								'<input type="hidden" id="userId" name="userId" value="'+userId+'">'+
					 			'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">处理状态</div>'+
									'<input type="text" name="cl" id="cl"'+
										'class="hui-input" value="'+s+'" readonly="readonly">'+
								'</div>'+
								'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">单据号</div>'+
									'<input type="text" name="dcnumber" id="dcnumber"'+
										'class="hui-input" value="'+dcnumber+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">借用人员工号</div>'+
								'<input type="text" name="borrowid" id="borrowid"'+
									'class="hui-input" value="'+borrowid+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">借用人员姓名</div>'+
								'<input type="text" name="borrowname" id="borrowname"'+
									'class="hui-input" value="'+borrowname+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">借用人员部门</div>'+
								'<input type="text" name="borrowde" id="borrowde"'+
									'class="hui-input" value="'+borrowde+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">借用合同名</div>'+
								'<input type="text" name="contractName" id="contractName"'+
									'class="hui-input" value="'+contractName+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">借用事由</div>'+
								'<input type="text" name="reason" id="reason"'+
									'class="hui-input" value="'+reason+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">预计还回时间</div>'+
								'<input type="text" name="abacktime" id="abacktime"'+
									'class="hui-input" value="'+abacktime+'" readonly="readonly">'+
								'</div>'+
								
								
								'<input type="hidden" name="spid" id="spid"'+
									'class="hui-input" value="'+spid+'" readonly="readonly">'+
								
								
								
								'<input type="hidden" name="audit_name" id="audit_name"'+
									'class="hui-input" value="'+audit_name+'" readonly="readonly">'+
								
								'<div id="never">'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">审批意见</div>'+
								'<input type="text" class="hui-input" id="spopinions"  name="spopinions" required="required" checkType="string" checkData="6,30" checkMsg="审批意见应为6-30个字符">'+
								'</div>'+
							
								
								'<div class="hui-form-items">'+	
								'<div class="hui-form-items-title">审批时间</div>'+
								'<input type="date" id="spdate" name="spdate" required="required" class="hui-input">'+
								'</div>'+	
								
								'<div class="hui-form-items">'+						
								'<div class="hui-form-items-title">实际借出时间</div>'+
								'<input type="date" id="abdate" name="abdate" required="required" class="hui-input">'+
								'</div>'+	
								
							
						
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">是否同意</div>'+
								'<select id="radio" name="radio" class="radio" >'+
									'<option value="是">是</option>'+
									'<option value="否">否</option>'+
								'</select>'+
								'</div>'+
							
								'<div style="padding: 10px 30px 60px 10px;">'+
									'<div class="hui-form-items-title"></div>'+
									'<input type="submit" id="submit" name="submit" value="提交审核"'+
										'class="hui-button hui-primary hui-fr">'+
								'</div>'+	
								'</div>'+
								'</form>'+
					'</div>'+
					
					'<div id ="myapply-table" style="display:none">'+
							'<form action="HrServices/applyToBasse" method="post" id="myapply" class="hui-form">'+
							'<div class="hui-form-items">'+
							'<div class="hui-form-items-title">处理状态</div>'+
								'<input type="text" name="cl" id="cl"'+
									'class="hui-input" value="'+s+'" readonly="readonly">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
					     	'<div class="hui-form-items-title">单据号</div>'+		
							'<input type="text" readonly="readonly"'+
								'value="'+dcnumber+'" id="dcnumber" name="dcnumber" class="hui-input">'+
							'</div>'+
		
							'<input type="hidden" readonly="readonly"'+
								'value="'+borrowid+'" id="borrowid" name="borrowid">'+
						
					
							'<input type="hidden" readonly="readonly"'+
								'value="'+borrowname+'" id="borrowname" name="borrowname">'+
						
							'<input type="hidden" readonly="readonly"'+
								'value="'+borrowde+'" id="borrowde" name="borrowde">'+
						
							'<div class="hui-form-items">'+
						    '<div class="hui-form-items-title">借用合同名</div>'+
							'<input type="text" readonly="readonly"'+
								'value="'+contractName+'" id="contractName" name="contractName" class="hui-input">'+
							'</div>'+
						
							'<input type="hidden" readonly="readonly"'+
								'value="'+reason+'" id="reason" name="reason">'+
						
							'<input type="hidden" readonly="readonly"'+
								'value="'+abacktime+'" id="abacktime" name="abacktime">'+
						
						
							'<div id="never">'+
								'<div class="hui-form-items">'+
						     	'<div class="hui-form-items-title">服务评价</div>'+
						     	'<div class="hui-form-textarea">'+
						     		'<textarea placeholder="服务评价" name="evaluation" required="required"></textarea>'+
						     	'</div>'+
						     	'</div>'+
	
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">备注</div>'+
								'<div class="hui-form-textarea">'+
								 	'<textarea placeholder="备注" name="note" required="required"></textarea>'+
								'</div>'+
								'</div>'+
							
								'<div  style="padding:15px 30px 50px 10px; ">'+
								'<div class="hui-form-items-title"></div>'+
									'<input id="submit" type="submit" value="提交评价" class="hui-button hui-primary hui-fr">'+
								'</div>'+
								'</div>'+
							'</form>'+
						'</div>'+
						
						
						'<div id="myback-table" style="display:none">'+
							'<form action="HrServices/backToBase" method="post" id="myback" class="hui-form">'+
									
									'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">处理状态</div>'+
										'<input type="text" name="cl" id="cl"'+
											'class="hui-input" value="'+s+'" readonly="readonly">'+
									'</div>'+
									
									'<div class="hui-form-items">'+
							     	'<div class="hui-form-items-title">单据号</div>'+
									'<input type="text" readonly="readonly"'+
										'value="'+dcnumber+'" class="hui-input" id="dcnumber" name="dcnumber">'+
									'</div>'+
									
									'<input type="hidden" readonly="readonly"'+
										'value="'+borrowid+'" id="borrowid" name="borrowid">'+
									'<input type="hidden" readonly="readonly"'+
										'value="'+borrowname+'" id="borrowname" name="borrowname">'+
									'<input type="hidden" readonly="readonly"'+
										'value="'+borrowde+'" id="borrowde" name="borrowde">'+
										
									'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">借用合同名</div>'+
									'<input type="text" readonly="readonly"'+
										'value="'+contractName+'" class="hui-input" id="contractName" name="contractName">'+
									'</div>'+
											
									'<div id="never">'+
									'<div style="padding:15px 30px 50px 10px; ">'+
									'<div class="hui-form-items-title"></div>'+
										'<input type="submit" value="归还" class="hui-button hui-primary hui-fr">'+
									'</div>'+
									'</div>'+
								'</form>'+
						'</div>'+
						'<div id="findalback" style="display:none">'+
							'<form action="HrServices/finalToBase" method="post" id="sureback" class="hui-form" >'+
							
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">处理状态</div>'+
									'<input type="text" name="cl" id="cl"'+
										'class="hui-input" value="'+s+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
						     	'<div class="hui-form-items-title">单据号</div>'+
								'<input type="text" readonly="readonly"'+
									'value="'+dcnumber+'" class="hui-input" id="dcnumber" name="dcnumber">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">借用合同名</div>'+
								'<input type="text" readonly="readonly"'+
									'value="'+contractName+'" class="hui-input" id="contractName" name="contractName">'+
								'</div>'+
								
								'<div id="never">'+
								'<div style="padding:15px 30px 50px 10px; ">'+
								'<div class="hui-form-items-title"></div>'+
									'<input type="submit" value="确认归还" class="hui-button hui-primary hui-fr">'+
								'</div>'+
								'</div>'+
							'</form>'+
				'</div>';
				 
				 hui(div).appendTo('#list');
			}
			
			showHr(s);
		},
		error:function (){
			alert("获取人力合同信息失败");
		}
	})
	
}

function showHr(s){
//	alert(s);
//	alert("audit_name:"+$("#audit_name").attr("value"));
// 	alert("username:"+$("#username").attr("value"));
// 	alert($("#name").attr("value"));
	if (s=="未审批") {
		$("#audit-table").show();
		$("#myapply-table").remove();
		$("#myback-table").remove();
		$("#findalback").remove();
		if ($("#username").attr("value")!=$("#audit_name").attr("value")) {
			$("#never").remove();
		}
	}else if (s=="审核通过") {
		$("#myapply-table").show();
		$("#audit-table").remove();
		$("#myback-table").remove();
		$("#findalback").remove();
		if ($("#username").attr("value")!=$("#name").attr("value")) {
			$("#never").remove();
		}
	}else if (s=="未归还") {
		$("#myback-table").show();
		$("#findalback").remove();
		$("#audit-table").remove();
		$("#myapply-table").remove();
		if ($("#username").attr("value")!=$("#name").attr("value")) {
			$("#never").remove();
		}
	}else if (s=="已归还未确认") {
		$("#findalback").show();
		$("#audit-table").remove();
		$("#myback-table").remove();
		$("#myapply-table").remove();
		if ($("#username").attr("value")!=$("#audit_name").attr("value")) {
			$("#never").remove();
		}
	}else if (s=="已确认归还") {
		$("#findalback").show();
		$("#audit-table").remove();
		$("#myback-table").remove();
		$("#myapply-table").remove();
		$("#never").remove();
	}else if (s=="已拒绝") {
		$("#myapply-table").show();
		$("#audit-table").remove();
		$("#myback-table").remove();
		$("#findalback").remove();
		$("#never").remove();
	}
}
