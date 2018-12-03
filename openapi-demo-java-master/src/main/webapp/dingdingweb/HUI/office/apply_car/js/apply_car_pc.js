
DingTalkPC.config({
		agentId : _config.agentid,
		corpId : _config.corpId,
		timeStamp : _config.timeStamp,
		nonceStr : _config.nonceStr,
		signature : _config.signature,
		jsApiList : ['biz.contact.choose','biz.ding.post']
	});
DingTalkPC.ready(function(){
	
	DingTalkPC.runtime.permission.requestAuthCode({
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
//						document.getElementById("userId").innerHTML = info.userid;
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
					$("#jobnumber").val(info.jobnumber);
					$("#name").val(info.name);
					var dp = info.department;
					getDepartId(dp);
					getCourierPointMsg();
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
	
	DingTalkPC.error(function(err) {
		alert('dd error: ' + JSON.stringify(err));
	});
})

function to2(){

	DingTalkPC.ready(function(){
		
		DingTalkPC.biz.contact.choose({
		    multiple: false, //是否多选： true多选 false单选； 默认true
//		    users: ['10001', '10002', ...], //默认选中的用户列表，员工userid；成功回调中应包含该信息
		    corpId: _config.corpId, //企业id
		    max: 10, //人数限制，当multiple为true才生效，可选范围1-1500
		    onSuccess: function(data) {
		    	
		    	var d = JSON.parse(JSON.stringify(data));
				var name;
				var avatar;
				var emplId;
				for (var i = 0; i < d.length; i++) {
					var user = d[i];
// 					alert(user);
					name=user.name;
// 					alert(name);
					avatar = user.avatar;
//					alert(avtar);
					emplId = user.emplId;
				}
				
				$("#userid").val(emplId);
				$("#audit-name").val(name);
		         var img = document.getElementById("audit-img");
		         img.src = avatar;
		    /* data结构
		      [{
		        "name": "张三", //姓名
		        "avatar": "http://g.alicdn.com/avatar/zhangsan.png" //头像图片url，可能为空
		        "emplId": '0573', //员工userid
		       },
		       ...
		      ]
		    */
		    },
		    onFail : function(err) {}
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
	var usid = $("#userid").attr("value");
	var nw="新的车辆借用申请\n"+
	"申请人："+$("input[name='name']").val()+"\n"+
	"申请车辆："+$("input[name='car_name']").val()+"\n"+
	"车牌号："+$("input[name='license_plate']").val()+"\n"+
	"申请时间："+$("input[name='apply-time']").val()+"\n"+
	"申请事由："+$("input[name='apply-reason']").val()+"\n";
	
	var uarry = new Array();
	uarry[0]=usid;
	DingTalkPC.ready(function(){
		DingTalkPC.biz.ding.post({
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
