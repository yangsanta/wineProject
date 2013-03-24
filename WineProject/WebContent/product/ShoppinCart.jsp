<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link
	href="<%=request.getContextPath()%>/style/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script src="http://code.jquery.com/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/style/bootstrap/js/bootstrap.js"></script>
</head>
<body>
	<div style="width: 650px; text-align: center">
		<div>
			<c:if test="${sessionScope.ShoppingCart.content==null}">
					${sessionScope.m_id}，你好!! 您目前尚未購買任何商品
				</c:if>
			<c:if test="${sessionScope.ShoppingCart.content!=null}">
					${sessionScope.m_id}，你好!! 您目前購買<c:if
					test="${ShoppingCart.bottleNumber==null}"> 0 </c:if>
				<c:if test="${ShoppingCart.bottleNumber<10}">
				</c:if>${ShoppingCart.bottleNumber}<c:if
					test="${ShoppingCart.bottleNumber<10}">
				</c:if>項商品
				</c:if>
		</div>
		<table class="table table-striped" style="width: 650px">
			<tr>
			<td></td>
			<td>商品</td>
			<td>單價</td>
			<td>數量</td>
			<td>小計</td>
			<td></td>
			</tr>
			<c:forEach var="products"
				items="${sessionScope.ShoppingCart.content}">

				<tr>
					<td style="width: 35px"><a href="#"> <img
							src="<%=request.getContextPath()%>/images/products/${products.value.pic}"
							style="height: 50px; width: 30px" />
					</a></td>
					<td style="width: 400px"><span><a href="#">${products.value.productName}</a></span></td>
					<td style="width: 50px"><span>$</span>${products.value.productPrice}</td>
					<td style="width: 10px"><input type="text" value="${products.value.productNumber}"  max="2"style="width: 18px;"></td>
					<td>$<strong>${products.value.subTotal}</strong></td>
					<td style="width: 150px">
					<a href="DeleteWine?no=${products.value.productNo}"><input type="button"class="btn" value="修改"/></a>
					<a href="DeleteWine?no=${products.value.productNo}"><input type="button"class="btn" value="删除"/></a>
					</td>
				</tr>
			</c:forEach>
		</table>
        <a href="DisplayProducts.do?action=getAll&pageNo=1"><input type="button"class="btn btn-info" value="繼續購物"/></a>  
        <a href="#"><input type="button"class="btn btn-info" value="放棄購物"/></a>
        <a href="#"><input type="button"class="btn btn-info" value="購買回家"/></a>
	</div>
</body>
</html>