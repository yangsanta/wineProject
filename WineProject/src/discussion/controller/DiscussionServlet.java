package discussion.controller;

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

import member.model.MemberVO;
import discussion.model.*;


public class DiscussionServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		String url = req.getRequestURI();
		req.setAttribute("url", url);
		DiscussionHibernateDAO dao = new DiscussionHibernateDAO();
		
		List<String> errorMsgs = new LinkedList<String>();
		// Store this set in the request scope, in case we need to
		// send the ErrorPage view.
		req.setAttribute("errorMsgs", errorMsgs);

		try {
			//�[�ݥD�D����\��
			if ("getOne".equals(action)) {

				String str = req.getParameter("d_no");
				int d_no = new Integer(str);
//				System.out.println(d_no);
				DiscussionVO discussionVO = dao.findByPrimaryKey(d_no);
				
				if (discussionVO == null) {
					errorMsgs.add("�d�L���");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher(url);
					failureView.forward(req, res);
					return;// �{�����_
				}

				req.setAttribute("discussionVO", discussionVO); // ��Ʈw���X��VO����,�s�Jreq
				RequestDispatcher successView = req.getRequestDispatcher("/discussion/listOneDiscussion.jsp"); // ���\���
				successView.forward(req, res);
			}
			
			//�s�W�D�D�\��
			if("insert".equals(action)){
				//����ק令�qsession����|���s��
				int m_no = 1001;
				//�D�D�r�ꪺ�ˬd
				String d_title = req.getParameter("d_title").trim();
				if(d_title == null){
					errorMsgs.add("�п�J�峹�D�D");
				}
				//���媺�ˬd
				String d_context = req.getParameter("d_context");
				if(d_context.length() < 20){
					errorMsgs.add("�峹���e�п�J�W�L20�r");
				} 

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher(url);
					failureView.forward(req, res);
					return;// �{�����_
				}
				
				//�]�w�s�W���D�D����Ѽ�
				Timestamp time = new java.sql.Timestamp(new java.util.Date().getTime());
				String d_status = "1";
				DiscussionVO discussionVO = new DiscussionVO();
				MemberVO memberVO = new MemberVO();
				memberVO.setM_no(m_no);
				discussionVO.setMemberVO(memberVO);
				discussionVO.setD_title(d_title);
				discussionVO.setD_context(d_context);
				discussionVO.setD_datetime(time);
				discussionVO.setD_final_edit(time);
				discussionVO.setD_status(d_status);
				dao.insert(discussionVO);

				req.setAttribute("discussionVO", discussionVO); // ��Ʈw���X��VO����,�s�Jreq
				RequestDispatcher successView = req.getRequestDispatcher("DiscussionList"); // ���\���
				successView.forward(req, res);
			}
			
			
		} catch (Exception e) {
			errorMsgs.add("�L�k���o���:" + e.getMessage());
			RequestDispatcher failureView = req
					.getRequestDispatcher("DiscussionList");
			failureView.forward(req, res);
		}
	}

}
