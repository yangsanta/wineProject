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
		<title>酒迷| 歷久彌新的香濃口感</title>
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
	display: inline-block;
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
	filter:inherit;opacity:inherit
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

.primary {
	background-color: #bbb1a8;
	padding-left: 15px;
	-webkit-border-radius: 15px;
	-moz-border-radius: 15px;
	-ms-border-radius: 15px;
	-o-border-radius: 15px;
	border-radius: 15px;
}

#page-menu ul li {
	display: inline;
	border: 0;
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
				$(function() {

					$("#listall").click(function() {
						$("[name=ab]").fadeIn();
						$("[name=half]").fadeIn();
						$("[name=rg]").fadeIn();
					});
					$("#rg").click(function() {//紅綠
						$("[name=ab]").fadeOut().delay(300);
						$("[name=half]").fadeOut().delay(300);
						$("[name=rg]").fadeIn();
					});
					$("#half").click(function() { //半價
						$("[name=ab]").fadeOut().delay(300);
						$("[name=rg]").fadeOut().delay(300);
						$("[name=half]").fadeIn();
					});
					$("#ab").click(function() { //買a
						$("[name=rg]").fadeOut().delay(300);
						$("[name=half]").fadeOut().delay(300);
						$("[name=ab]").fadeIn();
					});
				});
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
				<%@ include file="../view_model/page_alert.htm"%>
				<div id="sidebar">
					<%@ include file="../view_model/product_list.jsp"%>
					<%@ include file="../view_model/index_left_hotsale.jsp"%>
				</div>

				<div id="content">
					<div style="overflow: auto; width: 100%">
						<h2>優惠商品</h2>
						<hr>
							<div id="page-menu">
								<ul class=" primary ">
									<li><a href="#" class="badge badge-success"><span
											id="listall" class="element-invisible">全部</span></a></li>
									<li><a href="#" class="badge badge-success"><span
											id="rg" class="element-invisible">紅配綠</span></a></li>
									<li><a href="#" class="badge badge-success"><span
											id="half" class="element-invisible">第二件半價</span></a></li>
									<li><a href="#" class="badge badge-success"><span
											id="ab" class="element-invisible">買A送B</span></a></li>
								</ul>
							</div>
							<div name="allproduct">
								<div class="searchResult">搜尋結果共 ${totalRows} 筆，頁數
									${whichPage} / ${totalPages}：</div>
								<c:forEach var="product" items="${list}" begin="${pageIndex}"
									end="${pageIndex+rowsPerPage-1}">
									<c:choose>
										<c:when test="${product.p_sales =='R'}">
											<c:set var="preference" scope="page" value="rg" />
										</c:when>
										<c:when test="${product.p_sales =='G'}">
											<c:set var="preference" scope="page" value="rg" />
										</c:when>

										<c:when test="${product.p_sales =='A'}">
											<c:set var="preference" scope="page" value="ab" />
										</c:when>

										<c:when test="${product.p_sales =='B'}">
											<c:set var="preference" scope="page" value="ab" />
										</c:when>

										<c:when test="${product.p_sales =='half'}">
											<c:set var="preference" scope="page" value="half" />
										</c:when>

									</c:choose>
									<a href="DisplayProducts?action=getOne_For_Display&pId=${product.p_no}">
									<div name="${preference}" class="g_wall drop-shadow">
										<img src="<%=request.getContextPath()%>/images/product_${preference}.png" class="label_tag" /> 
										<div style="height: 140px;">
										<img src="<%=request.getContextPath()%>/images/products/${product.p_pic}" style="width: 50px;float:left;"  /></br>
									<span style="color:#333">酒莊:${product.p_winery}<Br>地區:${product.p_area}<Br>評分:${product.p_rate}</span>
									<Br><span style="display:block;margin:10px 0 0 65px; color:red;font-size:26px">$${product.p_price}</span></div>
									<p> <c:if test="${product.p_sales =='R'}"><span class="label label-important">紅標</span></c:if>
									<c:if test="${product.p_sales =='G'}"><span class="label label-success">綠標</span></c:if>
									<c:if test="${product.p_sales =='A'}"><span class="label label-success"> A </span></c:if>
									<c:if test="${product.p_sales =='B'}"><span class="label label-success"> B </span></c:if><span style="color:#333">${product.p_name}</span></p>
									</div></a>
								</c:forEach>
							</div>
						<br class="clear" />

						<div class="pagination pagination-centered"	style="margin-top: 50px">
							<ul>
								<c:forEach var="page" begin="1" end="${totalPages}">
									<li><a
										href="DisplayProducts?action=${action}&pageNo=${page}${conditionParam}">${page}</a></li>
								</c:forEach>
							</ul>
						</div>



						<br class="clear" />
						<%@ include file="../view_model/index_fast_login.htm"%>


						<br class="clear" />
					</div>
				</div>
				<br class="clear" />
			</div>
		</div>
		<%@ include file="../view_model/index_footer.htm"%>

	</div>

	</div>
</body>

</html>