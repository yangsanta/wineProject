<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style>
	img {
		display: block;
		height: 150px;
	}
	td {
		border: 1px silver solid;
		width: 240px;
	}
</style>
</head>
<body>

如果購物車內沒東西的 request attribute： ${cartNoContent}
<hr>

	<table>
		<thead>
			<tr><th>商品</th><th>單價</th><th>數量</th><th>總價</th></tr>
		</thead>
		<tbody>
<!-- 			<tr> -->
<!-- 				<td><img -->
<%-- 					src="<%=request.getContextPath()%>/images/products/I1101_img1.jpg">路易拉圖阿羅斯高登紅葡萄酒</td> --%>
<!-- 				<td>$ 2250</td> -->
<!-- 				<td>2</td> -->
<!-- 				<td><i>原價 : $ 2500</i><br>紅配綠折扣後: $ 4275</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 			</tr> -->
			<c:forEach var="shoppingProduct" items="${sessionScope.ShoppingCart.content}">
				<tr><td><img src="<%=request.getContextPath()%>/images/products/${shoppingProduct.value.pic}">${shoppingProduct.value.productName}</td><td>$ （先放p_no ${shoppingProduct.value.productNo}）</td><td>${shoppingProduct.value.productNumber}</td><td><i>原價 : $ 2500</i><br>${shoppingProduct.value.saleType}折扣後: $ ${shoppingProduct.value.subTotal}</td></tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>