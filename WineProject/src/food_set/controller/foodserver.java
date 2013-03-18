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

import food.model.FoodDAO;
import food.model.FoodHibernateDAO;
import food.model.FoodVO;

public class foodserver extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public foodserver() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		FoodVO foodVo = new FoodVO();

		request.setCharacterEncoding("UTF-8");
		FoodHibernateDAO DAO = new FoodHibernateDAO();
		foodVo.setF_name(request.getParameter("f_name"));
		

		List<String> errorMsg = new ArrayList<String>();
		request.setAttribute("ErrorMsgKey", errorMsg);
		// 1. 讀取使用者輸入資料
		String f_name = request.getParameter("f_name");

		// 3. 檢查使用者輸入資料
		if (f_name == null || f_name.trim().length() == 0) {
			errorMsg.add("請輸入「食物種類」");
		}
		if (!errorMsg.isEmpty()) {
			RequestDispatcher rd = request.getRequestDispatcher("/error.jsp");
			rd.forward(request, response);
			return;
		}

	}
}
