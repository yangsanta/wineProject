<%@ page contentType="text/html; charset=Big5"%>
<%@ page import="java.net.*"%>
<%@ page import="java.io.*"%>

<%
	// 變數宣告
	String msg;
	String thisLine;
	URL u;
	URLConnection uc;

	// 設定參數
	String username = "davidou"; // 帳號
	String password = "davideric"; // 密碼
	String mobile = "0971091213"; // 電話
	String message = "簡訊內容 java班"; // 簡訊內容

	msg = "http://api.twsms.com/smsSend.php?username=" + username
			+ "&password=" + password + "&mobile=" + mobile
			+ "&message=" + URLEncoder.encode(message);

	u = new URL(msg);
	try {
		uc = u.openConnection();
		BufferedReader theHTML = new BufferedReader(
				new InputStreamReader(uc.getInputStream()));
		thisLine = theHTML.readLine();
%>
回傳訊息:
<%=thisLine%>
<%
	} catch (Exception e) {
%>
無法連結網站
<%=e.getMessage()%>
<%
	}
%>
