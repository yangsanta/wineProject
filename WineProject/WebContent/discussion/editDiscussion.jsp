<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
	<form action="insertDiscussion" method="post">
		Title:<input type="text" name="d_title" value="${discussionVO.d_title}"><br /> 
		Content:<textarea cols="50" rows="3" id="textContext" name="d_context">${discussionVO.d_context}</textarea><br />
		<input type="submit" value="Send">
		<input type="hidden" name="action" value="update">
		<input type="hidden" name="d_datetime" value="${discussionVO.d_datetime}">
		<input type="hidden" name="d_status" value="${discussionVO.d_status}">
		<input type="hidden" name="m_no" value="${discussionVO.memberVO.m_no}">
		<input type="hidden" name="d_no" value="${discussionVO.d_no}">
	</form><br/>
</body>
</body>
</html>