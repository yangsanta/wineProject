package discussion.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.MemberHibernateDAO;
import member.model.MemberVO;
import discussion.model.*;

public class DiscussionListServlet extends HttpServlet {
	//初始部分分業所需之參數並給直
	static final int rowsPerPage = 3; // 每頁的筆數
	static int pageNumber = 0; // 總頁數
	static int whichPage = 1; // 當前第幾頁
	static int pageIndexArray[] = null; //存放所有頁數的陣列
	static int pageIndex = 0; // 當前頁數在陣列中之索引index
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		DiscussionHibernateDAO dao = new DiscussionHibernateDAO();
		List<DiscussionVO> list = dao.getAll();		//每次進入留言板列表時，獲取全部討論文章之資料
//		MemberHibernateDAO daoMem = new MemberHibernateDAO();
//		List<MemberVO> listMem = daoMem.getAll();
//		for(DiscussionVO dvo:list){
//			for(MemberVO mvo:listMem){
//				System.out.print(dvo.getM_no() +",");
//				System.out.println(mvo.getM_no());
//				if((dvo.getM_no()).equals((mvo.getM_no()))){
//					System.out.print(7879);
//					dvo.setM_name(mvo.getM_name());
//					System.out.print(dvo.getM_name());
//				}
//			}
//		}
		
		
		
		int rowNumber = dao.findTotalNOofDiscussion(); //更新當前總筆數
		req.setCharacterEncoding("UTF-8");
//		String action = req.getParameter("action");
		req.setAttribute("list", list);				
		String url = req.getRequestURI();
//		System.out.println(url);
		req.setAttribute("url", url);
		req.setAttribute("rowsPerPage", rowsPerPage);
		req.setAttribute("rowNumber", rowNumber);
//			req.setAttribute("pageNumber", pageNumber);
//			req.setAttribute("whichPage", whichPage);
//			req.setAttribute("pageIndexArray", pageIndexArray);
//			req.setAttribute("pageIndex", pageIndex);
			
		//如果總比數 除 每頁筆數 之餘數 不為零 ，則總頁數為其商數+1
			if (rowNumber % rowsPerPage != 0){
				pageNumber = rowNumber / rowsPerPage + 1;
			}
		//為零則總頁數為其商數
			else{
				pageNumber = rowNumber / rowsPerPage;
			}
			req.setAttribute("pageNumber", pageNumber);
		//設定存放頁數之陣列長度並跑迴圈給值	
			pageIndexArray = new int[pageNumber];
			for (int i = 1; i <= pageIndexArray.length; i++){
				pageIndexArray[i - 1] = i * rowsPerPage - rowsPerPage;
				req.setAttribute("pageIndexArray", pageIndexArray);
			}
		//當前頁面及頁數陣列之設定
			if(req.getParameter("whichPage")!=null){
				whichPage = Integer.parseInt(req.getParameter("whichPage"));
				pageIndex = pageIndexArray[whichPage - 1];
				}else{whichPage = 1;pageIndex = 0;}
				req.setAttribute("whichPage", whichPage);
				req.setAttribute("pageIndex", pageIndex);
		//將資料轉交至討論區列表
			RequestDispatcher dis = req
					.getRequestDispatcher("/discussion/listAllDiscussion.jsp"); 
			dis.forward(req, res);
		}
	

}
