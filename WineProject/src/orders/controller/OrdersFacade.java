package orders.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

}
