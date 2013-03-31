package member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.MemberHibernateDAO;
import member.model.MemberVO;

import orders.model.OrdersDAO;
import orders.model.OrdersVO;
import coupon.model.CouponDAO;
import coupon.model.CouponVO;

public class MemberService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberService() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String UrlStr = "/member/Member_Info.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(UrlStr);
		rd.forward(request, response);
		
	}

}
