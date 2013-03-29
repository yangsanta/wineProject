package coupon_set.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import coupon_set.model.Coupon_setVO;

public class Coupon_setServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Coupon_setFacade facade = new Coupon_setFacade(request, response);
		
		String action = null;
		try {
			action = request.getParameter("action");
		} catch (NullPointerException e) {
			action = "getAll";
			
		}
		
		if (action.equals("getAll")){
			List<Coupon_setVO> clist = facade.getAll();
			
			request.setAttribute("clist", clist);
			request.getRequestDispatcher("/wine_admin/ademin_Shipping.jsp").forward(request, response);
		}
		
		if (action.equals("addCouponSet")){
			try {
				Integer new_cs_limit_price = Integer.valueOf(request.getParameter("new_cs_limit_price"));
				Integer new_cs_price = Integer.valueOf(request.getParameter("new_cs_price"));
			
				facade.addCouponSet(new_cs_limit_price, new_cs_price);
			
				String jsonStr = facade.createJson(facade.getAll());
				response.getWriter().write(jsonStr);
			
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
			
		}
		
		if (action.equals("deleteCouponSet")){
			Integer cs_limit_price = Integer.valueOf(request.getParameter("cs_limit_price"));
			
			facade.deleteCouponSet(cs_limit_price);
			
			String jsonStr = facade.createJson(facade.getAll());
			response.getWriter().write(jsonStr);
		}
		
	} //doPost
	
}
