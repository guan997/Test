<%@ page language="java" import="java.util.*"  contentType="text/html;  charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'historyBook.jsp' starting page</title>
    
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
   <h2>欢迎进入历史图书区</h2>
  1.史记 单价：28.0元<a href="addBook.jsp?b1=史记单价：28.0元&i=1">购买</a><br/>
    2.中国近代史 单价：34.0元<a href="addBook.jsp?b1=中国近代史 单价：34.0元&i=1">购买</a><br/>
    3.世界近代史 单价：56.0元<a href="addBook.jsp?b1=世界近代史 单价：56.0元&i=1">购买</a><br/>
   4.春秋 单价：67.0元<a href="addBook.jsp?b1=春秋单价：67.0元&i=1">购买</a><br/>
   <form action="cart.jsp">
   	<input type ="submit" value="查看购物车"/>
   </form>
    <form action="computerBook.jsp">
   	<input type ="submit" value="计算机图书区"/>
   </form>
  </body>
</html>
