<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ingredient.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主要食材</title>
<script type="text/javascript" src="Scripts/jquery-1.9.1.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<h1>主要食材</h1>
	<table border='1' bordercolor='#CCCCFF' width='800'>
		<tr>
			<th>食材編號</th>
			<th>食材名稱</th>
			<th>修改</th>
			<th>刪除</th>
		</tr>
		<c:forEach var="Ingredient" items="${Ingredient }">
			<tr align='center' valign='middle'>

				<td>${Ingredient.i_id}</td>

				<td>${Ingredient.i_name}</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/FoodWine/ingredient_update.jsp">
						<input type="submit" value="修改"> <input type="hidden"
							name="i_id" value="${Ingredient.i_id}"> <input type="hidden"
							name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						Action="<%=request.getContextPath()%>/product/ingin.do?action=Ingreddel">
						<input type="submit" value="刪除"> <input type="hidden"
							name="i_id" value="${Ingredient.i_id}"> <input
							type="hidden" name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
	<a href="<%=request.getContextPath()%>/FoodWine/FoodTest.html">回原畫面</a>
</body>
</html>