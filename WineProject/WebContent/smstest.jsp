<%@ page contentType="text/html; charset=Big5"%>
<%@ page import="java.net.*"%>
<%@ page import="java.io.*"%>

<%
	// �ܼƫŧi
	String msg;
	String thisLine;
	URL u;
	URLConnection uc;

	// �]�w�Ѽ�
	String username = "davidou"; // �b��
	String password = ""; // �K�X
	String mobile = "0971091213"; // �q��
	String message = "²�T���e java�Z"; // ²�T���e

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
�^�ǰT��:
<%=thisLine%>
<%
	} catch (Exception e) {
%>
�L�k�s������
<%=e.getMessage()%>
<%
	}
%>