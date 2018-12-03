

/**
 * 判断系统平台
 */
if (dd.ios || dd.android) {
		dd.ready(function(){
		hui.loading('数据加载中');
		dd.config({
			agentId : _config.agentid,
			corpId : _config.corpId,
			timeStamp : _config.timeStamp,
			nonceStr : _config.nonceStr,
			signature : _config.signature,
			jsApiList : [ 'runtime.info', 'biz.contact.choose',
					'device.notification.confirm', 'device.notification.alert',
					'device.notification.prompt', 'biz.ding.post',
					'biz.util.openLink' ,'biz.contact.complexPicker']
		});
		dd.runtime.permission.requestAuthCode({
			corpId : _config.corpId,
			onSuccess : function(info) {
//				alert('authcode: ' + info.code);
				$.ajax({
					url:'Userinfor/getuserinfor?code=' + info.code + '&corpid='
							+ _config.corpId,
					type : 'GET',
					dataType:"text",
					success : function(data, status, xhr) {
						hui.closeLoading();
						var info = JSON.parse(data);
//						alert('info:' + info); 
						document.getElementById("userName").innerHTML = "欢迎您:"+info.name;
// 						document.getElementById("userId").innerHTML = info.userid;
						$("#userid").val(info.userid);
						getTodoPointMsg(info.name);
						getMyPointMsg(info.name);
						// 图片
						if(info.avatar.length != 0){
				            var img = document.getElementById("userImg");
//				            alert(img.src);
				            img.src = info.avatar;
// 				                      img.height = '100';
// 				                      img.width = '100';
				          }
// 						document.getElementById("contract").href="/saveUserInfor?info="+data
						$("#info").val(data.replace(/"/g,"'"));
						var url = 'saveUserInfor?info='+encodeURIComponent(data.replace(/"/g,"'"));
// 						alert(url);
						tosave(url);
						

					},
					error : function(xhr, errorType, error) {
						logger.e("yinyien:" + _config.corpId);
						logger.e(errorType + ', ' + error);
					}
				});
				

			},
			onFail : function(err) {
				alert('fail: ' + JSON.stringify(err));
			}
		});
		
		
	})
	
	function to2(){
		
		dd.ready(function(){
			dd.biz.contact.complexPicker({
				    title:"选人",            //标题
				    corpId:_config.corpId,    //企业的corpId
				    multiple:true,            //是否多选
				    limitTips:"超出了",          //超过限定人数返回提示
				    maxUsers:1000,            //最大可选人数
				    pickedUsers:[],            //已选用户
				    pickedDepartments:[],          //已选部门
				    disabledUsers:[],            //不可选用户
				    disabledDepartments:[],        //不可选部门
				    requiredUsers:[],            //必选用户（不可取消选中状态）
				    requiredDepartments:[],        //必选部门（不可取消选中状态）
				    appId:_config.agentid,              //微应用的Id
					permissionType:"GLOBAL",          //选人权限，目前只有GLOBAL这个参数
				    responseUserOnly:false,        //返回人，或者返回人和部门
					startWithDepartmentId:0 ,   // 0表示从企业最上层开始，IOS不支持该字段
				    onSuccess: function(result) {
					alert('complexPicker result: ' + JSON.stringify(result));
				        /**
				        {
				            selectedCount:1,                              //选择人数
				            users:[{"name":"","avatar":"","emplId":""}]，//返回选人的列表，列表中的对象包含name（用户名），avatar（用户头像），emplId（用户工号）三个字段
				            departments:[{"id":,"name":"","number":}]//返回已选部门列表，列表中每个对象包含id（部门id）、name（部门名称）、number（部门人数）
				        }
				        */
				    },
				   onFail : function(err) {
						
					  alert('complexPicker error: ' + JSON.stringify(err));
					
				}
				});
		
		});
		
		
	}
	
}else if(DingTalkPC.ua.isDesktop&&DingTalkPC.ua.isInDingTalk){
	
	$(document).ready(function(){
		hui.loading('数据加载中');
		DingTalkPC.config({
			agentId : _config.agentid,
			corpId : _config.corpId,
			timeStamp : _config.timeStamp,
			nonceStr : _config.nonceStr,
			signature : _config.signature,
			jsApiList : [ 'runtime.info', 'biz.contact.choose',
					'device.notification.confirm', 'device.notification.alert',
					'device.notification.prompt', 'biz.ding.post',
					'biz.util.openLink' ,'biz.contact.complexPicker']
		});
		DingTalkPC.runtime.permission.requestAuthCode({
			corpId : _config.corpId,
			onSuccess : function(info) {
//				alert('authcode: ' + info.code);
				$.ajax({
					url:'Userinfor/getuserinfor?code=' + info.code + '&corpid='
							+ _config.corpId,
					type : 'GET',
					dataType:"text",
					success : function(data, status, xhr) {
						hui.closeLoading();
						var info = JSON.parse(data);
//						alert('info:' + info); 
						document.getElementById("userName").innerHTML = "欢迎您:"+info.name;
// 						document.getElementById("userId").innerHTML = info.userid;
						$("#userid").val(info.userid);
						getTodoPointMsg(info.name);
						getMyPointMsg(info.name);
						// 图片
						if(info.avatar.length != 0){
				            var img = document.getElementById("userImg");
//				            alert(img.src);
				            img.src = info.avatar;
// 				                      img.height = '100';
// 				                      img.width = '100';
				          }
// 						document.getElementById("contract").href="/saveUserInfor?info="+data
						$("#info").val(data.replace(/"/g,"'"));
						var url = 'saveUserInfor?info='+encodeURIComponent(data.replace(/"/g,"'"));
// 						alert(url);
						tosave(url);
						

					},
					error : function(xhr, errorType, error) {
						logger.e("yinyien:" + _config.corpId);
						alert(errorType + ', ' + error);
					}
				});
				

			},
			onFail : function(err) {
				alert('fail: ' + JSON.stringify(err));
			}
		});
		
		
		DingTalkPC.error(function(error){
			hui.closeLoading();
			alert("DingTalkPC_error:"+error);
			alert('dd error: ' + JSON.stringify(error));
	  /*{
	      errorCode: 1001, //错误码
	      errorMessage: '', //错误信息
	  }*/
	  // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开调试窗口的 console查看，也可以在返回的res参数中查看。
			});
	})
	
	
	
	function to2(){
		
	DingTalkPC.ready(function(){
		DingTalkPC.biz.contact.complexPicker({
				    title:"选人",            //标题
				    corpId:_config.corpId,    //企业的corpId
				    multiple:true,            //是否多选
				    limitTips:"超出了",          //超过限定人数返回提示
				    maxUsers:1000,            //最大可选人数
				    pickedUsers:[],            //已选用户
				    pickedDepartments:[],          //已选部门
				    disabledUsers:[],            //不可选用户
				    disabledDepartments:[],        //不可选部门
				    requiredUsers:[],            //必选用户（不可取消选中状态）
				    requiredDepartments:[],        //必选部门（不可取消选中状态）
				    appId:_config.agentid,              //微应用的Id
					permissionType:"GLOBAL",          //选人权限，目前只有GLOBAL这个参数
				    responseUserOnly:false,        //返回人，或者返回人和部门
					startWithDepartmentId:0 ,   // 0表示从企业最上层开始，IOS不支持该字段
				    onSuccess: function(result) {
					alert('complexPicker result: ' + JSON.stringify(result));
				        /**
				        {
				            selectedCount:1,                              //选择人数
				            users:[{"name":"","avatar":"","emplId":""}]，//返回选人的列表，列表中的对象包含name（用户名），avatar（用户头像），emplId（用户工号）三个字段
				            departments:[{"id":,"name":"","number":}]//返回已选部门列表，列表中每个对象包含id（部门id）、name（部门名称）、number（部门人数）
				        }
				        */
				    },
				   onFail : function(err) {
						
					  alert('complexPicker error: ' + JSON.stringify(err));
					
				}
				});
		
		});
		
		
	}
	
}else {
	
	$(document).ready(function (){
		getUserInfor();
	})
	function getUserInfor(){
		var info=JSON.parse($("#info").attr("value").replace(/'/g,"\""));
		document.getElementById("userName").innerHTML = "欢迎您:"+info.name;
		
		// 图片
		if(info.avatar.length != 0){
	        var img = document.getElementById("userImg");
//	      alert(img.src);
	        img.src = info.avatar;
//	                   img.height = '100';
//	                   img.width = '100';
	      }
	}
	
} 
	
	
	function tosave(url){
			$.ajax({
				url:url,
				type:'GET',
				dataType:"text",
				success:function(data){
// 					alert(data)
				},
				error:function(){
					alert("保存失败")
				},
				
			})
		}
	

/**
 * 到合同管理
 */
	function send2Contract(){
		var info = Encrypt($("#info").attr("value"));
// 		alert(info)
		if (info=="") {
			alert("请稍等")
		}else{
			window.location ='Contract/tocontract?info='+encodeURIComponent(info);
		}
	}
	
	/**
	 * 到行政办公
	 */
	
	function send2Office(){
		var info = Encrypt($("#info").attr("value"));
// 		alert(info)
		if (info=="") {
			alert("请稍等")
		}else{
			window.location ='Office/Office?info='+encodeURIComponent(info);
		}
	}


/**
 * 到IT服务
 */
function tocenter(){
	var info = Encrypt($("#info").attr("value"));
// 		alert("暂未上线");
		if (info=="") {
			alert("请稍等")
		}else{
			window.location ='ITService/toIT?info='+encodeURIComponent(info)
		}
	}

/**
 * 到人力服务
 */
function toHR(){
	var info = Encrypt($("#info").attr("value"));
//		alert(info)
//	alert("暂未上线");
	if (info=="") {
		alert("请稍等")
	}else{
		window.location ='HrServices/hrservices?info='+encodeURIComponent(info);
	}
}

/**
 * 
 */
function torepair(){
	var info = $("#info").attr("value")
	if (info=="") {
		alert("请稍等")
	}else{
		window.location ='Repair/torepair.do?info='+encodeURIComponent(info)
	}
}