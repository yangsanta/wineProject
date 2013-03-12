package Filter;


import java.io.IOException;
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

/**
 * Servlet Filter implementation class productList
 */
@WebFilter("/productList")
public class productList implements Filter {
	 
	  
	  
    /**
     * Default constructor. 
     */
    public productList() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
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
		
		chain.doFilter(request, response);
		//計時  ， 網站上線時砍掉
		HttpServletRequest request2 = (HttpServletRequest) request;
		HttpServletResponse response2 = (HttpServletResponse) response;
		timeEnd = System.currentTimeMillis(); 
		
		System.out.print("[開始]：" + timeStart + "ms [結束]：" + timeEnd + "ms[ 花費時間]：" + (timeEnd - timeStart) + "ms |"); 
		System.out.println(request2.getHeader("referer"));
		//計時
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
