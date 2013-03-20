<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="food.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>食物種類</title>
<script type="text/javascript" src="Scripts/jquery-1.9.1.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<h1>食物種類</h1>
	<table border='1' bordercolor='#CCCCFF' width='800'>
		<tr>
			<th>種類編號</th>
			<th>種類名稱</th>
			<th>修改</th>
			<th>刪除</th>
		</tr>
		<c:forEach var="Food" items="${Food }">
			<tr align='center' valign='middle'>

				<td>${Food.f_id}</td>

				<td>${Food.f_name}</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/FoodWine/food_update.jsp">
						<input type="submit" value="修改"> <input type="hidden"
							name="f_id" value="${Food.f_id}"> <input type="hidden"
							name="action" value="update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						Action="<%=request.getContextPath()%>/product/foodin?action=fooddel">
						<input type="submit" value="刪除"> <input type="hidden"
							name="f_id" value="${Food.f_id}"> <input type="hidden"
							name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
	<a href="<%=request.getContextPath()%>/FoodWine/FoodTest.html">回原畫面</a>
</body>
</html>