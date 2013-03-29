<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="<%=request.getContextPath()%>/favicon.ico"
	type="image/x-icon" />
<html>
<head>
<meta http-equiv="Content-Language" content="zh-tw">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>酒迷| 歷久彌新的香濃口感</title>
<meta content="酒迷 | 歷久彌新的香濃口感。" name="description" />
<meta content="酒迷 | 歷久彌新的香濃口感" name="keywords" />
<link href="<%=request.getContextPath()%>/style/reset.css"
	rel="stylesheet" type="text/css" />
<link
	href="<%=request.getContextPath()%>/style/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script src="http://code.jquery.com/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/style/bootstrap/js/bootstrap.js"></script>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.fancybox.js?v=2.1.4"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style/jquery.fancybox.css?v=2.1.4"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style/index.css?v=1.0"
	media="screen" />

<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/index.js?v=1.0"></script>




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
	<div id="shadow_bg">
		<div id="body">
			<%@ include file="../view_model/index_header.jsp"%>
			<div id="main">
				<div id="sidebar">
					<%@ include file="../view_model/product_list.jsp"%>
					<%@ include file="../view_model/index_left_hotsale.jsp"%>
				</div>

				<div id="content">
					<%@ include file="../view_model/page_alert.htm"%>
					您的訂單（no. ${ordersVO.o_no}）已成立：

					<c:if test="${not empty newCoupon}">
						<div>
							感謝您的購買！您獲得了新的折價券:
							<div>
								${newCoupon.c_price}<br>${newCoupon.c_key}<br>
							</div>
						</div>
					</c:if>

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
										<c:if test="${shoppingProduct.value.saleType eq 'R'}">【紅】</c:if>
										<c:if test="${shoppingProduct.value.saleType eq 'G'}">【綠】</c:if>
										<c:if test="${shoppingProduct.value.saleType eq 'A'}">【A】</c:if>
										<c:if test="${shoppingProduct.value.saleType eq 'B'}">【B】</c:if></td>
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


				</div>

				<%@ include file="../view_model/index_fast_login.htm"%>


				<br class="clear" />
			</div>
			<br class="clear" />
		</div>
	</div>
	<%@ include file="../view_model/index_footer.htm"%>

	</div>

	</div>
</body>

</html>
