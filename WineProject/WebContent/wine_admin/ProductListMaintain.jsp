<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<head>
<meta charset="utf-8">
	<title>酒迷|後台管理系統</title>
	<link media="all" rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/wine_admin/css/all.css" />
	<script type="text/javascript"
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<script type="text/javascript">
		window.jQuery
				|| document
						.write('<script type="text/javascript" src="js/jquery-1.7.2.min.js"><\/script>');
	</script>
	<script type="text/javascript" src=""<%=request.getContextPath()%>/wine_admin/js/jquery.main.js"></script>
	<link
		href="<%=request.getContextPath()%>/style/bootstrap/css/bootstrap.min.css"
		rel="stylesheet" media="screen">
		<script src="http://code.jquery.com/jquery.js"></script>
		<script
			src="<%=request.getContextPath()%>/style/bootstrap/js/bootstrap.js"></script>
		<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="css/ie.css" /><![endif]-->
</head>
<body>
	<div id="wrapper">
		<div id="content">
			<div class="c1">
				<div class="controls">
					<nav class="links">
					<ul>
						<li><a href="#" class="ico1">訊息 <span class="num">26</span></a></li>
						<li><a href="#" class="ico2">Alerts <span class="num">5</span></a></li>
						<li><a href="#" class="ico3">訂單<span class="num">3</span></a></li>
					</ul>
					</nav>
					<div class="profile-box">
						<span class="profile"> <a href="#" class="section"> <img
								class="image" src="images/img1.png" alt="image description"
								width="26" height="26" /> <span class="text-box">
									Welcome <strong class="name">楊明華</strong>
							</span>
						</a> <a href="#" class="opener">opener</a>
						</span> <a href="#" class="btn-on">On</a>
					</div>
				</div>
				<div class="tabs">
					<div id="tab-1" class="tab">

						<div class="text-section">
							<h1>商品專區</h1>
							<p>可在這邊修改商品喔!!!</p>
						</div>

						<div style="width: 80%; margin: 0 auto">
							<!--------------------------分頁----------------------------------------------------------- -->

							<div align="right">

								<form action="Maintain" method="get" class="form-search">
									<p style="color: red; font-size: 12pt">${msgbox}</p>
									<input type="hidden" name="action" value="getSome_For_Display" />
									<input type="hidden" name="condition" value="p_name" /> <input
										type="text" name="conditionValue" class="input-medium search-query"
										placeholder="商品名稱" /> <input type="submit" value="search"
										class="btn" /> <input type="hidden" name="action"
										value="search" />
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
												href="Maintain?action=${action}&pageNo=${whichPage-1}${conditionParam}">&laquo;</a></li>
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
													href="Maintain?action=${action}&pageNo=${page}${conditionParam}">${page}</a></span></li>
											</c:when>
										</c:choose>
									</c:forEach>

									<c:choose>
										<c:when test="${whichPage==totalPages}">
											<li class="disabled"><a href="#">&raquo;</a></li>
										</c:when>
										<c:when test="${whichPage!=totalPages}">
											<li><a
												href="Maintain?action=${action}&pageNo=${whichPage+1}${conditionParam}">&raquo;</a></li>
										</c:when>

									</c:choose>
								</ul>
							</div>




							<div style="float: right; margin-top: 45px; margin-right: 45px">
								<a href="/WineProject/wine_admin/ProductInsert.jsp"> <input
									type="button" class="btn btn-success" value="新增商品" />
								</a>
							</div>
							<!-------------------------顯示商品清單----------------------------------------------------------- -->
							<table class="table table-hover">
								<thead>
									<tr>
										<th>商品編號</th>
										<th>圖片</th>
										<th>商品名稱</th>
										<th>商品價格</th>
										<th>商品數量</th>
										<th>商品狀態</th>
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
												style="width: 45px; height: 65px" />
												</div> </a></td>
											<td>${product.p_name}</td>
											<td><span style='font-size: 15px'>${product.p_price}</span></td>
											<td><span style='font-size: 15px'>${product.p_num}</span></td>
											<td><span style='font-size: 15px'>${product.p_status}<br />
											</span></td>
											<td><span style='font-size: 15px'>${product.p_sales}</span></td>
											<td><a
												href="<%=request.getContextPath()%>/product/Maintain?action=getOne_For_Display&pId=${product.p_no}&page=${whichPage}"><input
													type="button" class="btn btn-primary" value="修改" /></a></td>
										</tr>


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
												href="Maintain?action=${action}&pageNo=${whichPage-1}${conditionParam}">&laquo;</a></li>
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
													href="Maintain?action=${action}&pageNo=${page}${conditionParam}">${page}</a></span></li>
											</c:when>
										</c:choose>
									</c:forEach>

									<c:choose>
										<c:when test="${whichPage==totalPages}">
											<li class="disabled"><a href="#">&raquo;</a></li>
										</c:when>
										<c:when test="${whichPage!=totalPages}">
											<li><a
												href="Maintain?action=${action}&pageNo=${whichPage+1}${conditionParam}">&raquo;</a></li>
										</c:when>

									</c:choose>
								</ul>
							</div>

						</div>






						</article>
					</div>

				</div>
			</div>
		</div>
		<aside id="sidebar"> <strong class="logo"><a href="#">lg</a></strong>
		<ul class="tabset buttons">
			<li class="active"><a href="#tab-1" class="ico1"><span>儀表板</span><font
					class="text_con">儀表板</font><em></em></a> <span class="tooltip"><span>儀表板</span></span>
			</li>
			<li><a href="#tab-2" class="ico2"><span>會員管理</span><font
					class="text_con">會員管理</font><em></em></a> <span class="tooltip"><span>會員管理</span></span>
			</li>
			<li><a href="#tab-3" class="ico3"><span>商品管理</span><font
					class="text_con">商品管理</font><em></em></a> <span class="tooltip"><span>商品管理</span></span>
			</li>
			<li><a href="#tab-4" class="ico4"><span>優惠設定</span><font
					class="text_con">優惠設定</font><em></em></a> <span class="tooltip"><span>優惠設定</span></span>
			</li>
			<li><a href="#tab-5" class="ico5"><span>討論區管理</span><font
					class="text_con">討論區管理</font><em></em></a> <span class="tooltip"><span>討論區管理</span></span>
			</li>
			<li><a href="#tab-6" class="ico6"> <span>空的</span><em></em>
			</a> <span class="num">常用</span> <span class="tooltip"><span>空的</span></span>
			</li>
			<li><a href="#tab-7" class="ico7"><span>訂單管理</span><em></em></a>
				<span class="tooltip"><span>訂單管理</span></span></li>
			<li><a href="#tab-8" class="ico8"><span>Settings</span><em></em></a>
				<span class="tooltip"><span>Settings</span></span></li>
		</ul>
		<span class="shadow"></span> </aside>
	</div>
</body>
</html>