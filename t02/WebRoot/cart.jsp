<%@ page language="java" import="java.util.*" contentType="text/html;  charset=UTF-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'cart.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	购物车的内容是：
	<hr />
	<%
	ArrayList books = (ArrayList)session.getAttribute("books");
		for (int i = 0; i < books.size(); i++) {
			String book = (String) books.get(i);
			out.print(book);
	%>
	<a href="moveBookFormCart.jsp?tt=<%=book%>">删除</a>
	<br />
	<%
		}
	%><hr>
	<form action="clearAllCart.jsp">
		<input type="submit" value="清空购物车" />
	</form>
	<form action="computerBook.jsp">
		<input type="submit" value="计算机图书区" />
	</form>
	<form action="historyBook.jsp">
		<input type="submit" value="历史图书区" />
	</form>
</body>
</html>
