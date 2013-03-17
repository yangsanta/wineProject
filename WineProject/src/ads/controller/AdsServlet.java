package ads.controller;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.json.JSONArray;
import org.json.JSONObject;

public class AdsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.print("AdsServlet doPost is running up.");
		request.setCharacterEncoding("UTF-8");

		if (request.getParameter("pic") != null
				&& !request.getParameter("pic").isEmpty()) {
			File file = new File(request.getServletContext().getRealPath("/")
					+ "images/ad/" + request.getParameter("pic"));

			if (file.exists()) {
				int bytes = 0;
				ServletOutputStream op = response.getOutputStream();

				response.setContentType(getMimeType(file));
				response.setContentLength((int) file.length());
				response.setHeader("Content-Disposition", "inline; filename=\""
						+ file.getName() + "\"");

				byte[] bbuf = new byte[1024];
				DataInputStream in = new DataInputStream(new FileInputStream(
						file));

				while ((in != null) && ((bytes = in.read(bbuf)) != -1)) {
					op.write(bbuf, 0, bytes);
				}

				cloneFile(file);

				in.close();
				op.flush();
				op.close();
			}
		} else if (request.getParameter("delfile") != null
				&& !request.getParameter("delfile").isEmpty()) {
			File file = new File(request.getServletContext().getRealPath("/")
					+ "images/ad/" + request.getParameter("delfile"));
			if (file.exists()) {
				file.delete(); // TODO:check and report success
			}
		} else {
			PrintWriter writer = response.getWriter();
			writer.write("call POST with multipart form data");
		}
	}


	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		System.out.println("AdsServlet doPost is running up.");
		request.setCharacterEncoding("UTF-8");

		if (!ServletFileUpload.isMultipartContent(request)) {
			throw new IllegalArgumentException(
					"Request is not multipart, please 'multipart/form-data' enctype for your form.");
		}

		ServletFileUpload uploadHandler = new ServletFileUpload(
				new DiskFileItemFactory());
		PrintWriter writer = response.getWriter();
		response.setContentType("application/json");
		JSONArray json = new JSONArray();
		try {
			List<FileItem> items = uploadHandler.parseRequest(request);
			for (FileItem item : items) {
				if (!item.isFormField()) {
					File file = new File(request.getServletContext()
							.getRealPath("/") + "images/ad/", item.getName());
					item.write(file);
					
					cloneFile(file);
					
					JSONObject jsono = new JSONObject();
					jsono.put("name", item.getName());
					jsono.put("size", item.getSize());
					jsono.put(
							"url",
							request.getServletContext().getRealPath("/")
									+ "product/advertisements?pic="
									+ item.getName());
					jsono.put(
							"delete_url",
							request.getServletContext().getRealPath("/")
									+ "product/advertisements?delfile="
									+ item.getName());
					jsono.put("delete_type", "GET");
					json.put(jsono);
					System.out.println(json.toString());
				}
			}
		} catch (FileUploadException e) {
			throw new RuntimeException(e);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			writer.write(json.toString());
			writer.close();
		}

	}

	private String getMimeType(File file) {
		String mimetype = "";
		if (file.exists()) {
			if (getSuffix(file.getName()).equalsIgnoreCase("png")) {
				mimetype = "image/png";
			} else if (getSuffix(file.getName()).equalsIgnoreCase("jpg")) {
				mimetype = "image/jpg";
			} else if (getSuffix(file.getName()).equalsIgnoreCase("jpeg")) {
				mimetype = "image/jpeg";
			} else if (getSuffix(file.getName()).equalsIgnoreCase("gif")) {
				mimetype = "image/gif";
			} else {
				javax.activation.MimetypesFileTypeMap mtMap = new javax.activation.MimetypesFileTypeMap();
				mimetype = mtMap.getContentType(file);
			}
		}
		return mimetype;
	}

	private String getSuffix(String filename) {
		String suffix = "";
		int pos = filename.lastIndexOf('.');
		if (pos > 0 && pos < filename.length() - 1) {
			suffix = filename.substring(pos + 1);
		}
		return suffix;
	}

	private void cloneFile(File file) {
		File folderPath = new File("C:\\images\\ad") ;
		if ( !folderPath.exists() ) {
		   folderPath.mkdirs();   
		}
		
		File fileC = new File("C:\\images\\ad" , file.getName());

		try {
			InputStream is = new FileInputStream(file);
			OutputStream os = new FileOutputStream(fileC);
	
			byte[] b = new byte[1024];
			int len;
			
			while ( (len = is.read(b)) != -1 ) {
			    os.write( b, 0, len);
			}
			
			is.close();
			os.close();
		} catch (IOException e) {
			e.printStackTrace();
		}


	}

}
