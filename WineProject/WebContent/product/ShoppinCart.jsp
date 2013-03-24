<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${sessionScope.ShoppingCart.content==null}"><div style="margin: 30px 30px">目前尚未購買任何商品</div></c:if>
						<c:forEach var="products"
							items="${sessionScope.ShoppingCart.content}">
							<div class="babypart">
								<a href="#" class="aproimg"><img
									src="<%=request.getContextPath()%>/images/products/${products.value.pic}" /></a>
								<div class="arr01-hd">
									<span><a href="#">${products.value.productName}</a></span>
									<p>x${products.value.productNumber}</p>
								</div>
								<div class="arr02-hd">
									<span>$<strong>${products.value.subTotal}</strong></span>
									<a href="DeleteWine?no=${products.value.productNo}"><p class="del">删除</p></a>
								</div>
							</div>
							<p class="clear"></p>
						</c:forEach>
</body>
</html>