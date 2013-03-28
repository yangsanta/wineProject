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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<style type="text/css">
.show_pro {
	border-bottom: #ccc 1px solid;
	overflow: auto;
	width: 100%;
	border-left: #ccc 1px solid;
	border-right: #ccc 1px solid;
}

.show_pro:hover {
	background: rgb(238, 245, 236)
}

.pro_list {
	float: left;
	list-style: none;
}

.pro_list2 {
	float: right;
	list-style: none;
	margin: 30px 30px 0 0;
}

.pro_list3 {
	float: left;
	list-style: none;
	width: 350px;
}

.mcntservice01 h3 {
	color: #006699;
	font-size: 123.1%;
	font-weight: 700;
}

.color_1 {
	color: #D80000;
}

.prod_img {
	background: #fff;
	border: #ccc 1px solid;
	padding: 3px;
	margin: 15px;
	width: 100px;
	height: 100px;
	text-align: center;
}

.buttonbuy {
	margin-top: 10px;
}

.pro_title {
	width: 100%;
	height: 21px;
	background-repeat: repeat-x;
	background: url(<%=request.getContextPath()%>/images/product_list_top.png);
	border-left: #ccc 1px solid;
	border-right: #ccc 1px solid;
}

img {
	display: block;
	height: 150px;
}

td {
	border: 1px silver solid;
	width: 240px;
}
</style>
<script type="text/javascript">
	
</script>
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
					11
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
									<tr>
										<th>商品</th>
										<th>單價</th>
										<th>數量</th>
										<th>總價</th>
									</tr>
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
									<c:forEach var="shoppingProduct"
										items="${sessionScope.ShoppingCart.content}">
										<tr>
											<td><img
												src="<%=request.getContextPath()%>/images/products/${shoppingProduct.value.pic}">${shoppingProduct.value.productName}
												<c:if test="${shoppingProduct.value.saleType eq 'R'}">【紅】</c:if>
												<c:if test="${shoppingProduct.value.saleType eq 'G'}">【綠】</c:if>
												<c:if test="${shoppingProduct.value.saleType eq 'A'}">【A】</c:if>
												<c:if test="${shoppingProduct.value.saleType eq 'B'}">【B】</c:if>
											</td>
											<td>$ ${shoppingProduct.value.productVO.p_price}</td>
											<td><c:if
													test="${shoppingProduct.value.productVO.p_num < shoppingProduct.value.productNumber}">
													<i>庫存數量 (${shoppingProduct.value.productVO.p_num}) 不足！</i>
													<br>
												</c:if>${shoppingProduct.value.productNumber}</td>
											<td>
												<%-- 					<td><i>原價 : $ ${shoppingProduct.value.productVO.p_price*shoppingProduct.value.productNumber}</i><br>${shoppingProduct.value.saleType}折扣後: $ ${shoppingProduct.value.subTotal}</td> --%>
												<c:choose>
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
														<c:if test="${shoppingProduct.value.saleType eq 'R'}">
															<a
																href="<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_sales&conditionValue="><i>加購綠標商品享紅配綠優惠價</i></a>
															<br>
														</c:if>
														<c:if test="${shoppingProduct.value.saleType eq 'B'}">
															<a
																href="<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_sales&conditionValue="><i>加購A標商品享買A送B免費贈送</i></a>
															<br>
														</c:if>
								小計： $ ${shoppingProduct.value.subTotal}</c:otherwise>
												</c:choose>
											</td>
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

							<div>
								<form method="POST"
									action="<%=request.getContextPath()%>/orders/checkout.do?">
									收件人姓名：<input type="text" name="o_recipient" placeholder="收件人姓名"
										value="${o_recipient}">${errMap.errRName}<br>
									聯絡電話：<input type="text" name="o_recipient_tel"
										placeholder="聯絡電話" value="${o_recipient_tel}">${errMap.errRPhone}<br>
									收件地址：<input type="text" name="o_recipient_addr"
										placeholder="收件地址" value="${o_recipient_addr}">${errMap.errRAddr}<br>

									<c:if test="${not empty theCoupons}">
										<div>
											您擁有的折價券:<br>
											<c:forEach var="coupon" items="${theCoupons}">
												<div>
													${coupon.c_price}<br>${coupon.c_key}<br> <input
														type="radio" name="useCoupon" value="${coupon.c_key}">使用這張折價券
												</div>
											</c:forEach>
										</div>
									</c:if>

									<a href="<%=request.getContextPath()%>/index.jsp"><input
										type="button" value="繼續選購"></a> <input type="submit"
										value="確認結帳"> <input type="hidden" name="action"
										value="confirmed">
								</form>
							</div>
						</c:if>
					</c:if>
				</div>
			</div>
			<%@ include file="../view_model/index_footer.htm"%>

		</div>

	</div>
</body>

</html>