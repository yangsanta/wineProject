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


public class listOneMem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public listOneMem() {
        super();
 
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		Integer no=(Integer)session.getAttribute("m_no");
		MemberHibernateDAO dao=new MemberHibernateDAO();
		MemberVO memberVO=dao.findByPrimaryKey(no);
		request.setAttribute("memberVO", memberVO);
		RequestDispatcher rd=request.getRequestDispatcher("/listOneMem.jsp");
		rd.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
