package orders.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import coupon.model.CouponDAO;
import coupon.model.CouponVO;

import member.model.MemberDAO;
import member.model.MemberVO;

import shoppingCart.controller.ShipingCart;

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
			
			CouponDAO couponDAO = new CouponDAO();
			List<CouponVO> theCoupons = couponDAO.findByM_no((Integer) session
					.getAttribute("m_no"));
			request.setAttribute("theCoupons", theCoupons);

			// 準備facade
			OrdersFacade facade = new OrdersFacade(request, response);

			// 從購物車點 "結帳回家"
			if (action.equals("checkout")) {
				System.out.println("*********************Order Checkout******************");

				facade.checkout(memberVO, cart);

				request.getRequestDispatcher("/orders/confirmcheckout.jsp")
						.forward(request, response);
			}
			
			// 從確認訂購話畫面點 "確認結帳"
			if (action.equals("confirmed")) {
				System.out.println("*********************Order confirmed******************");
				
				boolean isSuccess = facade.confirmed(memberVO, cart);
				if (isSuccess) {
					
				} else {
				request.getRequestDispatcher("/orders/confirmcheckout.jsp")
				.forward(request, response);
				}
			}
			
		} // end of if-else of "no shopping cart?"

	}

}
