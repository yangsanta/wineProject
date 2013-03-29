package member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;
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
import tools.GmailSender;
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
		if (smscheck.equals(smscheck_num)) {//	確認簡訊驗證碼是否正確
			MemberHibernateDAO DAO = new MemberHibernateDAO();
			MemberVO memberVo = new MemberVO();
			
			
			
			MemberVO db_member = DAO.findByPrimaryKey(m_no); //從資料庫把資料撈回來update
			memberVo.setM_no(m_no);
			memberVo.setM_id(db_member.getM_id());
			memberVo.setM_name(db_member.getM_name());
			memberVo.setM_pwd(db_member.getM_pwd());
			memberVo.setM_mobile(db_member.getM_mobile());
			memberVo.setM_email(db_member.getM_email());
			memberVo.setM_bday(db_member.getM_bday());
			memberVo.setM_addr(db_member.getM_addr());
			memberVo.setM_pic(db_member.getM_pic());
			memberVo.setM_safety_q(db_member.getM_safety_q());
			memberVo.setM_safety_a(db_member.getM_safety_a());
			memberVo.setM_status(db_member.getM_status());

			memberVo.setM_smscheck(1);
			DAO.update(memberVo);
			
			//email
		     String[] sendTomail = { db_member.getM_email() }; //收件者mail
//		     String emailMsgTxt= db_member.getM_name()+" 您好：<br><br>您已將"+ db_member.getM_email()+" 輸入為 酒迷的聯絡電子郵件位址。並通過我們的手機安全性驗證。<br><br><br><hr>想知道您為何會收到此郵件嗎?<br>當有人註冊了成為本站的會員並通過手機安全性驗證，此郵件就會自動傳送。如果您沒有在我們網站註冊成為會員請用您的信箱("+db_member.getM_email()+")與我們連絡<br><br>如需更多資訊，請參閱常見問答集<br><br>感謝您，<br>JomeWine酒迷創意行銷 客戶支援<br><br><br>請注意：<br>	 此電子郵件係由系統自動產生，且由無人監管的信箱所寄送。 請勿回覆此電子郵件，因為您將不會收到回信。<br>copyright © 2013 JomeWine Inc.<br>保留一切權利 / 掌握最新資訊 / 隱私權政策  <br>";
		     StringBuffer html = new StringBuffer();
		     html.append( db_member.getM_name()+" 您好：<br><br>您已將"+ db_member.getM_email()+" 輸入為 酒迷的聯絡電子郵件位址。並通過我們的手機安全性驗證。<br>為了感謝您的註冊 在此送上一張50元的折價優待卷，請至會員專區查看<br><br><br><span style='font-size:10px;color: #ccc;'>請注意：</span><br><span style='font-size:10px;color: #ccc;'> 此電子郵件係由系統自動產生，且由無人監管的信箱所寄送。 請勿回覆此電子郵件，因為您將不會收到回信。</span><hr><b>想知道您為何會收到此郵件嗎?</b><br>當有人註冊了成為本站的會員並通過手機安全性驗證，此郵件就會自動傳送。如果您沒有在我們網站註冊成為會員請用您的信箱("+db_member.getM_email()+")與我們連絡，如需更多資訊，請參閱<a href='http://wine.davidou.org:8080/WineProject/commonQA.jsp'>常見問答集</a><br><br>感謝您，<br>JomeWine酒迷創意行銷 客戶支援<br><br><br>copyright © 2013 JomeWine Inc.<a href=''> 保留一切權利</a> / <a href='http://wine.davidou.org:8080/WineProject/product/DisplayProducts.do?action=getSome_For_Display&condition=p_date&conditionValue=0'>掌握最新資訊</a> / <a href='http://wine.davidou.org:8080/WineProject/privacy.jsp'>隱私權政策</a>  <br>");
		     String emailMsgTxt=html.toString();
		     try {
		        //	sendSSLMessage(sendTo, emailSubjectTxt, emailMsgTxt, emailFromAddress);  
					new GmailSender().sendSSLMessage(sendTomail, "歡迎!註冊成為酒迷的一份子",emailMsgTxt, "davidou123@hotmail.com");
				} catch (MessagingException e) {
					e.printStackTrace();
				}  
		        //email 結束
		        
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
