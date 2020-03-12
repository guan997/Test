<%@ page language="java" import="java.util.*"
	contentType="text/html;  charset=UTF-8"%><%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录界面
    </title>
	
  </head>
  
  <body>
  	欢迎登陆
  	<script type="text/javascript">
  	function validate(){
  		if(loginForm.account.value!=""&&loginForm.password.value!=
  			""&&loginForm.account.value==loginForm.password.value){
  			loginForm.submit();
  			return;
  		}else{
  			alert("登陆失败");
  			return;
  		}
  	}
  	
  	</script>
	<form name="loginForm" action="add.jsp" method="post">
		请输入账号：<input name="account" type="text"/>
		请输入密码：<input name="password" type="password"/>	
		<input type="button"value="登录"onClick="validate()"/>
	</form>
  </body>
</html>
