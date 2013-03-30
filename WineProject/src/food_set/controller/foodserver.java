package food_set.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.model.FoodDAO;
import food.model.FoodHibernateDAO;
import food.model.FoodVO;

public class foodserver extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public foodserver() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");

		FoodHibernateDAO DAO = new FoodHibernateDAO();
		List<String> errorMsg = new ArrayList<String>();
		request.setAttribute("ErrorMsgKey", errorMsg);

		if (action.equals("foodin")) {
			// 1. 讀取使用者輸入資料
			String f_name = request.getParameter("f_name");
			// 2. 檢查使用者輸入資料
			if (f_name == null || f_name.trim().length() == 0) {
				errorMsg.add("請輸入「食物種類」");
			}else{
			// 3. 使用DAO.insert()去新增資料
			FoodVO foodVo = new FoodVO();
			foodVo.setF_name(f_name);
			DAO.insert(foodVo);}
		}
		// 4 刪除
		if (action.equals("fooddel")) {
			int f_id = Integer.parseInt(request.getParameter("f_id"));
			DAO.delete(f_id);
		}
		// 5修改
		if (action.equals("foodup")) {

			int f_id = Integer.parseInt(request.getParameter("f_id"));
			String f_name = request.getParameter("f_name");

			if (f_name == null || f_name.trim().length() == 0) {
				errorMsg.add("請輸入「食物種類」");
			}else{

			FoodVO foodVO2 = new FoodVO();
			foodVO2.setF_id(new Integer(f_id));
			foodVO2.setF_name(f_name);
			DAO.update(foodVO2);}
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
