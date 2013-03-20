package food_set.controller;

import ingredient.model.IngredientDAO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.ProductDAO;
import sauce.model.SauceDAO;
import food.model.FoodDAO;
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
		String action = request.getParameter("action");

		System.out.println(request.getParameter("p_no"));
		System.out.println(request.getParameter("f_id"));
		System.out.println(request.getParameter("i_id"));
		System.out.println(request.getParameter("s_id"));

		Food_setHibernateDAO DAO = new Food_setHibernateDAO();
		List<String> errorMsg = new ArrayList<String>();
		request.setAttribute("ErrorMsgKey", errorMsg);

		if (action.equals("foodsetin")) {

			food_setVo.setProductVO(new ProductDAO().findByPrimaryKey(Integer
					.parseInt(request.getParameter("p_no"))));
			food_setVo.setFoodVO(new FoodDAO().findByPrimaryKey(Integer
					.parseInt(request.getParameter("f_id"))));
			food_setVo.setIngredientVO(new IngredientDAO()
					.findByPrimaryKey(Integer.parseInt(request
							.getParameter("i_id"))));
			food_setVo.setSauceVO(new SauceDAO().findByPrimaryKey(Integer
					.parseInt(request.getParameter("s_id"))));

			// 1. 讀取使用者輸入資料
			String p_no = request.getParameter("p_no");
			String f_id = request.getParameter("f_id");
			String i_id = request.getParameter("i_id");
			String s_id = request.getParameter("s_id");

			// 3. 檢查使用者輸入資料
			if (p_no == null || p_no.trim().length() == 0) {
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
				RequestDispatcher rd = request
						.getRequestDispatcher("/FoodWine/error.jsp");
				rd.forward(request, response);
				return;
			}
			// 4. 使用DAO.insert()去新增資料
			// Food_setVO food_setVo = new Food_setVO();
			// food_setVo.setFoodVO(foodVO);

			DAO.insert(food_setVo);

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
		// 刪除
		if (action.equals("foodsetdel")) {
			int fs_id = Integer.parseInt(request.getParameter("fs_id"));
			DAO.delete(fs_id);

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
		// 修改
		if (action.equals("foodsetupdate")) {

			int fs_id = Integer.parseInt(request.getParameter("fs_id"));
			
			Food_setVO food_setVO = new Food_setVO();
			food_setVO.setFs_id(new Integer(fs_id));

			food_setVo.setProductVO(new ProductDAO().findByPrimaryKey(Integer
					.parseInt(request.getParameter("p_no"))));
			food_setVo.setFoodVO(new FoodDAO().findByPrimaryKey(Integer
					.parseInt(request.getParameter("f_id"))));
			food_setVo.setIngredientVO(new IngredientDAO()
					.findByPrimaryKey(Integer.parseInt(request
							.getParameter("i_id"))));
			food_setVo.setSauceVO(new SauceDAO().findByPrimaryKey(Integer
					.parseInt(request.getParameter("s_id"))));

			// 1. 讀取使用者輸入資料
			String p_no = request.getParameter("p_no");
			String f_id = request.getParameter("f_id");
			String i_id = request.getParameter("i_id");
			String s_id = request.getParameter("s_id");
		}
	}
}
