<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.lang.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link rel="shortcut icon" href="<%=request.getContextPath()%>/favicon.ico" />
<link rel="icon" href="<%=request.getContextPath()%>/favicon.ico" type="image/x-icon" />
<head>
<meta charset="utf-8">
	<title>酒迷|後台管理系統</title>
	<link media="all" rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/wine_admin/css/all.css" />
	<c:if test="${sessionScope.admin_access!='y'}">
		<meta http-equiv="refresh" content="0; url=index.jsp">
	</c:if>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript">
	window.jQuery|| document.write('<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.9.0.min.js"><\/script>');
	</script>
	<link
		href="<%=request.getContextPath()%>/style/bootstrap/css/bootstrap.min.css"
		rel="stylesheet" media="screen">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/style/bootstrap/js/bootstrap.js"></script>
		<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="css/ie.css" /><![endif]-->
		<style type="text/css">
.buttons li.prodis a {
	background: url(<%=request.getContextPath()%>/wine_admin/images/sprite.png
		) no-repeat -113px -2px;
	margin: 0 -21px 0 0;
	padding: 0 21px 0 0;
}

.buttons li.prodis a :hover {
	color: yellow;
}

.buttons li.prodis a em {
	top: 40px;
}

.buttons .prodis .ico1 span {
	background-position: 0 -23px;
}

.buttons .prodis .ico2 span {
	background-position: -2px -73px;
}

.buttons .ico3 span {
	background-position: -2px -97px;
}

.buttons .prodis .ico3 span {
	background-position: -2px -126px;
}

.buttons .ico4 span {
	background-position: -2px -153px;
}

.buttons .prodis .ico4 span {
	background-position: -2px -178px;
}

.buttons .ico5 span {
	background-position: -1px -206px;
}

.buttons .prodis .ico5 span {
	background-position: -2px -232px;
}

.buttons .ico6 span {
	background-position: -2px -262px;
}

.buttons .prodis .ico6 span {
	background-position: -3px -291px;
}

.buttons .ico7 span {
	background-position: -4px -321px;
}

.buttons .prodis .ico7 span {
	background-position: -4px -352px;
}

.buttons .ico8 span {
	background-position: -4px -380px;
}

.buttons .prodis .ico8 span {
	background-position: -4px -415px;
}
</style>

</head>
<body>
	<div id="wrapper">
		<div id="content">
			<div class="c1">
				<%@ include file="view_model/total_tab.jsp"%>
				<div class="tabs">
					<div id="tab-1" class="tab">

						<div class="text-section">
							<h1>商品優惠</h1>
							<p>各項暢銷商品的組合優惠方案都在這邊設定，設定完請洽行銷部門做商品促銷DM</p>
						</div>


						<div style="width: 80%; margin: 0 auto">
							<!--------------------------分頁----------------------------------------------------------- -->

							<div align="right">

								<form action="MaintainSales" method="get" class="form-search">
									<p style="color: red; font-size: 12pt">${msgbox}</p>
									<input type="hidden" name="action" value="getSome_For_Display" />
									<input type="hidden" name="condition" value="p_name" /> <input
										type="text" name="conditionValue"
										class="input-medium search-query" placeholder="商品名稱" /> <input
										type="submit" value="搜尋" class="btn" /> <input
										type="hidden" name="action" value="search" />
								</form>
							</div>
							<br class="clear" />
							<div class="pagination" style="float: left">
								共 ${totalRows} 項商品，頁數 ${whichPage} / ${totalPages}<br />
								<ul>
									<c:choose>
										<c:when test="${whichPage==1}">
											<li class="disabled"><a href="#">&laquo;</a></li>
										</c:when>
										<c:when test="${whichPage!=1}">
											<li><a
												href="MaintainSales?action=${action}&pageNo=${whichPage-1}${conditionParam}">&laquo;</a></li>
										</c:when>
									</c:choose>
									<c:forEach var="page" begin="1" end="${totalPages}">
										<c:choose>
											<c:when test="${page==whichPage}">
												<li class="disabled"><a
													style="background: #CCC; color: black" href="#">${page}</a></span></li>
											</c:when>
											<c:when test="${page!=whichPage}">
												<li><a
													href="MaintainSales?action=${action}&pageNo=${page}${conditionParam}">${page}</a></span></li>
											</c:when>
										</c:choose>
									</c:forEach>

									<c:choose>
										<c:when test="${whichPage==totalPages}">
											<li class="disabled"><a href="#">&raquo;</a></li>
										</c:when>
										<c:when test="${whichPage!=totalPages}">
											<li><a
												href="MaintainSales?action=${action}&pageNo=${whichPage+1}${conditionParam}">&raquo;</a></li>
										</c:when>

									</c:choose>
								</ul>
							</div>





							<!-------------------------顯示商品清單----------------------------------------------------------- -->
							<table class="table table-hover">
								<thead>
									<tr>
										<th>商品編號</th>
										<th>圖片</th>
										<th>商品名稱</th>
										<th>優惠狀態</th>
										<th>管理</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="product" items="${list}" begin="${pageIndex}"
										end="${pageIndex+rowsPerPage-1}">

										<tr>
											<td class="left">No.${product.p_no}</td>
											<td class="center"><img
												src="../images/products/${product.p_pic}"
												style="width: 45px; height: 65px" /></td>
											<td>${product.p_name}</td>
                                             <form action="MaintainSales" action="post">
                                              <input type="hidden" name="page" value="${whichPage}"></input>
                                             <input type="hidden" name="action" value="getOneMaintainSales"></input>
                                             <input type="hidden" name="oldSales" value="${product.p_sales}"></input>
                                             <input type="hidden" name="pNo" value="${product.p_no}"></input><td><c:forEach var="sales" items="A,B,R,G,half,NONE">
													<c:choose>

														<c:when test="${sales==product.p_sales}">
															<input id="${product.p_no}${sales}" type="radio"
																size="30" name="${product.p_no}" value="${sales}"
																checked />
															<c:choose>
																<c:when test="${sales=='A'}">
																	<label for="${product.p_no}${sales}" style="display: inline-block"> <span	class="badge badge-success">A區商品</span></label>
																</c:when>
																<c:when test="${sales=='B'}">
																	<label for="${product.p_no}${sales}"style="display: inline-block"> <span	class="badge badge-success">B區商品 </span></label>
																</c:when>
																<c:when test="${sales=='R'}">
																	<label for="${product.p_no}${sales}"style="display: inline-block"> <span	class="badge badge-success">紅標商品 </span></label>
																</c:when>
																<c:when test="${sales=='G'}">
																	<label for="${product.p_no}${sales}"style="display: inline-block"> <span	class="badge badge-success">綠標商品 </span></label>
																</c:when>
																<c:when test="${sales=='half'}">
																	<label for="${product.p_no}${sales}"style="display: inline-block"> <span	class="badge badge-success">第2件半價商品</span></label>
																</c:when>
																<c:when test="${sales=='NONE'}">
																	<label for="${product.p_no}${sales}"style="display: inline-block"> <span class="badge badge-success">沒有優惠</span></label>
																</c:when>
															</c:choose>
														</c:when>
														<c:when test="${sales!=product.p_sales}">
															<input id="${product.p_no}${sales}" type="radio"
																size="30" name="${product.p_no}" value="${sales}" />
															<c:choose>
																<c:when test="${sales=='A'}">
																	<label for="${product.p_no}${sales}"style="display: inline-block"><span class="badge">A區商品</span></label>
																</c:when>
																<c:when test="${sales=='B'}">
																	<label for="${product.p_no}${sales}"style="display: inline-block"> <span class="badge">B區商品</span></label>
																</c:when>
																<c:when test="${sales=='R'}">
																	<label for="${product.p_no}${sales}"style="display: inline-block"> <span class="badge">紅標商品</span></label>
																</c:when>
																<c:when test="${sales=='G'}">
																	<label for="${product.p_no}${sales}"style="display: inline-block"> <span	 class="badge">綠標商品</span></label>
																</c:when>
																<c:when test="${sales=='half'}">
																	<label for="${product.p_no}${sales}"style="display: inline-block"> <span	class="badge">第2件半價商品</span></label>
																</c:when>
																<c:when test="${sales=='NONE'}">
																	<label for="${product.p_no}${sales}"style="display: inline-block"> <span	class="badge">沒有優惠</span></label>
																</c:when>
															</c:choose>
														</c:when>
													</c:choose>
												</c:forEach></td>
											<td> <button
													type="submit" class="btn btn-primary" style="width: 80px;" ><i class=" icon-pencil icon-white"></i> 修改</button></td>
										</form></tr>


									</c:forEach>
								</tbody>
							</table>

							<!--------------------------分頁----------------------------------------------------------- -->
							共 ${totalRows} 項商品，頁數 ${whichPage} / ${totalPages}
							<div class="pagination">
								<ul>
									<c:choose>
										<c:when test="${whichPage==1}">
											<li class="disabled"><a href="#">&laquo;</a></li>
										</c:when>
										<c:when test="${whichPage!=1}">
											<li><a
												href="MaintainSales?action=${action}&pageNo=${whichPage-1}${conditionParam}">&laquo;</a></li>
										</c:when>
									</c:choose>
									<c:forEach var="page" begin="1" end="${totalPages}">
										<c:choose>
											<c:when test="${page==whichPage}">
												<li class="disabled"><a
													style="background: #CCC; color: black" href="#">${page}</a></span></li>
											</c:when>
											<c:when test="${page!=whichPage}">
												<li><a
													href="MaintainSales?action=${action}&pageNo=${page}${conditionParam}">${page}</a></span></li>
											</c:when>
										</c:choose>
									</c:forEach>

									<c:choose>
										<c:when test="${whichPage==totalPages}">
											<li class="disabled"><a href="#">&raquo;</a></li>
										</c:when>
										<c:when test="${whichPage!=totalPages}">
											<li><a
												href="MaintainSales?action=${action}&pageNo=${whichPage+1}${conditionParam}">&raquo;</a></li>
										</c:when>

									</c:choose>
								</ul>
							</div>


							<%@ include file="view_model/footer.jsp"%>
						</div>

						</article>
					</div>

				</div>
			</div>
		</div>
		<%@ include file="view_model/admin_menu.jsp"%>
	</div>
</body>
</html>