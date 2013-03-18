package admin_board.model;

import java.sql.Timestamp;

public class Admin_boardVO implements java.io.Serializable {
	private Integer i_no;
	private String RemoteAddr;
	private String QueryString;
	private String ServletPath;
	private String UserAgent;
	private Timestamp viewedate;
	private String user_os;	
	private String user_browser;

	public Integer geti_no() {
		return i_no;
	}
	public void seti_no(Integer i_no) {
		this.i_no = i_no;
	}
	public String getQueryString() {
		return QueryString;
	}

	

	public void setQueryString(String QueryString) {
		this.QueryString = QueryString;
	}

	public String getRemoteAddr() {
		return RemoteAddr;
	}

	public void setRemoteAddr(String RemoteAddr) {
		this.RemoteAddr = RemoteAddr;
	}


	public String getServletPath() {
		return ServletPath;
	}

	public void setServletPath(String ServletPath) {
		this.ServletPath = ServletPath;
	}

	public String getUserAgent() {
		return UserAgent;
	}

	public void setUserAgent(String UserAgent) {
		this.UserAgent = UserAgent;
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

	
	
}
