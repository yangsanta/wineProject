package member.controller;

import java.io.File;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.MemberDAO;
import member.model.MemberVO;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import product.model.ProductDAO;

public class MenberPicByUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MenberPicByUser() {
		super();

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		if (!ServletFileUpload.isMultipartContent(request)) {
			throw new IllegalArgumentException(
					"Request is not multipart, please 'multipart/form-data' enctype for your form.");
		}
		ServletFileUpload uploadHandler = new ServletFileUpload(
				new DiskFileItemFactory());
		List<FileItem> items;
		try {
			items = uploadHandler.parseRequest(request);
			String m_no = new String(items.get(0).getString()
					.getBytes("ISO-8859-1"), "UTF-8");
			MemberDAO memberDAO = new MemberDAO();
			MemberVO memberVO = memberDAO.findByPrimaryKey(Integer
					.parseInt(m_no));
			for (FileItem item : items) {
				if (item.getName() != null
						&& item.getName().trim().length() > 0) {

					MessageDigest md = MessageDigest.getInstance("MD5");
					byte[] b = new Long(new java.util.Date().getTime())
							.toString().getBytes();
					
					byte[] hash = md.digest(b);
					StringBuilder sb = new StringBuilder();
					for (byte bb : hash) {
						sb.append(String.format("%02X", bb));
					}
					memberVO.setM_pic(sb.toString() + ".jpg");
					String sss = request.getServletContext().getRealPath("\\")
							+ "images\\";

					File file = new File(sss, sb.toString() + ".jpg");
					item.write(file);
					
					
				}

			}
			
			new MemberDAO().update(memberVO);
			
			response.sendRedirect(request.getContextPath()+"/memberCRUD/MemberUpdate?action=getOne_For_Display&m_no="+m_no);
			
			
		} catch (FileUploadException e) {

			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
