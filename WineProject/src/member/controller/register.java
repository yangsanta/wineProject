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


@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public register() {
        super();
    }
    public  String inputfilter(String input,int num){
    	String output=input.trim(); //如果字串長度超過num則截斷、去除空白
    	if ( input.length()>num){
    		output=input.trim().substring(0,num);
    	}
    	return output;
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
	request.setCharacterEncoding("UTF-8");
	
	List<String> errorMsg = new ArrayList<String>();
	request.setAttribute("ErrorMsgKey", errorMsg);
	// 1. 讀取使用者輸入資料
	String m_id = inputfilter(request.getParameter("m_id"),20);
	String m_name = inputfilter(request.getParameter("m_name"),10);
	String m_pwd = inputfilter(request.getParameter("m_pwd"),16);
	String m_mobile = inputfilter(request.getParameter("m_mobile"),10);
	String m_email =inputfilter( request.getParameter("m_email"),40);
	String m_bday = inputfilter(request.getParameter("m_bday"),20);
	String m_addr = inputfilter(request.getParameter("m_addr"),100);

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
	
	
	MemberHibernateDAO DAO = new MemberHibernateDAO();
	MemberVO memberVo = new MemberVO();
	memberVo.setM_id(m_id); 
	memberVo.setM_pwd(m_pwd);
	memberVo.setM_name(m_name);
	memberVo.setM_email(m_email);
	memberVo.setM_mobile(m_mobile);
	memberVo.setM_bday(new java.sql.Date(new java.util.Date().getTime()));
	memberVo.setM_addr(m_addr);
	

	

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

