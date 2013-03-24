package orders.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import coupon.model.CouponDAO;
import coupon.model.CouponVO;

import order_detail.model.Order_DetailDAO;
import order_detail.model.Order_DetailVO;
import orders.model.OrdersDAO;
import orders.model.OrdersVO;
import product.model.ProductDAO;
import product.model.ProductVO;

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
		while (it.hasNext()) {
			Integer key = it.next();
			System.out.println("KKKKKKKKKKKKKKKKKKKKeys: " + key);
			System.out.println("ProductNo: "
					+ contentMap.get(key).getProductNo());
			System.out.println("Pic: " + contentMap.get(key).getPic());
			System.out.println("ProductName: "
					+ contentMap.get(key).getProductName());
			System.out
					.println("SaleType: " + contentMap.get(key).getSaleType());
			System.out.println("ProductNumber: "
					+ contentMap.get(key).getProductNumber());
			System.out.println("ProductPrice: "
					+ contentMap.get(key).getProductPrice());
			System.out.println("ProductSalesNumber: "
					+ contentMap.get(key).getSalesNumber());
			System.out
					.println("SubTotal: " + contentMap.get(key).getSubTotal());
		}

		Integer min_price = new Shipping_setDAO().getAll().get(0)
				.getmin_pirce();
		System.out.println("--------------------" + cart.getTotal());
		if (cart.getTotal() >= min_price) {
			request.getSession().setAttribute("ShippingCost", 0);
		} else {
			request.getSession().setAttribute("ShippingCost", 50);
		}
		
		// 自動帶入 user 最近一次的訂單收件人資訊
		try {
			OrdersVO ordersVO = (new OrdersDAO().getOrdersByM_no(memberVO.getM_no())).get(0);
			request.setAttribute("o_recipient", ordersVO.getO_recipient());
			request.setAttribute("o_recipient_tel", ordersVO.getO_recipient_tel());
			request.setAttribute("o_recipient_addr", ordersVO.getO_recipient_addr());
		} catch (NullPointerException e) {
			System.out.println("No order of this user at the moment");
			e.printStackTrace();
		}
		
	}

	public boolean confirmed(MemberVO memberVO, ShipingCart cart)
			throws IOException {
		System.out
				.println("*********************Order confirmed******************");
		boolean isSuccess = true;

		// 主控台印出每個商品並確認庫存是否足夠 & 把 order_detailVO們 收到 list 裡
		Map<Integer, ShoppingProduct> contentMap = cart.getContent();
		Set<Integer> cartKeys = contentMap.keySet();
		Iterator<Integer> it = cartKeys.iterator();
		List<Order_DetailVO> listODs = new ArrayList<Order_DetailVO>();
		while (it.hasNext()) {
			Order_DetailVO order_detailVO = new Order_DetailVO();

			Integer key = it.next();
			System.out.println("KKKKKKKKKKKKKKKKKKKKeys: " + key);
			System.out.println("ProductNo: "
					+ contentMap.get(key).getProductNo());
			System.out.println("Pic: " + contentMap.get(key).getPic());
			System.out.println("ProductName: "
					+ contentMap.get(key).getProductName());
			System.out
					.println("SaleType: " + contentMap.get(key).getSaleType());
			System.out.println("ProductNumber: "
					+ contentMap.get(key).getProductNumber());
			System.out.println("ProductPrice: "
					+ contentMap.get(key).getProductPrice());
			System.out.println("ProductSalesNumber: "
					+ contentMap.get(key).getSalesNumber());
			System.out
					.println("SubTotal: " + contentMap.get(key).getSubTotal());

			order_detailVO.setProductVO(contentMap.get(key).getProductVO());
			if (contentMap.get(key).getSalesNumber() > 0)
				order_detailVO.setOd_sales(true);
			else
				order_detailVO.setOd_sales(false);
			order_detailVO.setP_num(contentMap.get(key).getProductNumber());
			order_detailVO.setOd_price(contentMap.get(key).getSubTotal());

			if (contentMap.get(key).getProductVO().getP_num() < contentMap.get(
					key).getProductNumber()) {
				System.out.println("目前庫存數量("
						+ contentMap.get(key).getProductVO().getP_num()
						+ ")不足！");
				isSuccess = false;
			}
			listODs.add(order_detailVO);

		}

		// 收參數（收件人資訊）
		String o_recipient = request.getParameter("o_recipient");
		String o_recipient_addr = request.getParameter("o_recipient_addr");
		String o_recipient_tel = request.getParameter("o_recipient_tel");

		Map<String, String> errMap = new HashMap<String, String>();

		// 驗證參數們
		if (o_recipient == null || o_recipient.trim().length() < 3) {
			errMap.put("errRName", "請輸入完整姓名");
			o_recipient.trim();
		}
		if (o_recipient_addr == null || o_recipient_addr.trim().length() < 10) {
			errMap.put("errRAddr", "請輸入完整地址");
			o_recipient_addr.trim();
		}
		Pattern pattern = Pattern
				.compile("^\\(?\\d{2}\\)?[\\s\\-]?\\d{4}\\-?\\d{4}$");
		if (o_recipient_tel == null || o_recipient_tel.trim().length() < 6) {
			errMap.put("errRPhone", "請輸入完整電話號碼");
			o_recipient_tel = o_recipient_tel.trim();
		}
		// else if (pattern.matcher(o_recipient_tel).matches()) {
		// errMap.put("errRPhone", "請輸入正確電話號碼");
		// o_recipient_tel = o_recipient_tel.trim();
		// }

		// 如果收件人資訊驗證不 OK
		if (!errMap.isEmpty() || isSuccess == false) {
			request.setAttribute("o_recipient", o_recipient);
			request.setAttribute("o_recipient_addr", o_recipient_addr);
			request.setAttribute("o_recipient_tel", o_recipient_tel);
			request.setAttribute("errMap", errMap);
			isSuccess = false;

			// 如果收件人資訊驗證 OK
		} else {
			System.out.println("OOOOOOOOOOOOOKKKKKKKKKKKKKKKKKK");

			// 寫入訂單
			OrdersVO ordersVO = new OrdersVO();
			ordersVO.setM_no(memberVO.getM_no());
			ordersVO.setO_date(new java.sql.Date(new java.util.Date().getTime()));
			ordersVO.setO_shipping((Double) request
					.getAttribute("ShippingCost"));
			ordersVO.setO_recipient(o_recipient);
			ordersVO.setO_recipient_addr(o_recipient_addr);
			ordersVO.setO_recipient_tel(o_recipient_tel);
			ordersVO.setO_status("F");
			if (request.getParameter("useCoupon") != null) {
				CouponDAO couponDAO = new CouponDAO();
				ordersVO.setC_key("Y");
				ordersVO.setO_after_sales(new Integer(cart.getTotal()
						+ (Integer) (request.getSession()
								.getAttribute("ShippingCost"))
						- (couponDAO.findByPrimaryKey(request
								.getParameter("useCoupon"))).getC_price())
						.doubleValue());

				CouponVO couponVO = couponDAO.findByPrimaryKey(request
						.getParameter("useCoupon"));
				couponVO.setC_status(true); // used
				couponDAO.update(couponVO);

			} else {
				ordersVO.setO_after_sales(new Integer(cart.getTotal()
						+ (Integer) (request.getSession()
								.getAttribute("ShippingCost"))).doubleValue());
			}
			OrdersDAO ordersDAO = new OrdersDAO();
			ordersDAO.update(ordersVO);

			// 寫入明細 & 扣庫存
			List<OrdersVO> listOs = ordersDAO.getOrdersByM_no(memberVO
					.getM_no());
			ordersVO = listOs.get(0);
			ProductDAO productDAO = new ProductDAO();
			ProductVO productVO;
			for (Order_DetailVO theOrder_Detail : listODs) {
				theOrder_Detail.setO_no(ordersVO.getO_no());
				new Order_DetailDAO().update(theOrder_Detail);

				productVO = theOrder_Detail.getProductVO();
				productVO.setP_num(productVO.getP_num()
						- theOrder_Detail.getP_num());
				productDAO.update(productVO);

			}
			request.setAttribute("ordersVO", ordersVO);
			isSuccess = true;

		}

		return isSuccess;

	}

}
