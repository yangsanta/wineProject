package login.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.List;

import member.model.MemberHibernateDAO;
import member.model.MemberVO;

@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public login() {
		super();
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		MemberHibernateDAO dao = new MemberHibernateDAO();
		HttpSession session = request.getSession();
		List<String> errorMsgs = new  ArrayList<String>();
		request.setAttribute("ErrorMsgKey", errorMsgs);
		String m_id = request.getParameter("m_id").trim();
		String m_pwd = request.getParameter("m_pwd").trim();

		session.setAttribute("access", "n");

		if (m_id != null && m_id.length() != 0 && m_pwd != null
				&& m_pwd.length() != 0) {
			MemberVO member = dao.Login(m_id, m_pwd);
			if (member != null) {
				// 登入成功狀況
				session.setAttribute("access", "y");

				session.setAttribute("m_id", member.getM_id()); // 會員帳號
				session.setAttribute("m_no", member.getM_no()); // 會員編號
				session.setAttribute("m_name", member.getM_name()); // 會員姓名
				session.setMaxInactiveInterval(3600);
				System.out.println("success!!");
				
				String redirestpage= null;
				//跳轉回原頁面
				redirestpage=(request.getHeader("REFERER").indexOf('?')<0)?"?login=y":"&login=y";
				response.sendRedirect(request.getHeader("REFERER")+redirestpage);
//				response.sendRedirect("accesspage.jsp");
			} else {
				System.out.println("failed!!");
				errorMsgs.add("帳號密碼不符，請重新登入");
				request.setAttribute("ErrorMsgKey", errorMsgs);
				RequestDispatcher dis = request
						.getRequestDispatcher("errorLogin.jsp");
				dis.forward(request, response);
			}
		} else {
			errorMsgs.add("帳號或密碼不能為空白");
			request.setAttribute("ErrorMsgKey", errorMsgs);
			RequestDispatcher dis = request
					.getRequestDispatcher("errorLogin.jsp");
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
