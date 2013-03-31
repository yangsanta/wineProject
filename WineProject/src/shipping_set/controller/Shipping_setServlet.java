package shipping_set.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shipping_set.model.Shipping_setDAO;
import shipping_set.model.Shipping_setVO;

public class Shipping_setServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		Integer min_pirce = Integer.valueOf(request.getParameter("min_pirce"));
		Shipping_setDAO dao = new Shipping_setDAO();
//		Shipping_setVO shipping_setVO = dao.getAll().get(0);
//		shipping_setVO.setMin_pirce(min_pirce);

		dao.updateShippingMinPrice(min_pirce);
		
		response.sendRedirect("/WineProject/wine_admin/couponsetadmin.do?action=getAll");
		
	}

}
