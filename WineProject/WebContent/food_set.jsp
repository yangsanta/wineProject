<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="food.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="Scripts/jquery-1.9.1.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<ul>
		<li>肉類</li>
		<ul>
			<c:forEach var="food_set" items="${food_set_fid1}">
				<li>${food_set.ingredientVO.i_name}</li>
			</c:forEach>
		</ul>
	</ul>
	<ul>
		<li>乳酪</li>
		<ul>
			<c:forEach var="food_set" items="${food_set_fid2}">
				<li>${food_set.ingredientVO.i_name}</li>
			</c:forEach>
		</ul>

	</ul>
	<ul>
		<li>甜點</li>
		<ul>
			<c:forEach var="food_set" items="${food_set_fid3}">
				<li>${food_set.ingredientVO.i_name}</li>
			</c:forEach>
		</ul>

	</ul>
	<ul>
		<li>穀類</li>
		<ul>
			<c:forEach var="food_set" items="${food_set_fid4}">
				<li>${food_set.ingredientVO.i_name}</li>
			</c:forEach>
		</ul>

	</ul>
	<ul>
		<li>雞鴨</li>
		<ul>
			<c:forEach var="food_set" items="${food_set_fid5}">
				<li>${food_set.ingredientVO.i_name}</li>
			</c:forEach>
		</ul>

	</ul>
	<ul>
		<li>海鮮</li>
		<ul>
			<c:forEach var="food_set" items="${food_set_fid6}">
				<li>${food_set.ingredientVO.i_name}</li>
			</c:forEach>
		</ul>
	</ul>























	<%-- 	食物種類：
	<select id="food">
		<option>請選擇種類</option>
		<c:forEach var="Food" items="${Food }">
			<option>${Food.f_name}</option>
		</c:forEach>
	</select> 主要成分:
	<select id="ingredient">
		<option>請選擇主要成分</option>
		<c:forEach var="Ingredient" items="${Ingredient }">
			<option>${Ingredient.i_name}</option>
		</c:forEach>
	</select> 風味特色:
	<select id="sauce">
		<option>請選擇風味</option>
		<c:forEach var="Sauce" items="${Sauce }">
			<option>${Sauce.s_name}</option>
		</c:forEach> --%>
	<!-- 	</select> -->
	<!-- 	<FORM METHOD="post" ACTION="food.do" name="form1"> -->
	<!-- 		<table border="0"> -->
	<!-- 			<tr> -->
	<!-- 				<td>食物種類：</td> -->
	<!-- 				<td><input type="TEXT" name="f_name" size="45" -->
	<%-- 					value="<%=(foodVO == null) ? "AAAAA" : foodVO.getF_name()%>" /></td> --%>
	<!-- 			</tr> -->
	<!-- 		</table> -->
	<!-- 		<input type="hidden" name="action" value="insert">  -->
	<!-- 		<input type="submit" value="送出新增"> -->
	<!-- 	</FORM> -->
</body>
</html>