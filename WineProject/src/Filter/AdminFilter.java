package Filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminFilter implements Filter {


    public AdminFilter() {

    }


	public void destroy() {

	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	
		HttpServletRequest req=  (HttpServletRequest)request;
		HttpServletResponse resp=  (HttpServletResponse)response;
		HttpSession	session =req.getSession();
		
		
		if(session.getAttribute("a_id")==null){
			resp.sendRedirect(req.getContextPath()+"/admin/index.jsp");
		
		}else{
			
			chain.doFilter(req, resp);
			}
 		
	}
private FilterConfig fConfig;
	public void init(FilterConfig fConfig) throws ServletException {
	this.fConfig=fConfig;
	}

}
