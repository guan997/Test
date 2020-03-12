<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>My JSP 'show.jsp' starting page</title>

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
<% 
String name=request.getParameter("name");
String birthday=request.getParameter("birthday");
String email=request.getParameter("email");
Cookie myCook=new Cookie("meCookInfo",name+"#"+birthday+"#"+email);
myCook.setMaxAge(20);
response.addCookie(myCook);
%>
	表单提交成功
		<ul style="line-height:3">
			<li>姓名：<%=name %>
			</li>
			<li>出生日期：<%=birthday %>
			</li>
			<li>邮箱地址：<%=email %>
			</li>
			<a href="index.jsp">返回</a>
		</ul>
</body>
</html>
