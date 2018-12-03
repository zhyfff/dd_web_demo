<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%@include file="/top3.jsp"%>
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
<script type="text/javascript" src="dingdingweb/HUI/itservices/consumable_borrowing/js/getconsuable.js"></script>
<script type="text/javascript" src="dingdingweb/HUI/itservices/shop/js/numberbox.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	getconsu();
})
</script>
<title>耗材列表</title>
</head>
<body>

<header class="hui-header">
	<h1>${c}</h1>
	<div id="hui-header-menu"></div>
</header>
<div class="hui-wrap">
    <div id="refreshContainer" class="hui-refresh">
        <div class="hui-refresh-icon"></div>
        <div class="hui-refresh-content hui-list">
       		<div id="list">
       		
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="dingdingweb/HUI/js/hui-refresh-load-more.js"></script>	

<script type="text/javascript">
// hui.loadMore(getmoreconsu);
// var meuns = ['申领耗材'];
// var cancel = '关闭菜单';
// hui('#hui-header-menu').click(function(){
//     hui.actionSheet(meuns, cancel, function(e){
//         console.log(e.index);
//         hui.toast(e.innerHTML);
//         tolocation(e.innerHTML);
//     });
// });

function tolocation(target){
	var url="ITServices/consumable_borrowing/apply";
        var form = $("<form method='post'></form>");
        form.attr({"action":url});
//        var input = $("<input type='hidden'>");
//        input.attr({"name":"dcnumber"});
//        input.val($(target).parent().parent().$("#dcnumber").attr("value"));
//        form.append(input);
       var input = $("<input type='hidden'>");
       input.attr({"name":"Recipients_number"});
       input.val($(target).parent().parent().children("#Recipients_number").attr("value"));
       form.append(input);
        var input = $("<input type='hidden'>");
        input.attr({"name":"ptype"});
        input.val($(target).parent().parent().children(".hui-form-items").children("#ptype").attr("value"));
        form.append(input);
        var input = $("<input type='hidden'>");
        input.attr({"name":"consumable_type"});
        input.val($(target).parent().parent().children(".hui-form-items").children("#consumable_type").attr("value"));
        form.append(input);
        var input = $("<input type='hidden'>");
        input.attr({"name":"consumable_name"});
        input.val($(target).parent().parent().children("#consumable_name").attr("value"));
        form.append(input);
        var input = $("<input type='hidden'>");
        input.attr({"name":"specifications"});
        input.val($(target).parent().parent().children(".hui-form-items").children("#specifications").attr("value"));
        form.append(input);
        var input = $("<input type='hidden'>");
        input.attr({"name":"consum_uprice"});
        input.val($(target).parent().parent().children(".hui-form-items").children("#uprice").attr("value"));
        form.append(input);
       var input = $("<input type='hidden'>");
       input.attr({"name":"num"});
       input.val($(target).parent().parent().children(".hui-form-items").children("#num").attr("value"));
       form.append(input);
        
        $("html").append(form);
        form.submit();
    
}
</script>
</body>
</html>