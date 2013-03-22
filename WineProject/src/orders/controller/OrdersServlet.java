package orders.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




public class OrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("OOOOOOOOOOOrdersServlet doPost is running up.");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		//取參數
		String action = request.getParameter("action");
		//取 Attribute
		String xxx = (String) session.getAttribute("");
		
		//準備facade
		OrdersFacade facade = new OrdersFacade(request, response);
		
		if ( action != null && action.equals("checkout")){
			System.out.println("*********************Order Checkout******************");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}

}
