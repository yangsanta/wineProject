package food_set.controller;

import ingredient.model.IngredientHibernateDAO;
import ingredient.model.IngredientVO;

import java.io.IOException;
import java.util.List;

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
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
//		response.setCharacterEncoding("UTF-8");

		String action = request.getParameter("action");

		if (action.equals("Foodsetinsert")) {
			ProductHibernateDAO productHibernateDAO = new ProductHibernateDAO();
			List<ProductVO> list4 = productHibernateDAO.getAll();
			request.setAttribute("Product", list4);

			FoodHibernateDAO foodHibernateDAO = new FoodHibernateDAO();
			List<FoodVO> list = foodHibernateDAO.getAll();
			request.setAttribute("Food", list);

			IngredientHibernateDAO ingredientDAO = new IngredientHibernateDAO();
			List<IngredientVO> list1 = ingredientDAO.getAll();
			request.setAttribute("Ingredient", list1);

			SauceHibernateDAO SauceDAO = new SauceHibernateDAO();
			List<SauceVO> list2 = SauceDAO.getAll();
			request.setAttribute("Sauce", list2);

			RequestDispatcher rd = request
					.getRequestDispatcher("/FoodWine/food_set_insert.jsp");
			rd.forward(request, response);

		}
		if (action.equals("Foodsetall")) {
			ProductHibernateDAO productHibernateDAO = new ProductHibernateDAO();
			List<ProductVO> listˇ = productHibernateDAO.getAll();
			request.setAttribute("Product", listˇ);

			Food_setHibernateDAO food_setHibernateDAO = new Food_setHibernateDAO();
			List<Food_setVO> list4 = food_setHibernateDAO.getAll();
			request.setAttribute("Food_set", list4);

			FoodHibernateDAO foodHibernateDAO = new FoodHibernateDAO();
			List<FoodVO> list = foodHibernateDAO.getAll();
			request.setAttribute("Food", list);

			IngredientHibernateDAO ingredientDAO = new IngredientHibernateDAO();
			List<IngredientVO> list1 = ingredientDAO.getAll();
			request.setAttribute("Ingredient", list1);

			SauceHibernateDAO SauceDAO = new SauceHibernateDAO();
			List<SauceVO> list2 = SauceDAO.getAll();
			request.setAttribute("Sauce", list2);

			RequestDispatcher rd = request
					.getRequestDispatcher("/FoodWine/food_set_all.jsp");
			rd.forward(request, response);

		}
		if (action.equals("Foodsetupdate")) {
			ProductHibernateDAO productHibernateDAO = new ProductHibernateDAO();
			List<ProductVO> listˇ = productHibernateDAO.getAll();
			request.setAttribute("Product", listˇ);

			Food_setHibernateDAO food_setHibernateDAO = new Food_setHibernateDAO();
			List<Food_setVO> list4 = food_setHibernateDAO.getAll();
			request.setAttribute("Food_set", list4);

			FoodHibernateDAO foodHibernateDAO = new FoodHibernateDAO();
			List<FoodVO> list = foodHibernateDAO.getAll();
			request.setAttribute("Food", list);

			IngredientHibernateDAO ingredientDAO = new IngredientHibernateDAO();
			List<IngredientVO> list1 = ingredientDAO.getAll();
			request.setAttribute("Ingredient", list1);

			SauceHibernateDAO SauceDAO = new SauceHibernateDAO();
			List<SauceVO> list2 = SauceDAO.getAll();
			request.setAttribute("Sauce", list2);

			RequestDispatcher rd = request
					.getRequestDispatcher("/FoodWine/food_set_update.jsp");
			rd.forward(request, response);

		} else if (action.equals("FoodAll")) {
			FoodHibernateDAO foodHibernateDAO = new FoodHibernateDAO();
			List<FoodVO> list = foodHibernateDAO.getAll();
			request.setAttribute("Food", list);

			RequestDispatcher rd = request
					.getRequestDispatcher("/FoodWine/food_all.jsp");
			rd.forward(request, response);

		} else if (action.equals("IngredientAll")) {

			IngredientHibernateDAO ingredientDAO = new IngredientHibernateDAO();
			List<IngredientVO> list1 = ingredientDAO.getAll();
			request.setAttribute("Ingredient", list1);

			RequestDispatcher rd = request
					.getRequestDispatcher("/FoodWine/ingredient_all.jsp");
			rd.forward(request, response);
		} else if (action.equals("SauceAll")) {

			SauceHibernateDAO SauceDAO = new SauceHibernateDAO();
			List<SauceVO> list2 = SauceDAO.getAll();
			request.setAttribute("Sauce", list2);

			RequestDispatcher rd = request
					.getRequestDispatcher("/FoodWine/sauce_all.jsp");
			rd.forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);

	}

}
