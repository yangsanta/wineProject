package member.controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.MemberDAO;
import member.model.MemberDAO_interface;
import member.model.MemberHibernateDAO;
import member.model.MemberService;
import member.model.MemberVO;

public class MemberUpdate extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer m_no = (Integer) req.getSession().getAttribute("m_no");
				if(m_no==null){
					res.sendRedirect(req.getContextPath()+"/index.jsp");
					return;
				}
				MemberDAO memSvc = new MemberDAO();
				MemberVO memberVO = memSvc.findByPrimaryKey(m_no);

				if (memberVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memberVO", memberVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("memberVO", memberVO); // 資料庫取出的memberVO物件,存入req
				String url = "/memberCRUD/listOneMem.jsp";
				RequestDispatcher failureView = req
						.getRequestDispatcher("listOneMem.jsp");
				failureView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("listOneMem.jsp");
				failureView.forward(req, res);
			}
		}

		else if ("getOne_For_Update".equals(action)) { // 來自listAllMem.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer m_no = (Integer) req.getSession().getAttribute("m_no");
				if(m_no==null){
					res.sendRedirect(req.getContextPath()+"/index.jsp");
					return;
				}
				


				/*************************** 2.開始查詢資料 ****************************************/
				MemberService memSvc = new MemberService();
				MemberVO memberVO = memSvc.getOneMem(m_no);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("memberVO", memberVO); // 資料庫取出的memberVO物件,存入req
				String url = "/wine_admin/ademin_member_update.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交
																				// update_mem_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("select_page.jsp");
				failureView.forward(req, res);
			}
		}else	if ("member_update".equals(action)) { // 來自update_mem_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			Integer sm_no = (Integer) req.getSession().getAttribute("m_no");
			if(sm_no==null){
				res.sendRedirect(req.getContextPath()+"/index.jsp");
				return;
			}
			// try {
			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			Integer m_no = sm_no;
			String m_id = req.getParameter("m_id").trim();
			String m_name = req.getParameter("m_name").trim();
			String m_mobile = req.getParameter("m_mobile").trim();
			String m_email = req.getParameter("m_email").trim();
			String m_addr = req.getParameter("m_addr").trim();
			String m_pic = req.getParameter("m_pic").trim();
			String m_safety_q = req.getParameter("m_safety_q").trim();
			String m_safety_a = req.getParameter("m_safety_a").trim();
			Integer m_status = Integer.parseInt(req.getParameter("m_status").trim());
			String  m_bday  =req.getParameter("m_bday").trim();                      
			if(m_name.length()==0||m_mobile.length()==0||m_email.length()==0||m_addr.length()==0||m_bday.length()==0){
				
				req.setAttribute("update", "error"); // 資料庫update成功後,正確的的memberVO物件,存入req
				String url = "/member/Member_Info.jsp"; //listOneMemOK.jsp
				RequestDispatcher errorView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneMem.jsp
				errorView.forward(req, res);
				return; // 程式中斷
			}
					
				
			
             java.sql.Date bday = java.sql.Date.valueOf(m_bday);
			MemberVO memberVO = new MemberDAO().findByPrimaryKey(m_no);

			memberVO.setM_no(m_no);
			memberVO.setM_id(m_id);
			memberVO.setM_name(m_name);

			memberVO.setM_mobile(m_mobile);
			memberVO.setM_email(m_email);
			memberVO.setM_bday(bday);
			memberVO.setM_addr(m_addr);
			memberVO.setM_pic(m_pic);
			memberVO.setM_safety_q(m_safety_q);
			memberVO.setM_safety_a(m_safety_a);
			memberVO.setM_status(m_status);
			
			// Send the use back to the form, if there were errors
			

			/*************************** 2.開始修改資料 *****************************************/

			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
			new MemberDAO().update(memberVO);
			
			req.setAttribute("update", "success"); // 資料庫update成功後,正確的的memberVO物件,存入req
			String url = "/member/Member_Info.jsp"; //listOneMemOK.jsp
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneMem.jsp
			successView.forward(req, res);

			/*************************** 其他可能的錯誤處理 *************************************/
			// } catch (Exception e) {
			// errorMsgs.add("修改資料失敗:"+e.getMessage());
			//
			// RequestDispatcher failureView = req
			// .getRequestDispatcher("/memberCRUD/listOneMem.jsp");
			// failureView.forward(req, res);
			// }
		}

		else	if ("password_update".equals(action)) { // 來自update_mem_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer m_no = (Integer) req.getSession().getAttribute("m_no");
				if(m_no==null){
					res.sendRedirect(req.getContextPath()+"/index.jsp");
					return;
				}
				

				String m_pwd = req.getParameter("m_pwd").trim();
				String Password = req.getParameter("Password").trim();
				String PasswordChecked = req.getParameter("PasswordChecked").trim();
				MemberDAO_interface dao = new MemberHibernateDAO();
				MemberVO memberVO = dao.findByPrimaryKey(m_no);
				
				
				MessageDigest md= MessageDigest.getInstance("MD5");
				byte[] b = m_pwd.trim().getBytes();
			
			byte[] hash = md.digest(b);
			StringBuilder pwd = new StringBuilder();
			for (byte bb : hash) {
				pwd.append(String.format("%02X", bb));
			}
				
				
				
				if (!memberVO.getM_pwd().equals(pwd.toString())) {
					req.setAttribute("error", "你輸入的密碼不正確!!!");
					RequestDispatcher failureView = req
							.getRequestDispatcher("/listOneMemPass.jsp");
					failureView.forward(req, res);
					return;
				}else if(!PasswordChecked.equals(Password)){
					req.setAttribute("error", "請確認再次確認你的新密碼!!!");
					RequestDispatcher failureView = req
							.getRequestDispatcher("/listOneMemPass.jsp");
					failureView.forward(req, res);
					return;
					
				}
				else {
					
					if (Password.length() < 8) {
						errorMsgs.add("密碼不能為空值且長度必須大於8");
					}
					if (!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req
								.getRequestDispatcher("/listOneMemPass.jsp");
						failureView.forward(req, res);
						return; // 程式中斷
					}
					byte[] b2 = Password.trim().getBytes();
					
					byte[] hash2 = md.digest(b2);
					StringBuilder newpwd = new StringBuilder();
					for (byte bb : hash2) {
						newpwd.append(String.format("%02X", bb));
					}
					memberVO.setM_pwd(newpwd.toString());
					dao.update(memberVO);

					req.setAttribute("memberVO", memberVO); // 資料庫update成功後,正確的的memberVO物件,存入req
					String url = "/member/Member_Info.jsp";

					RequestDispatcher successView = req
							.getRequestDispatcher(url); // 修改成功後,轉交listOneMem.jsp
					successView.forward(req, res);
				}
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());

				RequestDispatcher failureView = req
						.getRequestDispatcher("/listOneMemPass.jsp");
				failureView.forward(req, res);
			}
		}else{
			res.sendRedirect(req.getContextPath()+"/index.jsp");
			return;		
			}
	
	}
}
