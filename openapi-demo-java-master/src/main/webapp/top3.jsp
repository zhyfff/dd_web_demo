<%-- <%@page import="Hisign.controller.util.SessionHelper"%> --%>
<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setAttribute("basePath", basePath);
request.setAttribute("path", path);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- jquery引入 -->
<script type="text/javascript" src="${basePath}dingdingweb/public/js/jquery/jquery.js"></script>
<script type="text/javascript" src="${basePath}dingdingweb/public/js/jquery/jquery.cookie.js"></script> 
<script type="text/javascript">var basePath='${basePath}';</script>
<link rel="stylesheet" type="text/css" href="${basePath}dingdingweb/HUI/css/hui.css" />
<link rel="stylesheet" type="text/css" href="${basePath}dingdingweb/HUI/css/font_kn57agctpf/iconfont.css">
<script src="${basePath}dingdingweb/HUI/js/hui.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="${basePath}dingdingweb/HUI/js/hui-form.js"></script>
<script type="text/javascript" src="${basePath}dingdingweb/HUI/js/hui-accordion.js"></script>
<script type="text/javascript" src="${basePath}dingdingweb/public/js/crypto-js/crypto-js.js"></script>
<script type="text/javascript" src="${basePath}dingdingweb/HUI/useful/js/Useful.js"></script>
<script type="text/javascript">
var os = function() {
    var ua = navigator.userAgent,
    isWindowsPhone = /(?:Windows Phone)/.test(ua),
    isSymbian = /(?:SymbianOS)/.test(ua) || isWindowsPhone, 
    isAndroid = /(?:Android)/.test(ua), 
    isFireFox = /(?:Firefox)/.test(ua), 
    isChrome = /(?:Chrome|CriOS)/.test(ua),
    isTablet = /(?:iPad|PlayBook)/.test(ua) || (isAndroid && !/(?:Mobile)/.test(ua)) || (isFireFox && /(?:Tablet)/.test(ua)),
    isPhone = /(?:iPhone)/.test(ua) && !isTablet,
    isPc = !isPhone && !isAndroid && !isSymbian;
    return {
         isTablet: isTablet,
         isPhone: isPhone,
         isAndroid : isAndroid,
         isPc : isPc
    };
}();	


</script>


</head>

<body>
	


</body>
</html>
