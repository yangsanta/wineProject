package orders.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import coupon.model.CouponDAO;
import coupon.model.CouponVO;

import orders.model.OrdersDAO;
import orders.model.OrdersVO;

import member.model.MemberVO;
import shipping_set.model.Shipping_setDAO;
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
		
		Integer min_price = new Shipping_setDAO().getAll().get(0).getmin_pirce();
		System.out.println("--------------------"+cart.getTotal());
		if (cart.getTotal() >= min_price){
			request.getSession().setAttribute("ShippingCost", 0);
		} else {
			request.getSession().setAttribute("ShippingCost", 50);
		}
	}

	public boolean confirmed(MemberVO memberVO, ShipingCart cart) throws IOException {
		System.out.println("*********************Order confirmed******************");
		boolean isSuccess = true;
		
		//主控台印出每個商品並確認庫存是否足夠
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
			if (contentMap.get(key).getProductVO().getP_num() < contentMap.get(key).getProductNumber()) {
				System.out.println("目前庫存數量("+ contentMap.get(key).getProductVO().getP_num() +")不足！");
				isSuccess = false;
			}
		}
		
		// 收參數（收件人資訊）
		String o_recipient = request.getParameter("o_recipient");
		String o_recipient_addr = request.getParameter("o_recipient_addr");
		String o_recipient_tel = request.getParameter("o_recipient_tel");
		
		Map<String, String> errMap = new HashMap<String, String>();
		
		// 驗證參數們
		if (o_recipient == null || o_recipient.trim().length() <3) {
			errMap.put("errRName", "請輸入完整姓名");
			o_recipient.trim();
		}
		if (o_recipient_addr == null || o_recipient_addr.trim().length() <10) {
			errMap.put("errRAddr", "請輸入完整地址");
			o_recipient_addr.trim();
		}
		Pattern pattern = Pattern.compile("^\\(?\\d{2}\\)?[\\s\\-]?\\d{4}\\-?\\d{4}$");
		if (o_recipient_tel == null || o_recipient_tel.trim().length() <6) {
			errMap.put("errRPhone", "請輸入完整電話號碼");
			o_recipient_tel = o_recipient_tel.trim();
		}
//		 else if (pattern.matcher(o_recipient_tel).matches()) {
//			errMap.put("errRPhone", "請輸入正確電話號碼");
//			o_recipient_tel = o_recipient_tel.trim();
//		}
	
		// 如果收件人資訊驗證不 OK
		if(!errMap.isEmpty() || isSuccess==false){
			request.setAttribute("o_recipient", o_recipient);
			request.setAttribute("o_recipient_addr", o_recipient_addr);
			request.setAttribute("o_recipient_tel", o_recipient_tel);
			request.setAttribute("errMap", errMap);
			isSuccess = false;
			
		// 如果收件人資訊驗證 OK
		} else {
			System.out.println("OOOOOOOOOOOOOKKKKKKKKKKKKKKKKKK");
			
			OrdersVO ordersVO = new OrdersVO();
			ordersVO.setM_no(memberVO.getM_no());
			ordersVO.setO_date(new java.sql.Date(new java.util.Date().getTime()));
			ordersVO.setO_shipping((Double) request.getAttribute("ShippingCost"));
			ordersVO.setO_recipient(o_recipient);
			ordersVO.setO_recipient_addr(o_recipient_addr);
			ordersVO.setO_recipient_tel(o_recipient_tel);
			ordersVO.setO_status("F");
			
			if (request.getParameter("useCoupon") != null){
				CouponDAO couponDAO = new CouponDAO();
				ordersVO.setC_key("Y");
				ordersVO.setO_after_sales(new Integer(cart.getTotal() + (Integer)(request.getSession().getAttribute("ShippingCost")) - (couponDAO.findByPrimaryKey(request.getParameter("useCoupon"))).getC_price()).doubleValue());
				
				CouponVO couponVO = couponDAO.findByPrimaryKey(request.getParameter("useCoupon"));
				couponVO.setC_status(true); //used
				couponDAO.update(couponVO);
				
			} else {
				ordersVO.setO_after_sales(new Integer(cart.getTotal() + (Integer)(request.getSession().getAttribute("ShippingCost"))).doubleValue());
			}
			
			new OrdersDAO().update(ordersVO);
		}
		
		return isSuccess;
		
	}

}
