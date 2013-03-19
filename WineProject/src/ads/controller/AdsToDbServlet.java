package ads.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		response.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("AdsErrs");
		session.removeAttribute("productName");
		session.removeAttribute("fileName");
		session.removeAttribute("AdsSuccess");
		
		String fileName = request.getParameter("fileName");
		String productName = request.getParameter("productName");
		System.out.println(fileName);
		System.out.println(productName);
		
		Map errMap = new HashMap();
		ProductVO productVO = new ProductVO();
		AdsDAO adsDAO = new AdsDAO();
		List<AdsVO> list = null;
		AdsVO adsVO = null;
				
		//避免直接針對server輸入的productName不合規格
		try {
		Integer p_no = Integer.parseInt((productName.split(":"))[0]);
		//System.out.println(p_no);
		productVO = (new ProductDAO()).findByPrimaryKey(p_no);
		} catch (Exception e) {
			errMap.put("WrongP_no", "請輸入正確商品編號，或由搜尋商品欄搜尋並選擇商品。");
			e.printStackTrace();
		}
		//其他驗證
		if (productName == null || productName.trim().length() == 0){
			errMap.clear();
			errMap.put("EmptyName", "請選擇商品。");
		}
		if (fileName == null || fileName.trim().length() == 0){
			errMap.put("EmptyFile", "請選擇圖片。");
			fileName = null;
		}
		if (productVO == null)
			errMap.put("NoSuchProduct", "您所輸入的商品不存在，請先至商品管理頁面新增商品。");
		
		//錯誤 & 正確的情況
		if (!errMap.isEmpty()){
			session.setAttribute("AdsErrs", errMap);
			session.setAttribute("productName", productName);
			session.setAttribute("fileName", fileName);			
		} else {
			list = adsDAO.findByAds_filename(fileName);
			if ( list.size() == 0){
				adsVO = new AdsVO();
				adsVO.setAds_filename(fileName);
				adsVO.setProductVO(productVO);
				adsDAO.insert(adsVO);
			} else {
				adsVO = list.get(0);
				adsVO.setProductVO(productVO);
				adsDAO.update(adsVO);
			}
			session.setAttribute("AdsSuccess", productName + " " +fileName + " 廣告設定成功。");
		}
		if (request.getParameter("action") == null){
			response.sendRedirect(request.getContextPath()+"/wine_admin/ademin_discount.jsp");
		}
		
			
		//getAll
		//System.out.println("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTt" + request.getParameter("action"));
		if (request.getParameter("action").equals("getAll")){
			response.sendRedirect(request.getContextPath()+"/wine_admin/ademin_discount.jsp?pagetab=2");
		}
		
	} //end of doPost

}
