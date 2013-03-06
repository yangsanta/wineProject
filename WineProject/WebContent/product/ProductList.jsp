<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="<%=request.getContextPath()%>/favicon.ico" type="image/x-icon" />
<html>
<head>
	<meta http-equiv="Content-Language" content="zh-tw">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>酒迷 1| 歷久彌新的香濃口感</title>
	<meta content="酒迷 | 歷久彌新的香濃口感。" name="description" />
 	<meta content="酒迷 | 歷久彌新的香濃口感" name="keywords" />
        <link href="<%=request.getContextPath()%>/style/reset.css" rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath()%>/style/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
		<script src="http://code.jquery.com/jquery.js"></script>
		<script src="<%=request.getContextPath()%>/style/bootstrap/js/bootstrap.js"></script>

		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.fancybox.js?v=2.1.4"></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style/jquery.fancybox.css?v=2.1.4" media="screen" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style/index.css?v=1.0" media="screen" />

		<script type="text/javascript" src="<%=request.getContextPath()%>/js/index.js?v=1.0"></script>
<style type="text/css">

</style>
<script type="text/javascript">


</script>
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="twitter.github.com/bootstrap/assets/js/html5shiv.js"></script>
    <![endif]-->
</head>

<body >
	<div id="shadow_bg" >
	<div id="body" >
				<div id="search">
					<input name="searchInput" type="text" class="search-query iconsearch" placeholder="搜尋" style="width: 70px; height: 10px; padding-left: 24px;" onfocus="this.style.width='100px'" onblur="this.style.width='70px'">
					</div>
						<br class="clear" />
			<%@ include file="../view_model/index_header.htm"%>
	<div id="main">
					<div id="sidebar">
						<%@ include file="../view_model/product_list.jsp"%>
						<%@ include file="../view_model/index_left_hotsale.htm"%>	
					</div>
	
					<div id="content">
					
<div class="searchResult">
	搜尋結果共 ${totalRows} 筆，頁數 ${whichPage} / ${totalPages}：
	<table class="p_outerTable">
		<tbody>
		<c:forEach var="product" items="${list}" begin="${pageIndex}" end="${pageIndex+rowsPerPage-1}" >
			<tr>
				<td class="p_pic"><a href="DisplayProducts?action=getOne_For_Display&pId=${product.p_no}"><img src="../images/products/${product.p_pic}.jpg" style="width:50px;"/></a></td>
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
			<a href="DisplayProducts?action=${action}&pageNo=${page}${conditionParam}">${page}</a>
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