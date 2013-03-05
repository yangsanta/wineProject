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
		ProductDAO dao = new ProductDAO();
		List<String> area = dao.findProductType("p_area");
		request.setAttribute("area", area);
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
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
