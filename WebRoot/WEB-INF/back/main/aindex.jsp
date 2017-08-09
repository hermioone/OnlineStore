<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ include file="/public/head.jspf" %>
	<style type="text/css">
		#menu{
			width:200px;
			/* border: 1px solid red; */
		}
		#menu ul{
			list-style: none;
			padding: 0px;
			margin: 0px;
		}
		#menu ul li{
			border-bottom: 1px solid red;
		}
		#menu ul li a{
			/*设置a标签的宽和内边距则先转化为块级元素*/
			display: block;
			background-color: #E0FFFF;
			color: #000;
			padding: 5px;
			text-decoration: none;
		}
		#menu ul li a:hover{
			background-color: #F0FFF0;
		}		
	</style>
	<script type="text/javascript">
		$(function() {
			//给有title属性的a标签添加事件，title中存的是a标签要访问的地址，因为要发送ajax请求，所以不能在href中写地址
			$("a[title]").click(function() {
				var text = $(this).text();   //当前a标签的内容
				var href = "${shop}/" + $(this).attr("title"); 
				//1.判断当前右边是否已有相应的tab
				//2.如果没有则创建一个新的tab，否则切换到当前的tab
				if($("#tt").tabs("exists", text)) {   //exists是方法名，text是exists方法的参数
					//存在，则切换
					$("#tt").tabs("select", text);
				}else {
					//不存在，创建
					$("#tt").tabs("add", {     //add是方法名，后面的json数据是add的参数(panel的属性)，href是这个新创建的面板要从哪里获取数据
						title:text,
						/*
						//href:默认是通过url地址加载远程的页面，但是仅仅是body部分，head中的css或者js无效，所以这种方法不行
						//href:'${shop}/send/category/query'
						*/
						//前面不能加${shop}，因为这一部分会被抽取到.js中，js是在客户端解析的，不是在服务端，所以${shop}会解析不出来
						//所以只能不抽取这一部分
						content:'<iframe title=' + text + ' src=' + href + ' frameborder="0" width="100%" height="100%" />',
						closable:true
					});
				}
				
			});
		});
	</script>
</head>

<!--  框架集合，里面包含了3+1个页面,普通版本
<frameset border="5" rows="150, *">
	<frame src="${shop }/send/main/top" />
	<frameset border="5" cols="150, *">
		<frame src="${shop }/send/main/left" />
		<frame src="${shop }/send/main/right" />
	</frameset>
</frameset> -->

<body class="easyui-layout">   

    <div data-options="region:'north',title:'欢迎来到后台管理系统',split:true" style="height:100px;"></div>      
    <div data-options="region:'west',title:'系统操作',split:true" style="width:200px;">
    	<div id="menu" class="easyui-accordion" data-options="fit:true">   
    		<div title="基本操作">
	 			<ul>
	 				<li><a href="#" title="send/back/category/query">类别管理</a></li>
	 				<li><a href="#" title="send/back/product/query">商品管理</a></li>
	 			</ul>
	 		</div>
	 		<div title="其它操作">
	 			<ul>
	 				<li><a href="#">类别管理</a></li>
	 				<li><a href="#">商品管理</a></li>
	 			</ul>
	 		</div>
		</div> 
    </div>
    <div data-options="region:'center',title:'后台操作页面'" style="padding:1px;background:#eee;">
    	<div id="tt" class="easyui-tabs" data-options="fit:true">   <!-- fit:true  是适应当前的 -->
		    <div title="系统缺省页面" style="padding:10px;">   
		                           此处以后显示相应的系统(当前操作系统的类型，包括当前项目的域名，硬件的相关配置，或者显示报表)    
		    </div>     
		</div> 
    </div> 
    
    <!-- 这个必须放在这里，因为这个窗口弹出的话会锁住它的爹，所以为了锁住整个页面，必须把它放在这里，以便锁住整个body，如果放在query.jsp的body里则只会锁住query的那个iframe -->
    <div id="win" data-options="collapsible:false, minimizable:false, maximizable:false, modal:true"></div>  
</body> 

</html>