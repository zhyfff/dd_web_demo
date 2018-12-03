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
				var Recipients_number=blist[i].Recipients_number;
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
						'<form action="ITServices/UpdateConsumableInfor" method="post" id="toStamp">'+
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
							'<div id="nomol">'+
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
								
								
							'</div>'+
							
							'<div id="updateMessage" style="display: none;">'+
							
								'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">添加数量</div>'+
									'<div class="hui-number-box" min="1" max="999">'+
										'<div class="reduce" onclick="numberbox()">-</div>'+
										'<input type="num" id="consumable-num" name="consumable_num" value="'+consumable_num+'" onkeyup="this.value=this.value.replace(/[^0-9\.]/g,"");G("consum-tprice").value=G("consumable-num").value*G("consum-uprice").value;">'+
										'<div class="add" onclick="numberbox()">+</div>'+
									'</div>'+
								'</div>'+
						
								'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">耗材单价</div>'+
									'<input type="text" id="consum-uprice" name="consum_uprice"'+
										'required="required" class="hui-input" value="'+consum_uprice+'" onkeyup="this.value=this.value.replace(/[^0-9\.]/g,"");G("consum-tprice").value=G("consumable-num").value*G("consum-uprice").value;">'+
								'</div>'+
						
								'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">耗材总价</div>'+
									'<input type="text" id="consum-tprice" name="consum_tprice"'+
										'required="required" class="hui-input" value="'+consum_tprice+'" readonly="readonly">'+
								'</div>'+
								
								
								
								'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">状态</div>'+
										'<div class="hui-form-select">'+
						                '<select name="available" id="available">'+
						                    '<option value="可用">可用</option>'+
						                    '<option value="不可用">不可用</option>'+
						                '</select>'+
						            '</div>'+
								'</div>'+
							
							'</div>'+
							
							'<div class="hui-form-items" id="update">'+
								'<div class="hui-form-items-title" style="padding:10px 20px;" onclick="updateInfo(this)"><button class="hui-button hui-button-small hui-fl" type="button">更新信息</button></div>'+
								'<div class="hui-form-items-title" style="padding:10px 20px;display: none;" id="cancel" onclick="hiden(this)" ><button class="hui-button hui-button-small hui-fl" type="button">取消</button></div>'+
							'</div>'+
							
							'<div style="padding: 15px 8px;display:none;" id="sub">'+
								'<div class="hui-form-items-title"></div>'+
								'<input type="submit" id="submit" value="提交"'+
									'class="hui-button hui-button-large hui-primary hui-fr">'+
							'</div>'+
							
							
						'<form>'+
					'</div>'+
				'</div>';
				 hui(div).appendTo('#list');
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
				var Recipients_number=blist[i].Recipients_number;
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
						'<form action="ITServices/UpdateConsumableInfor" method="post" id="toStamp">'+
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
							'<div id="nomol">'+
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
								
								
							'</div>'+
							
							'<div id="updateMessage" style="display: none;">'+
							
								'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">添加数量</div>'+
									'<div class="hui-number-box" min="1" max="999">'+
										'<div class="reduce" onclick="numberbox()">-</div>'+
										'<input value="1" type="num" id="consumable-num" name="consumable_num" onkeyup="this.value=this.value.replace(/[^0-9\.]/g,"");G("consum-tprice").value=G("consumable-num").value*G("consum-uprice").value;">'+
										'<div class="add" onclick="numberbox()">+</div>'+
									'</div>'+
								'</div>'+
						
								'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">耗材单价</div>'+
									'<input type="text" id="consum-uprice" name="consum_uprice"'+
										'required="required" class="hui-input" onkeyup="this.value=this.value.replace(/[^0-9\.]/g,"");G("consum-tprice").value=G("consumable-num").value*G("consum-uprice").value;">'+
								'</div>'+
						
								'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">耗材总价</div>'+
									'<input type="text" id="consum-tprice" name="consum_tprice"'+
										'required="required" class="hui-input" value="'+consum_tprice+'" readonly="readonly">'+
								'</div>'+
								
								
								
								'<div class="hui-form-items">'+
									'<div class="hui-form-items-title">状态</div>'+
										'<div class="hui-form-select">'+
						                '<select name="available" id="available">'+
						                    '<option value="可用">可用</option>'+
						                    '<option value="不可用">不可用</option>'+
						                '</select>'+
						            '</div>'+
								'</div>'+
								
								
							
							'</div>'+
							
							'<div class="hui-form-items" id="update">'+
								'<div class="hui-form-items-title" onclick="updateInfo(this)"><button class="hui-button hui-button-small hui-fl" type="button">更新信息</button></div>'+
								'<div class="hui-form-items-title" id="cancel" onclick="hiden(this)" style="display: none;"><button class="hui-button hui-button-small hui-fl" type="button">取消</button></div>'+
							'</div>'+
							
							'<div style="padding: 15px 8px;display:none;" id="sub">'+
								'<div class="hui-form-items-title"></div>'+
								'<input type="submit" id="submit" value="提交"'+
									'class="hui-button hui-button-large hui-primary hui-fr">'+
							'</div>'+
							
							
						'<form>'+
					'</div>'+
				'</div>';
				 hui(div).appendTo('#list');
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

function hiden(target){
	$(target).parent().parent().children("#updateMessage").hide();
	$(target).parent().parent().children("#sub").hide();
	$(target).parent().parent().children("#nomol").show();
	$(target).parent().children("#cancel").hide();
}

function updateInfo(target){
	$(target).parent().parent().children("#updateMessage").show();
	$(target).parent().parent().children("#sub").show();
	$(target).parent().parent().children("#nomol").hide();
	$(target).parent().children("#cancel").show();
}