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
	<title>酒迷| 歷久彌新的香濃口感</title>
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
.show_pro{ border-bottom:#ccc 1px solid;overflow: auto;	width: 100%;border-left: #ccc 1px solid;border-right: #ccc 1px solid;}
.show_pro:hover{background:rgb(238, 245, 236)}
.pro_list{float: left;list-style: none;}
.pro_list2{float: right;list-style: none;margin:30px 30px 0 0;}
.pro_list3{float: left;list-style: none;width: 350px;}
.prod_img{background:#fff; border:#ccc 1px solid;padding:3px;margin:15px;width:100px;height:100px;text-align:center;}
.buttonbuy{margin-top: 10px;}
.pro_title{width: 100%;height:21px;background-repeat: repeat-x;background: url(<%=request.getContextPath()%>/images/product_list_top.png);border-left: #ccc 1px solid;
border-right: #ccc 1px solid;}
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
	共 ${totalRows} 項商品，頁數 ${whichPage} / ${totalPages}：
	<div class="pro_title"> <span style="margin-left:10px">全部商品</span></div>
	<c:forEach var="product" items="${list}" begin="${pageIndex}" end="${pageIndex+rowsPerPage-1}" >
		<div class="show_pro">
		<li class="pro_list"><a href="DisplayProducts?action=getOne_For_Display&pId=${product.p_no}"><div class="prod_img"><img  src="../images/products/${product.p_pic}" style="width:45px;"/></div></a></li>
		<li class="pro_list3"><a href="DisplayProducts?action=getOne_For_Display&pId=${product.p_no}">${product.p_name}</a><br><span style='font-size:9px'>酒莊:${product.p_winery}<br>國家:${product.p_area}<br>容量:0ml<br>評分:${product.p_rate}</span></li >	
		<li class="pro_list2"><span style="color:red;margin-left:10px;font-size: 26px;">$${product.p_price}</span> <br><button class="buttonbuy btn btn-success" type="button"><i class="icon-white icon-shopping-cart"></i>加入購物車</button></li >	
<br class="clear" />		
		</div >	
	</c:forEach>
	
	
	
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