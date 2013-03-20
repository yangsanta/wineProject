<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改食物搭配</title>
</head>
<body>
	<h1>修改食物搭配</h1>
	<Form
		Action="<%=request.getContextPath()%>/product/setin.do?action=foodsetupdate"
		method="post" id="commentForm" class="cmxform">
		搭配編號：<input type="text" readonly name="fs_id" value="${param.fs_id}" /><br>
		<tr>
			<td>商品名稱：<font color=red><b>*</b></font></td>
			<td><select id="product" name="p_no">
					<c:forEach var="Product" items="${Product }">
						<option value="${Product.p_no}">${Product.p_name}</option>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<td>食物種類：<font color=red><b>*</b></font></td>
			<td><select id="food" name="f_id">
					<c:forEach var="Food" items="${Food }">
						<option value="${Food.f_id}">${Food.f_name}</option>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<td>主要成分：<font color=red><b>*</b></font></td>
			<td><select id="ingredient" name="i_id">
					<c:forEach var="Ingredient" items="${Ingredient }">
						<option value="${Ingredient.i_id}">${Ingredient.i_name}</option>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<td>風味特色：<font color=red><b>*</b></font></td>
			<td><select id="sauce" name="s_id">
					<c:forEach var="Sauce" items="${Sauce }">
						<option value="${Sauce.s_id}">${Sauce.s_name}</option>
					</c:forEach>
			</select></td>
		</tr>
		<TR>
			<td colspan="2" align="center"><input type="submit" value="送出"
				class="btn btn-primary"></td>
		</TR>
		<a href="<%=request.getContextPath()%>/FoodWine/FoodTest.html">回原畫面</a>
</body>
</html>