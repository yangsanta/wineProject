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
.pro_list {
	float: left;
	list-style: none;
	font-size: 10px;
	text-align: left;
	margin-left: 20px
}

.prod_img {
	background: #fff;
	border: #ccc 1px solid;
	padding: 3px;
	width: 250px;
	height: 250px;
	text-align: center;
}

#product_one ul li {
	padding: 1px 0 1px 0;
	border-top: dashed 1px #b3b3b3;
}

#product_one .price {
	text-align: center;
	font-size: 24px
}

#product_one .car {
	text-align: center;
}

.recom-title {
	margin-top: 30px;
	background: url(<%=request.getContextPath()%>/images/cl_vvrecmd_trans_bg.png
		) repeat-x;
	padding-left: 50px
}

#recom-ul {
	text-align: center;
}

#recom-ul  li {
	float: left;
	width: 150px;
	border-top: 0
}

#recom-ul .desc {
	font-size: 10px
}

#recom-ul .shpdollar {
	color: red
}

.pro_info {
	color: blue;
	width: 70px;
	display: inline-block;
	text-align: right;
	font-size: 12px;
}

.info_li {
	font-size: 12px;
	line-height: 20px;
	padding: 1px 0 1px 0 !important;
}

.fb-like {
	margin-top: 10px
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
					<%@ include file="../view_model/index_left_hotsale.jsp"%>
				</div>

				<div id="content">
					<%@ include file="../view_model/page_alert.htm"%>
					首頁>商品
 					<div style="margin:0 auto;width:300px">                
                 <h1>不好意思!! </h1><br><br>
                 </div>
                 <h3> 此商品已經下架  下次請盡早購買</h3>
					<div class="recom-title">或許你也會喜歡</div>
					<ul id="recom-ul" style="list-style: none;">

						<c:forEach var="maylike" items="${maylike}">
							<li style="border-top: 0"><div class="img">
									<a
										href="<%=request.getContextPath()%>/product/DisplayProducts.do?action=getOne_For_Display&pId=${maylike.p_no}"><img
										src="<%=request.getContextPath()%>/images/products/${maylike.p_pic}"
										style="width: 40px"></a>
								</div>
								<div class="desc">
									<a
										href="<%=request.getContextPath()%>/product/DisplayProducts.do?action=getOne_For_Display&pId=${maylike.p_no}">${maylike.p_name}</a>
								</div>
								<div>
									<span class="shpdollar">$${maylike.p_price}元</span>
								</div></li>
						</c:forEach>
					</ul>


					<div id="fb-root"></div>
					<script>
						(function(d, s, id) {
							var js, fjs = d.getElementsByTagName(s)[0];
							if (d.getElementById(id))
								return;
							js = d.createElement(s);
							js.id = id;
							js.src = "http://connect.facebook.net/zh_TW/all.js#xfbml=1&appId=326780054097640";
							fjs.parentNode.insertBefore(js, fjs);
						}(document, 'script', 'facebook-jssdk'));
					</script>
					<div class="fb-comments"
						data-href="http://wine.davidou.org:8080/WineProject/product/DisplayProducts.do?action=getOne_For_Display&amp;pId=${productVO.p_no}"
						data-width="600" data-num-posts="10"></div>
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