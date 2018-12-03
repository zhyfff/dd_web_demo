function getconsu(){
	var type_num;
	var consumable_type=$(".hui-header").children("h1").text();
// 	alert(consumable_type);
	if (consumable_type==("打印耗材")) {
		type_num=1;
	}else if (consumable_type==("电脑耗材")) {
		type_num=2;
	}else if (consumable_type==("印刷耗材")) {
		type_num=3;
	}else if (consumable_type==("输出介质")) {
		type_num=4;
	}else if (consumable_type==("手机周边耗材")) {
		type_num=5;
	}
	$.ajax({
		url:'ITServices/getConsumable?type_num='+type_num+'&pageNum=1',
		type:'GET',
		dataType:'text',
		success:function(result){
			var re = JSON.parse(JSON.stringify(result));
			var blist = JSON.parse(re).blist;
			for (var i = 0; i < blist.length; i++) {
				var ptype=blist[i].ptype;
				var recipients_number=blist[i].recipients_number;
				var consumable_type=blist[i].consumable_type;
				var consumable_name=blist[i].consumable_name;
				var specifications=blist[i].specifications;
				var ptime=blist[i].ptime;
				var consumable_num=blist[i].consumable_num;
				var consum_uprice=blist[i].consum_uprice;
				var consum_tprice=blist[i].consum_tprice;
				var note=blist[i].note;
				var available=blist[i].available;
				var type_num=blist[i].type_num;
				var add_date=blist[i].add_date;
				
				var div = document.createElement('div');
				div.innerHTML =
				'<div class="hui-accordion">'+
					'<div class="hui-accordion-title" >[耗材名称：'+consumable_name+'][耗材规格型号：'+specifications+'][状态：'+available+']</div>'+
					'<div class="hui-accordion-content hui-list">'+
							'<input type="hidden" id="Recipients_number" name="Recipients_number" value="'+recipients_number+'">'+
					
							'<input type="hidden" id="consumable_name" value="'+consumable_name+'">'+
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">采购类型</div>'+
								'<input type="text" name="ptype" id="ptype"'+
									'class="hui-input" value="'+ptype+'" required="required" readonly="readonly">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">耗材分类</div>'+
								'<input type="text" name="consumable_type" id="consumable_type"'+
									'class="hui-input" value="'+consumable_type+'" required="required" readonly="readonly">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">耗材规格型号</div>'+
								'<input type="text" name="specifications" id="specifications"'+
									'class="hui-input" value="'+specifications+'" required="required" readonly="readonly">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">采购日期</div>'+
								'<input type="text" name="ptime" id="ptime"'+
									'class="hui-input" value="'+ptime+'" required="required" readonly="readonly">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">备注</div>'+
								'<div class="hui-form-textarea">'+
									'<textarea placeholder="备注..." id="note" name="note" required="required" readonly="readonly">'+note+'</textarea>'+
								'</div>'+
							'</div>'+
							
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">耗材数量</div>'+
								'<input type="text" name="num" id="num"'+
									'class="hui-input" value="'+consumable_num+'" required="required" readonly="readonly">'+
							'</div>'+
								
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">耗材单价</div>'+
								'<input type="text" name="uprice" id="uprice"'+
									'class="hui-input" value="'+consum_uprice+'" required="required" readonly="readonly">'+
							'</div>'+
								
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">耗材总价</div>'+
								'<input type="text" id="tprice" name="tprice"'+
									'required="required" class="hui-input" value="'+consum_tprice+'" readonly="readonly">'+
							'</div>'+
							
							
							'<div style="padding: 15px 8px;" id="sub">'+
								'<div class="hui-form-items-title"></div>'+
								'<input type="submit" id="submit" value="申领耗材"'+
									'class="hui-button hui-button-large hui-primary hui-fr" onclick="tolocation(this)">'+
							'</div>'+
							
					'</div>'+
				'</div>';
				 hui(div).appendTo('#list');
				if (available!='可用') {
					$("#sub").remove();
				}
			}
			hui.accordion(true, false);
		
		},
		error:function(){
			alert("error");
		}
	})
}


function getmoreconsu(){

	var page = 1;
	nextPage(page);
	
}

function nextPage(page){
	var type_num;
	var consumable_type=$(".hui-header").children("h1").text();
// 	alert(consumable_type);
	if (consumable_type==("打印耗材")) {
		type_num=1;
	}else if (consumable_type==("电脑耗材")) {
		type_num=2;
	}else if (consumable_type==("印刷耗材")) {
		type_num=3;
	}else if (consumable_type==("输出介质")) {
		type_num=4;
	}else if (consumable_type==("手机周边耗材")) {
		type_num=5;
	}
	$.ajax({
		url:'ITServices/getConsumable?type_num='+type_num+'&pageNum='+page,
		type:'get',
		dataType:'text',
		success:function(result){
			var re = JSON.parse(JSON.stringify(result));
			  var pageInfo = JSON.parse(re).pageInfo;
				var hasNextPage = pageInfo.hasNextPage;
//		 			alert(hasNextPage);
				if(hasNextPage == false){
			        hui.endLoadMore(true, '已经到头了...');
//			        alert("已经到头了...");
					
			         return false;
			     }else {
			    	page++;
			    	//hui.refresh('#refreshContainer', refresh);
			    	getMore(page);
				}
		},
		error:function(){}
	})
}	

//加载更多
function getMore(page){
	var type_num;
	var consumable_type=$(".hui-header").children("h1").text();
// 	alert(consumable_type);
	if (consumable_type==("打印耗材")) {
		type_num=1;
	}else if (consumable_type==("电脑耗材")) {
		type_num=2;
	}else if (consumable_type==("印刷耗材")) {
		type_num=3;
	}else if (consumable_type==("输出介质")) {
		type_num=4;
	}else if (consumable_type==("手机周边耗材")) {
		type_num=5;
	}
	hui.loading('加载更多');
	$.ajax({
		url:'ITServices/getConsumable?type_num='+type_num+'&pageNum='+page,
		type:'GET',
		dataType:'text',
		success:function(result){
			hui.closeLoading();
			var re = JSON.parse(JSON.stringify(result));
			var blist = JSON.parse(re).blist;
			for (var i = 0; i < blist.length; i++) {
				var ptype=blist[i].ptype;
				var recipients_number=blist[i].recipients_number;
				var consumable_type=blist[i].consumable_type;
				var consumable_name=blist[i].consumable_name;
				var specifications=blist[i].specifications;
				var ptime=blist[i].ptime;
				var consumable_num=blist[i].consumable_num;
				var consum_uprice=blist[i].consum_uprice;
				var consum_tprice=blist[i].consum_tprice;
				var note=blist[i].note;
				var available=blist[i].available;
				var type_num=blist[i].type_num;
				var add_date=blist[i].add_date;
				
				var div = document.createElement('div');
				div.innerHTML =
				'<div class="hui-accordion">'+
					'<div class="hui-accordion-title" >[耗材名称：'+consumable_name+'][耗材规格型号：'+specifications+'][状态：'+available+']</div>'+
					'<div class="hui-accordion-content hui-list">'+
							
							'<input type="hidden" id="Recipients_number" name="Recipients_number" value="'+recipients_number+'">'+
							'<input type="hidden" id="consumable_name" value="'+consumable_name+'">'+
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">采购类型</div>'+
								'<input type="text" name="ptype" id="ptype"'+
									'class="hui-input" value="'+ptype+'" required="required" readonly="readonly">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">耗材分类</div>'+
								'<input type="text" name="consumable_type" id="consumable_type"'+
									'class="hui-input" value="'+consumable_type+'" required="required" readonly="readonly">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">耗材规格型号</div>'+
								'<input type="text" name="specifications" id="specifications"'+
									'class="hui-input" value="'+specifications+'" required="required" readonly="readonly">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">采购日期</div>'+
								'<input type="text" name="ptime" id="ptime"'+
									'class="hui-input" value="'+ptime+'" required="required" readonly="readonly">'+
							'</div>'+
							
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">备注</div>'+
								'<div class="hui-form-textarea">'+
									'<textarea placeholder="备注..." id="note" name="note" required="required" readonly="readonly">'+note+'</textarea>'+
								'</div>'+
							'</div>'+
							
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">耗材数量</div>'+
								'<input type="text" name="num" id="num"'+
									'class="hui-input" value="'+consumable_num+'" required="required" readonly="readonly">'+
							'</div>'+
								
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">耗材单价</div>'+
								'<input type="text" name="uprice" id="uprice"'+
									'class="hui-input" value="'+consum_uprice+'" required="required" readonly="readonly">'+
							'</div>'+
								
							'<div class="hui-form-items">'+
								'<div class="hui-form-items-title">耗材总价</div>'+
								'<input type="text" id="tprice" name="tprice"'+
									'required="required" class="hui-input" value="'+consum_tprice+'" readonly="readonly">'+
							'</div>'+
							
							
							'<div style="padding: 15px 8px;" id="sub">'+
								'<div class="hui-form-items-title"></div>'+
								'<input type="submit" id="submit" value="申领耗材"'+
									'class="hui-button hui-button-large hui-primary hui-fr" onclick="tolocation(this)">'+
							'</div>'+
							
					'</div>'+
				'</div>';
				 hui(div).appendTo('#list');
				if (available!='可用') {
					$("#sub").remove();
				}
			}
			page++;
            hui.endLoadMore();
	        var pageInfo = JSON.parse(re).pageInfo;
			var hasNextPage = pageInfo.hasNextPage;
	// 			alert(hasNextPage);
			if(hasNextPage == false){
		        hui.endLoadMore(true, '已经到头了...');
	//		        alert("已经到头了...");
				hui.accordion(true, false);
		         return false;
		     }else {
		    	 hui.accordion(true, false);
			}
		},
		error:function(){
			alert("error");
		}
	})
	hui.accordion(true, false);
}

function G(e) {
	return document.getElementById(e);
}



