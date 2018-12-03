//window.onload=function(){
// 			getDepart();
// 		}

		$(document).ready(function(){
// 			$("div[class=borrowde1_] input").each(function() {   
// 		        var va=$(this).attr("value");
// 		        getDepart(va);

// 		 	});
//			getDepart1();
//			getDepart2();
//			getcorpUserDetail();
			
		})
		function getDepart1(){
			$.ajax({
				url:'${basePath}Department/getDepartmentdetail?DeptId='+$("#borrowde1_1").attr("value"),
				type:'GET',
				dataType:"text",		
				success:function(data){
					var depart = JSON.parse(data)		
					$("#borrowde1").val(depart.name)					
				},
				error:function(){
					alert("不合法的部门id")
				}
			})	
		}	
		function getDepart2(){
			$.ajax({
				url:'${basePath}Department/getDepartmentdetail?DeptId='+$("#borrowde1_2").attr("value"),
				type:'GET',
				dataType:"text",		
				success:function(data){
					var depart = JSON.parse(data)		
					$("#borrowde2").val(depart.name)					
				},
				error:function(){
					alert("不合法的部门id")
				}
			})
			
			
		}
		function getcorpUserDetail(){
// 			alert($("#borrowde1_2").attr("value"))
			
			$.ajax({
				url:'CorpUserdetailList/getCorpUserdetail?departmentId='+$("#departMent  option:selected").text()+'&offset=0&size=10&order=entry_asc',
				type:'GET',
				dataType:'text',
				success:function(data){
					var corpuser=JSON.parse(data)
// 					alert(corpuser)
					var userlist = corpuser.userlist
//					$("#Member").val(userlist[0].name)
					for (var int = 0; int < userlist.length; int++) {
						var name = userlist[int].name
						var isAdmin = userlist[int].isAdmin
						var jobnumber = userlist[int].jobnumber
						var userid = userlist[int].userid
// 						if (isAdmin=="true") {
// 							alert(name)
							
							$("#Member").append("<option value='"+userid+"'>"+name+"</option>");
// 						
// 						}
					}
					
				},
				error:function(){
					alert("审批人列表获取失败")
				}

			})
			
		}