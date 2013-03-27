package orders.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import order_detail.model.Order_DetailDAO;
import orders.model.OrdersDAO;
import orders.model.OrdersVO;

public class OrdersAdminFacade {
	HttpServletRequest request = null;
	HttpServletResponse response = null;

	public OrdersAdminFacade() {
		System.out.println("OrdersFacade Constructor without Parameter!");
	}

	public OrdersAdminFacade(HttpServletRequest request,
			HttpServletResponse response) {
		this.request = request;
		this.response = response;
	}

	public void getall() {
		List<OrdersVO> theOrders = new OrdersDAO().getAll();
		request.setAttribute("theOrders", theOrders);
	}

	public void detete(Integer o_no) {
		new OrdersDAO().delete(o_no);
		
	}

	public void edit(Integer o_no) {
		OrdersDAO ordersDAO = new OrdersDAO();
		OrdersVO ordersVO = ordersDAO.findByPrimaryKey(o_no);
		if ( ordersVO.getO_status().equals("F") ){
			ordersVO.setO_status("T");
		} else {
			ordersVO.setO_status("F");
		}
		ordersDAO.update(ordersVO);
		
	}

	public  Integer ordernumber() {
		OrdersDAO ordersDAO = new OrdersDAO();
		Integer ordersVO = ordersDAO.getNewodercount();
	System.out.println("跑了ordernumber");
	 return ordersVO;
	}
}
