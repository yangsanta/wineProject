package food_set.controller;

import ingredient.model.IngredientHibernateDAO;
import ingredient.model.IngredientVO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.ProductHibernateDAO;
import product.model.ProductVO;
import sauce.model.SauceHibernateDAO;
import sauce.model.SauceVO;
import food.model.FoodHibernateDAO;
import food.model.FoodVO;
import food_set.model.Food_setHibernateDAO;
import food_set.model.Food_setVO;

@WebServlet("/recipefood4")
public class food_set_all extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public food_set_all() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// response.setCharacterEncoding("UTF-8");
		// HttpSession Session = request.getSession();

		String action = request.getParameter("action");

		if (action.equals("Foodsetinsert")) {
			ProductHibernateDAO productHibernateDAO = new ProductHibernateDAO();
			List<ProductVO> Product = productHibernateDAO.getAll();
			request.setAttribute("Product", Product);

			FoodHibernateDAO foodHibernateDAO = new FoodHibernateDAO();
			List<FoodVO> Food = foodHibernateDAO.getAll();
			request.setAttribute("Food", Food);

			IngredientHibernateDAO ingredientDAO = new IngredientHibernateDAO();
			List<IngredientVO> Ingredient = ingredientDAO.getAll();
			request.setAttribute("Ingredient", Ingredient);

			SauceHibernateDAO SauceDAO = new SauceHibernateDAO();
			List<SauceVO> Sauce = SauceDAO.getAll();
			request.setAttribute("Sauce", Sauce);

			RequestDispatcher rd = request
					.getRequestDispatcher("/wine_admin/ademin_Fs_index.jsp");
			rd.forward(request, response);

		}
		if (action.equals("Foodsetall")) {  //進入修改餐酒搭配
			ProductHibernateDAO productHibernateDAO = new ProductHibernateDAO();
			List<ProductVO> Product = productHibernateDAO.getAll();
			request.setAttribute("Product", Product);

			Food_setHibernateDAO food_setHibernateDAO = new Food_setHibernateDAO();
			List<Food_setVO> Food_set = food_setHibernateDAO.getAll();
			request.setAttribute("Food_set", Food_set);

			FoodHibernateDAO foodHibernateDAO = new FoodHibernateDAO();
			List<FoodVO> Food = foodHibernateDAO.getAll();
			request.setAttribute("Food", Food);

			IngredientHibernateDAO ingredientDAO = new IngredientHibernateDAO();
			List<IngredientVO> Ingredient = ingredientDAO.getAll();
			request.setAttribute("Ingredient", Ingredient);

			SauceHibernateDAO SauceDAO = new SauceHibernateDAO();
			List<SauceVO> Sauce = SauceDAO.getAll();
			request.setAttribute("Sauce", Sauce);

			RequestDispatcher rd = request
					.getRequestDispatcher("/wine_admin/ademin_Fs_FsAll.jsp");
			rd.forward(request, response);

		}
		if (action.equals("Foodset001")) {
				//第三層
			Food_setHibernateDAO food_setHibernateDAO = new Food_setHibernateDAO();
			List<Food_setVO> DAOgetAll = food_setHibernateDAO.getAll();
			
			//-------------------------------------------------------------
			request.setAttribute("getAll", DAOgetAll);

			List<List<Food_setVO> > list = new ArrayList<List<Food_setVO>>();
			
			Integer getSecendcountI_id= food_setHibernateDAO.getSecendcountI_id(); //找出第二層不重複數
			
			for (int j = 1; j <= getSecendcountI_id; j++) {

				List<Food_setVO> getSomebyI_id = food_setHibernateDAO
						.getSomebyI_id(j);
				list.add(getSomebyI_id);

			}
			request.setAttribute("getSomebyI_id", list);
			
			//-------------------------------------------------------------
			Integer getlastReferer = food_setHibernateDAO.getlastReferer();
				//前台顯示 第二層
			for (int i = 1; i <= getlastReferer; i++) {

					Map<Integer, String> getSomebydF_id = food_setHibernateDAO
							.getSomebydF_id(i);
					request.setAttribute("getSomebydF_id"+i, getSomebydF_id);
				
			}

			// List<String> getSomebydF_id =
			// food_setHibernateDAO.getSomebydF_id(1);
			// request.setAttribute("getSomebydF_id", getSomebydF_id);
			// FoodHibernateDAO foodHibernateDAO = new FoodHibernateDAO();
			// List<FoodVO> list5 = foodHibernateDAO.getAll();
			// request.setAttribute("Food", list5);
			//
			// IngredientHibernateDAO ingredientDAO = new
			// IngredientHibernateDAO();
			// List<IngredientVO> list1 = ingredientDAO.getAll();
			// request.setAttribute("Ingredient", list1);
			//
			// SauceHibernateDAO SauceDAO = new SauceHibernateDAO();
			// List<SauceVO> list2 = SauceDAO.getAll();
			// request.setAttribute("Sauce", list2);

			RequestDispatcher rd = request
					.getRequestDispatcher("/food_set.jsp");
			rd.forward(request, response);

		}
		if (action.equals("Foodsetupdate")) {
			ProductHibernateDAO productHibernateDAO = new ProductHibernateDAO();
			List<ProductVO> list3 = productHibernateDAO.getAll();
			request.setAttribute("Product", list3);

			// Food_setHibernateDAO food_setHibernateDAO = new
			// Food_setHibernateDAO();
			// List<Food_setVO> list4 = food_setHibernateDAO.getAll();
			// request.setAttribute("Food_set", list4);

			FoodHibernateDAO foodHibernateDAO = new FoodHibernateDAO();
			List<FoodVO> list = foodHibernateDAO.getAll();
			request.setAttribute("Food", list);

			request.setAttribute("fs_id", request.getParameter("fs_id"));

			IngredientHibernateDAO ingredientDAO = new IngredientHibernateDAO();
			List<IngredientVO> list1 = ingredientDAO.getAll();
			request.setAttribute("Ingredient", list1);

			SauceHibernateDAO SauceDAO = new SauceHibernateDAO();
			List<SauceVO> list2 = SauceDAO.getAll();
			request.setAttribute("Sauce", list2);

			RequestDispatcher rd = request.getRequestDispatcher("/wine_admin/ademin_Fs_FsUpdate.jsp");
			rd.forward(request, response);

		} else if (action.equals("FoodAll")) {//修改食物種類的總頁面
			FoodHibernateDAO foodHibernateDAO = new FoodHibernateDAO();
			List<FoodVO> Food = foodHibernateDAO.getAll();
			request.setAttribute("Food", Food);
			request.setAttribute("Page", "Food");
			RequestDispatcher rd = request.getRequestDispatcher("/wine_admin/ademin_Fs_FAll.jsp");
			rd.forward(request, response);

		} else if (action.equals("IngredientAll")) { //修改主要食材的總頁面
			IngredientHibernateDAO ingredientDAO = new IngredientHibernateDAO();
			List<IngredientVO> Ingredient = ingredientDAO.getAll();
			request.setAttribute("Ingredient", Ingredient);

			RequestDispatcher rd = request.getRequestDispatcher("/wine_admin/ademin_Fs_IAll.jsp");
			rd.forward(request, response);

		} else if (action.equals("SauceAll")) { //修改風味特色的總頁面
			SauceHibernateDAO SauceDAO = new SauceHibernateDAO();
			List<SauceVO> Sauce = SauceDAO.getAll();
			request.setAttribute("Sauce", Sauce);

			RequestDispatcher rd = request.getRequestDispatcher("/wine_admin/ademin_Fs_SAll.jsp");
			rd.forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);

	}

}
