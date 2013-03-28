package product.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.ProductDAO;
import product.model.ProductVO;

@WebServlet(name = "wine_admin/EmergencyProductUpdate", urlPatterns = { "/wine_admin/EmergencyProductUpdate" })
public class EmergencyProductUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public EmergencyProductUpdate() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Map<String, String> errorMsgs = new HashMap<String, String>();
		
		Integer page = Integer.valueOf(request.getParameter("page"));		
		Integer p_num = Integer.valueOf(request.getParameter("p_num"));
		String p_status = request.getParameter("p_status");
		Integer p_no = Integer.valueOf(request.getParameter("p_no"));
		
		ProductDAO dao = new ProductDAO();		
		ProductVO productVO = dao.findByPrimaryKey(p_no);
		
		if (p_num < 0) {
			errorMsgs.put("errNum", "數量不能為負值");
		} else {
			productVO.setP_num(p_num);
		}

		if (p_status.length()==0) {
			errorMsgs.put("errNum", "數量不能為負值");
		} else {
			productVO.setP_status(p_status);
		}
		
		if (!errorMsgs.isEmpty()) {
			request.setAttribute("ErrMsg", errorMsgs);
			RequestDispatcher rd = request
					.getRequestDispatcher(response.encodeRedirectURL(request.getContextPath()+"/wine_admin/Maintain?action=getEmergency&pageNo="+page));
			rd.forward(request, response);
			return;
		}
		
		dao.update(productVO);
		response.sendRedirect(response.encodeRedirectURL(request.getContextPath()+"/wine_admin/Maintain?action=getEmergency&pageNo="+page));
		
		
	}

}
