<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>List All Products</title>
<link rel="stylesheet" href="../style/ProductList.css">
</head>
<body>
<div class="searchResult">
	搜尋結果共 ${totalRows} 筆，頁數 ${whichPage} / ${totalPages}：
	<table class="p_outerTable">
		<tbody>
		<c:forEach var="product" items="${list}" begin="${pageIndex}" end="${pageIndex+rowsPerPage-1}" >
			<tr>
				<td class="p_pic"><a href="DisplayProducts?action=getOne_For_Display&pId=${product.p_no}">${product.p_no}</a></td>
				<td>
				<table class="p_innerTable">
					<tr><td><a href="DisplayProducts?action=getOne_For_Display&pId=${product.p_no}">${product.p_name}</a></td></tr>
					<tr><td>${product.p_winery}</td></tr>
					<tr><td>${product.p_area}</td></tr>
					<tr><td>${product.p_price}</td></tr>
					<tr><td>${product.p_rate}</td></tr>
				</table>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pageSwitch">
		第 
		<c:forEach var="page" begin="1" end="${totalPages}">
			<a href="DisplayProducts?action=getAll&pageNo=${page}">${page}</a>
		</c:forEach>
		 頁
	</div>
</div>
<hr>
this area for testing while developing:
<table class="p_outerTable">
	<tbody>
		<tr>
			<td>圖片</td>
			<td>
				<table>
				<tr><td>第 1 行</td></tr>
				<tr><td>第 2 行</td></tr>
				<tr><td>第 3 行</td></tr>
				</table>
			</td>
		</tr>
	</tbody>
</table>
<a href="DisplayProducts?action=getAll&pageNo=3">Product/DisplayProducts</a>
rowsPerPage = ${ rowsPerPage }
whichPage = ${ whichPage }
pageIndex = ${ pageIndex }
totalPages = ${ totalPages }
totalRows = ${ totalRows }

</body>
</html>