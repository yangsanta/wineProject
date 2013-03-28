<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="abgne-news-scroll">
	<div align="center">
		<span class="title">暢銷商品</span>
	</div>
	<ul>
					<c:forEach var="product" items="${hot_product2}" >				
		<li style="height:110px">
			<div>
				<img
					src="<%=request.getContextPath()%>/images/products/${product.p_pic}"
					style="width: 50px;" /> <span>${product.p_name}<br> <br>特價$${product.p_price}！
					<a href="<%=request.getContextPath()%>/product/DisplayProducts.do?action=getOne_For_Display&pId=${product.p_no}"><br>
					  <button style="margin-top:10px;" class="btn btn-mini btn-danger" type="button">熱烈搶購!</button></a>
				</span>
			</div>
		</li>
							</c:forEach>
	
	
	</ul>
</div>