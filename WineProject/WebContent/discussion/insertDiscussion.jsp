<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#textContext {
	border: 1px solid;
}
</style>

</head>
<body>
	<form action="<c:url value='/insertDiscussion'/>" method="post">
		Title:<input type="text" name="d_title"><br /> 
		Content:<textarea cols="50" rows="3" id="textContext" name="d_context"></textarea><br />
		<input type="submit" value="Send">
		<input type="hidden" name="action" value="insert">
	</form>
</body>
</html>