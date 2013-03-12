package member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.MemberDAO;
import member.model.MemberVO;
import order_detail.model.Order_DetailDAO;
import orders.model.OrdersDAO;
import orders.model.OrdersJDBCDAO;
import orders.model.OrdersVO;

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
//		MemberDAO memberDAO = new MemberDAO();
//		MemberVO memberVO = memberDAO.findByPrimaryKey(1001);
//		request.getSession().setAttribute("m_no", memberVO.getM_no());
//		request.getSession().setAttribute("m_id", memberVO.getM_id());
		
		Integer m_no = (Integer)request.getSession().getAttribute("m_no");
		
		OrdersDAO ordersDAO = new OrdersDAO();
		List<OrdersVO> theOrders = ordersDAO.getOrdersByM_no(m_no);	//Added a method in OrdersDAO.java for this line.
		request.setAttribute("theOrders", theOrders);
		
		
		String UrlStr = "/member/Member_Info.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(UrlStr);
		rd.forward(request, response);
	}

}
