<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
</style>
<script type="text/javascript" src="Scripts/jquery-1.9.1.js"></script>
<script type="text/javascript">
	window.onload = init;
	function init() {
		var btnLoad = document.getElementById("meat");
		var dis = document.getElementById("ul1");
		//btnLoad.onclick = function(){
		btnLoad.onclick = function(){	
			 //dis.style.display = "none";
			 dis.style.display = "block";
		}
	}
</script>
</head>
<body>
	<ul>
		<li><a id="meat" href="#" rel="tooltip" data-placement="bottom">肉類</a>
			<c:forEach var="Ingredient" items="${Ingredient}">
				<c:if test="${Ingredient.f_id==1001}">
					<ul id="ul1" style="display:none;">
						${Ingredient.i_name}
						<li><c:forEach var="Sauce" items="${Sauce}">
								<c:if test="${Sauce.i_id==Ingredient.i_id}">
									<ul style="display:;">
										${Sauce.s_name}
										<li></li>
									</ul>
								</c:if>
							</c:forEach></li>
					</ul>
				</c:if>
			</c:forEach></li>
		<li><a href="#" rel="tooltip" data-placement="bottom">乳酪</a> <c:forEach
				var="Ingredient" items="${Ingredient}">
				<c:if test="${Ingredient.f_id==1002}">
					<ul style="display: none;">
						${Ingredient.i_name}
						<li><c:forEach var="Sauce" items="${Sauce}">
								<c:if test="${Sauce.i_id==Ingredient.i_id}">
									<ul style="display: none;">
										${Sauce.s_name}
										<li></li>
									</ul>
								</c:if>
							</c:forEach></li>
					</ul>
				</c:if>
			</c:forEach></li>
		<li><a href="#" rel="tooltip" data-placement="bottom">甜點</a> <c:forEach
				var="Ingredient" items="${Ingredient}">
				<c:if test="${Ingredient.f_id==1003}">
					<ul style="display: none;">
						${Ingredient.i_name}
						<li><c:forEach var="Sauce" items="${Sauce}">
								<c:if test="${Sauce.i_id==Ingredient.i_id}">
									<ul style="display: none;">
										${Sauce.s_name}
										<li></li>
									</ul>
								</c:if>
							</c:forEach></li>
					</ul>
				</c:if>
			</c:forEach></li>
		<li><a href="#" rel="tooltip" data-placement="bottom">穀類</a> <c:forEach
				var="Ingredient" items="${Ingredient}">
				<c:if test="${Ingredient.f_id==1004}">
					<ul style="display: none;">
						${Ingredient.i_name}
						<li><c:forEach var="Sauce" items="${Sauce}">
								<c:if test="${Sauce.i_id==Ingredient.i_id}">
									<ul style="display: none;">
										${Sauce.s_name}
										<li></li>
									</ul>
								</c:if>
							</c:forEach></li>
					</ul>
				</c:if>
			</c:forEach></li>
		<li><a href="#" rel="tooltip" data-placement="bottom">雞鴨</a> <c:forEach
				var="Ingredient" items="${Ingredient}">
				<c:if test="${Ingredient.f_id==1005}">
					<ul style="display: none;">
						${Ingredient.i_name}
						<li><c:forEach var="Sauce" items="${Sauce}">
								<c:if test="${Sauce.i_id==Ingredient.i_id}">
									<ul style="display: none;">
										${Sauce.s_name}
										<li></li>
									</ul>
								</c:if>
							</c:forEach></li>
					</ul>
				</c:if>
			</c:forEach></li>
		<li><a href="#" rel="tooltip" data-placement="bottom">海鮮</a> <c:forEach
				var="Ingredient" items="${Ingredient}">
				<c:if test="${Ingredient.f_id==1006}">
					<ul style="display: none;">
						${Ingredient.i_name}
						<li><c:forEach var="Sauce" items="${Sauce}">
								<c:if test="${Sauce.i_id==Ingredient.i_id}">
									<ul style="display: none;">
										${Sauce.s_name}
										<li></li>
									</ul>
								</c:if>
							</c:forEach></li>
					</ul>
				</c:if>
			</c:forEach></li>
	</ul>
	<form action="">
		<input type="button" value="確認">
	</form>
</body>
</html>