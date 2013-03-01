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
	//��l�������~�һݤ��Ѽƨõ���
	static final int rowsPerPage = 3; // �C��������
	static int pageNumber = 0; // �`����
	static int whichPage = 1; // ��e�ĴX��
	static int pageIndexArray[] = null; //�s��Ҧ����ƪ��}�C
	static int pageIndex = 0; // ��e���Ʀb�}�C��������index
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		DiscussionHibernateDAO dao = new DiscussionHibernateDAO();
		List<DiscussionVO> list = dao.getAll();		//�C���i�J�d���O�C��ɡA��������Q�פ峹�����
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
		
		
		
		int rowNumber = dao.findTotalNOofDiscussion(); //��s��e�`����
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
			
		//�p�G�`��� �� �C������ ���l�� �����s �A�h�`���Ƭ���Ӽ�+1
			if (rowNumber % rowsPerPage != 0){
				pageNumber = rowNumber / rowsPerPage + 1;
			}
		//���s�h�`���Ƭ���Ӽ�
			else{
				pageNumber = rowNumber / rowsPerPage;
			}
			req.setAttribute("pageNumber", pageNumber);
		//�]�w�s�񭶼Ƥ��}�C���רö]�j�鵹��	
			pageIndexArray = new int[pageNumber];
			for (int i = 1; i <= pageIndexArray.length; i++){
				pageIndexArray[i - 1] = i * rowsPerPage - rowsPerPage;
				req.setAttribute("pageIndexArray", pageIndexArray);
			}
		//��e�����έ��ư}�C���]�w
			if(req.getParameter("whichPage")!=null){
				whichPage = Integer.parseInt(req.getParameter("whichPage"));
				pageIndex = pageIndexArray[whichPage - 1];
				}else{whichPage = 1;pageIndex = 0;}
				req.setAttribute("whichPage", whichPage);
				req.setAttribute("pageIndex", pageIndex);
		//�N������ܰQ�װϦC��
			RequestDispatcher dis = req
					.getRequestDispatcher("/discussion/listAllDiscussion.jsp"); 
			dis.forward(req, res);
		}
	

}
