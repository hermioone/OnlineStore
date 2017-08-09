<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<%@ include file="/public/head.jspf" %>
	<!-- 
		pragma: 设置页面是否缓存, 用于HTTP1.0协议
		cache-control: 设置页面是否缓存, 用于HTTP1.1协议
		expires: 如果支持缓存,则有效期
		并不是所有的容器都支持 meta, 例如tomcat就不解析,所以设置无效
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">  
	     no-cache: 仅仅支持IE不支持火狐,和google浏览器，no-store支持所有浏览器 post方式, 但是 google浏览器get方式不支持
	             当前访问缓存页面的请求为post请求时, 返回时候会出现"页面过期", 但是 get方式访问 b.jsp返回时,直接到服务器加载新页面,而不会提示"页面过期"
	 -->
</head>

<body>
	<a href="b.jsp">get 方式跳转到b.jsp</a>
	<form action="b.jsp"  method="post">
	   <input type="submit" value="post方式跳转到b.jsp" />
	</form>
</body>
</html>