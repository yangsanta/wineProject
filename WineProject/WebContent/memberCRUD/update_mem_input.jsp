<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="member.model.*"%>

<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO"); //MemberServlet.java (Controller), 存入req的memberVO物件 (包括幫忙取出的memberVO, 也包括輸入資料錯誤時的memberVO物件)
%>

<html>
<head>
<title>員工資料修改 - update_mem_input.jsp</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>

	<table border='1' cellpadding='5' cellspacing='0' width='400'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td><h3>員工資料修改 - update_mem_input.jsp</h3>
			          <a href="select_page.jsp"><img src="images/back1.gif"  width="100" height="32" border="0">回首頁 </a></td></tr></table>

<h3>資料修改:</h3>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<FORM METHOD="post" ACTION="mem.do" name="form1">
<table border="0">
	<tr>
		<td>m_no<font color=red><b>*</b></font></td>
		<td><%=memberVO.getM_no()%></td>
	</tr>
	<tr>
		<td>m_id</td>
		<td><input type="TEXT" name="m_id" size="45" value="<%=memberVO.getM_id()%>" /></td>
	</tr>

	<tr>
		<td>m_name</td>
		<td><input type="TEXT" name="m_name" size="45" value="<%=memberVO.getM_name()%>" /></td>
	</tr>
	<tr>
		<td>m_pwd</td>
		<td><input type="TEXT" name="m_pwd" size="45"	value="<%=memberVO.getM_pwd()%>" /></td>
	</tr>
	<tr>
		<td>m_mobile</td>
		<td><input type="TEXT" name="m_mobile" size="45"	value="<%=memberVO.getM_mobile()%>" /></td>
	</tr>
	<tr>
		<td>m_email</td>
		<td><input type="TEXT" name="m_email" size="45"	value="<%=memberVO.getM_email()%>" /></td>
	</tr>	
	<tr>
		<td>m_bday</td>
		<td bgcolor="#CCCCFF">
		    <input class="cal-TextBox"
			onFocus="this.blur()" size="9" readonly type="text" name="m_bday" value="<%=memberVO.getM_bday()%>">
			<a class="so-BtnLink"
			href="javascript:calClick();return false;"
			onmouseover="calSwapImg('BTN_date', 'img_Date_OVER',true);"
			onmouseout="calSwapImg('BTN_date', 'img_Date_UP',true);"
			onclick="calSwapImg('BTN_date', 'img_Date_DOWN');showCalendar('form1','m_bday','BTN_date');return false;">
		    <img align="middle" border="0" name="BTN_date"	src="images/btn_date_up.gif" width="22" height="17" alt="開始日期"></a>
		</td>
	</tr>
	<tr>
		<td>m_addr</td>
		<td><input type="TEXT" name="m_addr" size="45"	value="<%=memberVO.getM_addr()%>" /></td>
	</tr>
	<tr>
		<td>m_pic</td>
		<td><input type="TEXT" name="m_pic" size="45"	value="<%=memberVO.getM_pic()%>" /></td>
	</tr>
	<tr>
		<td>m_safety_q</td>
		<td><input type="TEXT" name="m_safety_q" size="45"	value="<%=memberVO.getM_safety_q()%>" /></td>
	</tr>
	<tr>
		<td>m_safety_a</td>
		<td><input type="TEXT" name="m_safety_a" size="45"	value="<%=memberVO.getM_safety_a()%>" /></td>
	</tr>
	<tr>
		<td>m_status</td>
		<td><input type="TEXT" name="m_status" size="45"	value="<%=memberVO.getM_status()%>" /></td>
	</tr>					
	<tr>

<%-- 	<jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" /> --%>
<!-- 	<tr> -->
<!-- 		<td>部門:<font color=red><b>*</b></font></td> -->
<!-- 		<td><select size="1" name="deptno"> -->
<%-- 			<c:forEach var="deptVO" items="${deptSvc.all}"> --%>
<%-- 				<option value="${deptVO.deptno}" ${(empVO.deptVO.deptno==deptVO.deptno)?'selected':'' } >${deptVO.dname} --%>
<%-- 			</c:forEach> --%>
<!-- 		</select></td> -->
<!-- 	</tr> -->

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="m_no" value="<%=memberVO.getM_no()%>">
<input type="submit" value="送出修改"></FORM>

</body>
</html>
