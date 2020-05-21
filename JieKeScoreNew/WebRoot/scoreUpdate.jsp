<%@page language="java" import= "java.sql.*,dao.ScoreDao" pageEncoding= "gb2312" %>
<html>
	<body>
	<%
		request.setCharacterEncoding("gb2312");
		String courseno = request.getParameter("courseno");
		String[] type = request.getParameterValues("type" );
		String[] stuno = request.getParameterValues("stuno");
		String[] score = request.getParameterValues("score" );
		ScoreDao sdao = new ScoreDao();
	sdao.updateScores(courseno, type, stuno, score);
	response.sendRedirect("scoreForm.jsp");
	%>
	
</body>
</html>
