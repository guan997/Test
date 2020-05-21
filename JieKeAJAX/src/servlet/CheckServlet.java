package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vo.Customer;
import dao.CustomerDao;

public class CheckServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setHeader("Cache-Control", "no-cache");
		response.setContentType("text/html;charset=gb2312");
		String account = request.getParameter("account");
		CustomerDao cdao = new CustomerDao();
		Customer cus = null; 
		try {
			cus = cdao.getCustomerByAccount(account);
		} catch (Exception e) {
			e.printStackTrace();
		}
		PrintWriter out = response.getWriter();
		if(cus==null){
			out.println("您可以注册");
		}
		else{
			out.println("该账户已经存在，您不可以注册！");
		}
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
}
