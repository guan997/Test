<%@ page language="java" pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html> 
  <body>
  	<SCRIPT LANGUAGE="JavaScript">
  		function check(){
  			//��ȡ�˺�
  			var account = document.regForm.account.value;  			
			//�����������ʵ����XMLHTTP����
  			var xmlHttp = false;
			try {
                xmlHttp = new ActiveXObject("Msxml2.XMLHTTP"); // ie msxml3.0+��IE7.0�����ϣ�
			 } catch (e) {
				 try {
	                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP"); //ie msxml2.6��IE5/6��
				 } catch (e2) {
	                    xmlHttp = false;
	             }
			 }
			 if (!xmlHttp && typeof XMLHttpRequest != 'undefined') {// Firefox, Opera 8.0+, Safari
				 xmlHttp = new XMLHttpRequest();
	        }
			//�첽�ύ��Ŀ����ύ��ʽ
			//����1��ʾ����ķ�ʽGET��POST����
			//����2��ʾ�����jspҳ�棬���Ը�jspҳ��һЩ����
			//����jsp��Ϊaccount��ֵΪaccount�Ĳ�����jsp����ͨ��request.getParameter("account")������øò�����ֵ
			//����3��true��ʾ�첽���󣬷����ʾ���첽������ajax����¶�ѡ��true
	  		var url = "/JieKeAJAX/servlet/CheckServlet?account="+account;
	  		xmlHttp.open("GET", url, true);
			xmlHttp.onreadystatechange=function() {
				//4��ʾ���״̬������ȫ���������
	  			if (xmlHttp.readyState==4) {
					checkDiv.innerHTML = xmlHttp.responseText;
				}
				else{
					checkDiv.innerHTML = "���ڼ��......";
				}
			}
			xmlHttp.send();	
  		}
	</SCRIPT>
	��ӭע��������ϵͳ.<BR>
    <form name="regForm">
    	���������˺�:<input type="text" name="account" onblur="check()">
    	<span id="checkDiv"></span><BR>
    	������������:<input type="password" name="password"><BR>
    	����ȷ������:<input type="password" name="cpassword"><BR>
    	������������:<input type="text" name="cname"><BR>
    	<input type="button" value="ע��">
    </form>
  </body>
</html>
