package product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
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

public class ModifyBuyWine extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ModifyBuyWine() {
		super();

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);
		// if (session == null) { // 使用逾時
		// request.setAttribute("Errors", "使用逾時，請重新登入");
		// RequestDispatcher rd = request.getRequestDispatcher("#");
		// rd.forward(request, response);
		// return;
		// }

		ShipingCart cart = (ShipingCart) session.getAttribute("ShoppingCart");
		if (cart == null) {
			// 就新建ShoppingCart物件
			cart = new ShipingCart();
			// 將此新建ShoppingCart的物件放到session物件內
			session.setAttribute("ShoppingCart", cart);
			response.sendRedirect(request.getHeader("Referer"));
			return;

		}
		String error="正確";
		
		try {
		Integer.parseInt(request.getParameter("num"));
		Integer productNumber = Integer.parseInt(request.getParameter("num"));// 該商品修改後的數量
		
		
		Integer productNo = Integer.parseInt(request.getParameter("no"));
		// 從購物車中找出商品清單
		Map<Integer, ShoppingProduct> oldProduct = cart.getContent();
		ShoppingProduct oldShoppingProduct = oldProduct.get(productNo);
		String sales = oldShoppingProduct.getSaleType(); // 找出USER愈修改品之優惠狀態
		Integer number = oldShoppingProduct.getProductNumber(); // 該商品之數量
		
		if (productNumber < 0) {
			error = "數量不可為負值";
			session.setAttribute("errorNumber", error);
			response.sendRedirect(request.getHeader("Referer"));
			return;
		} else if (productNumber == 0) {
			
			response.sendRedirect(request.getContextPath()+"/product/DeleteWine?no="+request.getParameter("no"));
			return;
		}
		
		
		
		session.removeAttribute("errorNumber");
		ProductDAO productDAO = new ProductDAO();
		productNumber=productNumber-number;
		System.out.println(productNumber);
		ProductVO productVO = productDAO.findByPrimaryKey(productNo);
		String productName = productVO.getP_name();
		Integer price = productVO.getP_price();
		ShoppingProduct shoppingProduct = new ShoppingProduct();
		// 設定選取商品要顯示的文字
		shoppingProduct.setProductNo(productNo); // 物件存商品編號
		shoppingProduct.setProductName(productName);// 物件存商品名稱
		shoppingProduct.setProductPrice(price); // 物件存商品售價
		sales = productVO.getP_sales();
		shoppingProduct.setPic(productVO.getP_pic());
		shoppingProduct.setSaleType(sales); // 物件存商品優惠狀態

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
			Map<Integer, ShoppingProduct> old = cart.getContent();
			ShoppingProduct OldShoppingProductB = old.get(b_no);

			if (OldShoppingProductB == null) {
				ProductVO productB = new ProductDAO().findByPrimaryKey(b_no);
				ShoppingProduct shoppingProductB = new ShoppingProduct();

				// 將B商品加入購物車
				shoppingProductB.setProductName(productB.getP_name());
				shoppingProductB.setProductNo(productB.getP_no());
				shoppingProductB.setProductNumber(Integer.parseInt(request.getParameter("num")));
				shoppingProductB.setProductPrice(productB.getP_price());
				shoppingProductB.setPic(productVO.getP_pic());
				shoppingProductB.setSaleType("B");
				shoppingProductB.setSalesNumber(new Integer(productNumber));
				shoppingProductB.setSubTotal(0);
				cart.addToCart(productB.getP_no(), shoppingProductB);
			} else {

				ShoppingProduct OldShoppingProductA = old.get(productNo);

				int aNum = OldShoppingProductA.getProductNumber();
				int bNum = OldShoppingProductB.getProductNumber();
				// -----------------重新計算B價錢----------
				if (bNum >= aNum) {
					OldShoppingProductB.setSalesNumber(aNum);
					OldShoppingProductB.setProductNumber(bNum);
					OldShoppingProductB.setSubTotal(OldShoppingProductB
							.getProductPrice() * (bNum - aNum));

				} else {
					OldShoppingProductB.setSalesNumber(bNum);
					OldShoppingProductB.setProductNumber(aNum);
					OldShoppingProductB.setSubTotal(0);
				}

			}
		}
		else if (sales.equals("B")) {
			shoppingProduct.setProductNumber(productNumber);
			shoppingProduct.setSubTotal(productNumber * price);
			cart.addToCart(shoppingProduct.getProductNo(), shoppingProduct);
			AbDAO abdao = new AbDAO();
			AbVO abVO = abdao.findByBKey(productNo);
			Integer a_no = abVO.getAb_a_p_id();
			Map<Integer, ShoppingProduct> old = cart.getContent();
			ShoppingProduct OldShoppingProductA = old.get(a_no);
			if(OldShoppingProductA==null){
				return;
			}else{
				ShoppingProduct OldShoppingProductB = old.get(productNo);

				int aNum = OldShoppingProductA.getProductNumber();
				int bNum = OldShoppingProductB.getProductNumber();
				// -----------------重新計算B價錢----------
				if (bNum >= aNum) {
					OldShoppingProductB.setSalesNumber(aNum);
					OldShoppingProductB.setProductNumber(bNum);
					OldShoppingProductB.setSubTotal(OldShoppingProductB
							.getProductPrice() * (bNum - aNum));

				} else {
					OldShoppingProductB.setSalesNumber(bNum);
					OldShoppingProductB.setProductNumber(aNum);
					OldShoppingProductB.setSubTotal(0);
				}
				
			}
			
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

				shoppingProduct.setSubTotal((price * num)
						- (quotient * price / 2)-OldShoppingProduct.getSubTotal());
				cart.addToCart(shoppingProduct.getProductNo(), shoppingProduct);

			}
		} else if (sales.equals("R") || sales.equals("G")) {

			// 將所選的商品加入購物車
			// |-------邏輯流程 ---------------------------------------------------|
			// |1. 加入清單(將這次買的商品加入session) 此時小計是錯的，要從新計算(2.3.4.即此功能) |
			// |2.計算所有r g數量 map iterator |
			// |3.找r g小的數量 |
			// |4.從低價的開始填 |
			// |________________________________________________________________|
			// 1. 加入清單
			int rNum = 0, gNum = 0;
			shoppingProduct.setProductNumber(productNumber);
			shoppingProduct.setSubTotal(productNumber * price);
			cart.addToCart(productNo, shoppingProduct);

			// 2.計算所有r g數量 map iterator
			Map<Integer, Integer> rMap = new HashMap<Integer, Integer>();
			Map<Integer, Integer> gMap = new HashMap<Integer, Integer>();
			Map<Integer, ShoppingProduct> oldShoppingCart = cart.getContent();
			Set<Integer> set = oldShoppingCart.keySet();
			for (Integer n : set) {
				// 將RG商品撈出來計算數量 並用No 和Price組合成一個新的Map

				if (oldShoppingCart.get(n).getSaleType().equals("R")) {
					rMap.put(oldShoppingCart.get(n).getProductNo(),
							oldShoppingCart.get(n).getProductPrice());
					rNum += oldShoppingCart.get(n).getProductNumber();
				} else if (oldShoppingCart.get(n).getSaleType().equals("G")) {
					gMap.put(oldShoppingCart.get(n).getProductNo(),
							oldShoppingCart.get(n).getProductPrice());
					gNum += oldShoppingCart.get(n).getProductNumber();
				}
			}
			// 將G商品依價錢由小到大重新排列
			List<Map.Entry<Integer, Integer>> gList = new ArrayList<Map.Entry<Integer, Integer>>(
					gMap.entrySet());
			Collections.sort(gList,
					new Comparator<Map.Entry<Integer, Integer>>() {
						public int compare(Map.Entry<Integer, Integer> o1,
								Map.Entry<Integer, Integer> o2) {
							return (o1.getValue() - o2.getValue());
						}
					});
			// 將R商品依價錢由小到大重新排列
			List<Map.Entry<Integer, Integer>> rList = new ArrayList<Map.Entry<Integer, Integer>>(
					rMap.entrySet());
			Collections.sort(rList,
					new Comparator<Map.Entry<Integer, Integer>>() {
						public int compare(Map.Entry<Integer, Integer> o1,
								Map.Entry<Integer, Integer> o2) {
							return (o1.getValue() - o2.getValue());
						}
					});
			// 3.找r g小的數量
			int matchNumber = (rNum >= gNum) ? gNum : rNum;
			// 4.從低價的開始填 |
			// | 假設getProductNumber小於matchNumber |
			// | {優惠數量=getProductNumber |
			// | matchNumber=matchNumber-getProductNumber}else |
			// | {優惠數量=matchNumber |
			// | matchNumber=0;} |
			// |________________________________________________
			// 跑r
			int matchNumberR = matchNumber;
			for (Entry<Integer, Integer> r : rList) {

				ShoppingProduct temp = oldShoppingCart.get(r.getKey());
				price = temp.getProductPrice();
				if (temp.getProductNumber() <= matchNumberR) {
					temp.setSalesNumber(temp.getProductNumber());
					temp.setSubTotal((int) (price * 0.9 * temp
							.getProductNumber()));
					matchNumberR -= temp.getProductNumber();
				} else {
					temp.setSalesNumber(matchNumberR);
					temp.setSubTotal((int) (price * 0.9 * matchNumberR)
							+ (temp.getProductNumber() - matchNumberR) * price);
					matchNumberR = 0;
				}
			}
			// 跑g
			int matchNumberG = matchNumber;
			for (Entry<Integer, Integer> g : gList) {

				ShoppingProduct tempG = oldShoppingCart.get(g.getKey());
				price = tempG.getProductPrice();
				if (tempG.getProductNumber() <= matchNumberG) {
					tempG.setSalesNumber(tempG.getProductNumber());
					tempG.setSubTotal((int) (price * 0.9 * tempG
							.getProductNumber()));
					matchNumberG -= tempG.getProductNumber();
				} else {
					tempG.setSalesNumber(matchNumberG);
					tempG.setSubTotal((int) (price * 0.9 * matchNumberG)
							+ (tempG.getProductNumber() - matchNumberG) * price);
					matchNumberG = 0;
				}
			}

		} else {
			// 沒有優惠OR B區商品
			shoppingProduct.setProductNumber(productNumber);
			shoppingProduct.setSubTotal(productNumber * price);
			cart.addToCart(shoppingProduct.getProductNo(), shoppingProduct);

		}
		// 計算金額
		response.sendRedirect(request.getHeader("Referer"));
		} catch (Exception e) {

			error ="數量請輸入數字";
			session.setAttribute("errorNumber", error);
			response.sendRedirect(request.getHeader("Referer"));
			return;
		}
	}
}
