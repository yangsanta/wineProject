package admin_board.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin_board.model.Admin_boardHibernateDAO;
import admin_board.model.Admin_boardVO;

public class admin_board extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public admin_board() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");


		Admin_boardHibernateDAO Admin_boardHibernateDAO = new Admin_boardHibernateDAO();
		//取得Useragents  作業系統 瀏覽器等資料
		List<Admin_boardVO> list = null;
		list = Admin_boardHibernateDAO.getagents();
		request.getSession().setAttribute("list", list);

		//取得站外連結等資料
		List<Admin_boardVO> lastReferer = null;
		lastReferer = Admin_boardHibernateDAO.getlastReferer();
		request.getSession().setAttribute("lastReferer", lastReferer);
		
		//取得訪客數
		Map<String, String> visiter;
		try {
			visiter = Admin_boardHibernateDAO.getvisiterJDBC();
		
		request.getSession().setAttribute("visiter", visiter);	
		//取得pv
		Map<String, String> pv =  Admin_boardHibernateDAO.getpv();
		request.getSession().setAttribute("pv", pv);	
				
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/wine_admin/admin_board.jsp");
		rd.forward(request, response);
		return;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}