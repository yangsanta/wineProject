<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="../style/ProductOne.css">
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


<div class=p_content>
	<div class="p_pics">${ productVO.p_pic }圖片</div>
	<div class="p_data">
		<div class="p_title">${ productVO.p_name} </div>
		<ul class="p_info1">
			<li>${ productVO.p_winery }（${ productVO.p_year }年），${ productVO.p_area }，${ productVO.p_area }。</li>
			<li>葡萄種類:${ productVO.p_grape }</li>
			<li>評分：${ productVO.p_rate }</li>
		</ul>
		<div class="p_intro">${ productVO.p_intro }</div>
		<ul>
			<li class="p_info2">容量：${ productVO.p_vol }</li>
			<li>酒精濃度:${ productVO.p_alcho }</li>
		</ul>
		<div class="p_purchase">
			<ul>
			<li>價格：${ productVO.p_price }</li>
			<li>存貨數量：${ productVO.p_num }</li>
			</ul>
		</div>
	</div>
	<div class="bar"></div>
</div>

</body>
</html>