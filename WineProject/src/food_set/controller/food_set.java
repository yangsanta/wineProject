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

/**
 * Servlet implementation class recipefood
 */
@WebServlet("/recipefood")
public class food_set extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public food_set() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
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
		request.setAttribute("Ingredient", list);

		SauceHibernateDAO SauceDAO = new SauceHibernateDAO();
		List<SauceVO> list2 = SauceDAO.getAll();
		request.setAttribute("Sauce", list1);

		RequestDispatcher rd = request.getRequestDispatcher("/food_set.jsp");
		rd.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

}
