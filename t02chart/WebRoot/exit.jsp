<%@ page language="java" import="java.util.*"
	contentType="text/html;  charset=UTF-8"%><%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'exit.jsp' starting page</title>
    
  </head>
  
  <body>
   成功退出！
   <%
   String accounts=(String)session.getAttribute("myaccount");
   List<String> list=(List)application.getAttribute("yh");
   list.remove(accounts);
   %>
   <a href="index.jsp">重新登录</a>
  </body>
</html>
