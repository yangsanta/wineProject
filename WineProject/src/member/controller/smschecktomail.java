package member.controller;

import java.io.IOException;
import java.util.ArrayList;
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
import tools.InputFilter;
import coupon.model.CouponDAO;
import coupon.model.CouponVO;

public class smschecktomail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public smschecktomail() {
		super();
	}

	InputFilter inputfilter = new InputFilter();

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		Integer smscheck =  Integer.parseInt(inputfilter.sizeFomat(request.getParameter("smscheck"), 7));  //來自user輸入

		Integer m_no = (Integer) request.getSession().getAttribute("m_no");    //session的會員編號
		Integer smscheck_num = (Integer) (request.getSession().getAttribute("smscheck_num"));//session的驗證碼
		if (smscheck.equals(smscheck_num)) {
			MemberHibernateDAO DAO = new MemberHibernateDAO();
			MemberVO memberVo = new MemberVO();
			memberVo.setM_no(m_no);
			memberVo.setM_smscheck(1);
			DAO.update(memberVo);
			
			//email
			//導向 成功頁面
			String UrlStr = "/success.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(UrlStr);
			rd.forward(request, response);
			
		}else{
		//倒回原頁面
			List<String> errorMsgs = new ArrayList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			errorMsgs.add("驗證碼錯誤");
			String UrlStr = "/smscheck.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(UrlStr);
			rd.forward(request, response);
		}
	}

}
