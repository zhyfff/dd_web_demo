
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


dd.ready(function() {
   

	dd.runtime.info({
		onSuccess : function(info) {
//			logger.e('runtime info: ' + JSON.stringify(info));
		},
		onFail : function(err) {
			logger.e('fail: ' + JSON.stringify(err));
		}
	});
	dd.ui.pullToRefresh.enable({
	    onSuccess: function() {
	    },
	    onFail: function() {
	    }
	})

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
	
dd.error(function(err) {
	alert('dd error: ' + JSON.stringify(err));
});
