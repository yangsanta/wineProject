<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="member.model.*"%>
<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO"); //MemberServlet.java (Controller), �s�Jreq��memberVO���� (�]�A�������X��memberVO, �]�]�A��J��ƿ��~�ɪ�memberVO����)
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

<title>�|����ƭק�</title>
</head>
<body bgcolor='white'>

	<table border='1' cellpadding='5' cellspacing='0' width='800'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td><h3>�|����ƭק�</h3>
		              <a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></td></tr></table>

<%-- 	<div>
		<form id="MyForm" width="300px" title="�s�g��" subtitle="�|����ƭק�" method="post" action="mem.do">
			�y�����G&nbsp;&nbsp;&nbsp;<input type="text" name="m_id" value="<%=memberVO.getM_no()%>" readonly="readonly" /><br>
			�b���G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="m_id" value="<%=memberVO.getM_id()%>" readonly="readonly" /><br>
			�K�X�G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="m_pwd" require="true" label="�K�X" value="<%=memberVO.getM_pwd()%>" /><br>
			e-Mail�G&nbsp;&nbsp;&nbsp;<input type="text" name="m_email" value="<%=memberVO.getM_email()%>" /><br>
			�m�W�G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="m_name" require="true" label="�㸹" 	value="<%=memberVO.getM_name()%>" /><br>
			�ͤ�G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="m_bday" value="<%=memberVO.getM_bday()%>" /><br> 
			��ʹq�ܡG<input type="text" name="m_mobile" value="<%=memberVO.getM_mobile()%>" /><br>
			�q�T�a�}�G<input type="text" name="m_addr" 	value="<%=memberVO.getM_addr()%>" /><br>
			�Ϥ��G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="m_pic" value="<%=memberVO.getM_pic()%>" /><br> 
			�w�����ݡG<input type="text" name="m_safety_q" value="<%=memberVO.getM_safety_q()%>" /><br>
			���סG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="m_safety_a" value="<%=memberVO.getM_safety_a()%>" /><br>
			���A�G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="m_status" value="<%=memberVO.getM_status()%>" /><br> 
			<input type="hidden" name="action" value="update"> 
			<input type="hidden" name="m_no" value="<%=memberVO.getM_no()%>">
			<input type="submit" value="�e�X�ק�" /> <input type="reset" value="�M��" />
		</form>
	</div> --%>
	
	<tr>
		<th>�y����</th>
		<th>�b��</th>
		<th>�K�X</th>
		<th>e-Mail</th>
		<th>�m�W</th>
		<th>�ͤ�</th>
		<th>��ʹq��</th>
		<th>�q�T�a�}</th>
		<th>�Ϥ�</th>
		<th>�w������</th>
		<th>����</th>
		<th>���A</th>
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
