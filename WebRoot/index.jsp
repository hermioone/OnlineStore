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
	
        <!-- 导航栏 -->
        <div class="navigation_container">
        <!---->
         <div class="nav">
            <ul class="primary_nav">
                <li class="active highlight"><a href="#">女装</a>
                    <!--二级菜单-->
                    <ul class="sub_menu">
                        <li > <a href="#">裙装</a>
                            <ul>
                                <li><a href="#">短裙</a></li>
                                <li><a href="#">短裤 </a></li>
                                <li><a href="#">裤子</a></li>
                                <li><a href="#">卡其裤</a></li>
                                <li><a href="#">休闲裤</a></li>
                                <li><a href="#">牛仔裤</a></li>
                                <li><a href="#">风衣 & 运动夹克</a></li>
                            </ul>
                        </li>
                        <li> <a href="#">装饰品 </a>
                            <ul>
                                <li><a href="#"> 太阳镜</a></li>
                                <li><a href="#">围巾 </a></li>
                                <li><a href="#">发饰品 </a></li>
                                <li><a href="#">帽子和手套 </a></li>
                                <li><a href="#">生活时尚 </a></li>
                                <li><a href="#">牛仔系列 </a></li>
                                <li><a href="#">风衣 & 西服</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                    <!--二级菜单结束-->
                
                <li><a href="#">男装</a>
                    <!--二级菜单-->
                    <ul class="sub_menu">
                        <li> <a href="#">男士夏装</a>
                            <ul>
                                <li><a href="#">裤子</a></li>
                                <li><a href="#">休闲裤</a></li>
                                <li><a href="#">卡其裤</a></li>
                                <li><a href="#">牛仔裤</a></li>
                                <li><a href="#">风衣 & 运动夹克</a></li>
                            </ul>
                        </li>
                         <li> <a href="#">装饰品 </a>
                            <ul>
                                <li><a href="#"> 太阳镜</a></li>
                                <li><a href="#">围巾 </a></li>
                                <li><a href="#">发饰品 </a></li>
                                <li><a href="#">帽子和手套 </a></li>
                                <li><a href="#">生活时尚 </a></li>
                                <li><a href="#">牛仔系列 </a></li>
                                <li><a href="#">风衣 & 西服</a></li>
                            </ul>
                        </li>
                    </ul>
                    <!--二级菜单结束-->
                </li>
                <li><a href="#">儿童</a></li>
                <li><a href="#">时尚</a></li>
                <li><a href="#">装饰品 </a></li>
            </ul>
        </div>
        </div>
        <!--导航栏结束-->

        
        <div class="section_container">
            <!--左侧导航-->
            <div id="side_nav">
                <div class="sideNavCategories">
                    <h1>女装</h1>
                    <ul class="category departments">
                        <li class="header">分类</li>
                        <li><a href="#">毛衣</a></li>
                        <li><a href="#">针织衫 </a></li>
                        <li><a href="#">衬衫 </a></li>
                        <li><a href="#">T恤</a></li>
                        <li><a href="#">短裤</a></li>
                        <li><a href="#">牛仔 </a></li>
                        <li><a href="#">连身裙</a></li>
                        <li><a href="#">短裙 </a></li>
                    </ul>
                </div>
                
            </div>
            <!-- 右侧焦点图区域 -->
            <div id="main_content">
                <div>
                	<img src="image/lm_banner_1.jpg" />
                </div>
            </div>
        </div>
        
        
       

            
            <!-- 大循环开始 -->
	 		<c:forEach items="${applicationScope.bigList }" var="list">	
	 			<!-- 产品列表 -->
            	<div class="products_list products_slider clear">
	            	<!-- 显示类别名称 -->
	                <h2 class="sub_title">${list[0].category.type }</h2>
	                <ul id="first-carousel" class="first-and-second-carousel jcarousel-skin-tango">
	                
	                	<!-- 小循环开始 -->
	 					<c:forEach items="${list }" var="product">
		                    <li> 
		                    	<a  href="${shop }/product/get.action?id=${product.id}" class="product_image thumbnail"><img src="${shop }/image/${product.pic }" /></a>
		                        <div class="product_info">
		                            <h3><a href="#">商品名称:${product.name }</a></h3>
		                            <small>${product.remark }</small> </div>
		                        <div class="price_info"> 
		                            <button>
		                            	<span class="pr_add">添加购物车</span>
		                            </button>
		                            <button class="price_add" title="" type="button">
		                            	<span class="pr_price">￥${product.price }</span>
		                            </button>
		                        </div>
		                    </li>
		                </c:forEach>
		                <!-- 小循环结束 -->
	                </ul>    
            	</div>
        		<!--产品列表结束  -->
        	</c:forEach>
	    	<!-- 大循环结束 -->

         
        <!--产品列表结束  -->
        <!-- 导航栏结束 -->
            <div class="footer_container">


        <div class="footer">
            <ul class="footer_links">
                <li> <span>收藏本店</span>
                    <ul>
                        <li><a href="#">服装</a></li>
                        <li><a href="#">鞋子</a></li>
                        <li><a href="#">包包</a></li>
                        <li><a href="#">装饰品</a></li>
                        <li><a href="#">channel</a></li>
                        <li><a href="#">prada</a></li>
                        <li><a href="#">LV</a></li>
                    </ul>
                </li>
                <li class="seperator"> <span>出售的品牌</span>
                    <ul>
                        <li><a href="#">Elle</a></li>
                        <li><a href="#">Reallxe</a></li>
                        <li><a href="#">Fabric</a></li>
                        <li><a href="#">Mayflower</a></li>
                        <li><a href="#">Levis Strauss</a></li>
                        <li><a href="#">Anzonica</a></li>
                        <li><a href="#">Reallxe</a></li>
                        <li><a href="#">Fabric</a></li>
                    </ul>
                </li>
                <li> <span>客户服务</span>
                    <ul>
                        <li><a href="#">帮助</a></li>
                        <li><a href="#">速递</a></li>
                        <li><a href="#">退换货</a></li>
                        <li><a href="#">付款方式</a></li>
                        <li><a href="#">订单跟踪</a></li>
                        <li><a href="#">礼物包选项</a></li>
                        <li><a href="#">国际服务</a></li>
                        <li><a href="#">退运险</a></li>
                    </ul>
                </li>
                <li> <span>个人账户</span>
                    <ul>
                        <li><a href="#">个人账户信息</a></li>
                        <li><a href="#">用户密码</a></li>
                        <li><a href="#">订单历史</a></li>
                        <li><a href="#">付款方式</a></li>
                        <li><a href="#">我的收货地址</a></li>
                        <li><a href="#">我的通知</a></li>
                    </ul>
                </li>
            </ul>
            
            </div>
    </div>
    

</body>
</html>