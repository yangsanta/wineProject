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
			<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
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
.g_wall_long {
	background-color: #fff;
	border: 1px solid #eee;
	line-height: 1.4em;
	padding: 12px;
	margin: 10px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	height: 120px;
	box-shadow: 2px 1px 6px #efefef -moz-box-shadow:2px 1px 6px #f2f4f3;
	-webkit-box-shadow: 2px 1px 6px #f2f4f3;
	position: relative;

}

.g_wall:hover {
	background-color: rgb(244, 248, 255);
}
.g_wall_proimg{margin-left:20px}
.g_wall_long:hover {
	background-color: rgb(244, 248, 255);
}
.g_wall_price{float:right;margin-top: -70px;}
.label_tag {
	width: 70px;
	position: absolute;
	top: -4px;
	right: -5px
}
.g_wall_info{margin-left:290px}
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
.lebel_discribe{color:rgb(80, 4, 4);font-fize:10px}
.g_wall_name{background:#ccc;position: absolute; bottom: 0;margin: 0px -5px 0px -12px;
height: 60px;width: 171px;background: url(<%=request.getContextPath()%>/images/bg_05.png) repeat-x;padding: 7px 15px 0 15px;}
.g_wall_name_long{margin: -90px;width: 350px;}
.primary {
	background-color: #bbb1a8;
	padding-left: 15px;
	-webkit-border-radius: 15px;
	-moz-border-radius: 15px;
	-ms-border-radius: 15px;
	-o-border-radius: 15px;
	border-radius: 15px;
	position:relative;
	height:30px;
}
#page-menu ul li {
	display: inline;
	border: 0;
	
}
#page-menu {position: absolute;
right: 19px;
}
.display_long_off{margin-right:5px;background: url("<%=request.getContextPath()%>/images/csssplite.png"); background-position: -448px 0; width: 16px; height: 16px; background-repeat: no-repeat; }
.display_long_on{margin-right:5px;background: url("<%=request.getContextPath()%>/images/csssplite.png"); background-position: -464px 0; width: 16px; height: 16px; background-repeat: no-repeat; }
.display_block_on{margin-right:5px;background: url("<%=request.getContextPath()%>/images/csssplite.png"); background-position: -990px -90px; width: 16px; height: 16px; background-repeat: no-repeat; }
.display_block_off{margin-right:5px;background: url("<%=request.getContextPath()%>/images/csssplite.png"); background-position: -990px -74px; width: 16px; height: 16px; background-repeat: no-repeat; }
</style>
<script type="text/javascript">
				$(function() {
					$("#display_long").click(function() {//長條	
						$("[name='g_wall']").removeClass("g_wall").addClass("g_wall_long ");	
						$("[name='g_wall_name']").removeClass("g_wall_name").addClass("g_wall_name_long ");
						$("#display_long").removeClass("display_long_off").addClass("display_long_on ");
						$("#display_block").removeClass("display_block_on").addClass("display_block_off ");
						$("[name='g_wall_price']").addClass("g_wall_price");	
						$("[name='g_wall_proimg']").addClass("g_wall_proimg");	
						$("[name='g_wall_info']").addClass("g_wall_info");
						
					});
					$("#display_block").click(function() { //塊狀
						$("[name='g_wall']").removeClass("g_wall_long").addClass("g_wall");
						$("[name='g_wall_name']").removeClass("g_wall_name_long").addClass("g_wall_name ");
						$("#display_long").removeClass("display_long_on").addClass("display_long_off ");
						$("#display_block").removeClass("display_block_off").addClass("display_block_on ");
						$("[name='g_wall_price']").removeClass("g_wall_price");		
						$("[name='g_wall_proimg']").removeClass("g_wall_proimg");
						$("[name='g_wall_info']").removeClass("g_wall_info");
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
				<div id="sidebar">
					<%@ include file="../view_model/product_list.jsp"%>
					<%@ include file="../view_model/index_left_hotsale.jsp"%>
				</div>

				<div id="content">
					<div class="searchResult">
						<%-- 	搜尋結果共 ${totalRows} 筆，頁數 ${whichPage} / ${totalPages}： --%>

						<div style="overflow: auto; width: 100%">
							<h2>本月新品</h2>
							
							<div class=" primary ">
							<div id="page-menu">
								<ul >
								<li>顯示： </li>
									<li><a href="#" style="text-decoration:none"rel="tooltip"
				data-placement="top" title="切換成條列狀排序顯示畫面" ><span
											id="display_long" class="display_long_off" > 　</span></a></li>
									<li><a href="#" style="text-decoration:none" rel="tooltip"
				data-placement="top" title="切換成條塊狀排序顯示畫面" ><span
											id="display_block" class="display_block_on">　</span></a></li>
								</ul>
							</div></div>
							<hr />
							<c:forEach var="product" items="${list}" begin="${pageIndex}"
								end="${pageIndex+rowsPerPage-1}">
								<a style="text-decoration: none;"
									href="DisplayProducts.do?action=getOne_For_Display&pId=${product.p_no}">
									<div name="g_wall"class="g_wall drop-shadow" style="position: relative;">
										<img src="<%=request.getContextPath()%>/images/label.png"
											class="label_tag" />
											<div class="label2 label_tag"></div>
										<div style="height: 105px;">
											<img name="g_wall_proimg"
												src="<%=request.getContextPath()%>/images/products/${product.p_pic}"
												style="width: 50px; float: left;" /> </br>
												<div name="g_wall_info">
												<span class="lebel_discribe">酒莊:</span><span>${product.p_winery}</span><Br>
												<span class="lebel_discribe">地區:</span><span>${product.p_area}</span><Br>
												<span class="lebel_discribe">評分:</span>
												
													<c:forEach var="i" begin="1" end="${ product.p_rate }" step="1" >
     										  <img src="<%=request.getContextPath()%>/images/star1.gif" style="width:16px;margin-left:-4px;">
											</c:forEach>	
											<c:forEach var="i" begin="${ product.p_rate }" end="4" step="1" >
     										    <img src="<%=request.getContextPath()%>/images/star.gif"style="width:16px;margin-left:-4px;"> 
											</c:forEach><br></div>
												
												
												
												
									</div>
									<br class="clear" />
												<div name="g_wall_price"><span style="display: block; margin: 0px 0 0 15px; color: red; font-size: 22px">
												<span class="label label-important" style="background:#B41E3C;padding:7px;font-size:16px;background-image: -moz-linear-gradient(top,rgb(192, 49, 169),rgb(122, 5, 52));background-image: -webkit-gradient(linear,0 0,0 100%,from(rgb(192, 49, 169)),to(rgb(122, 5, 52)));background-image: -webkit-linear-gradient(top,rgb(192, 49, 169),rgb(122, 5, 52));
}">優惠價</span> ${product.p_price} 元</span></div>
										
										<div name="g_wall_name" class="g_wall_name">
<span style="padding-left:30px;display: block;height: 49px;margin-right: -10px;background: url(http://static.womai.com/zhongliang/templets/Winex/images/icon_12.png) no-repeat 0 8px;">${product.p_name}</span></div>
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
										href="DisplayProducts.do?action=${action}&pageNo=${page}${conditionParam}">${page}</a></li>
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