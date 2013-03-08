<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<c:forEach var="product" items="${list}" begin="${pageIndex}"
					end="${pageIndex+rowsPerPage-1}">
					<c:choose>
						<c:when test="${product.p_sales =='R'}">
							<tr>
								<td class="p_pic"><a
									href="DisplayProducts?action=getOne_For_Display&pId=${product.p_no}">${product.p_pic}</a></td>
								<td>

									<table class="rg">
										<tr>
											<td><a
												href="DisplayProducts?action=getOne_For_Display&pId=${product.p_no}">${product.p_name}</a></td>
										</tr>
										<tr>
											<td>${product.p_winery}</td>
										</tr>
										<tr>
											<td>${product.p_area}</td>
										</tr>
										<tr>
											<td>${product.p_price}</td>
										</tr>
										<tr>
											<td>${product.p_rate}</td>
										</tr>
										<tr>
											<td>${product.p_sales}</td>
										</tr>
									</table>

								</td>
							</tr>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${product.p_sales =='G'}">
							<tr>
								<td class="p_pic"><a
									href="DisplayProducts?action=getOne_For_Display&pId=${product.p_no}">${product.p_pic}</a></td>
								<td>

									<table class="rg">
										<tr>
											<td><a
												href="DisplayProducts?action=getOne_For_Display&pId=${product.p_no}">${product.p_name}</a></td>
										</tr>
										<tr>
											<td>${product.p_winery}</td>
										</tr>
										<tr>
											<td>${product.p_area}</td>
										</tr>
										<tr>
											<td>${product.p_price}</td>
										</tr>
										<tr>
											<td>${product.p_rate}</td>
										</tr>
										<tr>
											<td>${product.p_sales}</td>
										</tr>
									</table>

								</td>
							</tr>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${product.p_sales =='A'}">
							<tr>
								<td class="p_pic"><a
									href="DisplayProducts?action=getOne_For_Display&pId=${product.p_no}">${product.p_pic}</a></td>
								<td>

									<table class="ab">
										<tr>
											<td><a
												href="DisplayProducts?action=getOne_For_Display&pId=${product.p_no}">${product.p_name}</a></td>
										</tr>
										<tr>
											<td>${product.p_winery}</td>
										</tr>
										<tr>
											<td>${product.p_area}</td>
										</tr>
										<tr>
											<td>${product.p_price}</td>
										</tr>
										<tr>
											<td>${product.p_rate}</td>
										</tr>
										<tr>
											<td>${product.p_sales}</td>
										</tr>
									</table>

								</td>
							</tr>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${product.p_sales =='B'}">
							<tr>
								<td class="p_pic"><a
									href="DisplayProducts?action=getOne_For_Display&pId=${product.p_no}">${product.p_pic}</a></td>
								<td>

									<table class="ab">
										<tr>
											<td><a
												href="DisplayProducts?action=getOne_For_Display&pId=${product.p_no}">${product.p_name}</a></td>
										</tr>
										<tr>
											<td>${product.p_winery}</td>
										</tr>
										<tr>
											<td>${product.p_area}</td>
										</tr>
										<tr>
											<td>${product.p_price}</td>
										</tr>
										<tr>
											<td>${product.p_rate}</td>
										</tr>
										<tr>
											<td>${product.p_sales}</td>
										</tr>
									</table>

								</td>
							</tr>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${product.p_sales =='half'}">
							<tr>
								<td class="p_pic"><a
									href="DisplayProducts?action=getOne_For_Display&pId=${product.p_no}">${product.p_pic}</a></td>
								<td>

									<table class="half">
										<tr>
											<td><a
												href="DisplayProducts?action=getOne_For_Display&pId=${product.p_no}">${product.p_name}</a></td>
										</tr>
										<tr>
											<td>${product.p_winery}</td>
										</tr>
										<tr>
											<td>${product.p_area}</td>
										</tr>
										<tr>
											<td>${product.p_price}</td>
										</tr>
										<tr>
											<td>${product.p_rate}</td>
										</tr>
										<tr>
											<td>${product.p_sales}</td>
										</tr>
									</table>

								</td>
							</tr>
						</c:when>
					</c:choose>
				</c:forEach>
		</table>
	
		<div class="pageSwitch">
			第
			<c:forEach var="page" begin="1" end="${totalPages}">
				<a
					href="DisplayProducts?action=${action}&pageNo=${page}${conditionParam}">${page}</a>
			</c:forEach>
			頁
		</div>
	</div>

</body>
</html>