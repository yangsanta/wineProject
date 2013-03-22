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
		// response.setCharacterEncoding("UTF-8");
		// HttpSession Session = request.getSession();

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
					.getRequestDispatcher("/wine_admin/ademin_Fs_FsInsert.jsp");
			rd.forward(request, response);

			// response.sendRedirect("/WineProject/wine_admin/ademin_Fs_FsInsert.jsp");

		}
		if (action.equals("Foodsetall")) {
			ProductHibernateDAO productHibernateDAO = new ProductHibernateDAO();
			List<ProductVO> list3 = productHibernateDAO.getAll();
			request.setAttribute("Product", list3);

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
					.getRequestDispatcher("/wine_admin/ademin_Fs_FsAll.jsp");
			rd.forward(request, response);

			// response.sendRedirect("/WineProject/wine_admin/ademin_Fs_FsAll.jsp");

		}
		if (action.equals("Foodset001")) {
			ProductHibernateDAO productHibernateDAO = new ProductHibernateDAO();
			List<ProductVO> list3 = productHibernateDAO.getAll();
			request.setAttribute("Product", list3);

			
			Food_setHibernateDAO food_setHibernateDAO1 = new Food_setHibernateDAO();
			List<Food_setVO> food_set_fid1 = food_setHibernateDAO1.getSomebyF_id(1);
			request.setAttribute("food_set_fid1", food_set_fid1);
			
			Food_setHibernateDAO food_setHibernateDAO2 = new Food_setHibernateDAO();
			List<Food_setVO> food_set_fid2 = food_setHibernateDAO2.getSomebyF_id(2);
			request.setAttribute("food_set_fid2", food_set_fid2);
			
			Food_setHibernateDAO food_setHibernateDAO3 = new Food_setHibernateDAO();
			List<Food_setVO> food_set_fid3 = food_setHibernateDAO3.getSomebyF_id(3);
			request.setAttribute("food_set_fid3", food_set_fid3);
			
			Food_setHibernateDAO food_setHibernateDAO4 = new Food_setHibernateDAO();
			List<Food_setVO> food_set_fid4 = food_setHibernateDAO4.getSomebyF_id(4);
			request.setAttribute("food_set_fid4", food_set_fid4);
			
			Food_setHibernateDAO food_setHibernateDAO5 = new Food_setHibernateDAO();
			List<Food_setVO> food_set_fid5 = food_setHibernateDAO5.getSomebyF_id(5);
			request.setAttribute("food_set_fid5", food_set_fid5);
			
			Food_setHibernateDAO food_setHibernateDAO6 = new Food_setHibernateDAO();
			List<Food_setVO> food_set_fid6 = food_setHibernateDAO6.getSomebyF_id(6);
			request.setAttribute("food_set_fid6", food_set_fid6);

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

			RequestDispatcher rd = request
					.getRequestDispatcher("/wine_admin/ademin_Fs_FsUpdate.jsp");
			rd.forward(request, response);

			// response.sendRedirect("/WineProject/wine_admin/ademin_Fs_FsUpdate.jsp");

		} else if (action.equals("FoodAll")) {
			FoodHibernateDAO foodHibernateDAO = new FoodHibernateDAO();
			List<FoodVO> list = foodHibernateDAO.getAll();
			request.setAttribute("Food", list);

			RequestDispatcher rd = request
					.getRequestDispatcher("/wine_admin/ademin_Fs_FAll.jsp");
			rd.forward(request, response);

			// response.sendRedirect("/WineProject/wine_admin/ademin_Fs_FAll.jsp");

		} else if (action.equals("IngredientAll")) {

			IngredientHibernateDAO ingredientDAO = new IngredientHibernateDAO();
			List<IngredientVO> list1 = ingredientDAO.getAll();
			request.setAttribute("Ingredient", list1);

			RequestDispatcher rd = request
					.getRequestDispatcher("/wine_admin/ademin_Fs_IAll.jsp");
			rd.forward(request, response);

			// response.sendRedirect("/WineProject/wine_admin/ademin_Fs_IAll.jsp");

		} else if (action.equals("SauceAll")) {

			SauceHibernateDAO SauceDAO = new SauceHibernateDAO();
			List<SauceVO> list2 = SauceDAO.getAll();
			request.setAttribute("Sauce", list2);

			RequestDispatcher rd = request
					.getRequestDispatcher("/wine_admin/ademin_Fs_SAll.jsp");
			rd.forward(request, response);

			// response.sendRedirect("/WineProject/wine_admin/ademin_Fs_SAll.jsp");

		}

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);

	}

}
