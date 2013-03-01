<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 主題:${discussionVO.d_title}<br/> --%>
<%-- 發表日期:${discussionVO.d_datetime}<br/> --%>
<%-- 作者ID:${discussionVO.m_no}<br/> --%>
<%-- 內文:${discussionVO.d_context} --%>

<table  border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<td>主題:${discussionVO.d_title}</td>
		<td>發表日期:${discussionVO.d_datetime}</td>
		<td>作者ID:${discussionVO.memberVO.m_id}</td>
	</tr>
	<tr>
		<td colspan="3">內文:${discussionVO.d_context}</td>
	</tr>
</table>
</body>
</html>