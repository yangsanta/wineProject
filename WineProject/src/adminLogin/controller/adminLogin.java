package adminLogin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adminLogin.model.AdminLoginHibernateDAO;
import adminLogin.model.AdminLoginVO;

public class adminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public adminLogin() {
		super();
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		AdminLoginHibernateDAO dao = new AdminLoginHibernateDAO();
		HttpSession session = request.getSession();
		List<String> errorMsgs = new  ArrayList<String>();
		request.setAttribute("ErrorMsgKey", errorMsgs);
		String a_id = request.getParameter("a_id").trim();
		String a_pwd = request.getParameter("a_pwd").trim();

		session.setAttribute("admin_access", "n");

		if (a_id != null && a_id.length() != 0 && a_pwd != null
				&& a_pwd.length() != 0) {
			AdminLoginVO member = dao.Login(a_id, a_pwd);
			if (member != null) {
				// 登入成功狀況
				session.setAttribute("admin_access", "y");

				session.setAttribute("a_id", member.getA_id()); // 會員帳號
				session.setAttribute("a_no", member.getA_no()); // 會員編號
				session.setAttribute("a_name", member.getA_name()); // 會員姓名
				session.setAttribute("a_pic", member.getA_pic()); // 會員圖片
				session.setMaxInactiveInterval(3600);
				System.out.println("success!!");
				

				response.sendRedirect(request.getContextPath()+"/wine_admin/admin_board.do?login=y");
			} else {
				System.out.println("failed!!");
				errorMsgs.add("帳號密碼不符，請重新登入");
				request.setAttribute("ErrorMsgKey", errorMsgs);
				RequestDispatcher dis = request
						.getRequestDispatcher("index.jsp");
				dis.forward(request, response);
			}
		} else {
			errorMsgs.add("帳號或密碼不能為空白");
			request.setAttribute("ErrorMsgKey", errorMsgs);
			RequestDispatcher dis = request
					.getRequestDispatcher("index.jsp");
			dis.forward(request, response);
		}

		// if(request.getParameter("m_id") != null &&
		// request.getParameter("m_id").trim().length() != 0 &&
		// request.getParameter("m_pwd") != null &&
		// request.getParameter("m_pwd").trim().length() != 0 ){
		// session.setAttribute("access","y") ;
		// session.setAttribute("accessid",request.getParameter("m_id")) ;
		// session.setMaxInactiveInterval(3600) ;
		// response.sendRedirect("accesspage.jsp") ;
		// }else
		// System.out.println("密碼帳號不符 !!") ;
	}
}
