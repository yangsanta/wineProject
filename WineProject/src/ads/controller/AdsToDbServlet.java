package ads.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.jrockit.jfr.RequestDelegate;

import product.model.ProductDAO;
import product.model.ProductVO;

import ads.model.AdsDAO;
import ads.model.AdsVO;


public class AdsToDbServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String fileName = request.getParameter("fileName");
		String productName = request.getParameter("productName");
		System.out.println(fileName);
		System.out.println(productName);
		
		Map errMap = new HashMap();
		ProductVO productVO = new ProductVO();
		
		//避免直接針對server輸入的productName不合規格
		try {
		Integer p_no = Integer.parseInt((productName.split(":"))[0]);
		//System.out.println(p_no);
		productVO = (new ProductDAO()).findByPrimaryKey(p_no);
		} catch (Exception e) {
			errMap.put("WrongP_no", "請由搜尋商品欄搜尋並選擇商品。");
			e.printStackTrace();
		}
				
		if (fileName == null || fileName.trim().length() == 0)
			errMap.put("EmptyFile", "請選擇圖片。");
		if (productName == null || productName.trim().length() == 0)
			errMap.put("EmptyName", "請選擇商品。");
		if (productVO == null)
			errMap.put("NoSuchProduct", "您所輸入的商品不存在，請先至商品管理頁面新增商品後再設定廣告。");
		
		RequestDispatcher rd = request.getRequestDispatcher("Advertisements.jsp");
		if (!errMap.isEmpty()){
			request.setAttribute("Errs", errMap);
			rd.forward(request, response);
		} else {
			AdsVO adsVO = new AdsVO();
			adsVO.setAds_filename(fileName);
			adsVO.setProductVO(productVO);
			AdsDAO adsDAO = new AdsDAO();
			adsDAO.insert(adsVO);
			request.setAttribute("success", "新增廣告已成功，可繼續設定新的廣告。");
			rd.forward(request, response);
		}
	}

}
