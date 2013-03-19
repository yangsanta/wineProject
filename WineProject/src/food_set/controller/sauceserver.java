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

import food.model.FoodHibernateDAO;
import food.model.FoodVO;

import sauce.model.SauceDAO;
import sauce.model.SauceHibernateDAO;
import sauce.model.SauceVO;

public class sauceserver extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public sauceserver() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");

		SauceHibernateDAO DAO = new SauceHibernateDAO();
		List<String> errorMsg = new ArrayList<String>();
		request.setAttribute("ErrorMsgKey", errorMsg);

		if (action.equals("saucein")) {
			// 1. 讀取使用者輸入資料
			String s_name = request.getParameter("s_name");
			// 2. 檢查使用者輸入資料
			if (s_name == null || s_name.trim().length() == 0) {
				errorMsg.add("請輸入「風味特色」");
				RequestDispatcher rd = request
						.getRequestDispatcher("/FoodWine/error.jsp");
				rd.forward(request, response);
				return;
			}
			if (!errorMsg.isEmpty()) {
				RequestDispatcher rd = request
						.getRequestDispatcher("/FoodWine/error.jsp");
				rd.forward(request, response);
				return;
			}
			// 3. 使用DAO.insert()去新增資料
			SauceVO sauceVo = new SauceVO();
			sauceVo.setS_name(s_name);
			DAO.insert(sauceVo);

			if (errorMsg.isEmpty()) {
				RequestDispatcher rd = request
						.getRequestDispatcher("/FoodWine/Success.jsp");
				rd.forward(request, response);
				return;
			} else {
				RequestDispatcher rd = request
						.getRequestDispatcher("/FoodWine/error.jsp");
				rd.forward(request, response);
				return;

			}

		}
		// 4 刪除
		if (action.equals("saucedel")) {
			int s_id = Integer.parseInt(request.getParameter("s_id"));
			DAO.delete(s_id);
			if (errorMsg.isEmpty()) {
				RequestDispatcher rd = request
						.getRequestDispatcher("/FoodWine/Success.jsp");
				rd.forward(request, response);
				return;
			} else {
				RequestDispatcher rd = request
						.getRequestDispatcher("/FoodWine/error.jsp");
				rd.forward(request, response);
				return;
			}
		}
	}
}
