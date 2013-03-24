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

	您的訂單（no. ${ordersVO.o_no}）已成立：

	<div>
		<ul>
			<li>收件人姓名：${ordersVO.o_recipient}</li>
			<li>聯絡電話：${ordersVO.o_recipient_tel}</li>
			<li>收件地址：${ordersVO.o_recipient_addr}</li>
			<li>訂單日期：${ordersVO.o_date}</li>
			<li>訂單狀態：出貨流程處理中。</li>
		</ul>
	</div>

	<table>
		<thead>
			<tr>
				<th>商品</th>
				<th>單價</th>
				<th>數量</th>
				<th>總價</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach var="shoppingProduct"
				items="${requestScope.ShoppingCart.content}">
				<tr>
					<td><img
						src="<%=request.getContextPath()%>/images/products/${shoppingProduct.value.pic}">${shoppingProduct.value.productName}
						<c:if test="${shoppingProduct.value.saleType eq 'R'}">【紅】</c:if> <c:if
							test="${shoppingProduct.value.saleType eq 'G'}">【綠】</c:if> <c:if
							test="${shoppingProduct.value.saleType eq 'A'}">【A】</c:if> <c:if
							test="${shoppingProduct.value.saleType eq 'B'}">【B】</c:if></td>
					<td>$ ${shoppingProduct.value.productVO.p_price}</td>
					<td>${shoppingProduct.value.productNumber}</td>
					<td><c:choose>
							<c:when
								test="${shoppingProduct.value.saleType eq 'R' && shoppingProduct.value.salesNumber > 0}">
								<i>原價 : $
									${shoppingProduct.value.productVO.p_price*shoppingProduct.value.productNumber}</i>
								<br>紅配綠折扣後: $ ${shoppingProduct.value.subTotal}</c:when>
							<c:when
								test="${shoppingProduct.value.saleType eq 'G' && shoppingProduct.value.salesNumber > 0}">
								<i>原價 : $
									${shoppingProduct.value.productVO.p_price*shoppingProduct.value.productNumber}</i>
								<br>紅配綠折扣後: $ ${shoppingProduct.value.subTotal}</c:when>
							<c:when
								test="${shoppingProduct.value.saleType eq 'B' && shoppingProduct.value.salesNumber > 0}">
								<i>原價 : $
									${shoppingProduct.value.productVO.p_price*shoppingProduct.value.productNumber}</i>
								<br>買A送B折扣後: $ ${shoppingProduct.value.subTotal}</c:when>
							<c:otherwise>
								小計： $ ${shoppingProduct.value.subTotal}</c:otherwise>
						</c:choose></td>
				</tr>
			</c:forEach>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td><i>運費： ${ShippingCost}</i><br>總計： $
					${ShoppingCart.total + ShippingCost}</td>
			</tr>
		</tbody>
	</table>
	<a href="<%=request.getContextPath()%>/index.jsp"><input
		type="button" value="繼續選購"></a>


</body>
</html>