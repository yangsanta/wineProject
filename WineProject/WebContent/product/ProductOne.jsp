<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	background:
		url(<%=request.getContextPath()%>/images/cl_vvrecmd_trans_bg.png)
		repeat-x;
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
.pro_info{color:blue;width:70px;display:inline-block;text-align:right}
.fb-like{margin-top:10px}
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
首頁>商品
					<table border="0" width="100%" cellspacing="0" cellpadding="0">
						<tr>
							<td style="width: 210px;vertical-align: top;"><div class="prod_img">
									<img src="<%=request.getContextPath()%>/images/products/${ productVO.p_pic }"
										style="vertical-align: top; width: 100px;">
								</div>
								<div class="fb-like" data-href="http://blog.davidou.org"
									data-send="true" data-layout="button_count" data-width="100"
									data-show-faces="true"></div></td>
							<td style="text-align: left">
								<div id="product_one" class="pro_list">
									<span style="font-size: 26px;">
										<strong style="color: rgb(37, 94, 40)">${ productVO.p_name}</strong>
									</span>
									<ul style="margin-top:20px">
										<li><span class="pro_info">酒莊：</span> ${ productVO.p_winery }</li>
										<li><span class="pro_info">國家/地區：</span>${ productVO.p_area }</li>
										<li><span class="pro_info">容量：</span>${ productVO.p_vol } ml</li>
										<li><span class="pro_info">酒精濃度：</span>5%</li>
										<li><span class="pro_info">年份：</span>${ productVO.p_year }</li>
										<li><span class="pro_info">評分：</span>
											<c:forEach var="i" begin="1" end="${ productVO.p_rate }" step="1" >
     										  <img src="<%=request.getContextPath()%>/images/star1.gif" style="width:20px">
											</c:forEach>	
											<c:forEach var="i" begin="${ productVO.p_rate }" end="4" step="1" >
     										    <img src="<%=request.getContextPath()%>/images/star.gif"style="width:20px"> 
											</c:forEach>
										</li>
										<li><span class="pro_info">產區：</span>大陸</li>
										<li><span class="pro_info">葡萄種類：</span>${ productVO.p_grape }</li>
									</ul>
									<div style="text-align: right;">商品編號:365${ productVO.p_no}</div>
									<hr style="margin: 0">
										<div class="price">
											<strong>網路價:</strong><span style="color: red">$${ productVO.p_price }</span>
										</div>
											<div class="car">
										<BR> 數量<select style="width: 80px;">
													<option>1</option>
													<option>2</option>
													<option>${ productVO.p_num }</option>
											</select>
												<button class="btn btn-primary" type="button"
													style="margin: 0 0 10px 5px;">加入購物車</button>	</div>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2"><div style="margin-top: 20px">
									${ productVO.p_intro }

									</div>
							</td>
						</tr>
					</table>


					<div class="recom-title">或許你也會喜歡</div>
					<ul id="recom-ul" style="list-style: none;">
						<li style="border-top: 0"><div class="img">
								<a href="#"><img
									src="http://tw.m.yimg.com/res/gdsale/st_pic/3750/st-3750864-s60.jpg"></a>
							</div>
							<div class="desc">
								<a href="#">《Del Duomo》義大利巴薩米克醋淋醬 (215ml)</a>
							</div>
							<div>
								<span class="shpdollar">$299元</span>
							</div></li>
						<li style="border-top: 0"><div class="img">
								<a href="#"><img
									src="http://tw.m.yimg.com/res/gdsale/st_pic/3750/st-3750864-s60.jpg"></a>
							</div>
							<div class="desc">
								<a href="#">《Del Duomo》義大利巴薩米克醋淋醬 (215ml)</a>
							</div>
							<div>
								<span class="shpdollar">$299元</span>
							</div></li>
						<li style="border-top: 0"><div class="img">
								<a href="#"><img
									src="http://tw.m.yimg.com/res/gdsale/st_pic/3750/st-3750864-s60.jpg"></a>
							</div>
							<div class="desc">
								<a href="#">《Del Duomo》義大利巴薩米克醋淋醬 (215ml)</a>
							</div>
							<div>
								<span class="shpdollar">$299元</span>
							</div></li>
						<li style="border-top: 0"><div class="img">
								<a href="#"><img
									src="http://tw.m.yimg.com/res/gdsale/st_pic/3750/st-3750864-s60.jpg"></a>
							</div>
							<div class="desc">
								<a href="#">《Del Duomo》義大利巴薩米克醋淋醬 (215ml)</a>
							</div>
							<div>
								<span class="shpdollar">$299元</span>
							</div></li>
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