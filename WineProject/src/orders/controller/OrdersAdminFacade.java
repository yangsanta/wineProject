package orders.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

}
