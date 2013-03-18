<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="member.model.*"%>
<%-- �����ĥ� JSTL �P EL ���� --%>

<%
    MemberService memberSvc = new MemberService();
    List<MemberVO> list = memberSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>�Ҧ��|����� - listAllMem.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>�����m�߱ĥ� EL ���g�k����:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td><h3>�Ҧ��|����� - listAllMem.jsp</h3>
		          <a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></td></tr></table>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>�Эץ��H�U���~:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

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
		<th>�ק�</th>
		<th>�R��</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="memberVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
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
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/memberCRUD/mem.do">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="m_no" value="${memberVO.m_no}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/memberCRUD/mem.do">
			    <input type="submit" value="�R��">
			    <input type="hidden" name="m_no" value="${memberVO.m_no}">
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>
