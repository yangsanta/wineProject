package orders.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.MemberDAO;
import member.model.MemberVO;

import shoppingCart.controller.ShipingCart;
import shoppingCart.model.ShoppingProduct;

public class OrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		System.out.println("OOOOOOOOOOOrdersServlet doPost is running up.");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession(false);

		// 取參數
		String action = request.getParameter("action");
		// 取登入中的會員
		MemberVO memberVO = new MemberDAO().findByPrimaryKey((Integer) session
				.getAttribute("m_no"));
		// 取購物車
		ShipingCart cart = null;
		if (session.getAttribute("ShoppingCart") == null
				|| ((ShipingCart) session.getAttribute("ShoppingCart"))
						.getContent().isEmpty()) {
			request.setAttribute("cartNoContent", "購物車內無商品。");
			request.getRequestDispatcher("/orders/confirmcheckout.jsp")
					.forward(request, response);
		} else {
			cart = (ShipingCart) session.getAttribute("ShoppingCart");

			// 準備facade
			OrdersFacade facade = new OrdersFacade(request, response);

			if (action.equals("checkout")) {
				System.out
						.println("*********************Order Checkout******************");

				facade.checkout(memberVO, cart);

				request.getRequestDispatcher("/orders/confirmcheckout.jsp")
						.forward(request, response);

			}
		} // end of if-else of "no shopping cart?"

	}

}
