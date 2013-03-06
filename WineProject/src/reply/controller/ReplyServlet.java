package reply.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import discussion.model.DiscussionVO;

import member.model.MemberVO;

import reply.model.ReplyHibernateDAO;
import reply.model.ReplyVO;


@WebServlet("/ReplyServlet")
public class ReplyServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		ReplyHibernateDAO dao = new ReplyHibernateDAO();
		
		List<String> errorMsgs = new LinkedList<String>();
		// Store this set in the request scope, in case we need to
		// send the ErrorPage view.
		req.setAttribute("errorMsgs", errorMsgs);
		
		try{
			if ("insert".equals(action)) {
				ReplyVO replyVO = new ReplyVO();
				String url = req.getRequestURI();
				req.setAttribute("url", url);
				Integer d_no = Integer.valueOf(req.getParameter("d_no"));
				String  r_context = req.getParameter("r_context");
				Timestamp time = new java.sql.Timestamp(new java.util.Date().getTime());
				//之後修改成從session獲取會員編號
				int m_no = 1001;
				MemberVO memberVO = new MemberVO();
				memberVO.setM_no(m_no);

				replyVO.setD_no(d_no);
				replyVO.setR_context(r_context);
				replyVO.setR_status("0");
				replyVO.setR_datetime(time);
				replyVO.setR_final_edit(time);
				replyVO.setMemberVO(memberVO);
				dao.insert(replyVO);
				req.setAttribute("replyVO", replyVO); // 資料庫取出的VO物件,存入req
				RequestDispatcher successView = req.getRequestDispatcher("/DiscussionList?action=getOne"); // 成功轉交
				successView.forward(req, res);
			}	
		} catch (Exception e) {
			
		}
		
	}

}
