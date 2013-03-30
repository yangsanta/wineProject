package shipping_set.controller;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import Shipping_set.model.Shipping_setVO;

import shipping_set.model.Shipping_setDAO;
import shipping_set.model.Shipping_setVO;

public class Shipping_setServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Shipping_setServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");

		int min_pirce = Integer.parseInt(request.getParameter("min_pirce"));
		Shipping_setDAO dao = new Shipping_setDAO();
		Shipping_setVO shipping_setVO2 = new Shipping_setVO();
		shipping_setVO2.setMin_pirce(new Integer(min_pirce));

		dao.update(shipping_setVO2);
		
		response.sendRedirect("/WineProject/wine_admin/couponsetadmin.do?action=getAll");
		
	}

}
