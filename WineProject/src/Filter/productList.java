package Filter;


import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.ProductDAO;
import product.model.ProductVO;
import admin_board.model.Admin_boardHibernateDAO;
import admin_board.model.Admin_boardVO;
import admin_board.model.User_info_jugement;

/**
 * Servlet Filter implementation class productList
 */
@WebFilter("/productList")
public class productList implements Filter {

    public productList() {  }

	public void destroy() {	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//計時器
		long timeStart = 0;  
		 long timeEnd = 0;  
		timeStart =System.currentTimeMillis();  
		//計時器
		ProductDAO dao = new ProductDAO();
		List<String> France = dao.findCountry("法國");
//		for(String aaa:France){
//			System.out.println(aaa);
//		}
		request.setAttribute("France", France);
		List<String> Australia = dao.findCountry("澳洲");
		request.setAttribute("Australia", Australia);
		List<String> America = dao.findCountry("美國加州");
		request.setAttribute("America", America);
		List<String> Italy = dao.findCountry("義大利");
		request.setAttribute("Italy", Italy);
		List<String> Germany = dao.findCountry("德國");
		request.setAttribute("Germany", Germany);
		List<String> Spain = dao.findCountry("西班牙");
		request.setAttribute("Spain", Spain);
		List<String> Argentina = dao.findCountry("阿根廷");
		request.setAttribute("Argentina", Argentina);
		List<String> Chile = dao.findCountry("智利");
		request.setAttribute("Chile", Chile);
		List<String> Portugal = dao.findCountry("葡萄牙");
		request.setAttribute("Portugal", Portugal);
		List<String> style = dao.findProductType("p_style");
		request.setAttribute("style", style);
		List<String> p_winery = dao.findProductType("p_winery");
		request.setAttribute("p_winery", p_winery);
		List<String> p_vol = dao.findProductType("p_vol");
		request.setAttribute("p_vol", p_vol);
		List<String> redWine = dao.findGrapeType("紅葡萄酒");
		request.setAttribute("redWine", redWine);
		List<String> whiteWine = dao.findGrapeType("白葡萄酒");
		request.setAttribute("whiteWine", whiteWine);
		List<String> bubbleWine = dao.findGrapeType("氣泡酒");
		request.setAttribute("bubbleWine", bubbleWine);
		
//		首頁的左邊選單熱門商品
		ProductDAO productDAO = new ProductDAO();
		List<ProductVO> hot_product2  = productDAO.findTopProduct("10");
		request.setAttribute("hot_product2", hot_product2);
		
		
		
		
		chain.doFilter(request, response);
		
		//計時  ， 網站上線時砍掉
		HttpServletRequest request2 = (HttpServletRequest) request;
		HttpServletResponse response2 = (HttpServletResponse) response;
		timeEnd = System.currentTimeMillis(); 
		
		System.out.print("[開始]：" + timeStart + "ms [結束]：" + timeEnd + "ms[ 花費時間]：" + (timeEnd - timeStart) + "ms |"); 
		System.out.println(request2.getHeader("referer"));
		//計時
		//
		System.out.println("---   Remote Addr: " + request2.getRemoteAddr()); // Remote Addr: 127.0.0.1
		System.out.println("---   Query String: " + request2.getQueryString()); // Query String: action=getSome_For_Display&condition=p_sales&conditionValue=
		System.out.println("---   Servlet Path: " + request2.getServletPath()); // Servlet Path: /admin_board/DisplayAdmin_boards
		System.out.println("---   Referer : " + request2.getHeader("Referer")); // Referer : http://localhost:8080/WineProject/admin_board/DisplayAdmin_boards?action=getSome_For_Display&condition=p_sales&conditionValue=
		System.out.println("---   User-Agent : " + request2.getHeader("User-Agent")); // User-Agent : Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.152 Safari/537.22
		//
		//判斷user資訊
		User_info_jugement User_info_jugement=new User_info_jugement();
		String user_os= User_info_jugement.judgeOs(request2.getHeader("User-Agent"));
		System.out.println("系統是:"+user_os);
		String user_Browser= User_info_jugement.judgeBrowser(request2.getHeader("User-Agent"));
		System.out.println("瀏覽器是:"+user_Browser);		

		//判斷是否來自外站連結
		String referer=null;
		if(request2.getHeader("Referer")!=null){
		 referer=(request2.getHeader("Referer").startsWith("http://"+request2.getHeader("Host")))?request2.getHeader("Referer") : null;
		}

		Admin_boardHibernateDAO admindao = new Admin_boardHibernateDAO();
		 Admin_boardVO admin_boardVOO1 = new Admin_boardVO();
		 admin_boardVOO1.setQueryString(request2.getQueryString());
		 admin_boardVOO1.setRemoteAddr(request2.getRemoteAddr());
		 admin_boardVOO1.setServletPath(request2.getServletPath());
		 admin_boardVOO1.setLastReferer(referer);	 
		 admin_boardVOO1.setUserAgent(request2.getHeader("User-Agent"));
		 admin_boardVOO1.setUser_browser(user_Browser);		 
		 admin_boardVOO1.setUser_os(user_os);
			Timestamp time = new java.sql.Timestamp(new java.util.Date().getTime());
		 admin_boardVOO1.setViewedate(time);		 
		 admindao.insert(admin_boardVOO1);
		 
		System.out.println("字串長度"+ request2.getHeader("User-Agent").length());
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
