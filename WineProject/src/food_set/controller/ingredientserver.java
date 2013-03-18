package food_set.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ingredient.model.IngredientDAO;
import ingredient.model.IngredientHibernateDAO;
import ingredient.model.IngredientVO;

public class ingredientserver extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public ingredientserver() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		IngredientVO ingredientVo = new IngredientVO();

		request.setCharacterEncoding("UTF-8");
		IngredientHibernateDAO DAO = new IngredientHibernateDAO();
		ingredientVo.setI_name(request.getParameter("i_name"));
		
		List<String> errorMsg = new ArrayList<String>();
		request.setAttribute("ErrorMsgKey", errorMsg);
		// 1. 讀取使用者輸入資料
		String i_name = request.getParameter("i_name");

		// 3. 檢查使用者輸入資料
		if (i_name == null || i_name.trim().length() == 0) {
			errorMsg.add("請輸入「主要食材」");
		}
		if (!errorMsg.isEmpty()) {
			RequestDispatcher rd = request.getRequestDispatcher("/error.jsp");
			rd.forward(request, response);
			return;
		}

	}
}
