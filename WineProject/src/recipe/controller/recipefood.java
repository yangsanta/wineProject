package recipe.controller;

import ingredient.model.IngredientDAO;
import ingredient.model.IngredientVO;
import sauce.model.SauceDAO;
import sauce.model.SauceVO;

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

import food.model.FoodDAO;
import food.model.FoodVO;

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
				m1.put("f_id", food.getF_id());
				m1.put("f_name", food.getF_name());
				l1.add(m1);
			}

			String jsonString = JSONValue.toJSONString(l1);
			response.getWriter().println(jsonString);
		}
		if (action.equals("select2")) {
			IngredientDAO ingredientDAO = new IngredientDAO();
			Integer id = Integer.parseInt(request.getParameter("id"));
			List<IngredientVO> list = ingredientDAO.getf_id(id);

			List l2 = new LinkedList();

			for (IngredientVO ingredient : list) {
				Map m2 = new HashMap();
				m2.put("i_id", ingredient.getI_id());
//				 System.out.println("f_id", ingredient.getf_id());
				m2.put("i_name", ingredient.getI_name());
				l2.add(m2);

			}

			String jsonString = JSONValue.toJSONString(l2);
			//System.out.println(jsonString);
			response.getWriter().println(jsonString);
		}
		if (action.equals("select3")) {
			SauceDAO SauceDAO = new SauceDAO();
			Integer id = Integer.parseInt(request.getParameter("id"));
			List<SauceVO> list = SauceDAO.geti_id(id);

			List l3 = new LinkedList();

			for (SauceVO sauce : list) {
				Map m3 = new HashMap();
				m3.put("s_id", sauce.getS_id());
				m3.put("s_name", sauce.getS_name());
				l3.add(m3);

			}

			String jsonString = JSONValue.toJSONString(l3);
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
