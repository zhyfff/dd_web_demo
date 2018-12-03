<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%@include file="/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv=Content-Type content="text/html;charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />
<meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="yes" name="apple-touch-fullscreen" />    
    <meta name="data-spm" content="a215s" />
    <meta content="telephone=no,email=no" name="format-detection" />    
    <meta content="fullscreen=yes,preventMove=no" name="ML-Config" />
    <link href="icon114-114.png" rel="apple-touch-icon-precomposed">
    <link href="icon.png" rel="Shortcut Icon" type="image/x-icon" />
<title>联系人</title>
<script type="text/javascript" src="http://g.alicdn.com/dingding/open-develop/1.6.9/dingtalk.js">
</script>
<script type="text/javascript">

$(document).ready(function(){
	getcorpUserDetail();

})



function getcorpUserDetail(){
//		alert($("#borrowde1_2").attr("value"))
	
	$.ajax({
		url:'CorpUserdetailList/getCorpUserdetail?departmentId='+$("#departmentid").attr("value")+'&offset=0&size=10&order=entry_asc',
		type:'GET',
		dataType:'text',
		success:function(data){
			var corpuser=JSON.parse(data)
//				alert(corpuser)
			var userlist = corpuser.userlist
			$("#link_spname").val(userlist[0].name)
			for (var int = 0; int < userlist.length; int++) {
				var name = userlist[int].name;
				var isAdmin = userlist[int].isAdmin;
				var jobnumber = userlist[int].jobnumber;
				var avatar = userlist[int].avatar;
//					if (isAdmin=="true") {
//						alert(name)
					var img = document.getElementById("userImg");
					img.src =avatar;
					$(".hui-list-text").text(name);
					$("uif").val(name);
//					}
			}
			
		},
		error:function(){
			alert("列表获取失败")
		}

	})
	
}
</script>
</head>
<body>
<input type="hidden"  id="departmentid" value="${departmentid}">
	<div class="hui-wrap">
		<div class="hui-list" style="margin-top:22px;">
    	<ul>
    		<li>
    			<a href="javascript:back()">
		    	<div class="hui-list-icons"><img id = "userImg" src="" style="width:22px; margin:0px; border-radius:50%;"/></div>
        		<div class="hui-list-text">
        			<div class="hui-list-info hui-icons hui-icons-right"></div>
        		</div>
		    	</a>
    		</li>
    		
    	</ul>
    </div>
	</div>


<script type="text/javascript">

	
	function close(){
		
		dd.biz.navigation.close({
		    onSuccess : function(result) {
		        /*result结构
		        {}
		        */
// 		        alert(result);
		    	
		        
		    },
		    onFail : function(err) {}
		});
		
		
		
		
	}
	
	// 存储数据
	function setItem (name,val){
		dd.ready(function(){
		  dd.util.domainStorage.setItem({
			     name:name , // 存储信息的key值
			     value:val, // 存储信息的Value值
			     onSuccess : function(info) {
			    	 
			          alert(JSON.stringify("userlist"+info));
// 			          alert(info);
			          
			     },
			     onFail : function(err) {
			          alert(JSON.stringify("err"+err));
			     }
			 });
	  });
	}

	

	
	 dd.ready(function() {
			document.addEventListener('backbutton', function() {
				close();	
			});
			
			document.addEventListener('pause', function(){
				 
	   		});

			
		})
	function  back(){
		  var bValue = $(".hui-list-text").text();
		   alert(bValue);
		document.getElementById("recipients").value=bValue;
	 	dd.biz.navigation.close();
// 		window.opener.recipients.value = bValue ;
		
// 	    window.parent.document.getElementById("recipients").value=bValue;
	   	
	   
  	} 
	
</script>


</body>
</html>