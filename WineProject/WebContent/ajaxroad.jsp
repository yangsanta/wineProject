<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import=" java.net.*"%>
<%@ page import=" java.io.*"%>
<%
String noneuse="中文";
String q=request.getParameter("q");
q = new String(q.getBytes("ISO-8859-1"),"UTF-8");
String sCurrentLine;
String sTotalString;
sCurrentLine = "";
sTotalString = "";
InputStream l_urlStream;
URL l_url = new URL("http://www.davidou.org/test/ajaxroad/getuser.php?q="+q);
URLConnection l_connection = l_url.openConnection();
l_urlStream = l_connection.getInputStream();
BufferedReader l_reader = new BufferedReader(new InputStreamReader(
l_urlStream));
int i=1;
while ((sCurrentLine = l_reader.readLine()) != null) {
	if(sCurrentLine!=null)
{sTotalString = sCurrentLine + "\r\n";
i++;}
	
}
out.print(sTotalString);
%>