package recipe.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;

import recipe.model.RecipeDAO;
import food.model.FoodDAO;
import food.model.FoodVO;
import recipe.model.RecipeDAO;
import recipe.model.RecipeVO;

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

		if (action.equals("select1")) {
			FoodDAO foodDAO = new FoodDAO();
			List<FoodVO> list = foodDAO.getAll();

			List l1 = new LinkedList();

			for (FoodVO food : list) {
				Map m1 = new HashMap();
				m1.put("f_id", food.getf_id());
				m1.put("f_name", food.getf_name());
				l1.add(m1);
			}

			String jsonString = JSONValue.toJSONString(l1);
			response.getWriter().println(jsonString);
		}
		if (action.equals("select2")) {
			RecipeDAO recipeDAO = new RecipeDAO();
			List<RecipeVO> list = recipeDAO.getAll();

			List l2 = new LinkedList();

			for (RecipeVO recipe : list) {
				Map m2 = new HashMap();
				m2.put("f_id", recipe.getF_id());
				m2.put("i_id", recipe.getI_id());
				//m1.put("f_name", recipe.getf_name());
				l2.add(m2);
							
			}

			String jsonString = JSONValue.toJSONString(l2);
			response.getWriter().println(jsonString);
		}
		
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
