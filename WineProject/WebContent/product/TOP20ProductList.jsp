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
<title>酒迷 1| 歷久彌新的香濃口感</title>
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
	padding: 40px 20px 30px 20px
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

.label_tag {
	width: 70px;
	position: absolute;
	top: 0px;
	right: 0px
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
			<%@ include file="../view_model/index_header.htm"%>
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
								<div class="g_wall">
									<img src="<%=request.getContextPath()%>/images/label.png"
										class="label_tag" /><img
										src="<%=request.getContextPath()%>/images/products/${product.p_pic}"
										style="width: 50px;" /><span><a
										href="DisplayProducts?action=getOne_For_Display&pId=${product.p_no}">${product.p_name}</a><Br></B>酒莊:${product.p_winery}<Br>地區:${product.p_area}<Br>售價:${product.p_price}<Br>評分:${product.p_rate}</span>
								</div>
							</c:forEach>
							<br class="clear" />
						</div>
						<div class="pageSwitch">
							第
							<c:forEach var="page" begin="1" end="${totalPages}">
								<a
									href="DisplayProducts?action=${action}&pageNo=${page}${conditionParam}">${page}</a>
							</c:forEach>
							頁
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