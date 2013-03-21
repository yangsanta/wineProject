<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="food.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改食物種類</title>
<script type="text/javascript" src="Scripts/jquery-1.9.1.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<h1>修改食物種類</h1>
	<Form
		Action="<%=request.getContextPath()%>/product/foodin.do"
		method="post" id="commentForm" class="cmxform">

		食物編號：<input type="text" readonly name="f_id" value="${param.f_id}" /><br>

		食物名稱：<input type="text" name="f_name" value="" size="10" maxlength="12"><br>

		<input type="text" name="action" value="foodup" size="10" style="display:none"><br>
		<input type="submit" value="送出" class="btn btn-primary">

	</Form>
	<a href="<%=request.getContextPath()%>/FoodWine/FoodTest.html">回原畫面</a>
</body>
</html>