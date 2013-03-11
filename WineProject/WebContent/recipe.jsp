<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<li>肉類<c:forEach var="Ingredient" items="${Ingredient}">
				<c:if test="${Ingredient.f_id==1001}">
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
			</c:forEach>
		</li>
		<li>乳酪<c:forEach var="Ingredient" items="${Ingredient}">
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
			</c:forEach>
		</li>
		<li>甜點<c:forEach var="Ingredient" items="${Ingredient}">
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
			</c:forEach>
		</li>
		<li>穀類<c:forEach var="Ingredient" items="${Ingredient}">
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
			</c:forEach>
		</li>
		<li>雞鴨 <c:forEach var="Ingredient" items="${Ingredient}">
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
			</c:forEach>
		</li>
		<li>海鮮<c:forEach var="Ingredient" items="${Ingredient}">
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
			</c:forEach>
		</li>
	</ul>
<form action="">
<input type="button" value="確認">
</form>
</body>
</html>