package product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.ProductDAO;
import product.model.ProductVO;

public class DisplayProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DisplayProducts() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");

		if ("getAll".equals(action)) {
			List<ProductVO> list = null;

			// 如果用戶只是切換分頁，就直接從session裡抓list出來，如果用戶是新執行getAll
			// (點擊瀏覽全商品的連結，或直接在新的session打開該連結)，則重新query資料庫
			if (request.getAttribute("action") != null
					&& (request.getAttribute("action").equals("getAll"))) {
				list = (List<ProductVO>) request.getSession().getAttribute(
						"list");
			} else {
				request.setAttribute("action", new String("getAll"));

				ProductDAO productDAO = new ProductDAO();
				list = productDAO.getAll();
				request.getSession().setAttribute("list", list);
			}
			splitPages(list, request);

			String listAllUrl = "/product/ProductList.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(listAllUrl);
			rd.forward(request, response);
			return;
		}

		if ("getOne_For_Display".equals(action)) {
			request.setAttribute("action", new String("getOne_For_Display"));

			Integer p_no = Integer.parseInt(request.getParameter("pId"));
			ProductDAO productDAO = new ProductDAO();
			ProductVO productVO = productDAO.findByPrimaryKey(p_no);

			request.setAttribute("productVO", productVO);
			String listAllUrl = "/product/ProductOne.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(listAllUrl);
			rd.forward(request, response);
			return;
		}

		// for "where xxx=?" search.
		if ("getSome_For_Display".equals(action)) {
			List<ProductVO> list = null;

			// 設定jsp<c:forEach>產出的分頁連結的condition&conditionValue參數
			String condition = request.getParameter("condition");
			String conditionValue = new String(request.getParameter(
					"conditionValue").getBytes("ISO-8859-1"), "UTF-8");
			String conditionParam = "&condition=" + condition
					+ "&conditionValue=" + conditionValue;
			request.setAttribute("conditionParam", conditionParam);

			// 如果用戶只是切換分頁，就直接從session裡抓list出來;如果用戶是新執行getSome_For_Display
			// (點擊瀏覽全商品的連結，或直接在新的session打開該連結)，則重新query資料庫
			if (request.getAttribute("action") != null
					&& (request.getAttribute("action")
							.equals("getSome_For_Display"))) {
				list = (List<ProductVO>) request.getSession().getAttribute(
						"list");
			} else {
				request.setAttribute("action",
						new String("getSome_For_Display"));
				ProductDAO productDAO = new ProductDAO();

				if (condition.equals("p_buy_count")) {
					list = productDAO.findTopProduct(conditionValue);

				} else {

					if (condition.equals("p_sales")) {
						list = productDAO.findSalesProduct();
					} else if (condition.equals("p_price")
							|| condition.equals("p_date")) {
						list = productDAO.findProductBetween(condition,
								conditionValue);

					} else {

						list = productDAO.findSomeProduct(condition,
								conditionValue);
					}
					splitPages(list, request);
				}
				request.setAttribute("list", list);
			}
			
			String listAllUrl;
			if (condition.equals("p_date")) {
				listAllUrl = "/product/NewarriveProductList.jsp";
			} else if (condition.equals("p_sales")) {
				listAllUrl = "/product/PreferenceProductList.jsp";
			} else if (condition.equals("p_buy_count")) {
				listAllUrl = "/product/TOP20ProductList.jsp";
			} else {
				listAllUrl = "/product/ProductList.jsp";
			}
			RequestDispatcher rd = request.getRequestDispatcher(listAllUrl);
			rd.forward(request, response);
			return;
		}
	}

	// 分頁
	private void splitPages(List<ProductVO> list, HttpServletRequest request) {
		int rowsPerPage = 9; // 每頁的筆數
		int totalRows = list.size(); // 總筆數
		int totalPages = 0; // 總頁數
		int whichPage = 1; // 第幾頁
		int pageIndexArray[] = null;
		int pageIndex = 0;

		if ((totalRows % rowsPerPage) != 0)
			totalPages = totalRows / rowsPerPage + 1;
		else
			totalPages = totalRows / rowsPerPage;

		pageIndexArray = new int[totalPages];
		for (int i = 0; i < totalPages; i++)
			pageIndexArray[i] = rowsPerPage * i;

		try {
			whichPage = Integer.parseInt(request.getParameter("pageNo"));
			pageIndex = pageIndexArray[whichPage - 1];
		} catch (NumberFormatException e) {
			whichPage = 1;
			pageIndex = 0;
		} catch (ArrayIndexOutOfBoundsException e) {
			if (totalPages > 0) {
				whichPage = totalPages;
				pageIndex = pageIndexArray[whichPage - 1];
			}
		}

		request.setAttribute("whichPage", whichPage);
		request.setAttribute("pageIndex", pageIndex);
		request.setAttribute("totalPages", totalPages);
		request.setAttribute("totalRows", totalRows);
		request.setAttribute("rowsPerPage", rowsPerPage);
	}

}