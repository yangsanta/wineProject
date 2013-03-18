package food_set.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.model.FoodHibernateDAO;
import food.model.FoodVO;

public class foodserver extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public foodserver() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// request.setCharacterEncoding("UTF-8");
		// response.setCharacterEncoding("UTF-8");
		//
		// String action = request.getParameter("action");
		//
		// FoodHibernateDAO foodHibernateDAO = new FoodHibernateDAO();
		// List<FoodVO> list = foodHibernateDAO.getAll();
		// request.setAttribute("Food", list);
		//
		// RequestDispatcher rd =
		// request.getRequestDispatcher("/FoodWine/food_insert.jsp");
		// rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		FoodHibernateDAO DAO = new FoodHibernateDAO();

		List<String> errorMsg = new ArrayList<String>();
		request.setAttribute("ErrorMsgKey", errorMsg);

		// 1. 讀取使用者輸入資料
		String f_name = request.getParameter("f_name");
		// 2. 檢查使用者輸入資料
		if (f_name == null || f_name.trim().length() == 0) {
			errorMsg.add("請輸入「食物種類」");
		}
		if (!errorMsg.isEmpty()) {
			RequestDispatcher rd = request.getRequestDispatcher("/error.jsp");
			rd.forward(request, response);
			return;
		}
		// 3. 使用DAO.insert()去新增資料
		FoodVO foodVo = new FoodVO();
		foodVo.setF_name(f_name);
		DAO.insert(foodVo);
	}
}
