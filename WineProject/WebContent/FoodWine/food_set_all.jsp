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
	<h1>食物搭配</h1>
	<table border='1' bordercolor='#CCCCFF' width='800'>
		<tr>
			<th>搭配編號</th>
			<th>商品名稱</th>
			<th>食物種類</th>
			<th>主要食材</th>
			<th>風味特色</th>
			<th>修改</th>
			<th>刪除</th>
		</tr>
		<c:forEach var="food_set" items="${Food_set}">
			<tr align='center' valign='middle'>
				<td>${food_set.fs_id}</td>
				<td>${food_set.productVO.p_name}</td>
				<td>${food_set.foodVO.f_name}</td>
				<td>${food_set.ingredientVO.i_name}</td>
				<td>${food_set.sauceVO.s_name}</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/FoodWine/food/set/insert.do?action=Foodsetupdate">
						<input type="submit" value="修改"> <%-- <input type="hidden"
							name="fs_id" value="${food_set.fs_id}"> <input
							type="hidden" name="action" value="update"> --%>
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						Action="<%=request.getContextPath()%>/product/setin.do?action=foodsetdel">
						<input type="submit" value="刪除"> <input type="hidden"
							name="fs_id" value="${food_set.fs_id}"> <input
							type="hidden" name="action" value="delete">
					</FORM>
				</td>
		</c:forEach>
	</table>
	<a href="<%=request.getContextPath()%>/FoodWine/FoodTest.html">回原畫面</a>
</body>
</html>