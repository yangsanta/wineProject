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
	
	static final int rowsPerPage = 3; 
	static int pageNumber = 0;  
	static int whichPage = 1;  
	static int pageIndexArray[] = null; 
	static int pageIndex = 0;  

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		DiscussionHibernateDAO dao = new DiscussionHibernateDAO();
		
		List<String> errorMsgs = new LinkedList<String>();
		// Store this set in the request scope, in case we need to
		// send the ErrorPage view.
		req.setAttribute("errorMsgs", errorMsgs);

		try {
			//觀看所有文章列表
			if ("getAll".equals(action)) {
//				String url = req.getRequestURI();
//				req.setAttribute("url", url);
				dao = new DiscussionHibernateDAO();
				List<DiscussionVO> list = dao.getAll();		//�C���i�J�d���O�C��ɡA�������Q�פ峹�����
				splitPages(list,req);
					RequestDispatcher dis = req
							.getRequestDispatcher("/discussion/listAllDiscussion.jsp"); 
					dis.forward(req, res);
				
			}
			
			//觀看主題內文功能
			if ("getOne".equals(action)) {
				String url = req.getRequestURI();
				req.setAttribute("url", url);
				System.out.println(url);
				String str = req.getParameter("d_no");
				int d_no = new Integer(str);
//				System.out.println(d_no);
				DiscussionVO discussionVO = dao.findByPrimaryKey(d_no);
				
				if (discussionVO == null) {
					errorMsgs.add("查無資料");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher(url);
					failureView.forward(req, res);
					return;// 程式中斷
				}

				req.setAttribute("discussionVO", discussionVO); // 資料庫取出的VO物件,存入req
				RequestDispatcher successView = req.getRequestDispatcher("/discussion/listOneDiscussion.jsp"); // 成功轉交
				successView.forward(req, res);
			}
			
			//新增主題功能
			if("insert".equals(action)){
				String url = req.getRequestURI();
				req.setAttribute("url", url);
				//之後修改成從session獲取會員編號
				int m_no = 1001;
				//主題字串的檢查
				String d_title = req.getParameter("d_title").trim();
				if(d_title == null){
					errorMsgs.add("請輸入文章主題");
				}
				//內文的檢查
				String d_context = req.getParameter("d_context");
				if(d_context.length() < 20){
					errorMsgs.add("文章內容請輸入超過20字");
				} 

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher(url);   //導入錯誤處理頁面
					failureView.forward(req, res);
					return;// 程式中斷
				}
				
				//設定新增之主題物件參數
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

				req.setAttribute("discussionVO", discussionVO); // 資料庫取出的VO物件,存入req
				RequestDispatcher successView = req.getRequestDispatcher("/DiscussionList?action=getAll"); // 成功轉交
				successView.forward(req, res);
			}
			
			if("edit".equals(action)){
				DiscussionVO discussionVO = new DiscussionVO();
				Integer d_no = new Integer(req.getParameter("d_no"));
				discussionVO = dao.findByPrimaryKey(d_no);
				req.setAttribute("discussionVO", discussionVO);
				System.out.println("進入edit");
				RequestDispatcher successView = req.getRequestDispatcher("/discussion/editDiscussion.jsp"); // 成功轉交
				successView.forward(req, res);
			}
			
			if("update".equals(action)){
//				String url = req.getRequestURI();
				System.out.println("進入update");
				DiscussionVO discussionVO = new DiscussionVO();
				Integer d_no = Integer.valueOf(req.getParameter("d_no"));
				String d_title = req.getParameter("d_title");
				String d_context = req.getParameter("d_context");
				String d_status = req.getParameter("d_status");
				Integer m_no = Integer.valueOf(req.getParameter("m_no"));
//				System.out.println("進入1");
				MemberVO memberVO = new MemberVO();
//				System.out.println("進入2");
				memberVO.setM_no(m_no);
				System.out.println(m_no);
				Timestamp d_datetime = Timestamp.valueOf(req.getParameter("d_datetime"));
				System.out.print(d_datetime);
				discussionVO.setD_no(d_no);
				discussionVO.setMemberVO(memberVO);
				discussionVO.setD_title(d_title);
				discussionVO.setD_context(d_context);
				discussionVO.setD_datetime(d_datetime);
				discussionVO.setD_final_edit(new java.sql.Timestamp(new java.util.Date().getTime()));
				discussionVO.setD_status(d_status);
				dao.update(discussionVO);
				
				req.setAttribute("discussionVO", discussionVO);
				RequestDispatcher successView = req.getRequestDispatcher("DiscussionOne?action=getOne&d_no="+ d_no); // 成功轉交
				successView.forward(req, res);
			}
			
		} catch (Exception e) {
			errorMsgs.add("無法取得資料:" + e.getMessage());
			RequestDispatcher failureView = req
					.getRequestDispatcher("DiscussionList");
			failureView.forward(req, res);
		}
	}

	private void splitPages(List<DiscussionVO> list, HttpServletRequest req) {
		
		int rowNumber = list.size(); 
		req.setAttribute("list", list);				
		String url = req.getRequestURI();
		req.setAttribute("url", url);
		req.setAttribute("rowsPerPage", rowsPerPage);
		req.setAttribute("rowNumber", rowNumber);
			
		
			if (rowNumber % rowsPerPage != 0){
				pageNumber = rowNumber / rowsPerPage + 1;
			}

			else{
				pageNumber = rowNumber / rowsPerPage;
			}
			req.setAttribute("pageNumber", pageNumber);

			pageIndexArray = new int[pageNumber];
			for (int i = 1; i <= pageIndexArray.length; i++){
				pageIndexArray[i - 1] = i * rowsPerPage - rowsPerPage;
				req.setAttribute("pageIndexArray", pageIndexArray);
			}

			if(req.getParameter("whichPage")!=null){
				whichPage = Integer.parseInt(req.getParameter("whichPage"));
				pageIndex = pageIndexArray[whichPage - 1];
				}else{whichPage = 1;pageIndex = 0;}
				req.setAttribute("whichPage", whichPage);
				req.setAttribute("pageIndex", pageIndex);
	}
	
}
