<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<%@ include file="/public/front_head.jspf" %>	
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
        <!-- 头部结束 -->
    <div class="wrapper">


        <div class="section_container">
            <!-- 购物车 -->
            <ul class="breadcrumb">
                <li>
                    <a href="#">加入购物车</a>
                </li>
                <li >
                    <a href="#">确认订单信息</a>
                </li>
                <li class="active">
                    <a href="#">完成订单</a>
                </li>
            </ul>
            <!-- 确认订单信息 -->
            <div class="pay-step">
                <!-- 订购人确认 -->
                <div class="person-check check">
                    <h1>您的订单已经生成</h1>
                    <div class="person-checkinner">
                        <div><span>订单号</span>：<span>${sessionScope.oldForder.id}</span></div>
                        <div><span>收货人</span>：<span>${sessionScope.oldForder.name}</span></div>
                        <div><span>送货地址</span>：<span>${sessionScope.oldForder.address}</span></div>
                        <div><span>邮政编码</span>：<span>${sessionScope.oldForder.post}</span></div>
                        <div><span>支付金额</span>：<span>${sessionScope.oldForder.total}</span></div>
                    </div>
                </div>
                <div class="pay">
                    <div class="pay-inner">
                        <div class="fl">支付方式:</div>
                        <div class="fl yibao-logo">
                             <a href=""><img src="${shop}/image/yibao.jpg" width="110" height="35" alt="" /></a>
                        </div>
                        <div class="fr blue aa">世界一流的电子支付应用和服务提供商
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="red"href="">如何使用?</a>
                        </div>

                    </div>
                </div>
                <div class="select-bank">
                	 <form action="${shop}/bank/pay.action" method="post">
                    <h1>请选择支付银行</h1>
                    <!--  {fn:indexOf(name,'.'))}  {fn:substring(zip, 6, -1)} -->
                    <div>
                        <ul>
                           <c:forEach items="${applicationScope.bankList }" var="bankImage">
	                            <li>
	                               	<input type="radio" name="pd_FrpId" value="${fn:substring(bankImage, 0, fn:indexOf(bankImage, '.')) }">
									<img src="${shop }/image/bank/${bankImage }"/>
	                            </li>
                           </c:forEach>
                        </ul>
                    </div>
	
                    <div class="clear"></div>
                    <div class="reminder"><span>请确保您的银行卡已开通网银支付功能，否则没有办法完成支付&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> <a href="">如何开通?</a></div>
                    <div class="pay-submit">
                    	<div class="pay-inner">
                    		<input type="submit" style="width: 80px; height: 40px;" value="确认支付" />
                    	</div>
            		</div>	
                    </form>
                </div>
                
            </div>
            
            

            <div class="footer_container">

                <div class="footer">
                    <ul class="footer_links">
                        <li>
                            <span>收藏本店</span>
                            <ul>
                                <li>
                                    <a href="#">服装</a>
                                </li>
                                <li>
                                    <a href="#">鞋子</a>
                                </li>
                                <li>
                                    <a href="#">包包</a>
                                </li>
                                <li>
                                    <a href="#">装饰品</a>
                                </li>
                                <li>
                                    <a href="#">channel</a>
                                </li>
                                <li>
                                    <a href="#">prada</a>
                                </li>
                                <li>
                                    <a href="#">LV</a>
                                </li>
                            </ul>
                        </li>
                        <li class="seperator">
                            <span>出售的品牌</span>
                            <ul>
                                <li>
                                    <a href="#">Elle</a>
                                </li>
                                <li>
                                    <a href="#">Reallxe</a>
                                </li>
                                <li>
                                    <a href="#">Fabric</a>
                                </li>
                                <li>
                                    <a href="#">Mayflower</a>
                                </li>
                                <li>
                                    <a href="#">Levis Strauss</a>
                                </li>
                                <li>
                                    <a href="#">Anzonica</a>
                                </li>
                                <li>
                                    <a href="#">Reallxe</a>
                                </li>
                                <li>
                                    <a href="#">Fabric</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <span>客户服务</span>
                            <ul>
                                <li>
                                    <a href="#">帮助</a>
                                </li>
                                <li>
                                    <a href="#">速递</a>
                                </li>
                                <li>
                                    <a href="#">退换货</a>
                                </li>
                                <li>
                                    <a href="#">付款方式</a>
                                </li>
                                <li>
                                    <a href="#">订单跟踪</a>
                                </li>
                                <li>
                                    <a href="#">礼物包选项</a>
                                </li>
                                <li>
                                    <a href="#">国际服务</a>
                                </li>
                                <li>
                                    <a href="#">退运险</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <span>个人账户</span>
                            <ul>
                                <li>
                                    <a href="#">个人账户信息</a>
                                </li>
                                <li>
                                    <a href="#">用户密码</a>
                                </li>
                                <li>
                                    <a href="#">订单历史</a>
                                </li>
                                <li>
                                    <a href="#">付款方式</a>
                                </li>
                                <li>
                                    <a href="#">我的收货地址</a>
                                </li>
                                <li>
                                    <a href="#">我的通知</a>
                                </li>
                            </ul>
                        </li>
                    </ul>

                </div>
            </div>
         </div>
     </div>
</body>
</html>