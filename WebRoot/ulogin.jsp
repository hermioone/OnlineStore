<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<%@include file="/public/front_head.jspf"%>
	<style type="text/css">
		#dd div{
			padding: 5px;
		}
	</style>
<body>
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
			<!-- 购物车 -->
			<div id="dd" class="action_buttonbar" style="text-align:center;">
				<form method="post" action="${shop}/user/login.action">
					<div>
						<label for="login">账号:&nbsp;</label> 
						<input type="text" name="login" />
					</div>
					<div>
						<label for="pass">密码:&nbsp</label> 
						<input type="text" name="pass" />
					</div>
					<div>
						${sessionScope.error}  
					</div>
					<div>
						<input type="submit" class="btn btn-default" value="登陆" style="width:60px;height:30px" />
						<input type="button" class="btn btn-default" value="注册" onclick="window.open('${shop}/index.jsp','_self')" style="width:60px;height:30px" />
					</div>
			   </form>
			   <div style="clear:both"></div>
			</div>
		</div>
			<!-- 导航栏结束 -->
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
