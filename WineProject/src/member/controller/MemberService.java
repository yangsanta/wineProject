package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.MemberDAO;
import member.model.MemberVO;

public class MemberService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberService() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//for testing
		MemberDAO memberDAO = new MemberDAO();
		MemberVO memberVO = memberDAO.findByPrimaryKey(1002);
		request.getSession().setAttribute("theMember", memberVO);
		
		MemberVO theMember = (MemberVO)request.getSession().getAttribute("theMember");
		String m_id = theMember.getM_id();
		request.setAttribute("m_id", m_id);
		
		String UrlStr = "/member/Member_Info.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(UrlStr);
		rd.forward(request, response);
	}

}
