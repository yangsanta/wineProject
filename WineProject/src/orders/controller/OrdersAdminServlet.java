package orders.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OrdersAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		// 取參數
		String action = request.getParameter("action");
		// 準備facade
		OrdersAdminFacade facade = new OrdersAdminFacade(request, response);

		if (action.equals("getall") || action == null) {
			facade.getall();
			request.getRequestDispatcher("/wine_admin/ademin_orders.jsp").forward(request, response);
		}
		
		if (action.equals("delete")) {
			Integer o_no = Integer.valueOf(request.getParameter("o_no"));
			facade.detete(o_no);
			facade.getall();
		}
		
		if (action.equals("edit")) {
			Integer o_no = Integer.valueOf(request.getParameter("o_no"));
			facade.edit(o_no);
		}
		if (action.equals("ordernumber")) {
			Integer ordernumber=facade.ordernumber();
			System.out.println("吐回來"+ordernumber);
			
			request.setCharacterEncoding("UTF-8");
			request.setAttribute("ordernumber", ordernumber);
			RequestDispatcher dis = request.getRequestDispatcher("/wine_admin/ajaxordernumber.jsp");
			dis.forward(request, response);
		}
	}

}
