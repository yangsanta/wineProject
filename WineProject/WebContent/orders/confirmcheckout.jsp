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

<c:if test="${empty sessionScope.ShoppingCart}">
<c:if test="${empty sessionScope.ShoppingCart.content}">
如果購物車內沒東西的 request attribute： ${cartNoContent}
<hr>
</c:if>
</c:if>

<c:if test="${not empty sessionScope.ShoppingCart}">
<c:if test="${not empty sessionScope.ShoppingCart.content}">


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
				<tr>
					<td><img src="<%=request.getContextPath()%>/images/products/${shoppingProduct.value.pic}">${shoppingProduct.value.productName}
						 <c:if test="${shoppingProduct.value.saleType eq 'R'}">【紅】</c:if>
						 <c:if test="${shoppingProduct.value.saleType eq 'G'}">【綠】</c:if>
						 <c:if test="${shoppingProduct.value.saleType eq 'A'}">【A】</c:if>
						 <c:if test="${shoppingProduct.value.saleType eq 'B'}">【B】</c:if>
					</td>
					<td>$ ${shoppingProduct.value.productVO.p_price}</td>
					<td><c:if test="${shoppingProduct.value.productVO.p_num < shoppingProduct.value.productNumber}"><i>庫存數量 (${shoppingProduct.value.productVO.p_num}) 不足！</i><br></c:if>${shoppingProduct.value.productNumber}</td>
					<td>
<%-- 					<td><i>原價 : $ ${shoppingProduct.value.productVO.p_price*shoppingProduct.value.productNumber}</i><br>${shoppingProduct.value.saleType}折扣後: $ ${shoppingProduct.value.subTotal}</td> --%>
						<c:choose>
							<c:when test="${shoppingProduct.value.saleType eq 'R' && shoppingProduct.value.salesNumber > 0}">
								<i>原價 : $ ${shoppingProduct.value.productVO.p_price*shoppingProduct.value.productNumber}</i>
								<br>紅配綠折扣後: $ ${shoppingProduct.value.subTotal}</c:when>
							<c:when test="${shoppingProduct.value.saleType eq 'G' && shoppingProduct.value.salesNumber > 0}">
								<i>原價 : $ ${shoppingProduct.value.productVO.p_price*shoppingProduct.value.productNumber}</i>
								<br>紅配綠折扣後: $ ${shoppingProduct.value.subTotal}</c:when>
							<c:when test="${shoppingProduct.value.saleType eq 'B' && shoppingProduct.value.salesNumber > 0}">
								<i>原價 : $ ${shoppingProduct.value.productVO.p_price*shoppingProduct.value.productNumber}</i>
								<br>買A送B折扣後: $ ${shoppingProduct.value.subTotal}</c:when>
							<c:otherwise>
								<c:if test="${shoppingProduct.value.saleType eq 'R'}"><a href="<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_sales&conditionValue="><i>加購綠標商品享紅配綠優惠價</i></a><br></c:if>
								<c:if test="${shoppingProduct.value.saleType eq 'B'}"><a href="<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_sales&conditionValue="><i>加購A標商品享買A送B免費贈送</i></a><br></c:if>
								小計： $ ${shoppingProduct.value.subTotal}</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
			<tr><td></td><td></td><td></td><td><i>運費： ${ShippingCost}</i><br>總計： $ ${ShoppingCart.total + ShippingCost}</td></tr>
		</tbody>
	</table>
	
	<div>
		<form method="POST" action="<%=request.getContextPath()%>/orders/checkout.do?">
			<input type="text" name="o_recipient" placeholder="收件人姓名" value="${o_recipient}">${errMap.errRName}<br>
			<input type="text" name="o_recipient_tel" placeholder="聯絡電話" value="${o_recipient_tel}">${errMap.errRPhone}<br> <input type="text" name="o_recipient_addr" placeholder="收件地址"
						value="${o_recipient_addr}">${errMap.errRAddr}<br>
			
			<c:if test="${not empty theCoupons}">
				<div>您擁有的折價券:<br>
					<c:forEach var="coupon" items="${theCoupons}">
						<div>
						${coupon.c_price}<br>${coupon.c_key}<br>
						<input type="radio" name="useCoupon" value="${coupon.c_key}">使用這張折價券 
						</div>
					</c:forEach>
				</div>
			</c:if>
			
			<a href="<%=request.getContextPath()%>/index.jsp"><input type="button" value="繼續選購"></a>
			<input type="submit" value="確認結帳">
			<input type="hidden" name="action" value="confirmed">
		</form>
	</div>
</c:if>
</c:if>
</body>
</html>