<%@page language ="java" import="java.util.*,dao.ScoreDao,vo.Score" pageEncoding = "gb2312"%>
<html>
<body>
	<%
		String courseno= "001";
	%>
	输人课程编号为<%= courseno%>的所有学生成绩
	<form action="scoreUpdate.jsp"method="post">
	<input name="courseno" type= "hidden" value = "<%=courseno%>">
	<input type= "submit" value="提交成绩">
	<table>
	  <tr bgcolor="yellow">
	  <td>学号</td>
	  <td>姓名</td>
	  <td>考试类型</td>
	  <td>分数</td>
	</tr>
	<%
		ScoreDao sdao=new ScoreDao();
		ArrayList scores=sdao.getAllScoresByCourseno(courseno);
		for(int i=0;i<scores.size();i++){
			Score score=(Score) scores.get(i);
	%>
		<tr bgcolor="pink">
		<td><%= score.getStuno()%></td >
		<td><%= score.getStuname()%> </td>
		<td><%= score.getType()%></td>
		<td>
			<% if(score. getScorenumber() == null){%>
				<input name = "score" type= "text" size= "4">
				<input name = "type" type = "hidden" value = "<%= score.getType()%>">
				<input name = "stuno" type = "hidden" value= "<%= score.getStuno()%>">
				<% }else{
					out.print(score.getScorenumber());
				}%>

		</td>
		</tr>

	<%
		}
	%>
	</table>
	</form>
</body>
</html>