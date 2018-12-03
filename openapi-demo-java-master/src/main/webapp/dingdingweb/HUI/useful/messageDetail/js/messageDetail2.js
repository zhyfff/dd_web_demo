
/**
 * 耗材采购
 */
function getconsumable_purDetail(){
	var dc = $("#dcnumber").attr("value");
	var ty = $("#type").attr("value");
	$.ajax({
		url:'Message/getDetailMessage?dcnumber='+dc+'&type='+encodeURIComponent(ty),
		type:'GET',
		dataType:'text',
		success:function(result){
		hui.closeLoading();
		var re = JSON.parse(JSON.stringify(result));
		var blist = JSON.parse(re).blist;
		var s = '';
		for (var i = 0; i < blist.length; i++) {
			var dcnumber=blist[i].dcnumber;
			var userId=blist[i].userId;
			var borrowid=blist[i].borrowid;
			var borrowname=blist[i].borrowname;
			var borrowde=blist[i].borrowde;
			var ptime=blist[i].ptime;
			var ptype=blist[i].ptype;
			var consumable_type=blist[i].consumable_type;
			var consumable_name=blist[i].consumable_name;
			var specifications=blist[i].specifications;
			var apply_num=blist[i].apply_num;
			var note=blist[i].note;
			var audit_name=blist[i].audit_name;
			var spid=blist[i].spid;
			var audit_type=blist[i].audit_type;
			var audit_opinion=blist[i].audit_opinion;
			var audit_time=blist[i].audit_time;
			var overdate=blist[i].overdate;
			
			if (audit_type=='是'&&overdate==null) {
				s='审批通过';
			}else if(audit_type=='否'){
				s='审批拒绝';
			}else if(audit_type==null&&overdate==null){
				s='未审批';
			}else if (overdate!=null) {
				s='采购完成';
			}
			
			var div = document.createElement('div');
			div.innerHTML =
				 '<div id="audit-table" style="display:none">'+
				 	'<form action="ITServices/consuable_pur/saveAuditInfor" method="post" id="audit" class="hui-form" >'+
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
					     	'<div class="hui-form-items-title">申请人姓名</div>'+
							'<input type="text" readonly="readonly"'+
								'value="'+borrowname+'" class="hui-input" id="borrowname" name="borrowname">'+
						'</div>'+
						
						'<div class="hui-form-items">'+
					     	'<div class="hui-form-items-title">部门</div>'+
							'<input type="text" readonly="readonly"'+
								'value="'+borrowde+'" class="hui-input" id="borrowde" name="borrowde">'+
						'</div>'+
						
						'<div class="hui-form-items">'+
					     	'<div class="hui-form-items-title">采购日期</div>'+
							'<input type="text" readonly="readonly"'+
								'value="'+ptime+'" class="hui-input" id="ptime" name="ptime">'+
						'</div>'+
						
						'<div class="hui-form-items">'+
					     	'<div class="hui-form-items-title">采购类型</div>'+
							'<input type="text" readonly="readonly"'+
								'value="'+ptype+'" class="hui-input" id="ptype" name="ptype">'+
						'</div>'+
						
						'<div class="hui-form-items">'+
					     	'<div class="hui-form-items-title">耗材分类</div>'+
							'<input type="text" readonly="readonly"'+
								'value="'+consumable_type+'" class="hui-input" id="consumable_type" name="consumable_type">'+
						'</div>'+
						
						'<div class="hui-form-items">'+
					     	'<div class="hui-form-items-title">耗材名称</div>'+
							'<input type="text" readonly="readonly"'+
							'value="'+consumable_name+'" class="hui-input" id="consumable_name" name="consumable_name">'+
						'</div>'+
						
						'<div class="hui-form-items">'+
					     	'<div class="hui-form-items-title">规格型号</div>'+
							'<input type="text" readonly="readonly"'+
							'value="'+specifications+'" class="hui-input" id="specifications" name="specifications">'+
						'</div>'+
						
						'<div class="hui-form-items">'+
				     		'<div class="hui-form-items-title">申请数量</div>'+
							'<input type="text" readonly="readonly"'+
							'value="'+apply_num+'" class="hui-input" id="apply_num" name="apply_num">'+
						'</div>'+
						
						'<div class="hui-form-items">'+
							'<div class="hui-form-items-title">备注</div>'+
							'<div class="hui-form-textarea">'+
								'<textarea placeholder="备注..." id="note" name="note" readonly="readonly" required="required">'+note+'</textarea>'+
							'</div>'+
						'</div>'+
						
						'<div id="never">'+
							'<div class="hui-form-items">'+
				            '<div class="hui-form-items-title">是否批准</div>'+
				            '<div class="hui-form-select">'+
				                '<select name="audit_type" id="audit_type">'+
				                    '<option value="是">是</option>'+
				                    '<option value="否">否</option>'+
				                '</select>'+
				            '</div>'+
			       		 	'</div>'+
							
				       		 '<div class="hui-form-items">'+
								'<div class="hui-form-items-title">审批意见</div>'+
								'<div class="hui-form-textarea">'+
									'<textarea placeholder="审批意见..." id="audit_opinion" name="audit_opinion" required="required"></textarea>'+
								'</div>'+
							'</div>'+
						
							'<div class="hui-form-items">'+
					     		'<div class="hui-form-items-title">审批时间</div>'+
								'<input type="date"'+
								'value="'+audit_time+'" class="hui-input" id="audit_time" name="audit_time">'+
							'</div>'+
							
							'<div style="padding: 15px 8px 50px 15px;">'+
								'<div class="hui-form-items-title"></div>'+
								'<input type="submit" id="submit" value="提交"'+
									'class="hui-button hui-primary hui-fr">'+
							'</div>'+
						'</div>'+
						
						'<div id="toAdd" style="display:none;">'+
							'<div class="hui-form-items">'+
								'<button class="hui-button hui-button-large hui-danger" type="button" onclick="standardPost()">添加耗材</button>'+
							'</div>'+
						'</div>'+
						
					'</from>'+
				 '</div>';
			hui(div).appendTo('#list');
		}
		showconpur(s);
		
		
		},
		error:function(){
			alert("耗材采购获取失败");
		}
	})
}

function showconpur(s){
	if (s=="未审批") {
		$("#audit-table").show();
		if ($("#username").attr("value")!=$("#audit_name").attr("value")) {
			$("#never").remove();
		}
	}else if (s=="审批通过") {
		$("#audit-table").show();
		$("#never").remove();
		$("#toAdd").show();
		
	}else if (s=="审批拒绝") {
		$("#audit-table").show();
		$("#never").remove();
	}else if (s=="采购完成") {
		$("#audit-table").show();
		$("#never").remove();
		$("#toAdd").remove();
	}
}



//function setCookie(){
//	$.cookie('the_cookie', 'the_value', { expires: 7, path: 'ITServices/ToAddconsum' });
//}

function standardPost () 
    {
	var url="ITServices/ToAddconsum";
        var form = $("<form method='post'></form>");
        form.attr({"action":url});
        var input = $("<input type='hidden'>");
        input.attr({"name":"dcnumber"});
        input.val($("#dcnumber").attr("value"));
        form.append(input);
        var input = $("<input type='hidden'>");
        input.attr({"name":"ptime"});
        input.val($("#ptime").attr("value"));
        form.append(input);
        var input = $("<input type='hidden'>");
        input.attr({"name":"ptype"});
        input.val($("#ptype").attr("value"));
        form.append(input);
        var input = $("<input type='hidden'>");
        input.attr({"name":"consumable_type"});
        input.val($("#consumable_type").attr("value"));
        form.append(input);
        var input = $("<input type='hidden'>");
        input.attr({"name":"consumable_name"});
        input.val($("#consumable_name").attr("value"));
        form.append(input);
        var input = $("<input type='hidden'>");
        input.attr({"name":"specifications"});
        input.val($("#specifications").attr("value"));
        form.append(input);
        var input = $("<input type='hidden'>");
        input.attr({"name":"consumable_num"});
        input.val($("#apply_num").attr("value"));
        form.append(input);
        var input = $("<input type='hidden'>");
        input.attr({"name":"note"});
        input.val($("#note").text());
        form.append(input);
        
        $("html").append(form);
        form.submit();
        

//			window.location = "ITServices/ToAddconsum?dcnumber="
//			+ $("#dcnumber").attr("value") + "&ptime="
//			+ $("#ptime").attr("value") + "&ptype=" + $("#ptype").attr("value")
//			+ "&consumable_type=" + $("#consumable_type").attr("value")+"specifications="+$("#specifications").attr("value");
    }
/******************************************************************************************************/

/**
 * 设备借用
 */
function getEBorrowing(){
	var dc = $("#dcnumber").attr("value");
	var ty = $("#type").attr("value");
	$.ajax({
		url:'Message/getDetailMessage?dcnumber='+dc+'&type='+encodeURIComponent(ty),
		type:'GET',
		dataType:'text',
		success:function(result){
			hui.closeLoading();
			var re = JSON.parse(JSON.stringify(result));
			var blist = JSON.parse(re).blist;
			var s = '';
			for (var i = 0; i < blist.length; i++) {
				var dcnumber=blist[i].dcnumber;
				var userId=blist[i].userId;
				var borrowid=blist[i].borrowid;
				var borrowname=blist[i].borrowname;
				var borrowde=blist[i].borrowde;
				var equipment=blist[i].equipment;
				var model=blist[i].model;
				var num=blist[i].num;
				var ptime=blist[i].ptime;
				var ebtime=blist[i].ebtime;
				var audit_name=blist[i].audit_name;
				var spid=blist[i].spid;
				var audit_type=blist[i].audit_type;
				var has_get=blist[i].has_get;
				var abtime=blist[i].abtime;
				var note=blist[i].note;
				var return_type=blist[i].return_type;
				var evaluate=blist[i].evaluate;
				var applytime=blist[i].applytime;
				var overdate=blist[i].overdate;
				if (audit_type=='是'&&overdate==null&&has_get==null) {
					s='审批通过';
				}else if(audit_type=='否'){
					s='审批拒绝';
				}else if(audit_type==null&&overdate==null){
					s='未审批';
				}else if (abtime!=null&&return_type==null) {
					s='已归还未确认';
				}else if (abtime!=null&&return_type!=null&&evaluate==null) {
					s='已归还已确认';
				}else if (abtime==null&&has_get!=null&&evaluate==null) {
					s='未归还';
				}else if (evaluate!=null) {
					s='已评价反馈';
				}
				var div = document.createElement('div');
				div.innerHTML =
					'<div id="audit-table" style="display:none">'+
				 	'<form action="ITServices/eborrowing/saveAuditInfor" method="post" id="audit" class="hui-form" >'+
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
					     	'<div class="hui-form-items-title">申请人姓名</div>'+
							'<input type="text" readonly="readonly"'+
								'value="'+borrowname+'" class="hui-input" id="borrowname" name="borrowname">'+
						'</div>'+
						
						
						'<div class="hui-form-items">'+
					     	'<div class="hui-form-items-title">借用设备名称</div>'+
							'<input type="text" readonly="readonly"'+
								'value="'+equipment+'" class="hui-input" id="equipment" name="equipment">'+
						'</div>'+
						
						'<div class="hui-form-items">'+
					     	'<div class="hui-form-items-title">型号</div>'+
							'<input type="text" readonly="readonly"'+
								'value="'+model+'" class="hui-input" id="model" name="model">'+
						'</div>'+
						
						'<div class="hui-form-items">'+
					     	'<div class="hui-form-items-title">数量</div>'+
							'<input type="text" readonly="readonly"'+
								'value="'+num+'" class="hui-input" id="num" name="num">'+
						'</div>'+
						
						'<div class="hui-form-items">'+
					     	'<div class="hui-form-items-title">借用时间</div>'+
							'<input type="text" readonly="readonly"'+
							'value="'+ptime+'" class="hui-input" id="ptime" name="ptime">'+
						'</div>'+
						
						'<div class="hui-form-items">'+
					     	'<div class="hui-form-items-title">预计归还时间</div>'+
							'<input type="text" readonly="readonly"'+
							'value="'+ebtime+'" class="hui-input" id="ebtime" name="ebtime">'+
						'</div>'+
						
						'<div id="fk-re" style="display:none;">'+
							'<div class="hui-form-items">'+
							'<div class="hui-form-items-title">评价</div>'+
								'<div class="hui-form-textarea">'+
									'<textarea placeholder="评价..." readonly="readonly" id="evaluate" name="evaluate" required="required">'+evaluate+'</textarea>'+
								'</div>'+
							'</div>'+
						'</div>'+

						'<div class="hui-form-items">'+
							'<div class="hui-form-items-title">备注</div>'+
							'<div class="hui-form-textarea">'+
								'<textarea placeholder="备注..." id="note" name="note" readonly="readonly" required="required">'+note+'</textarea>'+
							'</div>'+
						'</div>'+
						
						'<div id="never">'+
							'<div class="hui-form-items">'+
				            '<div class="hui-form-items-title">是否批准</div>'+
				            '<div class="hui-form-select">'+
				                '<select name="audit_type" id="audit_type">'+
				                    '<option value="是">是</option>'+
				                    '<option value="否">否</option>'+
				                '</select>'+
				            '</div>'+
			       		 	'</div>'+
							
							'<div style="padding: 15px 8px 50px 15px;">'+
								'<div class="hui-form-items-title"></div>'+
								'<input type="submit" id="submit" value="提交"'+
									'class="hui-button hui-primary hui-fr">'+
							'</div>'+
						'</div>'+
						
					'</form>'+
				 '</div>'+
				 
				'<div id="get_type" style="display:none;">'+
			 		'<form action="ITServices/eborrowing/saveAuditInfor" method="post" id="audit" class="hui-form" >'+
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
					     	'<div class="hui-form-items-title">申请人姓名</div>'+
							'<input type="text" readonly="readonly"'+
								'value="'+borrowname+'" class="hui-input" id="borrowname" name="borrowname">'+
						'</div>'+
						
						
						'<div class="hui-form-items">'+
					     	'<div class="hui-form-items-title">借用设备名称</div>'+
							'<input type="text" readonly="readonly"'+
								'value="'+equipment+'" class="hui-input" id="equipment" name="equipment">'+
						'</div>'+
						
						'<div class="hui-form-items">'+
					     	'<div class="hui-form-items-title">型号</div>'+
							'<input type="text" readonly="readonly"'+
								'value="'+model+'" class="hui-input" id="model" name="model">'+
						'</div>'+
						
						'<div class="hui-form-items">'+
					     	'<div class="hui-form-items-title">数量</div>'+
							'<input type="text" readonly="readonly"'+
								'value="'+num+'" class="hui-input" id="num" name="num">'+
						'</div>'+
						
						'<div class="hui-form-items">'+
					     	'<div class="hui-form-items-title">借用时间</div>'+
							'<input type="text" readonly="readonly"'+
							'value="'+ptime+'" class="hui-input" id="ptime" name="ptime">'+
						'</div>'+
						
						'<div class="hui-form-items">'+
					     	'<div class="hui-form-items-title">预计归还时间</div>'+
							'<input type="text" readonly="readonly"'+
							'value="'+ebtime+'" class="hui-input" id="ebtime" name="ebtime">'+
						'</div>'+
						'<div class="hui-form-items">'+
							'<div class="hui-form-items-title">备注</div>'+
							'<div class="hui-form-textarea">'+
								'<textarea placeholder="备注..." id="note" name="note" readonly="readonly" required="required">'+note+'</textarea>'+
							'</div>'+
						'</div>'+
			 		
			 			'<input type="hidden" readonly="readonly"'+
						'value="是" class="hui-input" id="audit_type" name="audit_type">'+
						'<input type="hidden" readonly="readonly"'+
						'value="是" class="hui-input" id="has_get" name="has_get">'+
						
						'<div style="padding: 15px 8px 50px 15px;">'+
						'<div class="hui-form-items-title"></div>'+
						'<input type="submit" id="submit" value="确认领取"'+
							'class="hui-button hui-primary hui-fr">'+
							'</div>'+
					'</form>'+
				'</div>'+
				
				'<div id="has_return" style="display:none;">'+
		 			'<form action="ITServices/eborrowing/saveAuditInfor" method="post" id="audit" class="hui-form" >'+
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
					     	'<div class="hui-form-items-title">申请人姓名</div>'+
							'<input type="text" readonly="readonly"'+
								'value="'+borrowname+'" class="hui-input" id="borrowname" name="borrowname">'+
						'</div>'+
						
						
						'<div class="hui-form-items">'+
					     	'<div class="hui-form-items-title">借用设备名称</div>'+
							'<input type="text" readonly="readonly"'+
								'value="'+equipment+'" class="hui-input" id="equipment" name="equipment">'+
						'</div>'+
						
						'<div class="hui-form-items">'+
					     	'<div class="hui-form-items-title">型号</div>'+
							'<input type="text" readonly="readonly"'+
								'value="'+model+'" class="hui-input" id="model" name="model">'+
						'</div>'+
						
						'<div class="hui-form-items">'+
					     	'<div class="hui-form-items-title">数量</div>'+
							'<input type="text" readonly="readonly"'+
								'value="'+num+'" class="hui-input" id="num" name="num">'+
						'</div>'+
						
						'<div class="hui-form-items">'+
					     	'<div class="hui-form-items-title">借用时间</div>'+
							'<input type="text" readonly="readonly"'+
							'value="'+ptime+'" class="hui-input" id="ptime" name="ptime">'+
						'</div>'+
						
						'<div class="hui-form-items">'+
					     	'<div class="hui-form-items-title">预计归还时间</div>'+
							'<input type="text" readonly="readonly"'+
							'value="'+ebtime+'" class="hui-input" id="ebtime" name="ebtime">'+
						'</div>'+
						'<div class="hui-form-items">'+
							'<div class="hui-form-items-title">备注</div>'+
							'<div class="hui-form-textarea">'+
								'<textarea placeholder="备注..." id="note" name="note" readonly="readonly" required="required">'+note+'</textarea>'+
							'</div>'+
						'</div>'+
		 				'<input type="hidden" readonly="readonly"'+
						'value="是" class="hui-input" id="audit_type" name="audit_type">'+
						'<input type="hidden" readonly="readonly"'+
						'value="是" class="hui-input" id="has_get" name="has_get">'+
						'<input type="hidden" readonly="readonly"'+
						'value="是" class="hui-input" id="return_type" name="return_type">'+
						
						'<div style="padding: 15px 8px 50px 15px;">'+
						'<div class="hui-form-items-title"></div>'+
						'<input type="submit" id="submit" value="确认归还"'+
							'class="hui-button hui-primary hui-fr">'+
							'</div>'+
					'</form>'+
				'</div>'+
				
				'<div id="eva-type" style="display:none;">'+
					'<form action="ITServices/eborrowing/setEva" method="post" id="eva" class="hui-form" >'+
						
						
						'<input type="hidden" readonly="readonly"'+
							'value="'+dcnumber+'" class="hui-input" id="dcnumber" name="dcnumber">'+
						
						'<input type="hidden" readonly="readonly"'+
						'value="是" class="hui-input" id="audit_type" name="audit_type">'+
						'<input type="hidden" readonly="readonly"'+
						'value="是" class="hui-input" id="has_get" name="has_get">'+
						'<input type="hidden" readonly="readonly"'+
						'value="是" class="hui-input" id="return_type" name="return_type">'+
						
						'<div class="hui-form-items">'+
						'<div class="hui-form-items-title">评价</div>'+
							'<div class="hui-form-textarea">'+
								'<textarea placeholder="评价..." id="evaluate" name="evaluate" required="required"></textarea>'+
							'</div>'+
						'</div>'+
						

						'<div style="padding: 15px 8px 50px 15px;">'+
						'<div class="hui-form-items-title"></div>'+
						'<input type="submit" id="submit" value="提交"'+
							'class="hui-button hui-primary hui-fr">'+
							'</div>'+
						
					'</form>'+
				'</div>';
			hui(div).appendTo('#list');
				
			}
			showeborrowing(s);
		},
		error:function(){
			
		}
		
		})
}

function showeborrowing(s){
	if (s=="未审批") {
		$("#audit-table").show();
		if ($("#username").attr("value")!=$("#audit_name").attr("value")) {
			$("#never").remove();
		}
	}else if (s=="审批通过") {
		$("#audit-table").show();
		$("#never").remove();
		if ($("#username").attr("value")!=$("#audit_name").attr("value")) {
			$("#audit-table").remove();
			$("#get_type").show();
		}
	}else if (s=="审批拒绝") {
		$("#audit-table").show();
		$("#never").remove();
	}else if (s=="未归还") {
		$("#audit-table").show();
		$("#never").remove();
	}else if (s=="已归还未确认") {
		$("#audit-table").show();
		$("#never").remove();
		if ($("#username").attr("value")==$("#audit_name").attr("value")) {
			$("#audit-table").remove();
			$("#has_return").show();
		}
	}else if (s=="已归还已确认") {
		$("#audit-table").show();
		$("#never").remove();
		if ($("#username").attr("value")!=$("#audit_name").attr("value")) {
//			alert('已归还已确认');
			$("#eva-type").show();
		}
	}else if (s=="已评价反馈") {
		$("#audit-table").show();
		$("#never").remove();
		if ($("#username").attr("value")==$("#audit_name").attr("value")) {
			$("#fk-re").show();
		}
	}
}

/********************************************************************************************************/

/**
 * 耗材领用
 */
function getConsumable_borrowingDetail(){
	var dc = $("#dcnumber").attr("value");
	var ty = $("#type").attr("value");
	$.ajax({
		url:'Message/getDetailMessage?dcnumber='+dc+'&type='+encodeURIComponent(ty),
		type:'GET',
		dataType:'text',
		async:true,
		success:function (result){
			hui.closeLoading();
			var re = JSON.parse(JSON.stringify(result));
			var blist = JSON.parse(re).blist;
			var s = '';
			for (var i = 0; i < blist.length; i++) {
				var dcnumber=blist[i].dcnumber;
				var userId=blist[i].userId;
				var borrowid=blist[i].borrowid;
				var borrowname=blist[i].borrowname;
				var borrowde=blist[i].borrowde;
				var recipients_number=blist[i].recipients_number;
				var ptype=blist[i].ptype;
				var ptime=blist[i].ptime;
				var consumable_type=blist[i].consumable_type;
				var consumable_name=blist[i].consumable_name;
				var specifications=blist[i].specifications;
				var consumable_num=blist[i].consumable_num;
				var consum_uprice=blist[i].consum_uprice;
				var consum_tprice=blist[i].consum_tprice;
				var note=blist[i].note;
				var audit_name=blist[i].audit_name;
				var spid=blist[i].spid;
				var audit_type=blist[i].audit_type;
				var audit_opinion=blist[i].audit_opinion;
				var audit_time=blist[i].audit_time;
				var admins_id=blist[i].admins_id;
				var admins=blist[i].admins;
				var issue_type=blist[i].issue_type;
				var evaluate=blist[i].evaluate;
				var overdate=blist[i].overdate;
				mter=admins;
				if (audit_type==null&&issue_type==null) {
					s='未审批';
				}else if (audit_type=='是'&&issue_type==null) {
					s='审批通过';
				}else if (audit_type=='否') {
					s='审批拒绝';
				}else if (issue_type!=null&&audit_type=='是'&&evaluate==null) {
					s='已发放';
				}else if (issue_type==null&&audit_type=='是'&&evaluate==null) {
					s='未发放';
				}else if (evaluate!=null) {
					s='已评价';
				}
				var div = document.createElement('div');
				div.innerHTML =
					 '<div id="audit-table" style="display:none">'+
			 			'<form action="ITServices/consumable_borrowing/audit" method="post" id="audit" name="audit" class="hui-form">'+
			 				'<input type="hidden" id="Recipients_number" name="Recipients_number" value="'+recipients_number+'">'+
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
							'<div class="hui-form-items-title">采购类型</div>'+
							'<input type="text" name="ptype" id="ptype"'+
								'class="hui-input" value="'+ptype+'" readonly="readonly">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
							'<div class="hui-form-items-title">申请时间</div>'+
							'<input type="text" name="ptime" id="ptime"'+
								'class="hui-input" value="'+ptime+'" readonly="readonly">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
							'<div class="hui-form-items-title">耗材类型</div>'+
							'<input type="text" name="consumable_type" id="consumable_type"'+
								'class="hui-input" value="'+consumable_type+'" readonly="readonly">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
							'<div class="hui-form-items-title">申领耗材名称</div>'+
							'<input type="text" name="consumable_name" id="consumable_name"'+
								'class="hui-input" value="'+consumable_name+'" readonly="readonly">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
							'<div class="hui-form-items-title">规格型号</div>'+
							'<input type="text" name="specifications" id="specifications"'+
								'class="hui-input" value="'+specifications+'" readonly="readonly">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
							'<div class="hui-form-items-title">申领数量</div>'+
							'<input type="text" name="consumable_num" id="consumable_num"'+
								'class="hui-input" value="'+consumable_num+'" readonly="readonly">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
							'<div class="hui-form-items-title">耗材单价</div>'+
							'<input type="text" name="consum_uprice" id="consum_uprice"'+
								'class="hui-input" value="'+consum_uprice+'" readonly="readonly">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
							'<div class="hui-form-items-title">申领总价</div>'+
							'<input type="text" name="consum_tprice" id="consum_tprice"'+
								'class="hui-input" value="'+consum_tprice+'" readonly="readonly">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
							'<div class="hui-form-items-title">备注</div>'+
								'<div class="hui-form-textarea">'+
								'<textarea placeholder="备注..." id="note" name="note" readonly="readonly" required="required">'+note+'</textarea>'+
								'</div>'+
							'</div>'+
							
							'<div id="audit-never" name="never">'+
								'<div class="hui-form-items">'+
						            '<div class="hui-form-items-title">是否批准</div>'+
						            '<div class="hui-form-select">'+
						                '<select name="audit_type" id="audit_type">'+
						                    '<option value="是">是</option>'+
						                    '<option value="否">否</option>'+
						                '</select>'+
						            '</div>'+
				       		 	'</div>'+
				       		 	
				       		 	'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">审批意见</div>'+
									'<div class="hui-form-textarea">'+
									'<textarea placeholder="审批意见..." id="audit_opinion" name="audit_opinion" required="required"></textarea>'+
									'</div>'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">审批时间</div>'+
								'<input type="date" name="audit_time" id="audit_time"'+
									'class="hui-input">'+
								'</div>'+
				       		 	
					       		 '<div class="hui-form-items">'+
									'<div class="hui-form-items-title">耗材管理员</div>'+
									'<div class="hui-form-select">'+
						                '<select id="departMent" name="departMent" onChange="chooseMember()">'+
						                '<option value="0">请选择部门</option>'+
						                '</select>'+
						                '<select id="Member" name="Member" onChange="innerAd()">'+
						                '<option value="0">请选择人员</option>'+
						                '</select>'+
					                '<div style="display:none;" id="adminlist">'+
					                '</div>'+
					            '</div>'+
					            
					            '<input type="hidden" id="admins_id" name="admins_id">'+
					            '<input type="hidden" id="admins" name="admins">'+
				
								'</div>'+
				       		 	
					       		 '<div style="padding: 10px 30px 50px 10px;">'+
									'<div class="hui-form-items-title"></div>'+
									'<input type="submit" id="submit" name="submit" value="提交"'+
										'class="hui-button hui-primary hui-fr">'+
								'</div>'+	
								'</div>'+
				       		 	
			       		 	'</div>'+
							
			 			'</form>'+
					 '</div>'+
					 
					 '<div id="issue-table" style="display:none">'+
					    '<form action="ITServices/consumable_borrowing/issue" method="post" id="issue" class="hui-form">'+
								'<input type="hidden" id="Recipients_number" name="Recipients_number" value="'+recipients_number+'">'+
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
								'<div class="hui-form-items-title">采购类型</div>'+
								'<input type="text" name="ptype" id="ptype"'+
									'class="hui-input" value="'+ptype+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">申请时间</div>'+
								'<input type="text" name="ptime" id="ptime"'+
									'class="hui-input" value="'+ptime+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">耗材类型</div>'+
								'<input type="text" name="consumable_type" id="consumable_type"'+
									'class="hui-input" value="'+consumable_type+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">申领耗材名称</div>'+
								'<input type="text" name="consumable_name" id="consumable_name"'+
									'class="hui-input" value="'+consumable_name+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">规格型号</div>'+
								'<input type="text" name="specifications" id="specifications"'+
									'class="hui-input" value="'+specifications+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">申领数量</div>'+
								'<input type="text" name="consumable_num" id="consumable_num"'+
									'class="hui-input" value="'+consumable_num+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">耗材单价</div>'+
								'<input type="text" name="consum_uprice" id="consum_uprice"'+
									'class="hui-input" value="'+consum_uprice+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">申领总价</div>'+
								'<input type="text" name="consum_tprice" id="consum_tprice"'+
									'class="hui-input" value="'+consum_tprice+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">备注</div>'+
									'<div class="hui-form-textarea">'+
									'<textarea placeholder="备注..." id="note" name="note" readonly="readonly" required="required">'+note+'</textarea>'+
									'</div>'+
								'</div>'+
								
								'<div id="issue-never">'+
									'<div class="hui-form-items">'+
							            '<div class="hui-form-items-title">是否发放</div>'+
							            '<div class="hui-form-select">'+
							                '<select name="issue_type" id="issue_type">'+
							                    '<option value="是">是</option>'+
							                    '<option value="否">否</option>'+
							                '</select>'+
							            '</div>'+
				       		 		'</div>'+
				       		 	
						       		 '<div style="padding: 10px 30px 50px 10px;">'+
										'<div class="hui-form-items-title"></div>'+
										'<input type="submit" id="submit" name="submit" value="提交"'+
											'class="hui-button hui-primary hui-fr">'+
									'</div>'+
								'</div>'+
							'</div>'+
								
					    '</form>'+
					 '</div>'+
					 
					 '<div id="eva-table" style="display:none">'+
					 	'<form action="ITServices/consumable_borrowing/eva" method="post" id="issue" class="hui-form">'+
								'<input type="hidden" id="Recipients_number" name="Recipients_number" value="'+recipients_number+'">'+
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
								'<div class="hui-form-items-title">采购类型</div>'+
								'<input type="text" name="ptype" id="ptype"'+
									'class="hui-input" value="'+ptype+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">申请时间</div>'+
								'<input type="text" name="ptime" id="ptime"'+
									'class="hui-input" value="'+ptime+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">耗材类型</div>'+
								'<input type="text" name="consumable_type" id="consumable_type"'+
									'class="hui-input" value="'+consumable_type+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">申领耗材名称</div>'+
								'<input type="text" name="consumable_name" id="consumable_name"'+
									'class="hui-input" value="'+consumable_name+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">规格型号</div>'+
								'<input type="text" name="specifications" id="specifications"'+
									'class="hui-input" value="'+specifications+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">申领数量</div>'+
								'<input type="text" name="consumable_num" id="consumable_num"'+
									'class="hui-input" value="'+consumable_num+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">耗材单价</div>'+
								'<input type="text" name="consum_uprice" id="consum_uprice"'+
									'class="hui-input" value="'+consum_uprice+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">申领总价</div>'+
								'<input type="text" name="consum_tprice" id="consum_tprice"'+
									'class="hui-input" value="'+consum_tprice+'" readonly="readonly">'+
								'</div>'+
								
								'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">备注</div>'+
									'<div class="hui-form-textarea">'+
									'<textarea placeholder="备注..." id="note" name="note" readonly="readonly" required="required">'+note+'</textarea>'+
									'</div>'+
								'</div>'+
								
								'<div id="eva-never">'+
									'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">评价</div>'+
										'<div class="hui-form-textarea">'+
										'<textarea placeholder="评价..." id="evaluate" name="evaluate" required="required"></textarea>'+
										'</div>'+
									'</div>'+
				       		 	
						       		 '<div style="padding: 10px 30px 50px 10px;">'+
										'<div class="hui-form-items-title"></div>'+
										'<input type="submit" id="submit" name="submit" value="提交"'+
											'class="hui-button hui-primary hui-fr">'+
									'</div>'+
								'</div>'+
							'</div>'+
								
					    '</form>'+
					 '</div>';
		        hui(div).appendTo('#list');

				
			}
			showConborrow(s, mter);
			getConsumableNum();

		},
		error:function (){
			
		}
	})
}

function showConborrow(s,mter){
	if (s=='未审批') {
		if ($("#username").attr("value")==$("#audit_name").attr("value")) {
			$("#audit-table").show();
		}else {
			$("#audit-table").show();
			$("#audit-never").remove();
		}
	}else if (s=='审批通过') {
		$("#audit-table").show();
		$("#audit-never").remove();
		if ($("#username").attr("value")==mter) {
			$("#issue-table").show();
			$("#audit-table").remove();
		}
	}else if (s=='审批拒绝') {
		$("#audit-table").show();
		$("#audit-never").remove();
	}else if (s=='已发放') {
		if (($("#username").attr("value")!=$("#audit_name").attr("value"))&&($("#username").attr("value")!=mter)) {
			$("#eva-table").show();
		}else {
			$("#eva-table").show();
			$("#eva-never").remove();
		}
	}else if (s=='未发放') {
		if ($("#username").attr("value")==mter) {
			$("#issue-table").show();
		}else {
			$("#issue-table").show();
			$("#issue-never").remove();
		}	
	}else if (s=='已评价') {
		$("#issue-table").show();
		$("#issue-never").remove();
	}
}

/**
 * 部门选择下拉框与人员选择相关联
 */
function chooseMember(){
	var adm = JSON.parse($("#adminlist").text());
	var slddepart = document.audit.departMent;
	var sldmember = document.audit.Member;
	var departMent= adm[slddepart.selectedIndex-1];
//	alert(JSON.stringify(departMent));
	sldmember.length=1;
	for (var i = 0; i < departMent.member.length; i++) {
		sldmember[i+1]=new Option(departMent.member[i].name,departMent.member[i].userid);
		
	}
}

/**
 * 选择后保存耗材管理员
 */
function innerAd(){
	var asld_id=$("#Member option:selected").attr("value");
	var asld_name=$("#Member option:selected").text();
	$("#admins_id").val(asld_id);
	$("#admins").val(asld_name);
}

/**
 * 获取发放前库中所申请的耗材的数量与价格与申请的数量价格相减的数值
 */
function getConsumableNum(){
	$.ajax({
		url:'ITServices/consumable_borrowing/getConNum?Recipients_number='+$("#Recipients_number").attr("value"),
		type:'GET',
		dataType:'text',
//		async:false,
		success:function (result){
			var re = JSON.parse(JSON.stringify(result));
			var conlist = JSON.parse(re).conlist;
			for (var i = 0; i < conlist.length; i++) {
				var consumable_num=conlist[i].consumable_num;//库中的数量
				var consum_uprice=conlist[i].consum_uprice;
				var consum_tprice=conlist[i].consum_tprice;//库中的总价
//				alert(consum_tprice);
				var a_cnum=$("#consumable_num").attr("value");//申请的耗材数量
				var a_tup=$("#consum_tprice").attr("value");//申请的耗材总价
				
				var l_cnum=parseInt(consumable_num)-parseInt(a_cnum);
				var l_tup=parseInt(consum_tprice)-parseInt(a_tup)
				
				var div=document.createElement('div');
				div.innerHTML='<input type="hidden" id="l_cnum" name="l_cnum" value="'+l_cnum+'">'+
				'<input type="hidden" id="l_tup" name="l_tup" value="'+l_tup+'">';
				hui(div).appendTo('#issue');
			}
		},
		error:function(){
			alert("耗材数量获取失败！！");
		}
	})
}


