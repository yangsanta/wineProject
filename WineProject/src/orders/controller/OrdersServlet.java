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
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("OOOOOOOOOOOrdersServlet doPost is running up.");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession(false);
		
		//取參數
		String action = request.getParameter("action");
		
		//取登入中的會員
		MemberVO memberVO = new MemberDAO().findByPrimaryKey((Integer)session.getAttribute("m_no"));
//		System.out.println("MMMMMMMMMMMMMMMMMMMemberName: " + memberVO.getM_name());
		
		//取購物車內容
		ShipingCart cart = (ShipingCart) session.getAttribute("ShoppingCart");
		Map<Integer, ShoppingProduct> contentMap = cart.getContent();
		Set<Integer> cartKeys = contentMap.keySet();
		Iterator<Integer> it = cartKeys.iterator();
		while (it.hasNext()){
			Integer key = it.next();
			System.out.println("KKKKKKKKKKKKKKKKKKKKeys: " + key);
			System.out.println("ProductNo: " + contentMap.get(key).getProductNo());
			System.out.println("Pic: " + contentMap.get(key).getPic());
			System.out.println("ProductName: " + contentMap.get(key).getProductName());
			System.out.println("SaleType: " + contentMap.get(key).getSaleType());
			System.out.println("ProductNumber: " + contentMap.get(key).getProductNumber());
			System.out.println("ProductPrice: " + contentMap.get(key).getProductPrice());
			System.out.println("ProductSalesNumber: " + contentMap.get(key).getSalesNumber());
			System.out.println("SubTotal: " + contentMap.get(key).getSubTotal());
		}
		
		//準備facade
		OrdersFacade facade = new OrdersFacade(request, response);

		if ( action != null && action.equals("checkout")){
			System.out.println("*********************Order Checkout******************");
			
			facade.checkout(memberVO, cart);
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}

}
