package timing_sales.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import timing_sales.model.Timing_Sales;
import timing_sales.model.Timing_SalesDAO;

@WebServlet("/Timing_Sales_Servlet")
public class Timing_Sales_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Timing_Sales_Servlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("Timing Salessssssssss Servlet doPost is running up.");
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		//取參數
		String action = request.getParameter("action");
		System.out.println(action);
		//準備facade
		Timing_SalesFacade facade = new Timing_SalesFacade(request, response);

		if(action == null){
			String requestURI = request.getHeader("Referer");
			System.out.println("the previous page is ===== "+ requestURI);
//			request.setAttribute("requestURI", requestURI);
			System.out.println("action = insert Or Update");
			facade.saveOrUpdate();
		}
		
		if("getOne".equals(action)){
			Timing_Sales ts = new Timing_Sales();
			Timing_SalesDAO dao = new Timing_SalesDAO();
			Integer ts_id = Integer.parseInt(request.getParameter("ts_id"));
			ts = dao.findByPrimaryKey(ts_id);
			request.setAttribute("ts", ts);
			
			RequestDispatcher rd = request.getRequestDispatcher("wine_admin/ademin_TS_GetOne.jsp");
			rd.forward(request, response);
			return;
		}
		
		if("edit".equals(action)){
			Timing_Sales ts = new Timing_Sales();
			Timing_SalesDAO dao = new Timing_SalesDAO();
			Integer ts_id = Integer.parseInt(request.getParameter("ts_id"));
			ts = dao.findByPrimaryKey(ts_id);
			request.setAttribute("ts", ts);
			RequestDispatcher rd = request.getRequestDispatcher("wine_admin/ademin_TS_update.jsp");
			rd.forward(request, response);
			return;
		}
	}

}