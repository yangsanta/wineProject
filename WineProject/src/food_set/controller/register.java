/*package food_set.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sauce.model.SauceVO;
import ingredient.model.IngredientVO;
import food.model.FoodVO;
import food_set.model.Food_setDAO;
import food_set.model.Food_setHibernateDAO;
import food_set.model.Food_setVO;

public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public register() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Food_setVO food_setVo = new Food_setVO();

		request.setCharacterEncoding("UTF-8");
		Food_setHibernateDAO DAO = new Food_setHibernateDAO();
		food_setVo.setFs_id(Integer.parseInt(request.getParameter("fs_id")));
		food_setVo.setFoodVO(new FoodVO(Integer.parseInt(request.getParameter("f_id"))));
		food_setVo.setIngredientVO(new IngredientVO(Integer.parseInt(request.getParameter("i_id"))));
		food_setVo.setSauceVO(new SauceVO(Integer.parseInt(request.getParameter("s_id"))));

		List<String> errorMsg = new ArrayList<String>();
		request.setAttribute("ErrorMsgKey", errorMsg);
		// 1. 讀取使用者輸入資料
		String fs_id = request.getParameter("fs_id");
		String f_id = request.getParameter("f_id");
		String i_id = request.getParameter("i_id");
		String s_id = request.getParameter("s_id");

		// 3. 檢查使用者輸入資料
		if (fs_id == null || fs_id.trim().length() == 0) {
			errorMsg.add("請輸入「商品」");
		}
		if (f_id == null || f_id.trim().length() == 0) {
			errorMsg.add("請輸入「食物種類」");
		}
		if (i_id == null || i_id.trim().length() == 0) {
			errorMsg.add("請輸入「主要食材」");
		}
		if (s_id == null || s_id.trim().length() == 0) {
			errorMsg.add("請輸入「風味」");
		}
		if (!errorMsg.isEmpty()) {
			RequestDispatcher rd = request.getRequestDispatcher("/error.jsp");
			rd.forward(request, response);
			return;
		}

	}
}
*/