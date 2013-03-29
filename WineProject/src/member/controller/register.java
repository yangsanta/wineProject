package member.controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.MemberHibernateDAO;
import member.model.MemberVO;
import tools.InputFilter;
import coupon.controller.CouponFacade;
import coupon.model.CouponDAO;
import coupon.model.CouponVO;
import coupon_set.model.Coupon_setDAO;


@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public register() {
        super();
    }
   InputFilter inputfilter = new InputFilter();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		try {
	
	request.setCharacterEncoding("UTF-8");
	
	List<String> errorMsg = new ArrayList<String>();
	request.setAttribute("ErrorMsgKey", errorMsg);
	// 1. 讀取使用者輸入資料
	String m_id = inputfilter.sizeFomat(request.getParameter("m_id"),20);
	String m_name = inputfilter.sizeFomat(request.getParameter("m_name"),10);
	String m_pwd = inputfilter.sizeFomat(request.getParameter("m_pwd"),16);
	String m_mobile = inputfilter.sizeFomat(request.getParameter("m_mobile"),10);
	String m_email =inputfilter.sizeFomat( request.getParameter("m_email"),40);
	String m_bday = inputfilter.sizeFomat(request.getParameter("m_bday"),20);
	String m_addr = inputfilter.sizeFomat(request.getParameter("m_addr"),100);

	// 3. 檢查使用者輸入資料
	if (m_id == null || m_id.trim().length() == 0) {
		errorMsg.add("請輸入「帳號」");
	}
	if (m_pwd == null || m_pwd.trim().length() == 0) {
		errorMsg.add("請輸入「密碼」");
	}
	if (m_name == null || m_name.trim().length() == 0) {
		errorMsg.add("請輸入「姓名」");
	}
	if (m_email == null || m_email.trim().length() == 0) {
		errorMsg.add("請輸入「Email」");
	}
	if (m_mobile == null || m_mobile.trim().length() == 0) {
		errorMsg.add("請輸入「行動電話號碼」");
	}
	if (m_bday == null || m_bday.trim().length() == 0) {
		errorMsg.add("請輸入「生日」");
	}
	if (m_addr == null || m_addr.trim().length() == 0) {
		errorMsg.add("請輸入「通訊地址」");
	}
	if (!errorMsg.isEmpty()) {
		RequestDispatcher rd = request.getRequestDispatcher("/error.jsp");
		rd.forward(request, response);
		return;
	}
	
	

	// 4. 進行 Business Logic 運算
		MemberHibernateDAO DAO = new MemberHibernateDAO();
			if (DAO.findHaveName(m_id)!=0) {
				errorMsg.add("帳號 (" +  m_id  + ") 已存在，請選擇其它的帳號");
				RequestDispatcher rd = request.getRequestDispatcher("/error.jsp");
				rd.forward(request, response);
				return;
			} else {
					//過程完全無誤，新增會員帳號
				
//				MessageDigest md=null;
								
				MessageDigest md= MessageDigest.getInstance("MD5");
					byte[] b = m_pwd.trim().getBytes();
				
				byte[] hash = md.digest(b);
				StringBuilder pwd = new StringBuilder();
				for (byte bb : hash) {
					pwd.append(String.format("%02X", bb));
				}
				MemberVO memberVo = new MemberVO();
				memberVo.setM_id(m_id); 
				memberVo.setM_pwd(pwd.toString());
//				memberVo.setM_pwd(m_pwd);
				memberVo.setM_name(m_name);
				memberVo.setM_email(m_email);
				memberVo.setM_mobile(m_mobile);
				memberVo.setM_bday(new java.sql.Date(new java.util.Date().getTime()));
				memberVo.setM_addr(m_addr);
				memberVo.setM_status(1);
				DAO.insert(memberVo);
                int rand=(int)(Math.random()*100000+99999);
				
//				// 變數宣告
//				String msg;
//				String thisLine;
//				URL u;
//				URLConnection uc;
//
//				// 設定參數
//				String username = "davidou"; // 帳號
//				String password = ""; // 密碼
//				String mobile = m_mobile; // 電話  m_mobile 0971091213
//				String message = "hello!"+username+" 感謝您註冊成為酒迷的會員 以下是您的酒迷驗證碼:"+rand; // 簡訊內容
//
//				msg = "http://api.twsms.com/smsSend.php?username=" + username
//						+ "&password=" + password + "&mobile=" + mobile
//						+ "&message=" + URLEncoder.encode(message);
//
//				u = new URL(msg);
//				try {
//					uc = u.openConnection();
//					BufferedReader theHTML = new BufferedReader(
//							new InputStreamReader(uc.getInputStream()));
//					thisLine = theHTML.readLine();
//		
//					System.out.println(thisLine);//回傳訊息:
//				} catch (Exception e) {
//					System.out.println(e.getMessage());		//無法連結網站
//				}
				//// 簡訊結束
				MemberHibernateDAO dao = new MemberHibernateDAO();
				MemberVO member = dao.Login(m_id, pwd.toString());
				
				HttpSession session = request.getSession();

				if (member != null) {
					// 登入成功狀況
					session.setAttribute("access", "y");
					session.setAttribute("m_id", member.getM_id()); // 會員帳號
					session.setAttribute("m_no", member.getM_no()); // 會員編號
					session.setAttribute("m_name", member.getM_name()); // 會員姓名
					session.setAttribute("smscheck_num",rand); // 會員姓名
					session.setMaxInactiveInterval(3600);
				} 
				request.setAttribute("m_idKey", m_id);
				
				if (errorMsg.isEmpty())	{	
					//註冊成功贈送coupon
					String c_key = CouponFacade.createCoupon();
					Integer c_price = new Coupon_setDAO().getAll().get(0).getcs_price();
					CouponVO couponVO = new CouponVO();
					couponVO.setC_key(c_key);
					couponVO.setC_price(c_price);
					couponVO.setM_no(member.getM_no());
					couponVO.setC_status(true);
					couponVO.setC_deadline(new Timestamp(new java.util.Date().getTime()+30*60*60*24));
					new CouponDAO().insert(couponVO);
					
					System.out.println(c_key);
					request.setAttribute("newCoupon", couponVO);
					
					RequestDispatcher rd = request.getRequestDispatcher("/smscheck.jsp");
					rd.forward(request, response);
					return ; 
				}  else {
					RequestDispatcher rd = request.getRequestDispatcher("/error.jsp");
					rd.forward(request, response);
					return;
				}
								
				
				
						
									
				
			}
			// 5.依照 Business Logic 運算結果來挑選適當的畫面
	
		} catch (NoSuchAlgorithmException e) {
			
			e.printStackTrace();
			
		}
	}	


public static void main(String[] args) {
	
	String rand=String.valueOf( (int)(Math.random()*100000+99999));
	System.out.println(rand);
	
}
}
