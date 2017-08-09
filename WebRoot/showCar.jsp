<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<%@include file="/public/front_head.jspf"%>
	<script type="text/javascript">
		$(function() {
			$("#aLink").click(function() {
				$("#btnForm").submit();
			});
			//1.注册事件
			$(".text").change(function() {
				//2.验证数据的有效性，必须是自然数
				var number = $(this).val();
				if(!isNaN(number) && parseInt(number) == number && number > 0) {  //isNaN:如果是数返回false，如果不是数返回true，后面的是判断是否是整数
					$(this).attr("lang", number);
					//发送ajax请求，返回的是总价格，传输当前的数量与商品的id
					var id = $(this).parents("tr:first").attr("lang");
						
					$.post("${shop }/sorder/updateSorder.action", {number:number, 'product.id':id}, function(data) {
						$("#total").text(data);
					}, "text");
					//保留两位小数
					var price = ($(this).parent().prev().text() * number).toFixed(2);
					//更新单个商品的小计
					$(this).parent().next().text(price);
					
				}else {
					this.value=$(this).attr("lang");
				}
			});
			$(".minus").click(function() {
				var number = $(this).next().val();
				if(number > 1) {
					number = number - 1;
					$(this).next().val(number);
					$(this).attr("lang", number);
					//发送ajax请求，返回的是总价格，传输当前的数量与商品的id
					var id = $(this).parents("tr:first").attr("lang");
						
					$.post("${shop }/sorder/updateSorder.action", {number:number, 'product.id':id}, function(data) {
						$("#total").text(data);
					}, "text");
					//保留两位小数
					var price = ($(this).parent().prev().text() * number).toFixed(2);
					//更新单个商品的小计
					$(this).parent().next().text(price);
				}
			});
			$(".plus").click(function() {
				var number = $(this).prev().val();
				number = parseInt(number) + 1;
				$(this).prev().val(number);
				$(this).attr("lang", number);
				//发送ajax请求，返回的是总价格，传输当前的数量与商品的id
				var id = $(this).parents("tr:first").attr("lang");
					
				$.post("${shop }/sorder/updateSorder.action", {number:number, 'product.id':id}, function(data) {
					$("#total").text(data);
				}, "text");
				//保留两位小数
				var price = ($(this).parent().prev().text() * number).toFixed(2);
				//更新单个商品的小计
				$(this).parent().next().text(price);
				
			});
		});
	</script>
</head>
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
		
		<div class="container">
			<!-- 购物车 -->
			<div id="shopping_cart">
				<div class="message success">我的购物车</div>
				
				<table class="data-table cart-table" cellpadding="0" cellspacing="0">
					<tr>
						<th class="align_center" width="10%">商品编号</th>
						<th class="align_left" width="35%" colspan="2">商品名称</th>
						<th class="align_center" width="10%">销售价格</th>
						<th class="align_center" width="20%">数量</th>
						<th class="align_center" width="15%">小计</th>
						<th class="align_center" width="10%">删除</th>
					</tr>
					<c:forEach items="${sessionScope.forder.sorderList }" var="sorder">
						<tr lang="${sorder.product.id }">
							<td class="align_center"><a href="#" class="edit">${sorder.product.id }</a>
							</td>
							<td width="80px"><img src="${shop}/image/${sorder.product.pic }" width="80"
								height="80" />
							</td>
							<td class="align_left"><a class="pr_name" href="#">${sorder.name }</a>
							</td>
							<td class="align_center vline">
								${sorder.price }
							</td>
							<td class="align_center vline">
								<%-- <div class="wrap-input">
									<input class="text" style="height: 20px;" value="${sorder.number }">
								</div> --%>
								<a class="minus">
							       <span class="glyphicon glyphicon-minus"></span>
							    </a>
							    <!-- 文本框 -->
								<input class="text" style="height: 20px; width: 60px" value="${sorder.number }" lang="${sorder.number }">
								<a class="plus">
							       <span class="glyphicon glyphicon-plus"></span>
							    </a>
							</td>
							<td class="align_center vline">
								${sorder.price * sorder.number }
							</td>
							<td class="align_center vline"><a href="#" class="remove"></a>
							</td>
						</tr>
					</c:forEach>
					
				</table>
			</div>
		</div>
		<div class="container">
			<div class="col-xs-2 col-md-offset-1">
				<div class="panel panel-warning">
				  <div class="panel-heading">小计</div>
				  <div class="panel-body">
				    ￥109.00
				  </div>
				</div>
			</div>
			<div class="col-xs-2 col-md-offset-2">
				<div class="panel panel-warning">
				  <div class="panel-heading">运费</div>
				  <div class="panel-body">
				    ￥0.00
				  </div>
				</div>
			</div>
			<div class="col-xs-2 col-md-offset-2">
				<div class="panel panel-warning">
				  <div class="panel-heading">总计</div>
				  <div id="total" class="panel-body">
				    	${sessionScope.forder.total }
				  </div>
				</div>
			</div>
		</div>
		<div class="container">
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<div id="navbar">
						<ul class="nav navbar-nav navbar-right">
							<li>
								
								<a href="${shop }/index.jsp">
									<button type="button" class="btn btn-default">继续购物</button>
								</a>
		        			</li>
							<li>
								<a href="#" class="btn">
		          					<button type="button" class="btn btn-default">清空购物车</button>
		          				</a>
		          			</li>			
					        <li>
						        <a id="aLink">
									<button type="button" class="btn btn-info">订单确认</button>
								</a>
						    </li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
		<form id="btnForm" method="post" action="${shop }/send/front/confirm.action"></form>
		<div class="container">
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
		</div>
</body>
</html>
