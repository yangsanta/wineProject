package food_set.controller;

import food.model.FoodVO;
import ingredient.model.IngredientHibernateDAO;
import ingredient.model.IngredientVO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");

		IngredientHibernateDAO DAO = new IngredientHibernateDAO();
		List<String> errorMsg = new ArrayList<String>();
		request.setAttribute("ErrorMsgKey", errorMsg);

		if (action.equals("ingin")) {
			// 1. 讀取使用者輸入資料
			String i_name = request.getParameter("i_name");
			// 2. 檢查使用者輸入資料
			if (i_name == null || i_name.trim().length() == 0) {
				errorMsg.add("請輸入「主要食材」");
			}else{
			// 3. 使用DAO.insert()去新增資料
			IngredientVO ingredientVo = new IngredientVO();
			ingredientVo.setI_name(i_name);
			DAO.insert(ingredientVo);}
		}
		// 4 刪除
		if (action.equals("Ingreddel")) {
			int i_id = Integer.parseInt(request.getParameter("i_id"));
			DAO.delete(i_id);

		}
		// 5修改
		if (action.equals("ingupdate")) {

			int i_id = Integer.parseInt(request.getParameter("i_id"));
			String i_name = request.getParameter("i_name");

			IngredientVO ingredientVO3 = new IngredientVO();
			ingredientVO3.setI_id(new Integer(i_id));
			ingredientVO3.setI_name(i_name);
			if (i_name == null || i_name.trim().length() == 0) {
				errorMsg.add("請輸入「主要食材」");
			}
			DAO.update(ingredientVO3);
		}
					if (errorMsg.isEmpty()) {
				RequestDispatcher rd = request
						.getRequestDispatcher("/wine_admin/ademin_Fs_Success.jsp");
				rd.forward(request, response);
				return;
			} else {
				RequestDispatcher rd = request
						.getRequestDispatcher("/wine_admin/food.do?action=Foodsetinsert");
				rd.forward(request, response);
				return;
			}
	}
}
