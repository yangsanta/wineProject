<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link rel="shortcut icon" href="<%=request.getContextPath()%>/favicon.ico" />
<link rel="icon" href="<%=request.getContextPath()%>/favicon.ico" type="image/x-icon" />
<head>
<meta charset="utf-8">
	<title>酒迷|後台管理系統</title>
	<link media="all" rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/wine_admin/css/all.css" />
		 <c:if test="${sessionScope.admin_access!='y'}"><meta http-equiv="refresh" content="0; url=index.jsp"></c:if>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript">
		window.jQuery|| document.write('<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.9.0.min.js"><\/script>');
	</script>
	<link href="<%=request.getContextPath()%>/style/bootstrap/css/bootstrap.min.css"
		rel="stylesheet" media="screen">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script src="<%=request.getContextPath()%>/style/bootstrap/js/bootstrap.js"></script>
		<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="css/ie.css" /><![endif]-->
<style type="text/css">
	input{
		width:40px;
	}
	
	select{
		width: 90px;
		background-color: #fff;
		border: 1px solid #ccc;
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
							<h1>緊張庫存區</h1>
							<p>可在這邊補貨或下架喔!!!</p>
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
					
						<ul class="states" style="height: 60px;">
							.
							<!-- 								<li class="error">錯誤 : 系統錯誤，海尼根綠茶庫存沒了，請盡速補貨</li> -->
							<li id="warning_info" class="warning" style="display: none">注意:
								您剛剛成功的 刪除了 1 筆商品.</li>
							<li id="succes_info" class="succes" style="display: none">成功
								: 你剛更新了 1 筆商品.</li>
						</ul>
					
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
							</div><br><br><br>
						
		
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
										<th>優惠狀態</th>
										<th>商品價格</th>
										<th>商品數量</th>
										<th>商品狀態</th>
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
											<td><c:if test="${product.p_sales=='NONE'}"><span class="label">無優惠</span></c:if>
											<c:if test="${product.p_sales=='R'}"><span class="label label-important">紅標商品</span></c:if>
											<c:if test="${product.p_sales=='G'}"><span class="label label-success">綠標商品</span></c:if>
											<c:if test="${product.p_sales=='A'}"><span class="label label-warning">買A商品</span></c:if>
											<c:if test="${product.p_sales=='B'}"><span class="label label-info">送B商品</span></c:if>
											<c:if test="${product.p_sales=='half'}"><span class="label label-inverse">第二件半價</span></c:if>
											<c:if test="${product.p_sales=='TIME'}"><span class="badge badge-important">今日限時產品</span></c:if></td>
											<td><span style='font-size: 15px'>$ ${product.p_price}</span></td>											
										<form action="" method="post">
											<input type="hidden" size="30" name="page" value="${whichPage}" class="page"/>
											<input type="hidden" size="30" name="p_no" value="${product.p_no}" class="p_no" />												
											<td class="tdp_num"><span style='font-size: 15px' class="spanp_num"><input type="text" name="p_num" value="${product.p_num}" class="p_num"/></span></td>
											<td class="tdp_status"><span style='font-size: 15px' class="spanp_status"><select name="p_status" class="p_status">
													<option <c:if test="${product.p_status == '已上架'}">selected</c:if>>已上架</option>
													<option <c:if test="${product.p_status == '已下架'}">selected</c:if>>已下架</option>
											    </select><br /></span>
											</td>
											<td><input type="button" class="editEmergency btn btn-primary" value="修改" /></td>
										</form>
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

						
					<%@ include file="view_model/footer.jsp"%>
						</div>

						</article>
					</div>

				</div>
			</div>
		</div>
<%@ include file="view_model/admin_menu.jsp"%>
	</div>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/wine_admin/js/ademin_emergency.js"></script>
</body>
</html>