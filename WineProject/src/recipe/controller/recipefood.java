package recipe.controller;

import ingredient.model.IngredientDAO;
import ingredient.model.IngredientVO;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;

import sauce.model.SauceDAO;
import sauce.model.SauceVO;
import food.model.FoodDAO;
import food.model.FoodVO;

/**
 * Servlet implementation class recipefood
 */
@WebServlet("/recipefood")
public class recipefood extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public recipefood() {
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

		
			IngredientDAO ingredientDAO = new IngredientDAO();
	
			List<IngredientVO> list = ingredientDAO.getAll();
			request.setAttribute("Ingredient", list);
		

			SauceDAO SauceDAO = new SauceDAO();
			//Integer id = Integer.parseInt(request.getParameter("id"));
			List<SauceVO> list1 = SauceDAO.getAll();
			request.setAttribute("Sauce", list1);

		
	
		RequestDispatcher rd=request.getRequestDispatcher("/recipe.jsp");
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
