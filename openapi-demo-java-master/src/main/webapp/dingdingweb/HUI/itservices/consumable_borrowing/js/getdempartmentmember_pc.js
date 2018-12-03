
$.ajax({
	url : 'contactsinfo?corpid='+ _config.corpId,
	type : 'GET',
	success : function(data, status, xhr) {
		var json = data;
//		alert('data:'+json);
		
		var jj = eval("(" + json + ")");
//		var show ="";
		for(var i=0; i<jj.department.length; i++){
			$("#departMent").append("<option value='"+jj.department[i].name+"'>"+jj.department[i].name+"</option>");			
//			show +='<div style="text-indent:15px" class="deparment-'+i+'" name="deparment"><h3>'+jj.department[i].name+'</h3>' 
//			for(var j=0;j< jj.department[i].member.length;j++){	
//				show += '<div style="text-indent:25px" class="name-'+i+'" name="name">'+jj.department[i].member[j].name+'</div>';
//				show += '<div style="text-indent:25px" calss="uid-'+i+'" name="uid">'+jj.department[i].member[j].userid+'</div>';			
//			}
//			show+='</div>';
//			show+='<br >';
		}
//		alert("div:"+show);
		document.getElementById("adminlist").innerHTML = JSON.stringify(jj.department);

	},
	error : function(xhr, errorType, error) {
		logger.e("yinyien:" + _config.corpId);
		alert(errorType + ', ' + error);
	}
});