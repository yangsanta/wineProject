package member.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tools.InputFilter;

import member.model.MemberDAO_interface;
import member.model.MemberHibernateDAO;
import member.model.MemberService;
import member.model.MemberVO;

public class MemberServlet extends HttpServlet {

	InputFilter inputfilter = new InputFilter();
	
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
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("m_id");
				
				
				Integer m_id = null;
				
				/***************************2.開始查詢資料*****************************************/
				MemberService memSvc = new MemberService();
				MemberVO memberVO = memSvc.getOneMem(m_id);

				if (memberVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/wine_admin/ademin_member_update.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("memberVO", memberVO); // 資料庫取出的memberVO物件,存入req
				String url = "/memberCRUD/listOneMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneMem.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/wine_admin/ademin_member_update.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("getOne_For_Update".equals(action)) { // 來自listAllMem.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				Integer m_no = new Integer(req.getParameter("m_no"));
				
				/***************************2.開始查詢資料****************************************/
				MemberService memSvc = new MemberService();
				MemberVO memberVO = memSvc.getOneMem(m_no);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("memberVO", memberVO);         // 資料庫取出的memberVO物件,存入req
				String url = "/wine_admin/ademin_member_update.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_mem_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/wine_admin/ademin_member_update.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("update".equals(action)) { // 來自update_mem_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				Integer m_no = new Integer(req.getParameter("m_no").trim());
				String m_id = req.getParameter("m_id").trim();
				String m_name = req.getParameter("m_name").trim();
				String m_pwd = req.getParameter("m_pwd").trim();
				String m_mobile = req.getParameter("m_mobile").trim();
				String m_email = req.getParameter("m_email").trim();
				String m_addr = req.getParameter("m_addr").trim();
				String m_pic = req.getParameter("m_pic").trim();
				String m_safety_q = req.getParameter("m_safety_q").trim();
				String m_safety_a = req.getParameter("m_safety_a").trim();
				Integer m_status = new Integer(req.getParameter("m_status").trim());
				
				if (m_id == null || m_id.trim().length() == 0) {
					errorMsgs.add("請輸入「帳號」");
				}
				if (m_pwd == null || m_pwd.trim().length() == 0) {
					errorMsgs.add("請輸入「密碼」");
				}
				if (m_name == null || m_name.trim().length() == 0) {
					errorMsgs.add("請輸入「姓名」");
				}
				if (m_email == null || m_email.trim().length() == 0) {
					errorMsgs.add("請輸入「Email」");
				}
				if (m_mobile == null || m_mobile.trim().length() == 0) {
					errorMsgs.add("請輸入「行動電話號碼」");
				}
				if (m_addr == null || m_addr.trim().length() == 0) {
					errorMsgs.add("請輸入「通訊地址」");
				}
				
				java.sql.Date m_bday = null;
				try {
					m_bday = java.sql.Date.valueOf(req.getParameter("m_bday").trim());
				} catch (IllegalArgumentException e) {
					m_bday = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				

				MemberVO memberVO = new MemberVO();
				
				memberVO.setM_no(m_no);
				memberVO.setM_id(m_id);				
				memberVO.setM_name(m_name);
				memberVO.setM_pwd(m_pwd);
				memberVO.setM_mobile(m_mobile);
				memberVO.setM_email(m_email);
				memberVO.setM_bday(m_bday);
				memberVO.setM_addr(m_addr);
				memberVO.setM_pic(m_pic);
				memberVO.setM_safety_q(m_safety_q);
				memberVO.setM_safety_a(m_safety_a);
				memberVO.setM_status(m_status);
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memberVO", memberVO); // 含有輸入格式錯誤的memberVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/wine_admin/ademin_member_update.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				MemberService memSvc = new MemberService();
				memberVO = memSvc.updateMem(m_no, m_id, m_name, m_pwd, m_mobile, m_email, m_bday, m_addr, m_pic, m_safety_q,
						m_safety_a, m_status);
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("memberVO", memberVO); // 資料庫update成功後,正確的的memberVO物件,存入req
				String url = "/wine_admin/ademin_member_updateOK.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneMem.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/wine_admin/ademin_member_update.jsp");
				failureView.forward(req, res);
			}
		}

        
		
		
		
	}
}
