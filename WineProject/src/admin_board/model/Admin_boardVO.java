package admin_board.model;

import java.sql.Timestamp;

public class Admin_boardVO implements java.io.Serializable {
	private Integer i_no;
	private String remoteAddr;
	private String queryString;
	private String servletPath;
	private String userAgent;
	private String lastReferer;
	private Timestamp viewedate;
	private String user_os;	
	private String user_browser;

	public Integer getI_no() {
		return i_no;
	}
	public void setI_no(Integer i_no) {
		this.i_no = i_no;
	}
	public String getQueryString() {
		return queryString;
	}

	

	public void setQueryString(String queryString) {
		this.queryString = queryString;
	}

	public String getRemoteAddr() {
		return remoteAddr;
	}

	public void setRemoteAddr(String remoteAddr) {
		this.remoteAddr = remoteAddr;
	}


	public String getServletPath() {
		return servletPath;
	}

	public void setServletPath(String servletPath) {
		this.servletPath = servletPath;
	}

	public String getUserAgent() {
		return userAgent;
	}

	public void setUserAgent(String userAgent) {
		this.userAgent = userAgent;
	}

	public Timestamp getViewedate() {
		return viewedate;
	}

	public void setViewedate(Timestamp viewedate) {
		this.viewedate = viewedate;
	}
	public String getUser_os() {
		return user_os;
	}

	public void setUser_os(String user_os) {
		this.user_os = user_os;
	}
	
	
	public String getUser_browser() {
		return user_browser;
	}

	public void setUser_browser(String user_browser) {
		this.user_browser = user_browser;
	}
	
	public String getLastReferer() {
		return lastReferer;
	}

	public void setLastReferer(String lastReferer) {
		this.lastReferer = lastReferer;
	}
	
	
}
