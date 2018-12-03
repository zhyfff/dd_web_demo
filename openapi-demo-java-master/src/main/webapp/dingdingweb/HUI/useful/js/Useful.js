
 	//跳转到合同借用
 	function tocontract(){
 		var info = Encrypt($("#info").attr("value"));
// 		alert(info)
		if (info=="") {
			alert("请稍等")
		}else{
			window.location ='Contract/tocontract.do?info='+encodeURIComponent(info)
		}

	}
 	
 	
//  	跳转到管理员审批
 	function senduserjsontoaudit(){
 		var info = Encrypt($("#info").attr("value"));
// 		alert(info)
		if (info=="") {
			alert("请稍等")
		}else{
			window.location ='Contract/tomyaudit?info='+encodeURIComponent(info)
		}
	}
	
// 	跳转到我的申请'评价'
 	function senduserjsontomyapply(){
 		var info = Encrypt($("#info").attr("value"));
// 			alert(info)
 		if (info=="") {
 			alert("请稍等")
 		}else{
 			window.location ='Contract/tomyapply?info='+encodeURIComponent(info)
 		}
 	}
 	
 	//跳转到我未归还的合同
 	function senduserjsontoback(){
 		var info = Encrypt($("#info").attr("value"));
// 		alert(info)
 	if (info=="") {
 		alert("请稍等")
 	}else{
 		window.location ='Contract/tomyback?info='+encodeURIComponent(info)
 	}
 	}
 	
 	//跳转到管理员确认归还
 	function senduserjsontofinal(){
 		var info = Encrypt($("#info").attr("value"));
// 		alert(info)
 	if (info=="") {
 		alert("请稍等")
 	}else{
 		window.location ='Contract/tosureback?info='+encodeURIComponent(info)
 	}
 	}
 	
 	
 	//账号管理
 	function senduserjsontoaccount(){
 		var info = Encrypt($("#info").attr("value"));
// 		alert(info)
 	if (info=="") {
 		alert("请稍等")
 	}else{
 		window.location ='Account?info='+encodeURIComponent(info)
 	}
 		
 	}
 	
 	//跳转到我的快递
 	function senduserjsontomycourier(){
 		
 		var info = Encrypt($("#info").attr("value"));
// 		alert(info)
 	if (info=="") {
 		alert("请稍等")
 	}else{
 		window.location ='MyCourier?info='+encodeURIComponent(info)
 	}
 	}
 	
 	//跳转到车辆申请消息
 	function applyCar(){

 		var info = Encrypt($("#info").attr("value"));
// 		alert(info)
// 		alert("暂未上线");
	 	if (info=="") {
	 		alert("请稍等")
	 	}else{
	 		window.location ='Office/ApplyCar/apply?info='+encodeURIComponent(info)
	 	}
 		
 	}
 	
 	//跳转到车辆借用审核
 	function auditApplyCar(){
 		var info = Encrypt($("#info").attr("value"));
// 		alert("暂未上线");
 		if (info=="") {
			alert("请稍等")
		}else {
			window.location='Office/ApplyCar/audit?info='+encodeURIComponent(info);
		}
 		
 	}
 	
 	//跳到我的车辆借用
 	function mycar(){
 		var info = Encrypt($("#info").attr("value"));
// 		alert("暂未上线");
 		if (info=="") {
			alert("请稍等")
		}else {
			window.location='Office/ApplyCar/mycar?info='+encodeURIComponent(info);
		}
 		
 	}
 	
 	//跳转到确认车辆归还
 	function sureBackCar(){
 		var info = Encrypt($("#info").attr("value"));
 		if (info=="") {
			alert("请稍等")
		}else {
			window.location='Office/ApplyCar/surebackcar?info='+encodeURIComponent(info);
		}
 	}
 	
 	
 	//跳转到名片制作消息
 	function applyBusinessCard(){
 		var info = Encrypt($("#info").attr("value"));
 		if (info=="") {
			alert("请稍等")
		}else {
			window.location='Office/BusinessCard/apply?info='+encodeURIComponent(info);
		}
 	}
 	
 	//跳转审核名片制作
 	function auditBusinessCard(){
 		var info = Encrypt($("#info").attr("value"));
 		if (info=="") {
			alert("请稍等")
		}else {
			window.location='Office/BusinessCard/audit?info='+encodeURIComponent(info);
		}
 	}
 	
 	//跳转到我的名片
 	function mybussinessCard(){
 		var info = Encrypt($("#info").attr("value"));
 		if (info=="") {
			alert("请稍等")
		}else {
			window.location='Office/BusinessCard/mybcard?info='+encodeURIComponent(info);
		}
 	}
 	
 	//跳转到证章借用审核
 	function auditApplyStamp(){
 		var info = Encrypt($("#info").attr("value"));
 		if (info=="") {
			alert("请稍等")
		}else {
			window.location='Office/StampCertificate/audit?info='+encodeURIComponent(info);
		}
 	}
 	
 	

 	//跳转到我的证章
 	function myStamp(){
 		var info = Encrypt($("#info").attr("value"));
 		if (info=="") {
			alert("请稍等")
		}else {
			window.location='Office/StampCertificate/toMyStamp?info='+encodeURIComponent(info);
		}
 	}
 	
 	
 	//跳转到名片制作
 	function createcard(){
 		var info = Encrypt($("#info").attr("value"));
// 		alert(info)
		if (info=="") {
			alert("请稍等")
		}else{
			window.location ='Office/BusinessCard/createcard?info='+encodeURIComponent(info)
		}
	}
 	
 	//跳转到我的人力服务文件借用
 	function hrtoback(){
 		var info = Encrypt($("#info").attr("value"));
// 		alert(info)
		if (info=="") {
			alert("请稍等")
		}else{
			window.location ='HrServices/myContract?info='+encodeURIComponent(info)
		}
 	}
 	
 	//跳转到我的设备借用
 	function equipmentTobac(){
 		var info = Encrypt($("#info").attr("value"));
// 		alert(info)
		if (info=="") {
			alert("请稍等")
		}else{
			window.location ='ITServices/myeborrowing?info='+encodeURIComponent(info)
		}
 	}
 	
	function Encrypt(word){  
	    var key = CryptoJS.enc.Utf8.parse("AfghfADFFCBNKGad");   //加密密钥
	    var iv  = CryptoJS.enc.Utf8.parse('AfghfADFFCBNKGad');   //加密向量
	    var srcs = CryptoJS.enc.Utf8.parse(word);  
	    var encrypted = CryptoJS.AES.encrypt(srcs, key, { iv: iv,mode:CryptoJS.mode.CBC});  
	    return encrypted.toString();  
	} 	
	
	function Login(){
		var p = CryptoJS.HmacMD5($("#pwd").attr("value"),"fgdfgdaa");
		$("#pwd").val(p);
		$.ajax({
			url:'WebLogin/longin',
			dataType:'text',
			data:$("#save").serialize(),
			type:'GET',
			success:function(data){
				var data =JSON.parse(JSON.stringify(data));
				var Sta=JSON.parse(data).sta;
				if (Sta=='登陆成功！') {
					alert('登陆成功！');
					window.location="Home?info="+encodeURIComponent(Encrypt(data));
				}else if (data=='帐号或密码错误') {
					alert('帐号或密码错误');
				}
			},
			error:function(){
				
			}
		})
	}
 	