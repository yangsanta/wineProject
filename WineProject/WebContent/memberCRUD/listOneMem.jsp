<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>員工資料 - listOneMem.jsp</title>
</head>
<body bgcolor='white'>

	<table border='1' cellpadding='5' cellspacing='0' width='800'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td><h3>員工資料 - ListOneMem.jsp</h3>
		              <a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></td></tr></table>

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>m_no</th>
		<th>m_id</th>
		<th>m_name</th>
		<th>m_pwd</th>
		<th>m_mobile</th>
		<th>m_email</th>
		<th>m_bday</th>
		<th>m_addr</th>
		<th>m_pic</th>
		<th>m_safety_q</th>
		<th>m_safety_a</th>
		<th>m_status</th>
	</tr>
	<tr align='center' valign='middle'>
		<td>${memberVO.m_no}</td>
		<td>${memberVO.m_id}</td>
		<td>${memberVO.m_name}</td>
		<td>${memberVO.m_pwd}</td>
		<td>${memberVO.m_mobile}</td>
		<td>${memberVO.m_email}</td>
		<td>${memberVO.m_bday}</td>
		<td>${memberVO.m_addr}</td>
		<td>${memberVO.m_pic}</td>
		<td>${memberVO.m_safety_q}</td>
		<td>${memberVO.m_safety_a}</td>
		<td>${memberVO.m_status}</td>	        
	 </tr>
</table>

</body>
</html>
