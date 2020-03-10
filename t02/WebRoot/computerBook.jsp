<%@ page language="java" import="java.util.*" contentType="text/html;  charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>购物车界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <h2>欢迎进入计算机图书区</h2>
  1.计算机专业英语 单价：28.0元<a href="addBook.jsp?b1=计算机专业英语 单价：28.0元&i=0">购买</a><br/>
    2.数据库 单价：34.0元<a href="addBook.jsp?b1=数据库 单价：34.0元&i=0">购买</a><br/>
    3.数据结构 单价：56.0元<a href="addBook.jsp?b1=数据结构 单价：56.0元&i=0">购买</a><br/>
   4.计算机网络 单价：67.0元<a href="addBook.jsp?b1=计算机网络 单价：67.0元&i=0">购买</a><br/>
   <form action="cart.jsp">
   	<input type ="submit" value="查看购物车"/>
   </form>
    <form action="historyBook.jsp">
   	<input type ="submit" value="历史图书区"/>
   </form>
  <body>
  
  </body>
</html>
