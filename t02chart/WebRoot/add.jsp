<%@ page language="java" import="java.util.*"
	contentType="text/html;  charset=UTF-8"%>
	<%@page import="java.util.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登陆成功</title>
  
  </head>
  
  <body>
  <%!List<String> list=new ArrayList<String>(); %>
    <% 
		String account=request.getParameter("account");
		String password=request.getParameter("password");
		session.setAttribute("myaccount",account);
		for(int i=0;i<list.size();i++){
			if(account.equals(list.get(i))||account==""){
				%>
				<jsp:forward page="login.jsp"></jsp:forward>
				<%
			}
		}
		list.add(account);
		application.setAttribute("yh",list);
		response.sendRedirect("showOnline.jsp");
		%>
	
  </body>
</html>
