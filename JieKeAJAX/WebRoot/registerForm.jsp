<%@ page language="java" pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html> 
  <body>
  	<SCRIPT LANGUAGE="JavaScript">
  		function check(){
  			//获取账号
  			var account = document.regForm.account.value;  			
			//主流浏览器中实例化XMLHTTP对象
  			var xmlHttp = false;
			try {
                xmlHttp = new ActiveXObject("Msxml2.XMLHTTP"); // ie msxml3.0+（IE7.0及以上）
			 } catch (e) {
				 try {
	                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP"); //ie msxml2.6（IE5/6）
				 } catch (e2) {
	                    xmlHttp = false;
	             }
			 }
			 if (!xmlHttp && typeof XMLHttpRequest != 'undefined') {// Firefox, Opera 8.0+, Safari
				 xmlHttp = new XMLHttpRequest();
	        }
			//异步提交的目标和提交方式
			//参数1表示请求的方式GET和POST两种
			//参数2表示请求的jsp页面，可以给jsp页面一些参数
			//赋给jsp名为account、值为account的参数，jsp可以通过request.getParameter("account")方法获得该参数的值
			//参数3，true表示异步请求，否则表示非异步请求，在ajax情况下都选择true
	  		var url = "/JieKeAJAX/servlet/CheckServlet?account="+account;
	  		xmlHttp.open("GET", url, true);
			xmlHttp.onreadystatechange=function() {
				//4表示完成状态，数据全部接收完成
	  			if (xmlHttp.readyState==4) {
					checkDiv.innerHTML = xmlHttp.responseText;
				}
				else{
					checkDiv.innerHTML = "正在检测......";
				}
			}
			xmlHttp.send();	
  		}
	</SCRIPT>
	欢迎注册教务管理系统.<BR>
    <form name="regForm">
    	请您输入账号:<input type="text" name="account" onblur="check()">
    	<span id="checkDiv"></span><BR>
    	请您输入密码:<input type="password" name="password"><BR>
    	输入确认密码:<input type="password" name="cpassword"><BR>
    	请您输入姓名:<input type="text" name="cname"><BR>
    	<input type="button" value="注册">
    </form>
  </body>
</html>
