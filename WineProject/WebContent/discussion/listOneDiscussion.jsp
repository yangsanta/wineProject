<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
<%-- �D�D:${discussionVO.d_title}<br/> --%>
<%-- �o����:${discussionVO.d_datetime}<br/> --%>
<%-- �@��ID:${discussionVO.m_no}<br/> --%>
<%-- ����:${discussionVO.d_context} --%>

<table  border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<td>�D�D:${discussionVO.d_title}</td>
		<td>�o����:${discussionVO.d_datetime}</td>
		<td>�@��ID:${discussionVO.m_no}</td>
	</tr>
	<tr>
		<td colspan="3">����:${discussionVO.d_context}</td>
	</tr>
</table>
</body>
</html>