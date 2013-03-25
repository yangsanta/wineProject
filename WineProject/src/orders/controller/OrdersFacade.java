package orders.controller;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.MemberVO;
import shoppingCart.controller.ShipingCart;
import shoppingCart.model.ShoppingProduct;

public class OrdersFacade {
	HttpServletRequest request = null;
	HttpServletResponse response = null;

	public OrdersFacade() {
		System.out.println("OrdersFacade Constructor without Parameter!");
	}

	public OrdersFacade(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
	}

	public void checkout(MemberVO memberVO, ShipingCart cart) {
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
	}

	public void confirmed(MemberVO memberVO, ShipingCart cart) {
		System.out.println("*********************Order Checkout******************");
		
	}

}
