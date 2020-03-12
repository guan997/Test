<%@ page language="java" import="java.util.*"
	contentType="text/html;  charset=UTF-8"%>
<%@page import="java.util.List"%>
<%@ page import="javax.servlet.http.*"%>
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

<title>聊天室</title>

</head>

<body>
	<h2 align="center">欢迎进入聊天室：</h2>
	<table width="80%" border="0" align="center">
		<tr bgcolor="yellow" align="center">
			<td>当前在线</td>
		</tr>
		<tr bgcolor="pink" align="center">
			<td>
				<%
					List<String> list = (List) application.getAttribute("yh");
					for (int i = 0; i < list.size(); i++) {
				%> <%=list.get(i)%> <br> 
				<%
 	response.setHeader("refresh","5");
 	}
 %>
			</td>
		</tr>
		<tr align="center">
			<td>
				<form action="exit.jsp">
					<input type="submit" value="退出">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>
