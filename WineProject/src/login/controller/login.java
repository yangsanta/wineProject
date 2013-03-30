package login.controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tools.InputFilter;

import member.model.MemberHibernateDAO;
import member.model.MemberVO;

public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public login() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		InputFilter inputfilter = new InputFilter();
		// 登出功能
				try {
		String action = request.getParameter("action");
		if ("logout".equals(action)) {
			// if (session.getAttribute("access") == "y") {
			session.invalidate();
			response.sendRedirect(request.getContextPath()
					+ "/index.jsp?loginout=y");
			// } else {
			// response.sendRedirect(request.getContextPath() + "/login.jsp");
			// }
			return; // 停止
		}
		// 登入功能
		MemberHibernateDAO dao = new MemberHibernateDAO();
		List<String> errorMsgs = new ArrayList<String>();
		request.setAttribute("ErrorMsgKey", errorMsgs);
		String m_id = inputfilter.sizeFomat(request.getParameter("m_id").trim(),20);
		System.out.println(m_id);
		String m_pwd = inputfilter.sizeFomat(request.getParameter("m_pwd").trim(),16);
		System.out.println(m_pwd);
		session.setAttribute("access", "n");
		

		if (m_id != null && m_id.length() != 0 && m_pwd != null
				&& m_pwd.length() != 0) {
			MessageDigest md;
		
					md = MessageDigest.getInstance("MD5");
				
		
			byte[] b = m_pwd.trim().getBytes();
		
		byte[] hash = md.digest(b);
		StringBuilder pwd = new StringBuilder();
		for (byte bb : hash) {
			pwd.append(String.format("%02X", bb));
		}
			MemberVO member = dao.Login(m_id, pwd.toString());
			if (member != null) {
				// 登入成功狀況
				session.setAttribute("access", "y");
				// 讀取前次來源網址 (referer)
				String referer = (String) request.getAttribute("referer");

				session.setAttribute("m_id", member.getM_id()); // 會員帳號
				session.setAttribute("m_no", member.getM_no()); // 會員編號
				session.setAttribute("m_name", member.getM_name()); // 會員姓名
				session.setAttribute("m_pwd", member.getM_pwd()); // 會員密碼
				session.setMaxInactiveInterval(3600);
				String redirestpage = null;
				// 跳轉回原頁面
				String uri = (String) session.getAttribute("uri");

				if (uri == null) {
					if (referer != null) {
						response.sendRedirect(referer);
					} else {
						redirestpage = (request.getHeader("REFERER").indexOf(
								'?') < 0) ? "?login=y" : "&login=y";
						response.sendRedirect(request.getHeader("REFERER")
								+ redirestpage);
						// response.sendRedirect("accesspage.jsp");
					}
				} else {
					if (session.getAttribute("action") != null) {
						uri = uri + "?" + session.getAttribute("action");
					}
					
					session.removeAttribute("action");
					session.removeAttribute("uri");
					response.sendRedirect(uri);
				}
			} else {
				System.out.println("failed!!");

				errorMsgs.add("帳號密碼不符，請重新登入");
				request.setAttribute("ErrorMsgKey", errorMsgs);
				RequestDispatcher dis = request
						.getRequestDispatcher("../errorLogin.jsp");
				dis.forward(request, response);
			}
	
		} else {
			errorMsgs.add("帳號或密碼不能為空白");
			request.setAttribute("ErrorMsgKey", errorMsgs);
			RequestDispatcher dis = request
					.getRequestDispatcher("../errorLogin.jsp");
			dis.forward(request, response);
		}} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
