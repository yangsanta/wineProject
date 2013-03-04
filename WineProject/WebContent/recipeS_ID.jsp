<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.LinkedHashMap"%> 
<%@page import="java.util.Map"%>  
<%@page import="java.util.HashMap"%>
<%@page import="java.util.LinkedList"%>  
<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page import="java.sql.*;" %>

<%
Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;
String url = "jdbc:sqlserver://localhost:1433;DatabaseName=WineProject";
String query = "select DISTINCT s_id from recipe where i_id=? ";
String eid = request.getParameter("id");
try{
	DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
	conn = DriverManager.getConnection(url, "sa", "sa123456");

	
	stmt = conn.prepareStatement(query);
	stmt.setString(1,eid);
	 rs = stmt.executeQuery();
	 JSONArray list = new JSONArray();
	 while (rs.next()) {
		 list.add(rs.getInt(1));
	 }	                   
	 out.println(list);
}
catch(SQLException e){
	out.println("Error:" + e.getMessage());
}
finally{
	if(rs != null){
	   rs.close();
	}
	if(stmt != null){
	 stmt.close();
	}
	if(conn != null){
	}
}

%>