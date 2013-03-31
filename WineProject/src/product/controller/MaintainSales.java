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
//			if (request.getAttribute("action") != null
//					&& (request.getAttribute("action").equals("getAll"))) {
//				list = (List<ProductVO>) request.getSession().getAttribute(
//						"list");
//			} else {
//				request.setAttribute("action", new String("getAll"));

				ProductDAO productDAO = new ProductDAO();
				list = productDAO.getAll();
				request.setAttribute("list", list);
//			}
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

				if (sales.equals("A") || sales.equals("B")) {// 判斷是否改變成 A or B 是的話轉交去設對應表
					List<ProductVO> list = productDAO
							.findSpeciallySalesProduct();
					request.setAttribute("productList", list);
					request.setAttribute("productVO", productVO);
					request.setAttribute("page", page);
					request.setAttribute("oldSales", oldSales);
					RequestDispatcher rd = request
							.getRequestDispatcher("/wine_admin/ProductSalesAorB.jsp");
					rd.forward(request, response);
					return;
				}
				AbDAO abDAO = new AbDAO();
				if (oldSales.equals("A")) {// 判斷原有的優惠狀態是否是 A
					ProductVO productB=productDAO.findByPrimaryKey(abDAO.findByAKey(p_no).getAb_b_p_id());//找出對應的B商品
					productB.setP_sales("NONE");                                                          //將對應的B商品優惠狀態設為NONE
					productDAO.update(productB);
					abDAO.deleteByA(p_no);                                                                //刪除對應表
				} else if (oldSales.equals("B")) {// 判斷原有的優惠狀態是否是 B
					ProductVO productA=productDAO.findByPrimaryKey(abDAO.findByBKey(p_no).getAb_a_p_id());//找出對應的A商品
					productA.setP_sales("NONE");                                                          //將對應的A商品優惠狀態設為NONE
					productDAO.update(productA);
					abDAO.deleteByB(p_no);       														  //刪除對應表
				}
				productDAO.update(productVO);                             //改變優惠狀態
				String listAllUrl = request.getContextPath()
						+ "/wine_admin/MaintainSales?action=getAll&pageNo="
						+ page;
				response.sendRedirect(listAllUrl);
				return;
			}
		}

		if ("SET_A_OR_B".equals(action)) {                                   //設對應表
			String p_sales = request.getParameter("p_sales");
			Integer p_no = Integer.parseInt(request.getParameter("p_no"));
			String page = request.getParameter("page");
			Integer correspondence = Integer.parseInt(request.getParameter("correspondence"));
			String oldSales = request.getParameter("oldSales");
			ProductDAO productDAO = new ProductDAO();
			AbDAO abDAO = new AbDAO();
			AbVO abVO= new AbVO();
			if (oldSales.equals("A")) {// 判斷原有的優惠狀態是否是 A
				ProductVO productB=productDAO.findByPrimaryKey(abDAO.findByAKey(p_no).getAb_b_p_id());//找出對應的B商品
				productB.setP_sales("NONE");                                                          //將對應的B商品優惠狀態設為NONE
				productDAO.update(productB);
				abDAO.deleteByA(p_no);                                                                //刪除對應表
			} else if (oldSales.equals("B")) {// 判斷原有的優惠狀態是否是 B
				ProductVO productA=productDAO.findByPrimaryKey(abDAO.findByBKey(p_no).getAb_a_p_id());//找出對應的A商品
				productA.setP_sales("NONE");                                                          //將對應的A商品優惠狀態設為NONE
				productDAO.update(productA);
				abDAO.deleteByB(p_no);       														  //刪除對應表
			}
			if (p_sales.equals("A")) {                                    //所選的商品欲更改為A
				ProductVO productA = productDAO.findByPrimaryKey(p_no);                 //找出A商品
				ProductVO productB = productDAO.findByPrimaryKey(correspondence);       //找出B商品 
				productA.setP_sales("A");                                                                 //設定A商品優惠狀態
				productB.setP_sales("B");                                                                 //設定B商品優惠狀態
				productDAO.update(productA);
				productDAO.update(productB);
				abVO.setAb_a_p_id(p_no);
				abVO.setAb_b_p_id(correspondence);
				abDAO.insert(abVO);                                                                       //設定對應表
			} else {                                                     //所選的商品欲更改為B
				ProductVO productA = productDAO.findByPrimaryKey(correspondence);        //找出A商品
				ProductVO productB = productDAO.findByPrimaryKey(p_no);                  //找出B商品 
				productA.setP_sales("A");                                                                  //設定A商品優惠狀態
				productB.setP_sales("B");                                                                   //設定B商品優惠狀態
				productDAO.update(productA);
				productDAO.update(productB);
				abVO.setAb_a_p_id(correspondence);
				abVO.setAb_b_p_id(p_no);
			    abDAO.insert(abVO);                                                                         //設定對應表

			}
			String listAllUrl = request.getContextPath()
					+ "/wine_admin/MaintainSales?action=getAll&pageNo="
					+ page;
			response.sendRedirect(listAllUrl);
			return;
			
		}
		if ("getSome_For_Display".equals(action)) {
			List<ProductVO> list = null;

			// 設定jsp<c:forEach>產出的分頁連結的condition&conditionValue參數

			String conditionValue = new String(request.getParameter("conditionValue").getBytes("ISO-8859-1"), "UTF-8");
			String conditionParam = "&conditionValue=" + conditionValue;
			request.setAttribute("conditionParam", conditionParam);
		
			// 如果用戶只是切換分頁，就直接從session裡抓list出來;如果用戶是新執行getSome_For_Display
			// (點擊瀏覽全商品的連結，或直接在新的session打開該連結)，則重新query資料庫
//			if (request.getAttribute("action") != null
//					&& (request.getAttribute("action")
//							.equals("getSome_For_Display"))) {
//				list = (List<ProductVO>) request.getSession().getAttribute(
//						"list");
//				splitPages(list, request);
//				
//			} else {
				ProductDAO productDAO = new ProductDAO();
				list=productDAO.findFuzzyProductName(conditionValue);
				request.setAttribute("action",
						new String("getSome_For_Display"));
				request.setAttribute("list", list);
//			}
			splitPages(list, request);
			String listAllUrl="/wine_admin/ProductListSales.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(listAllUrl);
			rd.forward(request, response);
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