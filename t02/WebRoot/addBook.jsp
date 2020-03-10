<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=UTF-8"%>
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

<title>My JSP 'addBook.jsp' starting page</title>

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
		ArrayList books = (ArrayList) session.getAttribute("books");
		if (books == null) {
			books = new ArrayList();
			session.setAttribute("books", books);
		}
		//设置编码格式
		String book = new String(request.getParameter("b1").getBytes(
				"ISO-8859-1"), "utf-8");
		String type = request.getParameter("i");
		if (book != null) {
			books.add(book);
		}
		if (type.equals("0")) {
			response.sendRedirect("computerBook.jsp");
			/**重定向**/
		} else {
			response.sendRedirect("historyBook.jsp");
			/**重定向**/
		}
	%>
</body>
</html>
