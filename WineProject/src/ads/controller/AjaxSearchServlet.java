package ads.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import product.model.ProductDAO;
import product.model.ProductVO;


public class AjaxSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String queryProducts = request.getParameter("queryProducts");
		queryProducts = queryProducts.trim();
		if (queryProducts.equals("#"))
			queryProducts="";
		
		ProductDAO productDAO = new ProductDAO();
		List<ProductVO> list = productDAO.findFuzzyProductName(queryProducts);
		
		JSONArray jsonArray = new JSONArray();
		for (ProductVO productVO : list){
			String p_no = productVO.getP_no().toString();
			String p_name = productVO.getP_name();
			String str = p_no + ": " + p_name;
			jsonArray.put(str);
		}
		
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonArray.toString());
	}

}
