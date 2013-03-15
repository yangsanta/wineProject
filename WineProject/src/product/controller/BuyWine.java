package product.controller;

import java.io.IOException;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import product.model.ProductDAO;
import product.model.ProductVO;
import shoppingCart.controller.ShipingCart;
import shoppingCart.model.ShoppingProduct;
import ab.model.AbDAO;
import ab.model.AbVO;

/**
 * Servlet implementation class shopping_cart
 */
@WebServlet("/shopping_cart")
public class BuyWine extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BuyWine() {
		super();

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);
//		if (session == null) { // 使用逾時
//			request.setAttribute("Errors", "使用逾時，請重新登入");
//			RequestDispatcher rd = request.getRequestDispatcher("#");
//			rd.forward(request, response);
//			return;
//		}

		ShipingCart cart = (ShipingCart) session.getAttribute("ShoppingCart");
		if (cart == null) {
			// 就新建ShoppingCart物件
			cart = new ShipingCart();
			// 將此新建ShoppingCart的物件放到session物件內
			session.setAttribute("ShoppingCart", cart);
			
		}
		ProductDAO productDAO = new ProductDAO();
		Integer productNumber = Integer.parseInt(request.getParameter("num"));
		
		Integer productNo = Integer.parseInt(request.getParameter("no"));
		ProductVO productVO = productDAO.findByPrimaryKey(productNo);
		String productName = productVO.getP_name();
		Integer price = productVO.getP_price();
		ShoppingProduct shoppingProduct = new ShoppingProduct();
		// 設定選取商品要顯示的文字
		shoppingProduct.setProductNo(productNo);	//物件存商品編號
		shoppingProduct.setProductName(productName);//物件存商品名稱
		shoppingProduct.setProductPrice(price);		//物件存商品售價
		String sales = productVO.getP_sales();
		shoppingProduct.setSaleType(sales);			//物件存商品優惠狀態
		System.out.println("名稱"+productName);
		System.out.println("售價"+price);
		System.out.println("數量"+productNumber);
		System.out.println("優惠"+sales);
		// 判斷優惠狀態
		
		if (sales.equals("A")) {
			// 買A送B
			// 將所選的商品加入購物車
			shoppingProduct.setProductNumber(productNumber);
			shoppingProduct.setSubTotal(productNumber * price);
			cart.addToCart(productNo, shoppingProduct);
			// 找出對應的B商品
			AbDAO abdao = new AbDAO();
			AbVO abVO = abdao.findByAKey(productNo);
			Integer b_no = abVO.getAb_b_p_id();
			ProductDAO productDAOB = new ProductDAO();
			ProductVO productB = productDAOB.findByPrimaryKey(b_no);
			ShoppingProduct shoppingProductB = new ShoppingProduct();
			// 將B商品加入購物車
			shoppingProductB.setProductName(productB.getP_name());
			shoppingProductB.setProductNo(productB.getP_no());
			shoppingProductB.setProductNumber(productNumber);
			shoppingProductB.setProductPrice(productB.getP_price());
			shoppingProductB.setSubTotal(0);
			cart.addToCart(shoppingProductB.getProductNo(), shoppingProductB);
		} else if (sales.equals("half")) { // 第2件半價
			Map<Integer, ShoppingProduct> old = cart.getContent();
			ShoppingProduct OldShoppingProduct = old.get(productNo);
			shoppingProduct.setProductNumber(productNumber);
			int num = productNumber;
			int quotient = num / 2;
			if (OldShoppingProduct == null) {

				shoppingProduct.setSubTotal((price * num)
						- (quotient * price / 2));
				cart.addToCart(shoppingProduct.getProductNo(), shoppingProduct);

			} else {
				num = OldShoppingProduct.getProductNumber() + productNumber;
				quotient = num / 2;
				System.out.println(num);
				System.out.println(quotient);
				System.out.println((price * num) - (quotient * price / 2));
				System.out.println(OldShoppingProduct.getProductPrice());
				shoppingProduct.setSubTotal((price * num)
						- (quotient * price / 2)
						- OldShoppingProduct.getSubTotal());
				cart.addToCart(shoppingProduct.getProductNo(), shoppingProduct);

			}
		}
		 else if (sales.equals("R")) {
			// 將所選的商品加入購物車
			//1. 加入清單
			shoppingProduct.setProductNumber(productNumber);
			shoppingProduct.setSubTotal(productNumber * price);
			cart.addToCart(productNo, shoppingProduct);
			//2.計算所有r g數量 map iterator

			//3.找r g小的數量
			//4.從低價的開始填
			
			cart.addToCart(productNo, shoppingProduct);

			
//1. 加入清單
//2.計算所有r g數量 map iterator
//3.找r g小的數量
//4.從低價的開始填
//			Map<Integer, ShoppingProduct> old = cart.getContent();
//			ShoppingProduct OldShoppingProduct = old.get(productNo);
//			shoppingProduct.setProductNumber(productNumber);
			
		// Map<Integer, ShoppingProduct> old = cart.getContent();
		// Set<Integer> set=old.keySet();
		// int rNum=cart.getaNumber()+productNumber;
		// int gNum=cart.getbNumber();
		// if(rNum>gNum){
		// for (Integer n : set) {
		// if(old.get(n).getSaleType().equals("R")){
		//
		// }
		// }
		//
		// }
		// else if(rNum<gNum){}
		// else{}
		 }
		else {
			// 沒有優惠OR B區商品
			shoppingProduct.setProductNumber(productNumber);
			shoppingProduct.setSubTotal(productNumber * price);
			cart.addToCart(shoppingProduct.getProductNo(), shoppingProduct);

		}
		// 計算金額

		response.sendRedirect("http://localhost:8081/WineProject/product/DisplayProducts?action=getAll&pageNo=1");

	}

}
