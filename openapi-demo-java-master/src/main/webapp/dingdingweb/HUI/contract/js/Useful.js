
 	//跳转到合同借用
 	function tocontract(){
		var info = $("#info").attr("value")
// 		alert(info)
		if (info=="") {
			alert("请稍等")
		}else{
			window.location ='/Contract/tocontract.do?info='+encodeURIComponent(info)
		}

	}
 	
 	
//  	跳转到管理员审批
 	function senduserjsontoaudit(){
		var info = $("#info").attr("value")
// 		alert(info)
		if (info=="") {
			alert("请稍等")
		}else{
			window.location ='/Contract/tomyaudit?info='+encodeURIComponent(info)
		}
	}
	
// 	跳转到我的申请'评价'
 	function senduserjsontomyapply(){
 		var info = $("#info").attr("value")
// 			alert(info)
 		if (info=="") {
 			alert("请稍等")
 		}else{
 			window.location ='/Contract/tomyapply?info='+encodeURIComponent(info)
 		}
 	}
 	
 	//跳转到我未归还的合同
 	function senduserjsontoback(){
 		var info = $("#info").attr("value")
// 		alert(info)
 	if (info=="") {
 		alert("请稍等")
 	}else{
 		window.location ='/Contract/tomyback?info='+encodeURIComponent(info)
 	}
 	}
 	
 	//跳转到管理员确认归还
 	function senduserjsontofinal(){
 		var info = $("#info").attr("value")
// 		alert(info)
 	if (info=="") {
 		alert("请稍等")
 	}else{
 		window.location ='/Contract/tosureback?info='+encodeURIComponent(info)
 	}
 	}
 	
 	function senduserjsontoaccount(){
 		var info = $("#info").attr("value")
// 		alert(info)
 	if (info=="") {
 		alert("请稍等")
 	}else{
 		window.location ='/Account?info='+encodeURIComponent(info)
 	}
 		
 	}
 	
 	//跳转到我的快递
 	function senduserjsontomycourier(){
 		
 		var info = $("#info").attr("value")
// 		alert(info)
 	if (info=="") {
 		alert("请稍等")
 	}else{
 		window.location ='/MyCourier?info='+encodeURIComponent(info)
 	}
 	}
 	
 	//跳转到车辆申请消息
 	function applyCar(){

 		var info = $("#info").attr("value")
// 		alert(info)
	 	if (info=="") {
	 		alert("请稍等")
	 	}else{
	 		window.location ='/Office/ApplyCar/apply?info='+encodeURIComponent(info)
	 	}
 		
 	}
 	
 	//跳转到车辆借用审核
 	function auditApplyCar(){
 		var info =$("#info").attr("value");
 		if (info=="") {
			alert("请稍等")
		}else {
			window.location='/Office/ApplyCar/audit?info='+encodeURIComponent(info);
		}
 		
 	}
 	
 	//跳到我的车辆借用
 	function mycar(){
 		var info =$("#info").attr("value");
 		if (info=="") {
			alert("请稍等")
		}else {
			window.location='/Office/ApplyCar/mycar?info='+encodeURIComponent(info);
		}
 		
 	}
 	
 	//跳转到确认车辆归还
 	function sureBackCar(){
 		var info =$("#info").attr("value");
 		if (info=="") {
			alert("请稍等")
		}else {
			window.location='/Office/ApplyCar/surebackcar?info='+encodeURIComponent(info);
		}
 	}
 	