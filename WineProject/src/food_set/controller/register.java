package food_set.controller;

import ingredient.model.IngredientDAO;
import ingredient.model.IngredientVO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.ProductDAO;
import product.model.ProductVO;
import sauce.model.SauceDAO;
import sauce.model.SauceVO;
import food.model.FoodDAO;
import food.model.FoodVO;
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
		Food_setVO food_setVO = new Food_setVO();			//這隻java檔的url是setin.do
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");

		Food_setHibernateDAO DAO = new Food_setHibernateDAO();
		List<String> errorMsg = new ArrayList<String>();
		request.setAttribute("ErrorMsgKey", errorMsg);

		if (action.equals("foodsetin")) {

			food_setVO.setProductVO(new ProductDAO().findByPrimaryKey(Integer
					.parseInt(request.getParameter("p_no"))));
			food_setVO.setFoodVO(new FoodDAO().findByPrimaryKey(Integer
					.parseInt(request.getParameter("f_id"))));
			food_setVO.setIngredientVO(new IngredientDAO()
					.findByPrimaryKey(Integer.parseInt(request
							.getParameter("i_id"))));
			food_setVO.setSauceVO(new SauceDAO().findByPrimaryKey(Integer
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
			
			//確認是否已存在同筆資料
			List<Food_setVO> list = DAO.getSomeFISP(Integer.parseInt(f_id), Integer.parseInt(i_id), Integer.parseInt(s_id), Integer.parseInt(p_no));
			if ( list.size() > 0){
				errorMsg.add("已有相同餐酒搭配資料");
			}
			
			if (!errorMsg.isEmpty()) {
				RequestDispatcher rd = request //除非已有相同搭配，或被惡意手動輸入傳值 不然大概永遠不會跑到這邊來
						.getRequestDispatcher("/wine_admin/ademin_Fs_Error.jsp");
				rd.forward(request, response);
				return;
			} else {


			DAO.insert(food_setVO);
			request.setAttribute("update", "success");
			response.sendRedirect(request.getContextPath()+"/wine_admin/food.do?action=Foodsetall");
	
				return;}
		}
		// 刪除
		if (action.equals("foodsetdel")) {
			int fs_id = Integer.parseInt(request.getParameter("fs_id"));
			DAO.delete(fs_id);
			request.setAttribute("del", "success");
			response.sendRedirect(request.getContextPath()+"/wine_admin/food.do?action=Foodsetall");
				return;
		}
		// 修改
		if (action.equals("foodsetupdate")) { //餐酒搭配的更新

			// 1. 讀取使用者輸入資料
			String fs_id = request.getParameter("fs_id");

			food_setVO.setFs_id(new Integer(fs_id));
			
			food_setVO.setProductVO(new ProductDAO().findByPrimaryKey(Integer
					.parseInt(request.getParameter("p_no"))));
			food_setVO.setFoodVO(new FoodDAO().findByPrimaryKey(Integer
					.parseInt(request.getParameter("f_id"))));
			food_setVO.setIngredientVO(new IngredientDAO()
					.findByPrimaryKey(Integer.parseInt(request
							.getParameter("i_id"))));
			food_setVO.setSauceVO(new SauceDAO().findByPrimaryKey(Integer
					.parseInt(request.getParameter("s_id"))));


			DAO.update(food_setVO);
			request.setAttribute("update", "success");
			response.sendRedirect(request.getContextPath()+"/wine_admin/food.do?action=Foodsetall");
				return;

		}
	}
}
