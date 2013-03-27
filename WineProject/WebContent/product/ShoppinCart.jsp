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
	<script>
	function modify(productNo){
		var no=productNo;
		var newQty = document.getElementById(no).value;
		window.location="ModifyBuyWine?no="+productNo+"&num="+newQty;
	}
	</script>
	<script>
	function confirmDelete(){
		if (confirm("真的要清空購物車嗎?")){
			alert("歡迎下次再來!");
			window.location = "<%=request.getContextPath()%>/product/DeleteShoppingCart";
		}
		else{
			
		}}
	</script>
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
					<a href="DeleteWine?no=${products.value.productNo}"><input type="button"class="btn" value="删除"/></a>
					</td>
				</tr>
			</c:forEach>
		</table>
<input type="button"class="btn btn-info" value="繼續購物" onclick="window.location='<%=request.getContextPath()%>/index.jsp'"/> 
        <input type="button"class="btn btn-info" value="清空購物車" onClick="confirmDelete()"/>
        <a href="<%=request.getContextPath()%>/orders/checkout?action=checkout"><input type="button"class="btn btn-info" value="購買回家"/></a>
	</div>
</body>
</html>