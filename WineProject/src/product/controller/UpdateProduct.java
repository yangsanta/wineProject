package product.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.MessageDigest;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import product.model.ProductDAO;
import product.model.ProductVO;

public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateProduct() {
		super();

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		if (!ServletFileUpload.isMultipartContent(request)) {
			throw new IllegalArgumentException(
					"Request is not multipart, please 'multipart/form-data' enctype for your form.");
		}
		
		Map<String, String> errorMsgs = new HashMap<String, String>();

		
		int number, price, vol;
		double alcho;
		
		String page,p_no, p_name, p_year, p_area, p_country, p_num, p_price, p_status, p_winery, p_style, p_sales, p_vol, p_alcho, p_date, p_type, p_grape, p_intro, source = null;

		ServletFileUpload uploadHandler = new ServletFileUpload(
				new DiskFileItemFactory());

		try {
			List<FileItem> items = uploadHandler.parseRequest(request);
			page=new String(items.get(0).getString().getBytes(
					"ISO-8859-1"), "UTF-8");
			p_no = new String(items.get(1).getString().getBytes(
					"ISO-8859-1"), "UTF-8");
			ProductVO productVO =new ProductDAO().findByPrimaryKey(Integer.parseInt(p_no));
			
			for (FileItem item : items) {
				if (item.isFormField()) {
					String fldName = item.getFieldName();
					if (fldName.equals("p_name")) { // 判斷p_name值，無誤就包進物件
						p_name = new String(item.getString().getBytes(
								"ISO-8859-1"), "UTF-8");

						if (p_name == null || p_name.trim().length() == 0) {
							errorMsgs.put("errName", "必須輸入商品名稱");
						} else {
						
							productVO.setP_name(p_name);
						}
					} else if (fldName.equals("p_year")) { // 將p_year包進物件
						p_year = new String(item.getString().getBytes(
								"ISO-8859-1"), "UTF-8");
						if (p_year == null || p_year.trim().length() == 0) {

						} else {
							
							productVO.setP_year(Integer.parseInt(p_year));
						}
					} else if (fldName.equals("p_area")) { // 判斷p_area值，無誤就包進物件
						p_area = new String(item.getString().getBytes(
								"ISO-8859-1"), "UTF-8");

						if (p_area == null || p_area.trim().length() == 0) {
							errorMsgs.put("errArea", "必須輸入國家名稱");
						} else {
							
							productVO.setP_area(p_area);
						}
					} else if (fldName.equals("p_country")) { // 將p_country包進物件
						p_country = new String(item.getString().getBytes(
								"ISO-8859-1"), "UTF-8");
						
						productVO.setP_country(p_country);
					} else if (fldName.equals("p_num")) { // 判斷p_num值，無誤就包進物件
						p_num = new String(item.getString().getBytes(
								"ISO-8859-1"), "UTF-8");
						p_num = p_num.trim();
						if (p_num == null || p_num.trim().length() == 0) {
							errorMsgs.put("errNum", "必須輸入數量");
						} else {
							try {
								number = Integer.parseInt(p_num);
								if (number < 0) {
									errorMsgs.put("errNum", "數量不能為負值");
								} else {
									
									productVO.setP_num(number);
								}
							} catch (NumberFormatException e) {
								errorMsgs.put("errNum", "數量必須是數值");
							}
						}

					} else if (fldName.equals("p_price")) { // 判斷p_price值，無誤就包進物件
						p_price = new String(item.getString().getBytes(
								"ISO-8859-1"), "UTF-8");
						p_price = p_price.trim();
						if (p_price == null || p_price.trim().length() == 0) {
							errorMsgs.put("errPrice", "必須輸入價格");
						} else {
							try {
								price = Integer.parseInt(p_price);
								if (price < 0) {
									errorMsgs.put("errPrice", "價錢不能為負值");
								} else {
									
									productVO.setP_price(price);
								}

							} catch (NumberFormatException e) {
								errorMsgs.put("errPrice", "價格必須是數值");
							}
						}
					} else if (fldName.equals("p_status")) { // 將p_status包進物件
						p_status = new String(item.getString().getBytes(
								"ISO-8859-1"), "UTF-8");
					
						productVO.setP_status(p_status);
					} else if (fldName.equals("p_winery")) { // 判斷p_winery值，無誤就包進物件
						p_winery = new String(item.getString().getBytes(
								"ISO-8859-1"), "UTF-8");

						if (p_winery == null || p_winery.trim().length() == 0) {
							errorMsgs.put("errWinery", "必須輸入酒莊名稱");
						} else {
							
							productVO.setP_winery(p_winery);
						}
					} else if (fldName.equals("p_style")) { // 判斷p_style值，無誤就包進物件
						p_style = new String(item.getString().getBytes(
								"ISO-8859-1"), "UTF-8");

						if (p_style == null || p_style.trim().length() == 0) {
							errorMsgs.put("errStyle", "必須輸入風味");
						} else {
							
							productVO.setP_style(p_style);
						}
					} else if (fldName.equals("p_sales")) { // 判斷p_sales值，無誤就包進物件
						p_sales = new String(item.getString().getBytes(
								"ISO-8859-1"), "UTF-8");

						if (p_sales == null || p_sales.trim().length() == 0) {
							productVO.setP_sales("NONE");
						} else {
							
							productVO.setP_sales(p_sales);
						}
					} else if (fldName.equals("p_vol")) { // 判斷p_vol值，無誤就包進物件
						p_vol = new String(item.getString().getBytes(
								"ISO-8859-1"), "UTF-8");
						p_vol = p_vol.trim();
						if (p_vol == null || p_vol.trim().length() == 0) {
							errorMsgs.put("errVol", "必須輸入容量");
						} else {
							try {
								vol = Integer.parseInt(p_vol);
								if (vol < 0) {
									errorMsgs.put("errVol", "容量不能為負值");
								} else {
									
									productVO.setP_vol(vol);
								}
							} catch (NumberFormatException e) {
								errorMsgs.put("errVol", "容量必須是數值");
							}
						}
					} else if (fldName.equals("p_alcho")) { // 判斷p_alcho值，無誤就包進物件
						p_alcho = new String(item.getString().getBytes(
								"ISO-8859-1"), "UTF-8");
						p_alcho = p_alcho.trim();
						if (p_alcho == null || p_alcho.trim().length() == 0) {
							errorMsgs.put("errAlcho", "必須輸入酒精濃度");
						} else {
							try {
								alcho = Double.parseDouble(p_alcho);
								if (alcho < 0) {
									errorMsgs.put("errAlcho", "酒精濃度不能為負值");
								} else {
								
									productVO.setP_alcho(alcho);
								}
							} catch (NumberFormatException e) {
								errorMsgs.put("errAlcho", "酒精濃度必須是數值");
							}
						}
					} else if (fldName.equals("p_date")) { // 將p_date包進物件
						p_date = new String(item.getString().getBytes(
								"ISO-8859-1"), "UTF-8");
						
						productVO.setP_date(Date.valueOf(p_date));
					} else if (fldName.equals("p_type")) { // 判斷p_type值，無誤就包進物件
						p_type = new String(item.getString().getBytes(
								"ISO-8859-1"), "UTF-8");

						if (p_type == null || p_type.trim().length() == 0) {
							errorMsgs.put("errType", "必須輸入商品種類");
						} else {
							
							productVO.setP_type(p_type);
						}
					} else if (fldName.equals("p_grape")) { // 判斷p_grape值，無誤就包進物件
						p_grape = new String(item.getString().getBytes(
								"ISO-8859-1"), "UTF-8");

						if (p_grape == null || p_grape.trim().length() == 0) {
							errorMsgs.put("errGrape", "必須輸入葡萄種類");
						} else {
							
							productVO.setP_grape(p_grape);
						}
					} else if (fldName.equals("p_intro")) { // 將p_intro包進物件
						p_intro = new String(item.getString().getBytes(
								"ISO-8859-1"), "UTF-8");
						if (p_intro == null || p_intro.trim().length() == 0) {
							errorMsgs.put("errIntro", "必須輸入商品介紹");
						} else {
						productVO.setP_intro(p_intro);
						}
					} 

				} else {
					// 將圖片存到資歷夾，並將p_pic包進物件進物件
					if (item.getName() != null
							&& item.getName().trim().length() > 0) {
                       
						MessageDigest md = MessageDigest.getInstance("MD5");
						byte[] b=new Long(new java.util.Date().getTime()).toString().getBytes();
						System.out.println(new Long(new java.util.Date().getTime()));
						byte[] hash=md.digest(b);
						StringBuilder sb = new StringBuilder();
						for (byte bb : hash) {
							sb.append(String.format("%02X", bb));
					    }
						productVO.setP_pic(sb.toString()+".jpg");
						String sss=request.getServletContext().getRealPath("/")+ "images/products/";
						
						File file = new File(sss, sb.toString()+".jpg");
						item.write(file);
					} 
				}
			}
			if (!errorMsgs.isEmpty()) {
				request.setAttribute("ErrMsg", errorMsgs);
				RequestDispatcher rd = request
						.getRequestDispatcher("/wine_admin/Maintain?action=getOne_For_Display&pId="+p_no);
				rd.forward(request, response);
				return;
			}
			new ProductDAO().update(productVO);
//			errorMsgs.put("success" , "資料新增成功");
		
			response.sendRedirect(response.encodeRedirectURL(request.getContextPath()+"/wine_admin/Maintain?action=getAll&update=success&pageNo="+page));
		} catch (FileUploadException e) {

			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
