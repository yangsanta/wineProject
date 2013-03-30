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
import ab.model.AbDAO;
import ab.model.AbVO;

public class MaintainSales extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MaintainSales() {
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

			String listAllUrl = "/wine_admin/ProductListSales.jsp";

			RequestDispatcher rd = request.getRequestDispatcher(listAllUrl);
			rd.forward(request, response);
			return;
		}

		if ("getOneMaintainSales".equals(action)) {
			String oldSales = request.getParameter("oldSales");
			String sales = request.getParameter(request.getParameter("pNo"));
			Integer p_no = Integer.parseInt(request.getParameter("pNo"));
			String page = request.getParameter("page");
			ProductDAO productDAO = new ProductDAO();
			ProductVO productVO = productDAO.findByPrimaryKey(p_no);

			productVO.setP_sales(sales);
			if (oldSales.equals(sales)) {// 判斷新舊優惠狀態是否有改變
				String listAllUrl = request.getContextPath()
						+ "/wine_admin/MaintainSales?action=getAll&pageNo="
						+ page;
				response.sendRedirect(listAllUrl);

			} else {

				if (sales.equals("A") || sales.equals("B")) {// 判斷是否改變成 A or B
					List<ProductVO> list = productDAO
							.findSpeciallySalesProduct();
					request.setAttribute("productList", list);
					request.setAttribute("productVO", productVO);
					request.setAttribute("page", page);
					RequestDispatcher rd = request
							.getRequestDispatcher("/wine_admin/ProductSalesAorB.jsp");
					rd.forward(request, response);
					return;
				}
				AbDAO abDAO = new AbDAO();
				if (oldSales.equals("A")) {// 判斷原有的優惠狀態是否是 A
					abDAO.deleteByA(p_no);
				} else if (oldSales.equals("B")) {// 判斷原有的優惠狀態是否是 B
					abDAO.deleteByB(p_no);
				}
				productDAO.update(productVO);
				String listAllUrl = request.getContextPath()
						+ "/wine_admin/MaintainSales?action=getAll&pageNo="
						+ page;
				response.sendRedirect(listAllUrl);
				return;
			}
		}

		if ("SET_A_OR_B".equals(action)) {
			String p_sales = request.getParameter("p_sales");
			String 	p_no = request.getParameter("p_no");
			String page = request.getParameter("page");
			String 	correspondence = request.getParameter("correspondence");

			ProductDAO productDAO = new ProductDAO();
			AbDAO abDAO = new AbDAO();
			AbVO abVO= new AbVO();
			if (p_sales.equals("A")) {
				ProductVO productA = productDAO.findByPrimaryKey(Integer.parseInt(p_no));
				ProductVO productB = productDAO.findByPrimaryKey(Integer.parseInt(correspondence));
				productA.setP_sales("A");
				productB.setP_sales("B");
				productDAO.update(productA);
				productDAO.update(productB);
				abVO.setAb_a_p_id(Integer.parseInt(p_no));
				abVO.setAb_b_p_id(Integer.parseInt(correspondence));
				abDAO.insert(abVO);
			} else {
				ProductVO productA = productDAO.findByPrimaryKey(Integer.parseInt(correspondence));
				ProductVO productB = productDAO.findByPrimaryKey(Integer.parseInt(p_no));
				productA.setP_sales("B");
				productB.setP_sales("A");
				productDAO.update(productA);
				productDAO.update(productB);
				abVO.setAb_a_p_id(Integer.parseInt(correspondence));
				abVO.setAb_b_p_id(Integer.parseInt(p_no));
			    abDAO.insert(abVO);

			}
			String listAllUrl = request.getContextPath()
					+ "/wine_admin/MaintainSales?action=getAll&pageNo="
					+ page;
			response.sendRedirect(listAllUrl);
			return;
			
		}

	}

	// 分頁
	private void splitPages(List<ProductVO> list, HttpServletRequest request) {
		int rowsPerPage = 10; // 每頁的筆數
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