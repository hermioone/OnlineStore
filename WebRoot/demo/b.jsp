<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<%@ include file="/public/head.jspf" %>
	<%
		response.setHeader("cache-control", "no-store");
	%>
</head>

<body>
	此页面 b.jsp采用服务器端的方式设置了不缓存
	<input type="text" name="xyz" />
	<a href="c.jsp">c.jsp</a>
</body>
</html>