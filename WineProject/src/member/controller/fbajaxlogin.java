package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.MemberHibernateDAO;
import member.model.MemberVO;

public class fbajaxlogin  extends HttpServlet{

	 public fbajaxlogin() {
	        super();
	    }

		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doPost(request, response);
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession();
			request.setCharacterEncoding("UTF-8");
			String uid=request.getParameter("uid");
			String cname=request.getParameter("cname");
			String email=request.getParameter("email");
			String username=request.getParameter("username");

//取得資訊
			
			//1.先判斷資料庫有沒有這筆uid
			//如果沒有的話寫入資料庫
			MemberHibernateDAO dao = new MemberHibernateDAO();
			MemberVO member = dao.FBLogin(uid);
			if (member != null) { //以前登入過了 有這筆資料
				
			}
			else{  //第一次登入 資料庫目前尚無這筆資料
				MemberHibernateDAO DAO = new MemberHibernateDAO();
				MemberVO memberVo = new MemberVO();
				memberVo.setM_fbuid(uid);  //fb的iud
				memberVo.setM_smscheck(0);  //設定成未手機認證
				memberVo.setM_id(username); //帳號
				memberVo.setM_pwd("asdsdfsdgfasrtfr");
				memberVo.setM_name(cname); //暱稱
				memberVo.setM_email(email);
				memberVo.setM_bday(new java.sql.Date(new java.util.Date().getTime()));
				memberVo.setM_status(1);
				DAO.insert(memberVo);
				//註冊完後 重新取得資訊
				 member = dao.FBLogin(uid);
			}
			
			
			
			session.setAttribute("access", "y");
			session.setAttribute("m_id",username); // 會員帳號
			session.setAttribute("m_no", member.getM_no()); // 會員編號
			session.setAttribute("m_name", cname); // 會員姓名
			session.setMaxInactiveInterval(3600);
			
			
			String UrlStr = "/fbtest.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(UrlStr);
			rd.forward(request, response);
		}
}
