<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@include file="/public/front_head.jspf"%>
</head>
<body>
	<div class="wrapper">
		<nav class="navbar navbar-default navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="${shop }/index.jsp">LEISUPET SHOP</a>
				</div>
				<div id="navbar">
					<ul class="nav navbar-nav navbar-left">
						<!-- <form class="navbar-form">
							<div class="form-group">
					          <input type="text" class="form-control" placeholder="Search">
					        </div>
							<button type="submit" class="btn btn-default btn-sm">
	        					<span class="glyphicon glyphicon-search"></span>Search
	    					</button>
						</form> -->
						<div class="navbar-form">
					        <div class="form-group">
					        	<input type="text" class="form-control" placeholder="请输入商品名称">
					        </div>
					        <button id="ps" type="submit" class="btn btn-default">搜索</button>
					    </div>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li>
							<a href="${shop }/forder/showCart.action">
								<span class="glyphicon glyphicon-shopping-cart">购物车:</span>
								<span class="badge">${fn:length(sessionScope.forder.sorderList) }</span>
							
							</a>
							<!-- <a href="#" class="btn">
		          				<span class="glyphicon glyphicon-shopping-cart">购物车:<span id="count">2</span>件</span>
		        			</a> -->
	        			</li>
						<li>
							<a href="/myAccount" class="btn">
	          					<span class="glyphicon glyphicon-home">我的账户</span>
	          				</a>
	          				
	          			</li>			
				            <li class="dropdown">
					          <a data-toggle="dropdown">
								  <span class="glyphicon glyphicon-menu-hamburger"></span>
							  </a>
								<ul class="dropdown-menu">
									<li><a href="#">注册</a></li>
									<li><a href="${shop }/user/login.action">登录</a></li>
								</ul>
					        </li>
					</ul>
				</div>
			</div>
		</nav>

		

		<div class="section_container">
			<div class="pay-skip">
				<h1>感谢您在本商城购物</h1>
				<div class="payskip-inner">
					<div>
						<span>订单号:</span><strong>${requestScope.p2_Order }</strong><span>&#91;请您记住这个号码，以便在付款和查询时使用&#93;</span>
					</div>
					<div>
						<span>支付金额：</span><strong>￥${requestScope.p3_Amt }</strong>
					</div>
					<div>
						<span>支付方式：</span><img class="zffs" src="${shop }/image/yibao.jpg" alt="" />
					</div>
					<div>
						<span>支付银行：</span><img class="zfyh" src="${shop }/image/bank/${requestScope.pd_FrpId }.gif"
							alt="" />
					</div>
					<!-- <div class="pay-sub">
						<a href="https://www.yeepay.com/app-merchant-proxy/node">登陆网上银行，立即支付</a>
					</div> -->
				</div>
			</div>
			
			<div class="container">
				<%-- <form name="yeepay" action='${shop }/bank/back.action' method='POST' target="_blank">
					<input type='hidden' name='p0_Cmd'   value='${requestScope.p0_Cmd}'>
					<input type='hidden' name='p1_MerId' value='${requestScope.p1_MerId}'>
					<input type='hidden' name='p2_Order' value='${requestScope.p2_Order}'>
					<input type='hidden' name='p3_Amt'   value='${requestScope.p3_Amt}'>
					<input type='hidden' name='p4_Cur'   value='${requestScope.p4_Cur}'>
					<input type='hidden' name='p5_Pid'   value='${requestScope.p5_Pid}'>
					<input type='hidden' name='p6_Pcat'  value='${requestScope.p6_Pcat}'>
					<input type='hidden' name='p7_Pdesc' value='${requestScope.p7_Pdesc}'>
					<input type='hidden' name='p8_Url'   value='${requestScope.p8_Url}'>
					<input type='hidden' name='p9_SAF'   value='${requestScope.p9_SAF}'>
					<input type='hidden' name='pa_MP'    value='${requestScope.pa_MP}'>
					<input type='hidden' name='pd_FrpId' value='${requestScope.pd_FrpId}'>
					<input type="hidden" name="pr_NeedResponse"  value="${requestScope.pr_NeedResponse}">
					<input type='hidden' name='hmac' value='${requestScope.hmac}'>
					<input type='submit' class="btn btn-default" value="登陆网上银行，立即支付"/>
				</form> --%>
				
				<form name="yeepay" action='${shop }/bank/back.action'
					method='get'>			
					<input type='hidden' name='p1_MerId'   value='${requestScope.p1_MerId}'>
					<input type='hidden' name='r0_Cmd' value='${requestScope.p0_Cmd}'>
					<input type='hidden' name='r1_Code' value='1'>
					<input type='hidden' name='r2_TrxId'   value='719425185640671I'>
					<input type='hidden' name='r3_Amt'   value='${requestScope.p3_Amt}'>
					<input type='hidden' name='r4_Cur'   value='RMB'>
					<input type='hidden' name='r5_Pid'  value=''>
					<input type='hidden' name='r6_Order' value='${requestScope.p2_Order}'>
					<input type='hidden' name='r7_Uid'   value=''>
					<input type='hidden' name='r8_MP'   value='${requestScope.pa_MP}'>
					<input type='hidden' name='r9_BType'    value='1'>
					<input type='hidden' name='ru_Trxtime'    value='20140811104158'>
					<input type='hidden' name='ro_BankOrderId'    value='2515803476140811'>
					<input type='hidden' name='rb_BankId'    value='CCB-NET'>
					<input type='hidden' name='rp_PayDate'    value='20140811104141'>
					<input type='hidden' name='rq_CardNo'    value=''>
					<input type='hidden' name='rq_SourceFee'    value='0.0'>
					<input type='hidden' name='rq_TargetFee'    value='0.0'>
					<input type='hidden' name='hmac' value='b90084415b42c32e9887a1def5386535'>
					<input type='submit' class="btn btn-default" value="登陆网上银行，立即支付"/>
				</form>
			</div>




			<div class="footer_container">

				<div class="footer">
					<ul class="footer_links">
						<li><span>收藏本店</span>
							<ul>
								<li><a href="#">服装</a></li>
								<li><a href="#">鞋子</a></li>
								<li><a href="#">包包</a></li>
								<li><a href="#">装饰品</a></li>
								<li><a href="#">channel</a></li>
								<li><a href="#">prada</a></li>
								<li><a href="#">LV</a></li>
							</ul></li>
						<li class="seperator"><span>出售的品牌</span>
							<ul>
								<li><a href="#">Elle</a></li>
								<li><a href="#">Reallxe</a></li>
								<li><a href="#">Fabric</a></li>
								<li><a href="#">Mayflower</a></li>
								<li><a href="#">Levis Strauss</a></li>
								<li><a href="#">Anzonica</a></li>
								<li><a href="#">Reallxe</a></li>
								<li><a href="#">Fabric</a></li>
							</ul></li>
						<li><span>客户服务</span>
							<ul>
								<li><a href="#">帮助</a></li>
								<li><a href="#">速递</a></li>
								<li><a href="#">退换货</a></li>
								<li><a href="#">付款方式</a></li>
								<li><a href="#">订单跟踪</a></li>
								<li><a href="#">礼物包选项</a></li>
								<li><a href="#">国际服务</a></li>
								<li><a href="#">退运险</a></li>
							</ul></li>
						<li><span>个人账户</span>
							<ul>
								<li><a href="#">个人账户信息</a></li>
								<li><a href="#">用户密码</a></li>
								<li><a href="#">订单历史</a></li>
								<li><a href="#">付款方式</a></li>
								<li><a href="#">我的收货地址</a></li>
								<li><a href="#">我的通知</a></li>
							</ul></li>
					</ul>

				</div>
			</div>
</body>
</html>
