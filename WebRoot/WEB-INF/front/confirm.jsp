<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	  <%@include file="/public/front_head.jspf" %>	
	  <%
		response.setHeader("cache-control", "no-store");
	  %>   <!-- 页面不缓存 -->
  </head>
  <body>
  	 <c:if test="${empty sessionScope.forder.sorderList }">
  	 	<!-- 如果购物车中的购物项为空，则跳转到首页，这里不需要加项目名 -->
  	 	<c:redirect url="/index.jsp"/>
  	 </c:if>
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
							<a href="#">
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
                    <li class="active highlight">
                        <a href="#">女装</a>
                        <!--二级菜单-->
                        <ul class="sub_menu">
                            <li >
                                <a href="#">裙装</a>
                                <ul>
                                    <li>
                                        <a href="#">短裙</a>
                                    </li>
                                    <li>
                                        <a href="#">短裤</a>
                                    </li>
                                    <li>
                                        <a href="#">裤子</a>
                                    </li>
                                    <li>
                                        <a href="#">卡其裤</a>
                                    </li>
                                    <li>
                                        <a href="#">休闲裤</a>
                                    </li>
                                    <li>
                                        <a href="#">牛仔裤</a>
                                    </li>
                                    <li>
                                        <a href="#">风衣 & 运动夹克</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">装饰品</a>
                                <ul>
                                    <li>
                                        <a href="#">太阳镜</a>
                                    </li>
                                    <li>
                                        <a href="#">围巾</a>
                                    </li>
                                    <li>
                                        <a href="#">发饰品</a>
                                    </li>
                                    <li>
                                        <a href="#">帽子和手套</a>
                                    </li>
                                    <li>
                                        <a href="#">生活时尚</a>
                                    </li>
                                    <li>
                                        <a href="#">牛仔系列</a>
                                    </li>
                                    <li>
                                        <a href="#">风衣 & 西服</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <!--二级菜单结束-->

                    <li>
                        <a href="#">男装</a>
                        <!--二级菜单-->
                        <ul class="sub_menu">
                            <li>
                                <a href="#">男士夏装</a>
                                <ul>
                                    <li>
                                        <a href="#">裤子</a>
                                    </li>
                                    <li>
                                        <a href="#">休闲裤</a>
                                    </li>
                                    <li>
                                        <a href="#">卡其裤</a>
                                    </li>
                                    <li>
                                        <a href="#">牛仔裤</a>
                                    </li>
                                    <li>
                                        <a href="#">风衣 & 运动夹克</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">装饰品</a>
                                <ul>
                                    <li>
                                        <a href="#">太阳镜</a>
                                    </li>
                                    <li>
                                        <a href="#">围巾</a>
                                    </li>
                                    <li>
                                        <a href="#">发饰品</a>
                                    </li>
                                    <li>
                                        <a href="#">帽子和手套</a>
                                    </li>
                                    <li>
                                        <a href="#">生活时尚</a>
                                    </li>
                                    <li>
                                        <a href="#">牛仔系列</a>
                                    </li>
                                    <li>
                                        <a href="#">风衣 & 西服</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        <!--二级菜单结束--> </li>
                    <li>
                        <a href="#">儿童</a>
                    </li>
                    <li>
                        <a href="#">时尚</a>
                    </li>
                    <li>
                        <a href="#">装饰品</a>
                    </li>
                </ul>
            </div>
        </div>
        <!--导航栏结束-->

        <div class="section_container">
            <!-- 购物车 -->
            <ul class="breadcrumb">
                <li>
                    <a href="#">加入购物车</a>
                </li>
                <li class="active">
                    <a href="#">确认订单信息</a>
                </li>
                <li >
                    <a href="#">完成订单</a>
                </li>
            </ul>
            <!-- 确认订单信息 -->
            <div class="check-stup">
            	<!-- 商品确认 -->
                <div class="pro-check check ">
                    <h1>确认订单信息</h1>
	                <table class="data-table cart-table" cellpadding="0" cellspacing="0">
						<tr>
							<th class="align_center" width="10%">商品编号</th>
							<th class="align_left" width="35%" colspan="2">商品名称</th>
							<th class="align_center" width="10%">销售价格</th>
							<th class="align_center" width="20%">数量</th>
							<th class="align_center" width="15%">小计</th>
						</tr>
						<c:forEach items="${sessionScope.forder.sorderList}" var="sorder">
							<tr lang="${sorder.product.id}">
								<td class="align_center"><a href="#" class="edit">${sorder.product.id}</a>
								</td>
								<td width="80px"><img src="${shop }/image/${sorder.product.pic }" width="80"
									height="80" />
								</td>
								<td class="align_left"><a class="pr_name" href="#">${sorder.name}</a>
								</td>
								<td class="align_center vline">￥ ${sorder.price}</td>
								<td class="align_center vline">
									${sorder.number}	
								</td>
								<td class="align_center vline">￥${sorder.price*sorder.number}</td>
							</tr>
						</c:forEach>
					</table>
					
                    <div class="sum"> 
                        <div class="fr"><span>总计：</span><b>￥${forder.total}</b></div>
                    </div>
                   
                </div>
                <!-- 订购人确认 -->
                <form action="${shop }/forder/save.action" method="post">
	                <div class="person-check check">
	                    <h1>订购人信息</h1>
	                    <div class="person-checkinner">
	                        <div>
	                        	<label>配送姓名:</label>
	                        	<input type="text" name="name" value="${sessionScope.USER_SESSION.name }"/>
	                        </div>
	                        <div>
	                        	<label>联系方式:</label>
	                        	<input type="text" name="phone" value="${sessionScope.USER_SESSION.phone }"/>
	                        </div>
	                        <div>
	                        	<label>区域邮编:</label>
	                        	<input type="text" name="post" value=""/>
	                        </div>
	                        <div>
	                        	<label>配送地址:</label>
	                        	<input type="text" name="address" value=""/>
	                        </div>
	                    </div>
	                </div>
	                <!-- 卖家留言 -->
	                <div class="person-check check">
	               		<h1>卖家留言</h1>
	                	<textarea style="margin: 5px;" name="remark" cols="120" rows="2">输入留言信息</textarea>
		                <div class="submit">
		                   	<input type="submit" class="sub-logo fr" style="margin: 0px;padding: 0px; border: 0px;" value="确认无误,购买" />
		                </div>
	                </div>
                </form>
           	</div>
       	</div>
       <!-- 确认订单信息结束 -->
  	</div>
  </body>
</html>
