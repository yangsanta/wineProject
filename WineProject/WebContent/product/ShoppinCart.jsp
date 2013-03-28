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
#content{background: url('/WineProject/images/shopcar.png');
background-repeat: no-repeat;
background-position: bottom right;
background-color: #fff;}

</style>
<script type="text/javascript">
	function modify(productNo){
		var no=productNo;
		var newQty = document.getElementById(no).value;
		window.location="ModifyBuyWine?no="+productNo+"&num="+newQty;
	}

	function confirmDelete(){
		if (confirm("真的要清空購物車嗎?")){
			alert("歡迎下次再來!");
			window.location = "<%=request.getContextPath()%>/product/DeleteShoppingCart";
		}
		else{
			
		}}
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

<div style="width: 650px; text-align: center">
<h1>我的購物車</h1><br>	
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
					<td style="width: 35px"><a href="<%=request.getContextPath()%>/product/DisplayProducts.do?action=getOne_For_Display&pId=${products.value.productNo}"> <img
							src="<%=request.getContextPath()%>/images/products/${products.value.pic}"
							style="height: 50px; width: 30px" />
					</a></td>
					<td style="width: 400px"><span><a href="<%=request.getContextPath()%>/product/DisplayProducts.do?action=getOne_For_Display&pId=${products.value.productNo}">${products.value.productName}</a></span></td>
					<td style="width: 50px"><span>$</span>${products.value.productPrice}</td>
					<td style="width: 10px"><input id="${products.value.productNo}" type="text" value="${products.value.productNumber}"  maxlength="2"style="width: 18px;"onChange="modify(${products.value.productNo})"></td>
					<td>$<strong>${products.value.subTotal}</strong></td>
					<td style="width: 150px">
					<input type="button"class="btn" value="修改" onClick="modify(${products.value.productNo})"/>
					<a href="DeleteWine?no=${products.value.productNo}"><input type="button"class="btn" value="刪除"/></a>
					</td>
				</tr>
			</c:forEach>
		</table>
<input type="button"class="btn btn-info" value="繼續購物" onclick="window.location='<%=request.getContextPath()%>/index.jsp'"/> 
        <input type="button"class="btn btn-info" value="清空購物車" onClick="confirmDelete()"/>
        <a href="<%=request.getContextPath()%>/orders/checkout?action=checkout"><input type="button"class="btn btn-info" value="購買回家"/></a>
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