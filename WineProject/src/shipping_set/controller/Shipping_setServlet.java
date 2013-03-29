package shipping_set.controller;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import Shipping_set.model.Shipping_setVO;

import shipping_set.model.Shipping_setDAO;
import shipping_set.model.Shipping_setVO;

public class Shipping_setServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Shipping_setServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");

		int min_pirce = Integer.parseInt(request.getParameter("min_pirce"));
		Shipping_setDAO dao = new Shipping_setDAO();
		Shipping_setVO shipping_setVO2 = new Shipping_setVO();
		shipping_setVO2.setMin_pirce(new Integer(min_pirce));

		dao.update(shipping_setVO2);

		RequestDispatcher rd = request
				.getRequestDispatcher("/wine_admin/ademin_Shipping.jsp");
		rd.forward(request, response);

		// response.sendRedirect("/WineProject/wine_admin/ademin_Fs_Success.jsp");

		return;

		// List<String> errorMsgs = new LinkedList<String>();
		// // Store this set in the request scope, in case we need to
		// // send the ErrorPage view.
		// request.setAttribute("errorMsgs", errorMsgs);
		//
		// try {
		// /*************************** 1.接收請求參數 - 輸入格式的錯誤處理
		// **********************/
		// Integer min_pirce = new
		// Integer(request.getParameter("min_pirce").trim());
		//
		// Shipping_setVO shipping_setVO = new Shipping_setVO();
		// shipping_setVO.setMin_pirce(min_pirce);
		//
		// /*************************** 2.開始修改資料
		// *****************************************/
		// Shipping_setService empSvc = new Shipping_setService();
		// shipping_setVO = empSvc.updateEmp(min_pirce);
		//
		// /*************************** 3.修改完成,準備轉交(Send the Success view)
		// *************/
		// request.setAttribute("shipping_setVO", shipping_setVO); //
		// 資料庫update成功後,正確的的empVO物件,存入req
		// String url = "/emp/listOneEmp.jsp";
		// RequestDispatcher successView = request.getRequestDispatcher(url); //
		// 修改成功後,轉交listOneEmp.jsp
		// successView.forward(request, response);
		//
		// /*************************** 其他可能的錯誤處理
		// *************************************/
		// } catch (Exception e) {
		// errorMsgs.add("修改資料失敗:" + e.getMessage());
		// RequestDispatcher failureView = request
		// .getRequestDispatcher("/emp/update_emp_input.jsp");
		// failureView.forward(request, response);
		// }
	}

}
