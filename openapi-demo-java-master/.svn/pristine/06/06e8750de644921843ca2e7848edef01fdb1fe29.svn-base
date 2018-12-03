<!DOCTYPE html>
<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
	<meta content="telephone=no,email=no" name="format-detection">
	<meta name="wap-font-scale" content="no">
	<!-- ui框架引入css -->
	<link href="../dingdingweb/public/css/weui.min.css" rel="stylesheet" type="text/css" />
	<link href="../dingdingweb/public/css/jquery-weui.min.css" rel="stylesheet" type="text/css" />
	<!-- 公用样式css -->
	<link href="../dingdingweb/public/css/base.css" rel="stylesheet" type="text/css" />
	<!-- 界面引入css -->
	<link href="../dingdingweb/public/css/app/user/index.css" rel="stylesheet" type="text/css" />
	<title>海鑫服务中心</title>
	<script type="text/javascript">

	//在此拿到jsAPI权限验证配置所需要的信息
	var _config = <%= com.alibaba.dingtalk.openapi.demo.auth.AuthHelper.getConfig(request) %>;

	</script>
<!-- 	<script type="text/javascript" src="../javascripts/zepto.min.js"></script> -->
	<script type="text/javascript" src="http://g.alicdn.com/dingding/open-develop/1.6.9/dingtalk.js">
	</script>
<!-- 	<script type="text/javascript" src="../javascripts/logger.js"> -->
	</script>
	<script type="text/javascript" src="../javascripts/demo.js">
//免登相关代码
	</script>
	
</head>
<body>
<div class="main bot44">
   <div class="user-site">
      <div class="user-field">
         <b><img id ="userImg" alt="头像" src="../pic/default.png"></b>
         <i>
           <p>欢迎您：<span id="userName" class="green">登录</span></p>
           <p>UserId ：<span id="userId" class="green">未知</span></p>
<!--            <p>会员号：<span class="green">189928488(创客)</span></p> -->
         </i>
      </div>
      <div class="user-hand">
        <li>
           <div class="box box6">
              <p>当前积分</p>
              <p>1600</p>
           </div>
        </li>
        <li>
           <div class="box box6">
              <p>当前金币</p>
              <p>13</p>
           </div>
        </li>
        <li>
           <div class="box box6">
              <p>当前余额</p>
              <p>90</p>
           </div>
        </li>
      </div>
   </div>
   <div class="user-menu">
           <div class="weui-grids">
              <a href="integral-log.html" class="weui-grid js_grid">
                <div class="weui-grid__icon">
                  <img src="../dingdingweb/public/images/icon/u-1.png" alt="">
                </div>
                <p class="weui-grid__label">
                  积分日志
                </p>
              </a>
              <a href="gold-log.html" class="weui-grid js_grid">
                <div class="weui-grid__icon">
                  <img src="../dingdingweb/public/images/icon/u-2.png" alt="">
                </div>
                <p class="weui-grid__label">
                  金币日志
                </p>
              </a>
              <a href="money-log.html" class="weui-grid js_grid">
                <div class="weui-grid__icon">
                  <img src="../dingdingweb/public/images/icon/u-3.png" alt="">
                </div>
                <p class="weui-grid__label">
                  余额日志
                </p>
              </a>
              <a href="../detail/order-pay.html" class="weui-grid js_grid">
                <div class="weui-grid__icon">
                  <img src="../dingdingweb/public/images/icon/u-4.png" alt="">
                </div>
                <p class="weui-grid__label">
                  我的订单
                </p>
              </a>
              <a href="detail.html" class="weui-grid js_grid">
                <div class="weui-grid__icon">
                  <img src="../dingdingweb/public/images/icon/u-5.png" alt="">
                </div>
                <p class="weui-grid__label">
                  我的账户
                </p>
              </a>
              <a href="sale-log.html" class="weui-grid js_grid">
                <div class="weui-grid__icon">
                  <img src="../dingdingweb/public/images/icon/u-6.png" alt="">
                </div>
                <p class="weui-grid__label">
                  我的分销
                </p>
              </a>
              <a href="gold.html" class="weui-grid js_grid">
                <div class="weui-grid__icon">
                  <img src="../dingdingweb/public/images/icon/u-7.png" alt="">
                </div>
                <p class="weui-grid__label">
                  金币兑换
                </p>
              </a>
              <a href="address.html" class="weui-grid js_grid">
                <div class="weui-grid__icon">
                  <img src="../dingdingweb/public/images/icon/u-8.png" alt="">
                </div>
                <p class="weui-grid__label">
                  我的地址
                </p>
              </a>
              <a href="money.html" class="weui-grid js_grid">
                <div class="weui-grid__icon">
                  <img src="../dingdingweb/public/images/icon/u-9.png" alt="">
                </div>
                <p class="weui-grid__label">
                  申请提现
                </p>
              </a>
            </div>
      </div>
</div>

<!-- footer -->
<footer class="footer">
     <div class="weui-tabbar">
      <a href="index.html" class="weui-tabbar__item weui-bar__item--on">
          <div class="weui-tabbar__icon">
            <img src="../dingdingweb/public/images/icon/user-sel.png" alt="">
          </div>
          <p class="weui-tabbar__label">个人首页</p>
        </a>
          <a href="../order/index.html" class="weui-tabbar__item">
          <div class="weui-tabbar__icon">
            <img src="../dingdingweb/public/images/icon/order.png" alt="">
          </div>
          <p class="weui-tabbar__label">我的申请</p>
        </a>
        <a href="../index.html" class="weui-tabbar__item">
          <div class="weui-tabbar__icon">
            <img src="../dingdingweb/public/images/icon/home.png" alt="">
          </div>
          <p class="weui-tabbar__label">产品订购</p>
        </a>
        <a href="../index.html" class="weui-tabbar__item">
          <div class="weui-tabbar__icon">
            <img src="../dingdingweb/public/images/icon/code.png" alt="">
          </div>
          <p class="weui-tabbar__label">我的二维码</p>
        </a>
      </div>
</footer>

<!-- jquery引入 -->
<script type="text/javascript" src="../dingdingweb/public/js/jquery/jquery.js"></script>
<script type="text/javascript" src="../dingdingweb/public/js/jquery/flexible.js"></script>
<!-- weui引入 -->
<script type="text/javascript" src="../dingdingweb/public/js/jquery/weui.js"></script>
<!-- 界面对应js -->
<script type="text/javascript" src="../dingdingweb/public/js/data/user/index.js"></script>
 <script type="text/javascript">
    window.addEventListener('load', function() {
        setTimeout(function(){
        }, 500);
    });

    function openLink(url){
        dd.biz.util.openLink({
            url:url,
            onSuccess : function(result) {
            },
            onFail : function(err) {
                alert(JSON.stringify(err));
            }
        });
    }

	var items = document.querySelectorAll('li');
	items[0].addEventListener('click',function(){
		window.location='./h5/index.html';
	});
	items[1].addEventListener('click',function(){
		window.location='./weui/index.html';
	});
	items[2].addEventListener('click', function(){
 		window.location = './list/list.html'; 
	});
	
	items[3].addEventListener('click',function(){
 	 	window.location='./drawer/index.html'; 
	});
	items[4].addEventListener('click',function(){
 		 window.location='./tab/index.html'; 
	});
	items[5].addEventListener('click',function(){
 		 window.location='./contacts.jsp?corpid='+_config.corpId; 
	});	
	
</script>
 
</body>
</html>
