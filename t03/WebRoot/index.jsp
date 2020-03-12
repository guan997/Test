<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
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
  	String welcome="第一次访问";
  	String []info=new String[]{"","",""};
  	Cookie[] cook=request.getCookies();
  	if(cook!=null){
  		for(int i=0;i<cook.length;i++){
  			if(cook[i].getName().equals("meCookInfo")){
  				info=cook[i].getValue().split("#");
  				welcome="，欢迎回来！";
  			}
  		}
  	}
  	
  	%>
  	<%=info[0]+welcome %>
	<form action="show.jsp" method="post">
		<ul style="line-height:3">
			<li>姓名：<input type="text"name="name"value="<%=info[0]%>"/></li>
			<li>出生日期：<input type="text"name="birthday"value="<%=info[1]%>"/></li>
			<li>邮箱地址：<input type="text"name="email"value="<%=info[2]%>"/></li>
			<br/>
			<input type="submit"value="提交"/>
		</ul>
	</form>
  </body>
</html>
