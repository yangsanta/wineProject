package member.controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.Security;

import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import coupon.controller.CouponFacade;

import tools.GmailSender;

import member.model.MemberHibernateDAO;
import member.model.MemberVO;

public class MemberPwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String m_id = request.getParameter("m_id");
		MemberHibernateDAO memberDAO = new MemberHibernateDAO();
		
		try {
			MemberVO memberVO = memberDAO.findInformationByM_id(m_id);
			if(memberVO!=null){
			String newPwd = CouponFacade.createPwd();
			System.out.println(newPwd);
			MessageDigest md= MessageDigest.getInstance("MD5");
			byte[] b = newPwd.trim().getBytes();
		
		byte[] hash = md.digest(b);
		StringBuilder pwd = new StringBuilder();
		for (byte bb : hash) {
			pwd.append(String.format("%02X", bb));
		}
			memberVO.setM_pwd(pwd.toString());
			memberDAO.update(memberVO);
			
	        Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());  
	        String[] sendTomail = { memberVO.getM_email() }; 
	        
			
        
	        try {
				new GmailSender().sendSSLMessage(sendTomail, "酒迷網站 - 密碼更新", "您的帳號 "+memberVO.getM_id()+" 密碼已更新：" + newPwd, "oneeeit66@gmail.com");
			} catch (MessagingException e) {
				System.out.println(sendTomail);
				e.printStackTrace();
			}
			}else{
				String UrlStr = "/WineProject/member/forgotpwd.jsp";
				request.setAttribute("errorMId", "對不起!!查無此帳號");
				RequestDispatcher rd=request.getRequestDispatcher("../member/forgotpwd.jsp");
				rd.forward(request, response);
//				response.sendRedirect(UrlStr);
				return;
			}
		} catch (IndexOutOfBoundsException e) {
			System.out.println("忘記密碼功能：無該帳號！");
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String UrlStr = "/WineProject/member/sentpwd.jsp";
		response.sendRedirect(UrlStr);
	}

}
