package timing_sales.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import timing_sales.model.Timing_Sales;
import timing_sales.model.Timing_SalesDAO;
import tools.SplitPages;

@WebServlet("/Timing_Sales_Servlet")
public class Timing_Sales_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Timing_Sales_Servlet() {
		super();

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		System.out
				.println("Timing Salessssssssss Servlet doPost is running up.");

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Map<String, String> errorMsgs = new HashMap<String, String>();
		// 取參數
		String action = request.getParameter("action");
		System.out.println("action is  ==============     " + action);
		// 準備facade
		Timing_SalesFacade facade = new Timing_SalesFacade(request, response);

		if (action == null) {
			String requestURI = request.getHeader("Referer");
			System.out.println("the previous page is ===== " + requestURI);
			// request.setAttribute("requestURI", requestURI);
			System.out.println("action = insert Or Update");
			facade.saveOrUpdate();
		}

		if ("getAll".equals(action)) {
			List<Timing_Sales> list = new ArrayList<Timing_Sales>();
			Timing_SalesDAO dao = new Timing_SalesDAO();
			SplitPages tool = new SplitPages();
			list = dao.getAll();
			tool.splitPages(list, request);
			request.setAttribute("action", "getAll");
			RequestDispatcher rd = request
					.getRequestDispatcher("ademin_TS_List.jsp");
			rd.forward(request, response);
			return;
		}

		if ("getOne".equals(action)) {
			Timing_Sales ts = new Timing_Sales();
			Timing_SalesDAO dao = new Timing_SalesDAO();
			Integer ts_id = Integer.parseInt(request.getParameter("ts_id"));
			ts = dao.findByPrimaryKey(ts_id);
			request.setAttribute("ts", ts);

			RequestDispatcher rd = request
					.getRequestDispatcher("ademin_TS_GetOne.jsp");
			rd.forward(request, response);
			return;
		}

		if ("edit".equals(action)) {
			Timing_Sales ts = new Timing_Sales();
			Timing_SalesDAO dao = new Timing_SalesDAO();
			Integer ts_id = Integer.parseInt(request.getParameter("ts_id"));
			ts = dao.findByPrimaryKey(ts_id);
			request.setAttribute("ts", ts);
			RequestDispatcher rd = request
					.getRequestDispatcher("ademin_TS_update.jsp");
			rd.forward(request, response);
			return;
		}

		if ("delete".equals(action)) {
			Timing_SalesDAO dao = new Timing_SalesDAO();
			Integer ts_id = Integer.parseInt(request.getParameter("ts_id"));
			dao.delete(ts_id);
			response.sendRedirect("set_timing_sales?action=getAll");
			return;
		}

		if ("search".equals(action)) {
			List<Timing_Sales> list = new ArrayList<Timing_Sales>();
			Timing_SalesDAO dao = new Timing_SalesDAO();
			SplitPages tool = new SplitPages();
			String txtsrch = request.getParameter("txtsrch");
			if (txtsrch.trim().length() == 10) {
				list = dao.search(txtsrch);
				tool.splitPages(list, request);
				request.setAttribute("action", "search");
			}
				if (list.size() == 0) {
					errorMsgs.put("errSearch", "此日期無限時特惠");
					request.setAttribute("ErrMsg", errorMsgs);
					RequestDispatcher rd = request
							.getRequestDispatcher("set_timing_sales?action=getAll");
					rd.forward(request, response);
					return;

				} else {
					RequestDispatcher rd = request
							.getRequestDispatcher("ademin_TS_List.jsp");
					rd.forward(request, response);
				}
			
			return;

		}
	}

}
