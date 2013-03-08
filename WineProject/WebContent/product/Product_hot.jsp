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
border:0 ;

}
</style>
<script type="text/javascript">
$(function(){

$("#listall").click(function(){ 
    $("[name=allproduct] > div").fadeOut().delay(300); 
    $("[name=allproduct] > div").fadeIn(); 	
});
$("#rg").click(function(){//紅綠
    $("[name=allproduct] > div").fadeOut().delay(300);
    $("[name=rg]").fadeIn(); 	
});
$("#helf").click(function(){ //半價
    $("[name=allproduct] > div").fadeOut().delay(300); 	
    $("[name=helf]").fadeIn(); 	
});
$("#buyone").click(function(){ //買一
    $("[name=allproduct] > div").fadeOut().delay(300); 	
    $("[name=buyone]").fadeIn(); 	
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
			<div id="search">
				<input name="searchInput" type="text"
					class="search-query iconsearch" placeholder="搜尋"
					style="width: 70px; height: 10px; padding-left: 24px;"
					onfocus="this.style.width='100px'" onblur="this.style.width='70px'">
			</div>
			<br class="clear" />
			<%@ include file="../view_model/index_header.htm"%>
			<div id="main">
				<div id="sidebar">
					<%@ include file="../view_model/product_list.jsp"%>
					<%@ include file="../view_model/index_left_hotsale.htm"%>
				</div>

				<div id="content">
				<div  style="overflow: auto;	width: 100%">
	<h2>優惠商品</h2><hr>
						<div id="page-menu">
               <ul class=" primary "><li><a href="#" class="badge badge-success"><span id="listall" class="element-invisible">全部</span></a></li>
												<li><a href="#" class="badge badge-success"><span id="rg" class="element-invisible">紅配綠</span></a></li>
												<li><a href="#" class="badge badge-success"><span id="helf" class="element-invisible">第二件半價</span></a></li>
												<li><a href="#" class="badge badge-success"><span id="buyone" class="element-invisible">買一送一</span></a></li>
</ul>          </div>
						<div name="allproduct">
						
		<div  name="rg" class="g_wall"><img src="<%=request.getContextPath()%>/images/product_rg.png" class="label_tag" /><img src="<%=request.getContextPath()%>/images/products/I4601_img1.jpg" style="width:50px;border:1px"/><span>rg匯雅粉紅香檳</span> 特價$899！ 3小時前 評價了設計品Ooh La La 動感俏女孩硬殼筆記本</div>
		<div  name="rg" class="g_wall"><img src="<%=request.getContextPath()%>/images/product_rg.png" class="label_tag" /><img src="<%=request.getContextPath()%>/images/products/I4601_img1.jpg" style="width:50px;"/><span>rga義大利雪之邱</span>  3小時前 評價了設計品Ooh La La 動感俏女孩硬殼筆記本</div>	
		<div  name="rg" class="g_wall "><img src="<%=request.getContextPath()%>/images/product_rg.png" class="label_tag" /><img src="<%=request.getContextPath()%>/images/products/I4601_img1.jpg" style="width:50px;"/><span>rg山之巔黃標紅酒</span>  3小時前 評價了設計品Ooh La La 動感俏女孩硬殼筆記本</div>	
		<div  name="helf"  class="g_wall "><img src="<%=request.getContextPath()%>/images/product_helf.png" class="label_tag" /><img src="<%=request.getContextPath()%>/images/products/I4601_img1.jpg" style="width:50px;"/><span>helf匯雅粉紅香檳</span>  3小時前 評價了設計品Ooh La La 動感俏女孩硬殼筆記本</div>	
		<div  name="helf"  class="g_wall "><img src="<%=request.getContextPath()%>/images/product_helf.png" class="label_tag" /><img src="<%=request.getContextPath()%>/images/products/I4601_img1.jpg" style="width:50px;"/><span>helf匯雅粉紅香檳</span>  3小時前 評價了設計品Ooh La La 動感俏女孩硬殼筆La La 動感俏女孩La La 動感俏女孩硬殼筆記本硬殼筆記本記本</div>	
		<div  name="helf"  class="g_wall "><img src="<%=request.getContextPath()%>/images/product_helf.png" class="label_tag" /><img src="<%=request.getContextPath()%>/images/products/I4601_img1.jpg" style="width:50px;"/><span>helf山之巔黃標紅酒</span>  3小時前 評價了設計品Ooh La La 動感俏女孩硬殼筆記本</div>	
		<div  name="buyone" class="g_wall "><img src="<%=request.getContextPath()%>/images/product_buyone.png" class="label_tag" /><img src="<%=request.getContextPath()%>/images/products/I4601_img1.jpg" style="width:50px;"/><span>buyone義大利雪之邱</span>  3小時前 評價了設計品Ooh La La 動感俏女孩硬殼筆記本</div>	
		<div  name="buyone"  class="g_wall "><img src="<%=request.getContextPath()%>/images/product_buyone.png" class="label_tag" /><img src="<%=request.getContextPath()%>/images/products/I4601_img1.jpg" style="width:50px;"/><span>buyone匯雅粉紅香檳</span>  3小時前 評價了設計品Ooh La La 動感俏女孩硬殼筆記本</div>	
		<div  name="buyone"  class="g_wall "><img src="<%=request.getContextPath()%>/images/product_buyone.png" class="label_tag" /><img src="<%=request.getContextPath()%>/images/products/I4601_img1.jpg" style="width:50px;"/><span>buyone山之巔黃標紅酒</span>  3小時前 評價了設計品Ooh La La 動感俏女孩硬殼筆記本</div>	
		<div  name="buyone"  class="g_wall "><img src="<%=request.getContextPath()%>/images/product_buyone.png" class="label_tag" /><img src="<%=request.getContextPath()%>/images/products/I4601_img1.jpg" style="width:50px;"/><span>buyone匯雅粉紅香檳</span>  3小時前 評價了設計品Ooh La La 動感俏女孩硬殼筆記本</div>	
		<div  name="helf"  class="g_wall "><img src="<%=request.getContextPath()%>/images/product_helf.png" class="label_tag" /><img src="<%=request.getContextPath()%>/images/products/I4601_img1.jpg" style="width:50px;"/><span>helf山之巔黃標紅酒</span>  3小時前 評價了設計品Ooh La La 動感俏女孩硬殼筆記本</div>	
		<div  name="rg"  class="g_wall "><img src="<%=request.getContextPath()%>/images/product_rg.png" class="label_tag" /><img src="<%=request.getContextPath()%>/images/products/I4601_img1.jpg" style="width:50px;"/><span>rg義大利雪之邱</span>  3小時前 評價了設計品Ooh La La 動感俏女孩硬殼筆記本</div>	
		<br class="clear" /></div>
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