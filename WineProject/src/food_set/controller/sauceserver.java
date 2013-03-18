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
		SauceVO sauceVo = new SauceVO();

		request.setCharacterEncoding("UTF-8");
		SauceHibernateDAO DAO = new SauceHibernateDAO();
		sauceVo.setS_name(request.getParameter("s_name"));
		
		List<String> errorMsg = new ArrayList<String>();
		request.setAttribute("ErrorMsgKey", errorMsg);
		// 1. 讀取使用者輸入資料
		String s_name = request.getParameter("s_name");

		// 3. 檢查使用者輸入資料
		if (s_name == null || s_name.trim().length() == 0) {
			errorMsg.add("請輸入「風味」");
		}
		if (!errorMsg.isEmpty()) {
			RequestDispatcher rd = request.getRequestDispatcher("/error.jsp");
			rd.forward(request, response);
			return;
		}

	}
}
