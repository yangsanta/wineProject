<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="<%=request.getContextPath()%>/favicon.ico"
	type="image/x-icon" />
<html>
<head>
<meta http-equiv="Content-Language" content="zh-tw">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>酒迷 | 歷久彌新的香濃口感</title>
		<meta content="酒迷 | 歷久彌新的香濃口感。" name="description" />
		<meta content="酒迷 | 歷久彌新的香濃口感" name="keywords" />
		<link href="<%=request.getContextPath()%>/style/reset.css"
			rel="stylesheet" type="text/css" />
		<link
			href="<%=request.getContextPath()%>/style/bootstrap/css/bootstrap.min.css"
			rel="stylesheet" media="screen">
			<script src="http://code.jquery.com/jquery.js"></script>
			<script
				src="<%=request.getContextPath()%>/style/bootstrap/js/bootstrap.js"></script>

			<script type="text/javascript"
				src="<%=request.getContextPath()%>/js/jquery.fancybox.js?v=2.1.4"></script>
			<link rel="stylesheet" type="text/css"
				href="<%=request.getContextPath()%>/style/jquery.fancybox.css?v=2.1.4"
				media="screen" />
			<link rel="stylesheet" type="text/css"
				href="<%=request.getContextPath()%>/style/index.css?v=1.0"
				media="screen" />

			<script type="text/javascript"
				src="<%=request.getContextPath()%>/js/index.js?v=1.0"></script>
			<style type="text/css">
#content {
	padding: 40px 20px 30px 20px;
	background: url(<%=request.getContextPath()%>/images/page.png);
}

#content h2 {
	TEXT-ALIGN: center
}

.g_wall {
	background-color: #fff;
	border: 1px solid #eee;
	line-height: 1.4em;
	padding: 12px;
	margin: 10px;
	float: left;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	width: 176px;
	height: 220px;
	box-shadow: 2px 1px 6px #efefef -moz-box-shadow:2px 1px 6px #f2f4f3;
	-webkit-box-shadow: 2px 1px 6px #f2f4f3;
	position: relative;
}

.g_wall:hover {
	background-color: rgb(244, 248, 255);
}

.label_tag {
	width: 70px;
	position: absolute;
	top: -4px;
	right: -5px
}

.drop-shadow {
	-webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px
		rgba(0, 0, 0, 0.1) inset;
	-moz-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px
		rgba(0, 0, 0, 0.1) inset;
	box-shadow: 0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1)
		inset;
	-moz-border-radius: 100px/2px;
	border-radius: 100px/2px;
}
</style>
			<script type="text/javascript">
				
			</script>
			<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
			<!--[if lt IE 9]>
      <script src="twitter.github.com/bootstrap/assets/js/html5shiv.js"></script>
    <![endif]-->
</head>

<body>
	<div id="shadow_bg">
		<div id="body">
			<%@ include file="../view_model/index_header.jsp"%>
			<div id="main">
				<div id="sidebar">
					<%@ include file="../view_model/product_list.jsp"%>
					<%@ include file="../view_model/index_left_hotsale.htm"%>
				</div>

				<div id="content">
					<div class="searchResult">
						<%-- 	搜尋結果共 ${totalRows} 筆，頁數 ${whichPage} / ${totalPages}： --%>

						<div style="overflow: auto; width: 100%">
							<h2>暢銷新品</h2>
							<hr />
							<c:forEach var="product" items="${list}" begin="${pageIndex}"
								end="${pageIndex+rowsPerPage-1}">
								<a
									href="DisplayProducts?action=getOne_For_Display&pId=${product.p_no}">
									<div class="g_wall drop-shadow">
										<img src="<%=request.getContextPath()%>/images/label.png"
											class="label_tag" />
										<div style="height: 140px;">
											<img
												src="<%=request.getContextPath()%>/images/products/${product.p_pic}"
												style="width: 50px; float: left;" /> </br>
												<span style="color: #333">酒莊:${product.p_winery}<Br>地區:${product.p_area}<Br>評分:${product.p_rate}</span><Br>
												<span style="display: block; margin: 10px 0 0 65px; color: red; font-size: 26px">$${product.p_price}</span>
										</div>
										<p><span>${product.p_name}</span></p>
									</div>
								</a>
							</c:forEach>
							<br class="clear" />
						</div>
						<div class="pagination pagination-centered"
							style="margin-top: 50px">
							<ul>
								<c:forEach var="page" begin="1" end="${totalPages}">
									<li><a
										href="DisplayProducts?action=${action}&pageNo=${page}${conditionParam}">${page}</a></li>
								</c:forEach>
							</ul>
						</div>

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