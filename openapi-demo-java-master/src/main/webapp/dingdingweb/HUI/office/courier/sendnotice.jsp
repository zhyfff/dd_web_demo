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
<script type="text/javascript">
	//在此拿到jsAPI权限验证配置所需要的信息
	var _config = <%= com.alibaba.dingtalk.openapi.demo.auth.AuthHelper.getConfig(request) %>;
	
</script>
<script type="text/javascript" src="http://g.alicdn.com/dingding/open-develop/1.6.9/dingtalk.js"></script>
<script type="text/javascript" src="https://g.alicdn.com/dingding/dingtalk-pc-api/2.7.0/index.js"></script>
<%-- <script type="text/javascript" src="${basePath}dingdingweb/HUI/office/courier/js/courier.js"></script> --%>
<script type="text/javascript">
$(document).ready(function(){
	loadScript();
})

function loadScript(){
	if (os.isAndroid || os.isPhone) {
		var script=document.createElement("script");
		script.type="text/javascript";
		script.src="dingdingweb/HUI/office/courier/js/courier.js";
		document.getElementsByTagName('head')[0].appendChild(script); 
	// 	script.onload=function(){}//js加载完成执行方法
	}else {
		var script=document.createElement("script");
		script.type="text/javascript";
		script.src="dingdingweb/HUI/office/courier/js/courier_pc.js";
		document.getElementsByTagName('head')[0].appendChild(script); 
	// 	script.onload=function(){}
	}
}
</script>
<title>发送通知</title>
<style type="text/css">
	.courier-dail{width:100%;}
	.courier-dail li{width:20%; text-align:center; float:left; margin-top:25px;}
	.courier-dail-icons{text-align:center; height:60px;}
	.courier-dail-text{text-align:center; line-height:32px; height:32px;}

</style>
</head>
<body>
	<header class="header">
		<div class="hui-list" align="center">
				<div  class="hui-list-icons" style="width:110px; height:80px;">
					<img id="userImg" alt="头像" src="${basePath}dingdingweb/HUI/img/head.png" style="width:66px; margin:0px; border-radius:50%;">
				</div>
				<div align="center" style="height:auto; height:40px; padding-bottom:8px;" id="userName">
					欢迎您 : 
				</div>
					<input type="hidden" id ="userid">
					<input  type="hidden" id = "info" >
					<input type="hidden" id="username">
				
		</div>
	</header>
	
	<div class="hui-wrap" >
		<form style="padding: 28px 10px;" id="sendnotice" name="sendnotice" class="hui-form" onsubmit="return false;">
<!-- 			<div class="hui-form-items"> -->
<!-- 				<div class="hui-form-items-title" >收件人</div> -->
<!-- 				<input type ="text" id ="recipients" class="hui-input" name="recipients" required="required" onclick="to2()"> -->
<!-- 			</div> -->
			<input type="hidden" id="UserId" name="UserId">
			<input type="hidden" id="DeptId" name="DeptId">
			<input type="hidden" id="Approver" name="Approver">
			<input type="hidden" id ="fsname" name="fsname">
			<div class="hui-form-items">
					<div class="items-title" style="width:50%; line-height:40px; height:40px; flex-shrink:0;">收件人</div>
					<input type ="hidden" id ="recipients" class="hui-input" name="recipients" required="required" >	
					<img alt="头像" src="${basePath}dingdingweb/HUI/img/add.png" style="height:40px;width:40px; margin:0px; border-radius:50%;" onclick="to2()" id="recipients-img">
					
			</div>
			
			<div class="hui-form-items">
				<div class="hui-form-items-title">快递号</div>
				<input type ="number" id ="express-no" class="hui-input" name="express-no" placeholder="请输入快递号" required="required">
			</div>
			<div class="hui-form-items">
				<div class="hui-form-items-title">通知时间</div>
				<input type="date" id="notice-time" class="hui-input" name="notice-time" required="required">
			</div>
			<div class="hui-form-items">
				<div class="hui-form-items-title">是否到付</div>
				<div class="hui-form-radios">
					<input type="radio" id="yes" name="radio" value="yes" style="margin-left:40px; margin-top: 10px;"><label for="yes" >是</label>
					<input type="radio" id="no" name="radio" value="no" style="margin-right:40px; margin-top: 10px;"> <label for="no">否</label>
				</div>
			</div>
			<div class="hui-form-items">
				<div class="hui-form-items-title">通知语</div>
				<input type="hidden" id="nw">
				<select id="notice-word" name="notice-word" class="notice-word" >
					<option value="您好，您有快递在前台">您好，您有快递在前台</option>
					<option value="您好，你的邮件需到货付款，请来缴费领取">您好，你的邮件需到货付款，请来缴费领取</option>
				</select>
			</div>
<!-- 			<div class="hui-form-items"> -->
<!-- 				<div class="hui-form-items-title" onclick="toOrganization()">领取人</div> -->
<%-- 				<input type="text" name = "lq" id = "lq" class="hui-input" value="${name}"> --%>
				
<!-- 			</div> -->
			
			<div class="hui-form-items">
				<div class="hui-form-items-title">快递公司</div>
				<input type ="hidden" id ="express" class="hui-input" name="express"> 
				<select id="select_name" class="select_name" onchange="showToText();">
					<option value="0">请选择快递公司</option>
					<option value="annengkuaidi">安能快递</option>
					<option value="annengwuliu">安能物流</option>
<!-- 					<option value="auspost">澳大利亚邮政</option> -->
<!-- 					<option value="postar">阿根廷邮政</option> -->
<!-- 					<option value="postee">爱沙尼亚邮政</option> -->
<!-- 					<option value="postae">阿联酋邮政</option> -->
<!-- 					<option value="postat">奥地利邮政</option> -->
<!-- 					<option value="postal">阿尔巴尼亚邮政</option> -->
<!-- 					<option value="aramex">Aramex</option> -->
<!-- 					<option value="brazilposten">巴西邮政</option> -->
<!-- 					<option value="bpost">比利时邮政</option> -->
					<option value="bestqjt">百世快运</option>
<!-- 					<option value="blyz">波兰邮政</option> -->
<!-- 					<option value="postby">白俄罗斯邮政</option> -->
<!-- 					<option value="postbg">保加利亚邮政</option> -->
<!-- 					<option value="postpk">巴基斯坦邮政</option> -->
					<option value="ees">百福东方</option>
					<option value="youzhengguonei">包裹信件</option>
					<option value="chengbang">晟邦物流</option>
					<option value="bjcs">城市100</option>
<!-- 					<option value="citylink">City-Link</option> -->
<!-- 					<option value="coe">COE</option> -->
					<option value="cxcod">传喜物流</option>
					<option value="debang">德邦物流</option>
					<option value="dtw">大田物流</option>
					<option value="disifang">递四方</option>
<!-- 					<option value="dhlde">DHL德国</option> -->
<!-- 					<option value="dhlen">DHL全球</option> -->
					<option value="dhl">DHL中国</option>
					<option value="ems">EMS</option>
<!-- 					<option value="emsguoji">EMS国际</option> -->
					<option value="eyb">EMS经济快递</option>
					<option value="fedexcn">FedEx中国</option>
<!-- 					<option value="fedex">FedEx国际</option> -->
<!-- 					<option value="fedexus">FedEx美国</option> -->
					<option value="feibaokuaidi">飞豹快递</option>
					<option value="fanyukuaidi">凡宇快递</option>
					<option value="gzlt">飞远配送</option>
<!-- 					<option value="hzabc">飞远(爱彼西)</option> -->
<!-- 					<option value="fgyz">法国邮政</option> -->
<!-- 					<option value="postfi">芬兰邮政</option> -->
<!-- 					<option value="guotongkuaidi">国通快递</option> -->
<!-- 					<option value="postco">postco</option> -->
					<option value="huitongkuaidi">百世快递</option>
					<option value="hengluwuliu">恒路物流</option>
					<option value="huangmajia">黄马甲配送</option>
					<option value="yct">黑猫宅急便</option>
					<option value="huaqikuaiyun">华企快运</option>
<!-- 					<option value="koreapost">韩国邮政</option> -->
					<option value="jiajiwuliu">佳吉快运</option>
					<option value="jd">京东快递</option>
					<option value="jiayiwuliu">佳怡物流</option>
					<option value="jinguangsudikuaijian">京广速递</option>
<!-- 					<option value="japanposten">日本邮政</option> -->
					<option value="jindouyun">筋斗云物流</option>
<!-- 					<option value="jkyz">捷克邮政</option> -->
					<option value="jialidatong">嘉里大通</option>
					<option value="jiayunmeiwuliu">加运美</option>
					<option value="kuaijiesudi">快捷快递</option>
					<option value="kuayue">跨越速运</option>
<!-- 					<option value="posthr">克罗地亚邮政</option> -->
					<option value="lianhaowuliu">联昊通</option>
					<option value="lb">龙邦速递</option>
<!-- 					<option value="postlb">黎巴嫩邮政</option> -->
					<option value="minghangkuaidi">民航快递</option>
<!-- 					<option value="serpost">秘鲁邮政</option> -->
<!-- 					<option value="postmu">毛里求斯邮政</option> -->
<!-- 					<option value="postmt">马耳他邮政</option> -->
<!-- 					<option value="postmd">摩尔多瓦邮政</option> -->
<!-- 					<option value="postmk">马其顿邮政</option> -->
					<option value="minbangsudi">民邦快递</option>
					<option value="szml56">明亮物流</option>
<!-- 					<option value="postno">挪威邮政</option> -->
<!-- 					<option value="postza">南非邮政</option> -->
<!-- 					<option value="ontrac">OnTrac</option> -->
<!-- 					<option value="postpt">葡萄牙邮政</option> -->
					<option value="quanfengkuaidi">全峰快递</option>
					<option value="quanyikuaidi">全一快递</option>
					<option value="rufengda">如风达</option>
					<option value="shentong">申通快递</option>
					<option value="shunfeng">顺丰速运</option>
					<option value="suer">速尔快递</option>
					<option value="shengfengwuliu">盛丰物流</option>
					<option value="shenganwuliu">圣安物流</option>
					<option value="shenghuiwuliu">盛辉物流</option>
<!-- 					<option value="swisspost">瑞士邮政</option> -->
					<option value="snwl">苏宁快递</option>
<!-- 					<option value="postsk">斯洛伐克邮政</option> -->
<!-- 					<option value="postsa">沙特邮政</option> -->
<!-- 					<option value="postsi">斯洛文尼亚邮政</option> -->
<!-- 					<option value="postsrb">塞尔维亚邮政</option> -->
					<option value="tiantian">天天快递</option>
					<option value="tiandihuayu">天地华宇</option>
<!-- 					<option value="posttr">土耳其邮政</option> -->
<!-- 					<option value="postth">泰国邮政</option> -->
<!-- 					<option value="tnt">TNT</option> -->
<!-- 					<option value="ups">UPS</option> -->
<!-- 					<option value="usps">USPS</option> -->
					<option value="wanxiangwuliu">万象物流</option>
<!-- 					<option value="postua">乌克兰邮政</option> -->
					<option value="wanjiawuliu">万家物流</option>
					<option value="xinfengwuliu">信丰物流</option>
					<option value="xinbangwuliu">新邦物流</option>
<!-- 					<option value="postes">西班牙邮政</option> -->
<!-- 					<option value="posthu">匈牙利邮政</option> -->
					<option value="yuantong">圆通速递</option>
					<option value="yunda">韵达快递</option>
					<option value="youshuwuliu">优速物流</option>
					<option value="yinjiesudi">银捷速递</option>
					<option value="yuanchengwuliu">远成物流</option>
					<option value="ytkd">运通中港快递</option>
					<option value="postb">邮政国内小包</option>
<!-- 					<option value="royalmail">英国皇家邮政</option> -->
<!-- 					<option value="postit">意大利邮政</option> -->
<!-- 					<option value="postin">印度邮政</option> -->
<!-- 					<option value="postam">亚美尼亚邮政</option> -->
					<option value="yfexpress">越丰物流</option>
					<option value="yafengsudi">亚风速递</option>
<!-- 					<option value="youzhengguoji">邮政国际包裹</option> -->
					<option value="zhongtong">中通快递</option>
					<option value="zhaijisong">宅急送</option>
					<option value="ztky">中铁物流</option>
					<option value="zengyisudi">增益速递</option>
					<option value="zhongtiewuliu">中铁快运</option>
					<option value="zimakaimeng">芝麻开门</option>
					<option value="post">中国邮政</option>
<!-- 					<option value="postcl">智利邮政</option> -->
					<option value="zhongsukuaidi">中速快递</option>
				</select>
			</div>
			<div class="hui-form-items">
				<div style="padding:10px;">
				<div class="courier-dail">
					<ul>
						<li>
							<div class="courier-dail-icons" onclick="choose(this)">
					            <img src="${basePath}dingdingweb/HUI/img/courier/shentong.png" alt="申通快递">
					        </div>
				        	<div class="courier-dail-text">申通快递</div>
						</li>	
						<li>
							<div class="courier-dail-icons" onclick="choose(this)">
					            <img src="${basePath}dingdingweb/HUI/img/courier/shunfeng.png" alt="顺丰速运">
					        </div>
				        	<div class="courier-dail-text">顺丰速运</div>
						</li>
						<li>
							<div class="courier-dail-icons" onclick="choose(this)">
					            <img src="${basePath}dingdingweb/HUI/img/courier/yuantong.png" alt="圆通速递">
					        </div>
				        	<div class="courier-dail-text">圆通速递</div>
						</li>
						<li>
							<div class="courier-dail-icons" onclick="choose(this)">
					            <img src="${basePath}dingdingweb/HUI/img/courier/yunda.png" alt="韵达快递">
					        </div>
				        	<div class="courier-dail-text">韵达快递</div>
						</li>
						<li>
							<div class="courier-dail-icons" onclick="choose(this)">
					            <img src="${basePath}dingdingweb/HUI/img/courier/zhongtong.png" alt="中通快递">
					        </div>
				        	<div class="courier-dail-text">中通快递</div>
						</li>
						<li>
							<div class="courier-dail-icons" onclick="choose(this)">
					            <img src="${basePath}dingdingweb/HUI/img/courier/zhaijisong.png" alt="宅急送">
					        </div>
				        	<div class="courier-dail-text">宅急送</div>
						</li>
						<li>
							<div class="courier-dail-icons" onclick="choose(this)">
					            <img src="${basePath}dingdingweb/HUI/img/courier/ems.png" alt="EMS">
					        </div>
				        	<div class="courier-dail-text">EMS</div>
						</li>
						<li>
							<div class="courier-dail-icons" onclick="choose(this)">
					            <img src="${basePath}dingdingweb/HUI/img/courier/tiantian.png" alt="天天快递">
					        </div>
				        	<div class="courier-dail-text">天天快递</div>
						</li>
						<li>
							<div class="courier-dail-icons" onclick="choose(this)">
					            <img src="${basePath}dingdingweb/HUI/img/courier/baishi.png" alt="百世快递">
					        </div>
				        	<div class="courier-dail-text">百世快递</div>
						</li>
						<li>
							<div class="courier-dail-icons" onclick="choose(this)">
					            <img src="${basePath}dingdingweb/HUI/img/courier/yousu.png" alt="优速物流">
					        </div>
				        	<div class="courier-dail-text">优速物流</div>
						</li>
					</ul>
				</div>
	    	</div>
			</div>
						
			<div style="padding:15px 30px 50px 10px; ">
						<div class="hui-form-items-title"></div>
						<input type = "submit" id = "submit" value ="发送通知" class="hui-button hui-primary hui-fr" onclick="sendDing()">
			</div>
		</form>
	</div>

	
	<script type="text/javascript">
		function choose(target){
			var c = $(target).children("img").attr("alt");
// 			alert(c);
			$("#select_name").find("option:contains('"+c+"')").attr("selected",true);

			 document.sendnotice.express.value = $("#select_name").find("option:selected").text();
			  
			document.getElementById("nw").value=$("#notice-word").find("option:selected").text();
		}
		
		function showToText(){
			document.getElementById("express").value=$("#select_name").find("option:selected").text();
			document.getElementById("nw").value=$("#notice-word").find("option:selected").text();
		}
		
		function sendDing(){
// 			var link='${basePath}MyCourier?info='+encodeURIComponent($("#info").attr("value"));
// 			alert(link);
			if (myCheck()==true) {
				ding();
			}
			return false;
		}
		
		function myCheck()
        {//循环所有的表单元素； 也可以用jQuery：$("#表单id")[0].elements.length-1
           for(var i=0;i<document.sendnotice.elements.length-1;i++) //下面减一是因为数组的下标为0
           {	
              if(document.sendnotice.elements[i].value=="")
              {
                 alert("当前表单不能有空项");
                 document.sendnotice.elements[i].focus();
                 return false;
              }
           }
           return true;
          
        }
		

		function registered() {
				
			if (myCheck()==true) {
				$.ajax({
					url : "${basePath}SaveNotice/toBase",
// 					url:'${basePath}Office/Courier/Processinstance/sendCourierNotice',
					data : $("#sendnotice").serialize(),
					dataType : "text",
					type : "POST",
					success : function(data) {
							hui.iconToast("发送成功", 'success');
							window.location.reload();//刷新当前页			
							if (data=='失败') {
								hui.iconToast(data, 'error');
							}
					},
					error : function(data) {
						hui.iconToast(data, 'error');
					}
				})
			
			}
				
			return false;
		}
		

		hui.ready(function(){
			getCourierPointMsg();
		});	
		
		
	</script>

</body>
</html>