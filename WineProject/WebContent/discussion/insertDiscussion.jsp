<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
<style type="text/css">
#textContext {
	border: 1px solid;
}
</style>

</head>
<body>
	<form action="<%=request.getContextPath()%>/insertDiscussion" method="post">
		Title:<input type="text" name="d_title"><br /> 
		Content:<textarea cols="50" rows="3" id="textContext" name="d_context"></textarea><br />
		<input type="submit" value="Send">
		<input type="hidden" name="action" value="insert">
	</form>
</body>
</html>