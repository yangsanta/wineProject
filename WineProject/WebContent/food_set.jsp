<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="food.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/styles.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="Scripts/jquery-1.9.1.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<div id='cssmenu'>
		<div class="box-heading">
			<span class="title">餐酒搭配</span>
		</div>
		<ul>
			<li><a href="#"> 肉類</a>
				<ul>
					<c:forEach var="food_set" items="${getSomebydF_id1}">
						<li><a href="#">${food_set.value}</a>
							<ul>
								<c:forEach var="food_set1" items="${getSomebyI_id1}">
									<c:forEach var="food_set2" items="${food_set1}">

										<c:if test="${food_set.key == food_set2.ingredientVO.i_id}">

											<li><a href="#">${food_set2.sauceVO.s_name}</a>

												<ul>
													<li class=' has-sub'><a
														href="<%=request.getContextPath()%>/product/DisplayProducts.do?action=getOne_For_Display&pId=${food_set2.productVO.p_no}">
															${food_set2.productVO.p_name}</a></li>
												</ul></li>

										</c:if>
									</c:forEach>
								</c:forEach>
							</ul></li>
					</c:forEach>

				</ul></li>
		</ul>
		<ul>
			<li><a href="#">乳酪</a>
				<ul>
					<c:forEach var="food_set" items="${getSomebydF_id2}">
						<li><a href="#">${food_set.value}</a>
							<ul>
								<c:forEach var="food_set1" items="${getSomebyI_id2}">
									<c:forEach var="food_set2" items="${food_set1}">

										<c:if test="${food_set.key == food_set2.ingredientVO.i_id}">

											<li><a href="#">${food_set2.sauceVO.s_name}</a>

												<ul>

													<li><a
														href="<%=request.getContextPath()%>/product/DisplayProducts.do?action=getOne_For_Display&pId=${food_set2.productVO.p_no}">${food_set2.productVO.p_name}</a></li>
												</ul></li>

										</c:if>
									</c:forEach>
								</c:forEach>
							</ul></li>
					</c:forEach>
				</ul></li>
		</ul>
		<ul>
			<li><a href="#">甜點</a>
				<ul>
					<c:forEach var="food_set" items="${getSomebydF_id3}">
						<li><a href="#">${food_set.value}</a>
							<ul>
								<c:forEach var="food_set1" items="${getSomebyI_id3}">
									<c:forEach var="food_set2" items="${food_set1}">

										<c:if test="${food_set.key == food_set2.ingredientVO.i_id}">

											<li><a href="#">${food_set2.sauceVO.s_name}</a>

												<ul>

													<li><a
														href="<%=request.getContextPath()%>/product/DisplayProducts.do?action=getOne_For_Display&pId=${food_set2.productVO.p_no}">${food_set2.productVO.p_name}</a></li>
												</ul></li>

										</c:if>
									</c:forEach>
								</c:forEach>
							</ul></li>
					</c:forEach>
				</ul></li>
		</ul>
		<ul>
			<li><a href="#">穀類</a>
				<ul>
					<c:forEach var="food_set" items="${getSomebydF_id4}">
						<li><a href="#">${food_set.value}</a>
							<ul>
								<c:forEach var="food_set1" items="${getSomebyI_id4}">
									<c:forEach var="food_set2" items="${food_set1}">

										<c:if test="${food_set.key == food_set2.ingredientVO.i_id}">

											<li><a href="#">${food_set2.sauceVO.s_name}</a>

												<ul>

													<li><a
														href="<%=request.getContextPath()%>/product/DisplayProducts.do?action=getOne_For_Display&pId=${food_set2.productVO.p_no}">${food_set2.productVO.p_name}</a></li>
												</ul></li>

										</c:if>
									</c:forEach>
								</c:forEach>
							</ul></li>
					</c:forEach>
				</ul></li>
		</ul>
		<ul>
			<li><a href="#">雞鴨</a>
				<ul>
					<c:forEach var="food_set" items="${getSomebydF_id5}">
						<li><a href="#">${food_set.value}</a>
							<ul>
								<c:forEach var="food_set1" items="${getSomebyI_id5}">
									<c:forEach var="food_set2" items="${food_set1}">

										<c:if test="${food_set.key == food_set2.ingredientVO.i_id}">

											<li><a href="#">${food_set2.sauceVO.s_name}</a>

												<ul>

													<li><a
														href="<%=request.getContextPath()%>/product/DisplayProducts.do?action=getOne_For_Display&pId=${food_set2.productVO.p_no}">${food_set2.productVO.p_name}</a></li>
												</ul></li>

										</c:if>
									</c:forEach>
								</c:forEach>
							</ul></li>
					</c:forEach>
				</ul></li>
		</ul>
		<ul>
			<li><a href="#">海鮮</a>
				<ul>
					<c:forEach var="food_set" items="${getSomebydF_id6}">
						<li><a href="#">${food_set.value}</a>
							<ul>
								<c:forEach var="food_set1" items="${getSomebyI_id6}">
									<c:forEach var="food_set2" items="${food_set1}">

										<c:if test="${food_set.key == food_set2.ingredientVO.i_id}">

											<li><a href="#">${food_set2.sauceVO.s_name}</a>

												<ul>

													<li><a
														href="<%=request.getContextPath()%>/product/DisplayProducts.do?action=getOne_For_Display&pId=${food_set2.productVO.p_no}">${food_set2.productVO.p_name}</a></li>
												</ul></li>

										</c:if>
									</c:forEach>
								</c:forEach>
							</ul></li>
					</c:forEach>
				</ul></li>
		</ul>
	</div>
</body>
</html>