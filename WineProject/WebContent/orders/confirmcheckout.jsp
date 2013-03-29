<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="<%=request.getContextPath()%>/favicon.ico" type="image/x-icon" />
<html>
<head>
	<meta http-equiv="Content-Language" content="zh-tw">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>酒迷| 歷久彌新的香濃口感</title>
	<meta content="酒迷 | 歷久彌新的香濃口感。" name="description" />
 	<meta content="酒迷 | 歷久彌新的香濃口感" name="keywords" />
        <link href="<%=request.getContextPath()%>/style/reset.css" rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath()%>/style/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
		<script src="http://code.jquery.com/jquery.js"></script>
		<script src="<%=request.getContextPath()%>/style/bootstrap/js/bootstrap.js"></script>

		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.fancybox.js?v=2.1.4"></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style/jquery.fancybox.css?v=2.1.4" media="screen" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style/index.css?v=1.0" media="screen" />

		<script type="text/javascript" src="<%=request.getContextPath()%>/js/index.js?v=1.0"></script>
<style type="text/css">
.errorConfChkout{
	color: #be0000;
}
</style>
<script type="text/javascript">
	img {
		display: block;
		height: 150px;
	}
	table{font-size: 12px;}

</script>
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="twitter.github.com/bootstrap/assets/js/html5shiv.js"></script>
    <![endif]-->
</head>

<body >
	<div id="shadow_bg" >
	<div id="body" >
			<%@ include file="../view_model/index_header.jsp"%>
	<div id="main">
					<div id="sidebar">
						<%@ include file="../view_model/product_list.jsp"%>
						<%@ include file="../view_model/index_left_hotsale.jsp"%>	
					</div>
	
					<div id="content">
					<%@ include file="../view_model/page_alert.htm"%>


<c:if test="${empty sessionScope.ShoppingCart.content}">
如果購物車內沒東西的 request attribute： ${cartNoContent}
<hr>
</c:if>

<c:if test="${not empty sessionScope.ShoppingCart}">
<c:if test="${not empty sessionScope.ShoppingCart.content}">


	<table style="border: 1px double rgb(109, 2, 107);" >
		<thead>
			<tr><th>商品</th><th width=100px>單價</th><th  width=100px>數量</th><th>總價</th></tr>
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
					<td><img src="<%=request.getContextPath()%>/images/products/${shoppingProduct.value.pic}" width=30px;><span style="font-size:10px">${shoppingProduct.value.productName}</span>
						 <c:if test="${shoppingProduct.value.saleType eq 'R'}">【紅】</c:if>
						 <c:if test="${shoppingProduct.value.saleType eq 'G'}">【綠】</c:if>
						 <c:if test="${shoppingProduct.value.saleType eq 'A'}">【A】</c:if>
						 <c:if test="${shoppingProduct.value.saleType eq 'B'}">【B】</c:if>
					</td>
					<td align="center">$ ${shoppingProduct.value.productVO.p_price}</td>
					<td align="center"><c:if test="${shoppingProduct.value.productVO.p_num < shoppingProduct.value.productNumber}"><span class="errorConfChkout"><i> 庫存數量 (${shoppingProduct.value.productVO.p_num}) 不足！</i></span><br></c:if>${shoppingProduct.value.productNumber}</td>
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
								<c:if test="${shoppingProduct.value.saleType eq 'R'}"><a href="<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_sales&conditionValue="><i><span style="font-size:10px">加購綠標商品享紅配綠優惠價</span></i></a><br></c:if>
								<c:if test="${shoppingProduct.value.saleType eq 'B'}"><a href="<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_sales&conditionValue="><i><span style="font-size:10px">加購A標商品享買A送B免費贈送</span></i></a><br></c:if>
								小計： $ ${shoppingProduct.value.subTotal}</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
			<tr><td style="padding-right:10px;padding-bottom:10px;" COLSPAN=4 align="right"><hr><span style="margin:0 20px 20px 0">運費： ${ShippingCost} 總計： $ ${ShoppingCart.total + ShippingCost}</span></td></tr>
		</tbody>
	</table>
	

	<div style="margin-top:30px;">
		<form method="post" action="<%=request.getContextPath()%>/orders/checkout.do">

			收件人姓名：<input type="text" name="o_recipient" placeholder="收件人姓名" value="${o_recipient}"><span class="errorConfChkout"> ${errMap.errRName}</span><br>
			聯絡電話：<input type="text" name="o_recipient_tel" placeholder="聯絡電話" value="${o_recipient_tel}"><span class="errorConfChkout"> ${errMap.errRPhone}</span><br> 
			收件地址：<input type="text" name="o_recipient_addr" placeholder="收件地址"
						value="${o_recipient_addr}"><span class="errorConfChkout"> ${errMap.errRAddr}</span><br>
			
			<c:if test="${not empty theCoupons}">
				<div style="overflow: auto;">您擁有的折價券:<br>
					<c:forEach var="coupon" items="${theCoupons}">
						<div style="float:left;margin-right:30px">
						
						<label for="${coupon.c_key}">
							<img rel="tooltip" data-placement="bottom" title="優惠卷序號:${coupon.c_key}"  src="/WineProject/images/ticket${coupon.c_price}.png" width=50px style="margin-left:30px"/></label>
						
						<br><br>
						<input id="${coupon.c_key}" type="radio" name="useCoupon" value="${coupon.c_key}">使用${coupon.c_price}折價券 
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
