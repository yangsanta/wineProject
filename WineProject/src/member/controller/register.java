package member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.MemberDAO;
import member.model.MemberHibernateDAO;
import member.model.MemberVO;

/**
 * Servlet implementation class register
 */
@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	MemberVO memberVo = new MemberVO();
	
	request.setCharacterEncoding("UTF-8");
	MemberHibernateDAO DAO = new MemberHibernateDAO();
	memberVo.setM_id(request.getParameter("m_id")); 
	memberVo.setM_pwd(request.getParameter("m_pwd"));
	memberVo.setM_name(request.getParameter("m_name"));
	memberVo.setM_email(request.getParameter("m_email"));
	memberVo.setM_mobile(request.getParameter("m_mobile"));
	memberVo.setM_bday(new java.sql.Date(new java.util.Date().getTime()));
//	Long.parseLong(request.getParameter("m_bday")
	memberVo.setM_addr(request.getParameter("m_addr"));
	
	
	
	
	List<String> errorMsg = new ArrayList<String>();
	request.setAttribute("ErrorMsgKey", errorMsg);
	// 1. 讀取使用者輸入資料
	String m_id = request.getParameter("m_id");
	String m_name = request.getParameter("m_name");
	String m_pwd = request.getParameter("m_pwd");
	String m_mobile = request.getParameter("m_mobile");
	String m_email = request.getParameter("m_email");
	String m_bday = request.getParameter("m_bday");
	String m_addr = request.getParameter("m_addr");

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
			
			if (DAO.findHaveName(m_id)!=0) {
				errorMsg.add("帳號 (" +  m_id  + ") 已存在，請選擇其它的帳號");
			} else {
				
				DAO.insert(memberVo);
			}
			// 5.依照 Business Logic 運算結果來挑選適當的畫面
			request.setAttribute("m_idKey", m_id);
			if (errorMsg.isEmpty())	{			
				RequestDispatcher rd = request.getRequestDispatcher("/success.jsp");
				rd.forward(request, response);
				return ; 
			}  else {
				RequestDispatcher rd = request.getRequestDispatcher("/error.jsp");
				rd.forward(request, response);
				return;
			}
	}

}
