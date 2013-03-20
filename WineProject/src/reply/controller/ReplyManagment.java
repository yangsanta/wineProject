package reply.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.MemberVO;

import reply.model.ReplyHibernateDAO;
import reply.model.ReplyVO;

@WebServlet("/ReplyServlet")
public class ReplyManagment extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		ReplyHibernateDAO dao = new ReplyHibernateDAO();

		List<String> errorMsgs = new ArrayList<String>();
		// Store this set in the request scope, in case we need to
		// send the ErrorPage view.
		req.setAttribute("errorMsgs", errorMsgs);

		try {
			if ("insert".equals(action)) {
				ReplyVO replyVO = new ReplyVO();
				String url = req.getRequestURI();
				req.setAttribute("url", url);
				Integer d_no = Integer.valueOf(req.getParameter("d_no"));
				String r_context = req.getParameter("r_context");
				Timestamp time = new java.sql.Timestamp(
						new java.util.Date().getTime());
				// 之後修改成從session獲取會員編號
				int m_no = 1001;
				MemberVO memberVO = new MemberVO();
				memberVO.setM_no(m_no);

				if(r_context.trim().length() < 10){				//推文的檢查
					errorMsgs.add("推文內容請輸入超過10字");
				}
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("ErrorMsgKey", errorMsgs);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/error.jsp");//導入錯誤處理頁面
					failureView.forward(req, res);
					return;										// 程式中斷
				}
				
				replyVO.setD_no(d_no);
				replyVO.setR_context(r_context);
				replyVO.setR_status("0");
				replyVO.setR_datetime(time);
				replyVO.setR_final_edit(time);
				replyVO.setMemberVO(memberVO);
				dao.insert(replyVO);
				res.sendRedirect("DiscussionList?action=getOne&d_no=" + d_no);
			}

			
			if ("invisible".equals(action)) {
				Integer d_no = Integer.valueOf(req.getParameter("d_no"));
				Integer r_no = Integer.valueOf(req.getParameter("r_no"));
				String r_context = req.getParameter("r_context");
				Integer m_no = Integer.valueOf(req.getParameter("m_no"));
				Timestamp r_datetime = Timestamp.valueOf(req
						.getParameter("r_datetime"));
				String r_status = req.getParameter("r_status");
				Timestamp r_final_edit = Timestamp.valueOf(req
						.getParameter("r_final_edit"));
				
				if(r_status.equals("ooo")){
					r_status = "xxx";
				} else{
					r_status = "ooo";
				}
				MemberVO memberVO = new MemberVO();
				memberVO.setM_no(m_no);
				
				ReplyVO replyVO = new ReplyVO();
				replyVO.setD_no(d_no);
				replyVO.setMemberVO(memberVO);
				replyVO.setR_context(r_context);
				replyVO.setR_datetime(r_datetime);
				replyVO.setR_final_edit(r_final_edit);
				replyVO.setR_no(r_no);
				replyVO.setR_status(r_status);
			}
		} catch (Exception e) {

		}

	}

}