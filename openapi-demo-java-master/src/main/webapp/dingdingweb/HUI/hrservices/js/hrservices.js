dd.config({
			agentId : _config.agentid,
			corpId : _config.corpId,
			timeStamp : _config.timeStamp,
			nonceStr : _config.nonceStr,
			signature : _config.signature,
			jsApiList : ['biz.contact.complexPicker','biz.ding.create']
		});
	dd.ready(function(){
		
		dd.runtime.permission.requestAuthCode({
			corpId : _config.corpId,
			onSuccess : function(info) {
	//			alert('authcode: ' + info.code);
				$.ajax({
					url : 'Userinfor/getuserinfor.do?code=' + info.code + '&corpid='
							+ _config.corpId,
					type : 'GET',
					dataType:"text",
					success : function(data, status, xhr) {
						var info = JSON.parse(data);
	//					alert('info:' + info); 
						document.getElementById("userName").innerHTML = "欢迎您 :"+info.name;
						$("#userId").val(info.userid);
						$("#username").val(info.name);
						getTodoPointMsg(info.name);
						getMyPointMsg(info.name);
						// 图片
						if(info.avatar.length != 0){
				            var img = document.getElementById("userImg");
	//			            alert(img.src);
				            img.src = info.avatar;
	//				                      img.height = '100';
	//				                      img.width = '100';
				          }
						$("#info").val(data.replace(/"/g,"'"));
						$("#borrowid").val(info.jobnumber);
						$("#borrowname").val(info.name);
						var dp = info.department;
						getDepartId(dp);
						
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
		
		dd.error(function(err) {
			alert('dd error: ' + JSON.stringify(err));
		});
	})
	
	function to2(){
	
		dd.ready(function(){
//			dd.runtime.info({
//				onSuccess : function(info) {
//	//				logger.e('runtime info: ' + JSON.stringify(info));
//				},
//				onFail : function(err) {
//					logger.e('fail: ' + JSON.stringify(err));
//				}
//			});
//			dd.ui.pullToRefresh.enable({
//			    onSuccess: function() {
//			    },
//			    onFail: function() {
//			    }
//			})
	
			dd.biz.contact.complexPicker({
				    title:"选人",            //标题
				    corpId:_config.corpId,    //企业的corpId
				    multiple:false,            //是否多选
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
	// 				alert('complexPicker result: ' + JSON.stringify(result));
					var r = JSON.parse(JSON.stringify(result));
					var u = r.users
	// 				alert(u);
					var name;
					var avatar;
					var emplId;
					for (var i = 0; i < u.length; i++) {
						var user = u[i];
	// 					alert(user);
						name=user.name;
	// 					alert(name);
						avatar = user.avatar;
	//					alert(avtar);
						emplId = user.emplId;
					}
					
					$("#userid").val(emplId);
					$("#spid").val(emplId);
					if (document.getElementById("audit-img")) {
	//					alert("audit-name");
						$("#audit-name").val(name);
				         var img = document.getElementById("audit-img");
				         img.src = avatar;
					}
					
					if (document.getElementById("lq-img")){
	//					alert("lq");
						 $("#lq").val(name);
						 var img = document.getElementById("lq-img");
				         img.src = avatar;
					}
			        
			         
			          
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
	
	
	function getDepartId(dp){
	//	alert(dp);
		var departIdList=JSON.parse("["+dp+"]");
	//	alert(departIdList);
		var departId;
		for (var i = 0; i < departIdList.length; i++) {
			departId = departIdList[i];
				
			getDepart(departId);
		}
	}
	
	function getDepart(departId){
		$.ajax({
			url:'Department/getDepartmentdetail?DeptId='+departId,
			type:'GET',
			dataType:"text",		
			success:function(data){
				var depart = JSON.parse(data)		
				$("#borrowde").val(depart.name)					
			},
			error:function(){
				alert("不合法的部门id")
			}
		})	
	}	
	
	function ding(){
		var usid = $("#spid").attr("value");
		var nw = "劳动合同、人员档案借用申请，\n"+
				"申请人："+$("input[name='borrowname']").val()+"\n"+
				"借用文件名："+$("input[name='contractName']").val()+"\n"+
				"借用事由："+$("input[name='reason']").val()+"\n"+
				"预计归还时间："+$("input[name='abacktime']").val()+"\n";
		
		var uarry = new Array();
		uarry[0]=usid;
		dd.ready(function(){
			dd.biz.ding.create({
			    users : uarry,// 用户列表，工号
			    corpId: _config.corpId, // 企业id
	//		    type: 1, // 附件类型 1：image  2：link
			    alertType: 2, // 钉发送方式 0:电话, 1:短信, 2:应用内
	//		    alertDate: {"format":"yyyy-MM-dd HH:mm","value":"2018-08-23 14:54"},
	//		    attachment: {
	//		        images: [''],
	//		    }, // 附件信息，数据格式参考下文1.0版发钉的附件信息
			    text: nw,  // 正文
			    bizType :0, // 业务类型 0：通知DING；1：任务；2：会议；
	//			    confInfo:{
	//			       bizSubType:0, // 子业务类型如会议：0：预约会议；1：预约电话会议；2：预约视频会议；（注：目前只有会议才有子业务类型）
	//			       location:'某某会议室' , //会议地点；（非必填）
	//			       startTime:{"format":"yyyy-MM-dd HH:mm","value":"2015-05-09 08:00"},// 会议开始时间
	//			       endTime:{"format":"yyyy-MM-dd HH:mm","value":"2015-05-09 08:00"}, // 会议结束时间
	//			       remindMinutes:30, // 会前提醒。单位分钟-1：不提醒；0：事件发生时提醒；5：提前5分钟；15：提前15分钟；30：提前30分钟；60：提前1个小时；1440：提前一天；
	//			      remindType:2 // 会议提前提醒方式。0:电话, 1:短信, 2:应用内
	//			    },
			 
	//			    taskInfo:{
	//			       ccUsers: ['100', '101'], // 抄送用户列表，工号
	//			       deadlineTime:{"format":"yyyy-MM-dd HH:mm","value":"2015-05-09 08:00"} , // 任务截止时间
	//			       taskRemind:30// 任务提醒时间，单位分钟0：不提醒；15：提前15分钟；60：提前1个小时；180：提前3个小时；1440：提前一天；
	//			    },
			 
			    onSuccess : function() {
			         //onSuccess将在点击发送之后调用
	//		         alert("发送ding");
			         registered();
			    },
			    onFail : function() {
			    	alert("错误ding");
			    }
			})
			
		})
}
	
