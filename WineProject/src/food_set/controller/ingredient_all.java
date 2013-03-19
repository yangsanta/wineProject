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

import sauce.model.SauceHibernateDAO;
import sauce.model.SauceVO;
import food.model.FoodHibernateDAO;
import food.model.FoodVO;

@WebServlet("/recipefood1")
public class ingredient_all extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ingredient_all() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String action = request.getParameter("action");

		FoodHibernateDAO foodHibernateDAO = new FoodHibernateDAO();
		List<FoodVO> list = foodHibernateDAO.getAll();
		request.setAttribute("Food", list);

		IngredientHibernateDAO ingredientDAO = new IngredientHibernateDAO();
		List<IngredientVO> list1 = ingredientDAO.getAll();
		request.setAttribute("Ingredient", list1);

		SauceHibernateDAO SauceDAO = new SauceHibernateDAO();
		List<SauceVO> list2 = SauceDAO.getAll();
		request.setAttribute("Sauce", list2);

		RequestDispatcher rd = request.getRequestDispatcher("/FoodWine/ingredient_all.jsp");
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

}
