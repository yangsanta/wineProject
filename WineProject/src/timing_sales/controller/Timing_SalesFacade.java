package timing_sales.controller;

import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import product.model.ProductDAO;
import product.model.ProductVO;

import timing_sales.model.Timing_Sales;
import timing_sales.model.Timing_SalesDAO;

public class Timing_SalesFacade {
	HttpServletRequest request = null;
	HttpServletResponse response = null;

	public Timing_SalesFacade() {
		System.out.println("Timing_SalesFacade Constructor without Parameter!");
	}

	public Timing_SalesFacade(HttpServletRequest request,
			HttpServletResponse response) {
		this.request = request;
		this.response = response;
	}

	public void saveOrUpdate() {
		if (!ServletFileUpload.isMultipartContent(request)) {
			throw new IllegalArgumentException(
					"Request is not multipart, please 'multipart/form-data' enctype for your form.");
		}
		System.out.println("Timing_SalesFacade is running!!!!!!!!!!!!");
		Map<String, String> errorMsgs = new HashMap<String, String>();
		// HttpSession session = request.getSession();

		String p_no, ts_price, ts_slogan, ts_content, ts_totalsales, dateString;
		Date ts_date;
		String ts_id = null;
		ServletFileUpload uploadHandler = new ServletFileUpload(
				new DiskFileItemFactory());

		Timing_Sales ts = new Timing_Sales();

		try {
			List<FileItem> list = uploadHandler.parseRequest(request); // 解析request
			System.out.println("list size is ==============="+list.size());
//			ts_id = new String(list.get(0).getString().getBytes("ISO-8859-1"),
//					"UTF-8"); // 尋找此限惠編號是否有存在
//			ts = new Timing_SalesDAO()
//					.findByPrimaryKey(Integer.parseInt(ts_id));

			for (FileItem fi : list) {
				System.out.println("for loop starting !!!!!!!!!!!!!!!!");
				String fldName = fi.getFieldName();
				System.out.println(fldName);
				if (fi.isFormField()) { // 如果是文字域
					if ("p_no".equals(fldName)) { // 取出各個值
						p_no = new String(fi.getString().getBytes(), "UTF-8");
						System.out.println("p_no====================" + p_no);
						if (p_no == null || p_no.trim().length() == 0) {
							errorMsgs.put("errP_no", "產品編號錯誤");
						} else {
							ProductVO productVO = new ProductVO();
							productVO.setP_no(Integer.parseInt(p_no));
							ts.setProductVO(productVO);
						}
					}
					else if ("ts_price".equals(fldName)) {
						ts_price = new String(fi.getString().getBytes(),
								"UTF-8");
						System.out.println("ts_price =============" + ts_price);
						if (ts_price == null || ts_price.trim().length() == 0) {
							errorMsgs.put("errTs_price", "限惠價錢錯誤");
						} else {
							ts.setTs_price(Integer.valueOf(ts_price));
						}
					}
					else if ("ts_slogan".equals(fldName)) {
						ts_slogan = new String(fi.getString().getBytes(),
								"UTF-8");
						System.out.println("ts_slogan ============="
								+ ts_slogan);
						if (ts_slogan == null || ts_slogan.trim().length() == 0) {
							errorMsgs.put("errTs_slogan", "限惠標語錯誤");
						} else {
							ts.setTs_slogan(ts_slogan);
						}
					}
					else if ("ts_content".equals(fldName)) {
						ts_content = new String(fi.getString().getBytes(),
								"UTF-8");
						System.out.println("ts_content ============="
								+ ts_content);
						if (ts_content == null
								|| ts_content.trim().length() == 0) {
							errorMsgs.put("errTs_content", "限惠標語錯誤");
						} else {
							ts.setTs_content(ts_content);
						}
					}
					else if ("ts_totalsales".equals(fldName)) {
						ts_totalsales = new String(fi.getString().getBytes(),
								"UTF-8");
						System.out.println("ts_totalsales ============="
								+ ts_totalsales);
						if (ts_totalsales == null
								|| ts_totalsales.trim().length() == 0) {
							errorMsgs.put("errTs_totalsales", "限惠總購買數錯誤");
						} else {
							ts.setTs_totalsale(Integer.valueOf(ts_totalsales));
						}
					}
					else if ("ts_date".equals(fldName)) {
						dateString = new String(fi.getString().getBytes(),
								"UTF-8");
						System.out.println("ts_date =======String======"
								+ dateString);
						if (dateString == null
								|| dateString.trim().length() == 0) {
							errorMsgs.put("errTs_date", "限惠日期錯誤");
						} else {
							System.out.println(dateString);
							SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
							java.util.Date utildate = sdf.parse(dateString);
							System.out.println(utildate + "utildate =======Class======" + utildate.getClass());
							ts_date = new java.sql.Date(utildate.getTime());
							System.out.println( ts_date + " ts_date =======Class======" + ts_date.getClass());
							ts.setTs_date(ts_date);

						}
					}
				} else { 										// 否則為檔案域
					if ("file".equals(fldName)) {

						if (fldName != null && fi.getName().trim().length() > 0) {

//							String targetPath = request.getServletContext()
//									.getRealPath("\\")
//									+ "images\\timingSales\\";
//							System.out.println("目標儲存路徑" + targetPath);
							String fileUrl = request.getServletContext()
									.getRealPath("\\")
									+ "images\\timingSales\\";
							File file = new File(fileUrl, fi.getName());
							fi.write(file);
							ts.setTs_pic(fi.getName());


						}
					}
				}
				
			}
			if (!errorMsgs.isEmpty()) {
				request.setAttribute("ErrMsg", errorMsgs);

				RequestDispatcher rd = request
						.getRequestDispatcher("wine_admin/ademin_TS_insert.jsp");
				rd.forward(request, response);
				return;
			}

			new Timing_SalesDAO().update(ts);
			errorMsgs.put("success", "資料新增成功");
			response.sendRedirect("wine_admin/ademin_TS_List.jsp");

		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}

	}
}
