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
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String m_no = req.getParameter("m_no");
				MemberDAO memSvc=new MemberDAO();
				MemberVO memberVO = memSvc.findByPrimaryKey(Integer.parseInt(m_no));

				if (memberVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memberVO", memberVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/memberCRUD/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("memberVO", memberVO); // 資料庫取出的memberVO物件,存入req
				String url = "/memberCRUD/listOneMem.jsp";
				RequestDispatcher failureView = req
						.getRequestDispatcher("/memberCRUD/listOneMem.jsp");
				failureView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/memberCRUD/listOneMem.jsp");
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
						.getRequestDispatcher("/memberCRUD/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		

        if ("insert".equals(action)) { // 來自addMem.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String nm_name = req.getParameter("m_name").trim();
				String job = req.getParameter("job").trim();
				
				
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
							.getRequestDispatcher("/memberCRUD/addMem.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				MemberService memSvc = new MemberService();
				memberVO = memSvc.addMem(m_no, m_id, m_name, m_pwd, m_mobile, m_email, m_bday, m_addr, m_pic, m_safety_q,
						m_safety_a, m_status);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/memberCRUD/listAllMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllMem.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/memberCRUD/addMem.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		
			if ("member_update".equals(action)) { // 來自update_mem_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
	
//			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				Integer m_no = new Integer(req.getParameter("m_no").trim());
				String m_id = req.getParameter("m_id").trim();
				String m_name = req.getParameter("m_name").trim();	
				String m_mobile = req.getParameter("m_mobile").trim();
				String m_email = req.getParameter("m_email").trim();
				String m_addr = req.getParameter("m_addr").trim();
				String m_pic = req.getParameter("m_pic").trim();
				String m_safety_q = req.getParameter("m_safety_q").trim();
				String m_safety_a = req.getParameter("m_safety_a").trim();
				Integer m_status = new Integer(req.getParameter("m_status").trim());
				
				java.sql.Date m_bday = null;
				try {
					m_bday = java.sql.Date.valueOf(req.getParameter("m_bday").trim());
				} catch (IllegalArgumentException e) {
					m_bday = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
			
				MemberVO memberVO = new MemberDAO().findByPrimaryKey(m_no);
				
				memberVO.setM_no(m_no);
				memberVO.setM_id(m_id);				
				memberVO.setM_name(m_name);
		
				memberVO.setM_mobile(m_mobile);
				memberVO.setM_email(m_email);
				memberVO.setM_bday(m_bday);
				memberVO.setM_addr(m_addr);
				memberVO.setM_pic(m_pic);
				memberVO.setM_safety_q(m_safety_q);
				memberVO.setM_safety_a(m_safety_a);
				memberVO.setM_status(m_status);
				new MemberDAO().update(memberVO);
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memberVO", memberVO); // 含有輸入格式錯誤的memberVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/memberCRUD/listOneMem.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("memberVO", memberVO); // 資料庫update成功後,正確的的memberVO物件,存入req
				String url = "/memberCRUD/listOneMemOK.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneMem.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
//			} catch (Exception e) {
//				errorMsgs.add("修改資料失敗:"+e.getMessage());
//				
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/memberCRUD/listOneMem.jsp");
//				failureView.forward(req, res);
//			}
		}
			
			
			if ("password_update".equals(action)) { // 來自update_mem_input.jsp的請求
				
				List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
			
				try {
					/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
					Integer m_no = new Integer(req.getParameter("m_no").trim());
				     
					String m_pwd = req.getParameter("m_pwd").trim();
					String Password = req.getParameter("Password").trim();
					
					MemberDAO_interface dao =new MemberHibernateDAO();
					MemberVO memberVO	= dao.findByPrimaryKey(m_no);
					memberVO.setM_pwd(Password);
					dao.update(memberVO);			
					
					req.setAttribute("memberVO", memberVO); // 資料庫update成功後,正確的的memberVO物件,存入req
					String url = "/member/Member_Info.jsp";
					
					HttpSession session = req.getSession();
					
					RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneMem.jsp
					successView.forward(req, res);

					/***************************其他可能的錯誤處理*************************************/
				} catch (Exception e) {
					errorMsgs.add("修改資料失敗:"+e.getMessage());
					
					RequestDispatcher failureView = req
							.getRequestDispatcher("/memberCRUD/pwdChange.jsp");
					failureView.forward(req, res);
				}
			}
	}
}
