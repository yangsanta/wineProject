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
th{font-weight:bold}
#contenttable td{padding: 20px;}
#contenttable tr{border-bottom-style: solid;
border-color: #B9B9B9;
border-width: 1px;}
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

<h2><div class="checklist" style="display: inline-block;"></div><span style="font-size: 50px;margin-left: 30px;">1.</span>您的訂單確認</h2>
	<table style="border: 3px solid #B3B3B3;-webkit-border-radius: 5px;" class="table table-striped .table-bordered">
		<thead style="text-align:center">
			<tr><th style="text-align:center">商品</th><th width=100px>單價</th><th  width=100px>數量</th><th>總價</th></tr>
		</thead>
		<tbody id="contenttable">

			<c:forEach var="shoppingProduct" items="${sessionScope.ShoppingCart.content}">
				<tr style="border-bottom-style: solid;border-color: #B9B9B9;border-width: 1px;">
					<td style="padding-left: 10px;"> <!-- <img src="<%=request.getContextPath()%>/images/products/${shoppingProduct.value.pic}" width=30px;> --><span style="font-size:10px">${shoppingProduct.value.productName}</span>
						 <c:if test="${shoppingProduct.value.saleType eq 'R'}"><span class="label label-important">紅</span></c:if>
						 <c:if test="${shoppingProduct.value.saleType eq 'G'}"><span class="label label-success">綠</span></c:if>
						 <c:if test="${shoppingProduct.value.saleType eq 'A'}"><span class="label label-warning">A</span></c:if>
						 <c:if test="${shoppingProduct.value.saleType eq 'B'}"><span class="label label-info">B</span></c:if>
						 <c:if test="${shoppingProduct.value.saleType eq 'R'&& shoppingProduct.value.salesNumber <= 0}"><br><a href="<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_sales&conditionValue="><i><span style="font-size:10px">加購綠標商品享紅配綠優惠價</span></i></a><br></c:if>
						 <c:if test="${shoppingProduct.value.saleType eq 'B'&& shoppingProduct.value.salesNumber <= 0}"><br><a href="<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_sales&conditionValue="><i><span style="font-size:10px">加購A標商品享買A送B免費贈送</span></i></a><br></c:if>
					</td>
					<td align="center">$ ${shoppingProduct.value.productVO.p_price}</td>
					<td align="center"><c:if test="${shoppingProduct.value.productVO.p_num < shoppingProduct.value.productNumber}"><span class="errorConfChkout"><i> 庫存數量 (${shoppingProduct.value.productVO.p_num}) 不足！</i></span><br></c:if>${shoppingProduct.value.productNumber}</td>
					<td style="font-size:10px">
						<c:choose>
							<c:when test="${shoppingProduct.value.saleType eq 'R' && shoppingProduct.value.salesNumber > 0}">
								<i><del>原價 : $ ${shoppingProduct.value.productVO.p_price*shoppingProduct.value.productNumber}</del></i>
								<br><span style="color:blue">紅配綠折扣價: $ ${shoppingProduct.value.subTotal}</span></c:when>
							<c:when test="${shoppingProduct.value.saleType eq 'G' && shoppingProduct.value.salesNumber > 0}">
								<i><del>原價 : $ ${shoppingProduct.value.productVO.p_price*shoppingProduct.value.productNumber}</del></i>
								<br><span style="color:blue">紅配綠折扣價: $ ${shoppingProduct.value.subTotal}</span></c:when>
							<c:when test="${shoppingProduct.value.saleType eq 'B' && shoppingProduct.value.salesNumber > 0}">
								<i><del>原價 : $ ${shoppingProduct.value.productVO.p_price*shoppingProduct.value.productNumber}</del></i>
								<br><span style="color:blue">買A送B折扣價: $ ${shoppingProduct.value.subTotal}</span></c:when>
							<c:otherwise>
								小計： $ ${shoppingProduct.value.subTotal}</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
			<tr><td style="padding-right:10px;padding-bottom:10px;" COLSPAN=4 align="right" ><hr><div style="text-align: right;"><span style="margin:0 20px 20px 0">運費：
			<c:if test="${OriginShippingCost!=ShippingCost}"><span style="font-size:10px;color:blue"><del>達到免運價免收運費$${OriginShippingCost}元</del></span></c:if> ${ShippingCost}元 <br> 總計： $ ${ShoppingCart.total + ShippingCost} 元</span></div></td></tr>
		</tbody>
	</table>
	

	<div style="margin-top:30px;">
		<form method="post" action="<%=request.getContextPath()%>/orders/checkout.do">
<h2><div class="user" style="display: inline-block;"></div><span style="font-size: 50px;margin-left: 30px;">2.</span>訂單明細</h2>

			<span style="width:120px;display: inline-block;">收件人姓名：</span><input type="text" name="o_recipient" placeholder="收件人姓名" value="${o_recipient}"><span class="errorConfChkout"> ${errMap.errRName}</span><br>
			<span style="width:120px;display: inline-block;">聯絡電話：</span><input type="text" name="o_recipient_tel" placeholder="聯絡電話" value="${o_recipient_tel}"><span class="errorConfChkout"> ${errMap.errRPhone}</span><br> 
			<span style="width:120px;display: inline-block;">收件地址：</span><input type="text" name="o_recipient_addr" placeholder="收件地址"
						value="${o_recipient_addr}"><span class="errorConfChkout"> ${errMap.errRAddr}</span><br>
			
			<c:if test="${not empty theCoupons}">
			<br><h2><div class="us-dollar" style="display: inline-block;"></div><span style="font-size: 50px;margin-left: 30px;">3.</span>您擁有的折價券:</h2>
				<div style="overflow: auto;"><br>
					<c:forEach var="coupon" items="${theCoupons}">
						<div style="float:left;margin-right:30px">
						
						<label for="${coupon.c_key}">
							<div rel="tooltip" data-placement="bottom" title="優惠卷序號:${coupon.c_key}"  class="ticket${coupon.c_price} style="margin-left:30px;display: inline-block;"></div></label>
						
						<br><br>
						<input id="${coupon.c_key}" type="radio" name="useCoupon" value="${coupon.c_key}">使用${coupon.c_price}折價券 
						</div>
					</c:forEach>
				</div>
			</c:if>
			<br><br>
			<a href="<%=request.getContextPath()%>/index.jsp"><button type="button" class="btn btn-info" style="width: 250px;height: 40px;"><i class="icon-share-alt icon-white"></i> 繼續選購</button></a>
			<button type="submit"class="btn btn-success" style="width: 250px;height: 40px;"><i class="icon-thumbs-up icon-white"></i> 確認結帳</button>
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
