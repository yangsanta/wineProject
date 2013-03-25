<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="member.model.*"%>
<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO"); //MemberServlet.java (Controller), 存入req的memberVO物件 (包括幫忙取出的memberVO, 也包括輸入資料錯誤時的memberVO物件)
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="../memberCRUD/js/memberCRUD.js"></script>
<link rel="stylesheet" href="../memberCRUD/css/memberCRUD.css" type="text/css" />
<script type="text/javascript">
$(document).ready(function()
  { $('#MyForm').formly({'onBlur':false});
   });
</script>

<title>會員資料修改</title>
</head>
<body bgcolor='white'>

	<table border='1' cellpadding='5' cellspacing='0' width='800'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td><h3>會員資料修改</h3>
		              <a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></td></tr></table>

<%-- 	<div>
		<form id="MyForm" width="300px" title="酒迷網" subtitle="會員資料修改" method="post" action="mem.do">
			流水號：&nbsp;&nbsp;&nbsp;<input type="text" name="m_id" value="<%=memberVO.getM_no()%>" readonly="readonly" /><br>
			帳號：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="m_id" value="<%=memberVO.getM_id()%>" readonly="readonly" /><br>
			密碼：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="m_pwd" require="true" label="密碼" value="<%=memberVO.getM_pwd()%>" /><br>
			e-Mail：&nbsp;&nbsp;&nbsp;<input type="text" name="m_email" value="<%=memberVO.getM_email()%>" /><br>
			姓名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="m_name" require="true" label="賬號" 	value="<%=memberVO.getM_name()%>" /><br>
			生日：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="m_bday" value="<%=memberVO.getM_bday()%>" /><br> 
			行動電話：<input type="text" name="m_mobile" value="<%=memberVO.getM_mobile()%>" /><br>
			通訊地址：<input type="text" name="m_addr" 	value="<%=memberVO.getM_addr()%>" /><br>
			圖片：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="m_pic" value="<%=memberVO.getM_pic()%>" /><br> 
			安全提問：<input type="text" name="m_safety_q" value="<%=memberVO.getM_safety_q()%>" /><br>
			答案：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="m_safety_a" value="<%=memberVO.getM_safety_a()%>" /><br>
			狀態：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="m_status" value="<%=memberVO.getM_status()%>" /><br> 
			<input type="hidden" name="action" value="update"> 
			<input type="hidden" name="m_no" value="<%=memberVO.getM_no()%>">
			<input type="submit" value="送出修改" /> <input type="reset" value="清除" />
		</form>
	</div> --%>
	
	<tr>
		<th>流水號</th>
		<th>帳號</th>
		<th>密碼</th>
		<th>e-Mail</th>
		<th>姓名</th>
		<th>生日</th>
		<th>行動電話</th>
		<th>通訊地址</th>
		<th>圖片</th>
		<th>安全提問</th>
		<th>答案</th>
		<th>狀態</th>
	</tr>
	<tr align='center' valign='middle'>
		     <td>${memberVO.m_no}</td>
			 <td>${memberVO.m_id}</td>
			 <td>${memberVO.m_pwd}</td>
			 <td>${memberVO.m_email}</td>
			 <td>${memberVO.m_name}</td>
			 <td>${memberVO.m_bday}</td>
			 <td>${memberVO.m_mobile}</td>
			 <td>${memberVO.m_addr}</td>
			 <td>${memberVO.m_pic}</td>
			 <td>${memberVO.m_safety_q}</td>
			 <td>${memberVO.m_safety_a}</td>
			 <td>${memberVO.m_status}</td>
			 </tr>

</body>
</html>
