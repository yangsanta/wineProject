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

public class DeleteWine extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteWine() {
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

		}
		Map<Integer, ShoppingProduct> oldProduct = cart.getContent();
		Integer productNo = Integer.parseInt(request.getParameter("no"));
		ShoppingProduct oldShoppingProduct = oldProduct.get(productNo);
		String sales = oldShoppingProduct.getSaleType();
		Integer number = oldShoppingProduct.getProductNumber();

		if (sales.equals("A")) {
			cart.deleteProduct(productNo);
			AbDAO abdao = new AbDAO();
			AbVO abVO = abdao.findByAKey(productNo);
			Integer b_no = abVO.getAb_b_p_id();
			ShoppingProduct shoppingProductB = oldProduct.get(b_no);
			if (shoppingProductB != null) {
				Integer productNumber = shoppingProductB.getProductNumber();
				Integer bNum = productNumber - number;
				if (bNum <= 0) {
					cart.deleteProduct(b_no);
				} else {
					shoppingProductB.setProductNumber(bNum);
				}
			}
		} else if (sales.equals("R") || sales.equals("G")) {
			Integer price;
			int rNum = 0, gNum = 0;
			cart.deleteProduct(productNo);
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
			for (Entry<Integer, Integer> r : rList) {
				int matchNumberR = matchNumber;
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
			for (Entry<Integer, Integer> g : gList) {
				int matchNumberG = matchNumber;
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
			cart.deleteProduct(productNo);
		}

		response.sendRedirect(request.getContextPath()
				+ "/product/DisplayProducts.do?action=getSome_For_Display&condition=p_sales&conditionValue=");

	}

}
