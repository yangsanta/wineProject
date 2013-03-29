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
a{text-decoration:none}
.title{font-size:24px;}
#foodalldiv ul li ul{display:none;float:left;background-color:#ccc;position: absolute;left: 300px;margin-top: 30px;margin-right: 30px;} /*第一層選單藏起來 firstul*/
#foodalldiv ul li ul li {border-top: 0;float:left;margin-left:10px;margin-right:10px;list-style: none;padding: 10px;} /*第2層選單藏起來 secli*/
#foodalldiv ul li ul li ul{width: 600px;top: 120px;display:none;float:left;background-color:yellow;position: absolute;left: 0px;margin-top: 30px;} /*第二層選單藏起來 secul*/
#foodalldiv ul li ul li ul li {float:left;margin-left:10px;margin-right:10px;list-style: none;padding: 10px;} /*第3層選單藏起來 secli*/
#foodalldiv ul li ul li ul li ul{display:none;float:left;background-color:rgb(247, 77, 34);position: absolute;left: 0px;margin-left:0px} /*第3層選單藏起來 secul*/
.forthli{width:400px;border-top: 0;}
.firstli{display:block;float:left;margin-right:30px;}
.firstul{height: 130px;width: 600px;margin-left:-10px;border-width:1px; border-style:solid;-webkit-border-radius: 5px;-moz-border-radius: 5px;border-radius: 5px;background: #ad8667 url('<%=request.getContextPath()%>/images/disz_bg.png')}
.thirdli{margin-left:10px;border-top: 0;}
.secul{margin-left:0px;height: 120px;border-width:1px; border-style:solid;-webkit-border-radius: 5px;-moz-border-radius: 5px;border-radius: 5px;background: #ad8667 url('<%=request.getContextPath()%>/images/disz_bg.png')}
.thirdul{border-width:1px; border-style:solid;-webkit-border-radius: 5px;-moz-border-radius: 5px;border-radius: 5px;padding:10px 0 10px 0;background: #ad8667 url('<%=request.getContextPath()%>/images/disz_bg.png')}
</style>
<script type="text/javascript">
$(document).on("click",
		".firstli",
		function(event) {
		$(".firstul").css( "display", "none" );
		$(this).find(".firstul").css( "display", "block" );
		});
$(document).on("click",
		".secli",
		function(event) {
		$(".secul").css( "display", "none" );
		$(this).find(".secul").css( "display", "block" );
		});
$(document).on("click",
		".thirdli",
		function(event) {
		$(".thirdul").css( "display", "none" );
		$(this).find(".thirdul").css( "display", "block" );
		});

</script>
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="twitter.github.com/bootstrap/assets/js/html5shiv.js"></script>
    <![endif]-->
</head>

<body >
	<div id="shadow_bg" >
	<div id="body" >
			<%@ include file="../view_model/index_header.jsp"%>
	<div id="main">
					<div id="sidebar">
						<%@ include file="../view_model/product_list.jsp"%>
						<%@ include file="../view_model/index_left_hotsale.jsp"%>	
					</div>
	
					<div id="content">
					<%@ include file="view_model/page_alert.htm"%>
	<div id="foodalldiv">
		<div class="box-heading">
			<span class="title">餐酒搭配</span><hr>
		</div><br>
		<ul>
			<li class="firstli" style="border-top: 0;" style="margin-top:11px"><a href="#"><img src="<%=request.getContextPath()%>/images/icon_meat_off.png"><Br>肉類</a>
				<ul class="firstul">
				<li style="width:600px;">請選擇您喜愛的食材</li>
					<c:forEach var="food_set" items="${getSomebydF_id1}">
						<li  class="secli"><a href="#">${food_set.value}</a>
							<ul class="secul">
							<li style="width:600px;">您喜歡哪種風味呢? <span style="font-size:10px;color:blue"> 肉類 > ${food_set.value}</span></li>
								<c:forEach var="food_set1" items="${getSomebyI_id}">
									<c:forEach var="food_set2" items="${food_set1}">

										<c:if test="${food_set.key == food_set2.ingredientVO.i_id}">

											<li class="thirdli"><a href="#">${food_set2.sauceVO.s_name}</a>

												<ul class="thirdul">
												<li style="width:600px;">太好了，這就是你今晚的美酒了! <span style="font-size:10px;color:blue">肉類 > ${food_set.value} > ${food_set2.sauceVO.s_name}</span></li>
													<li class='forthli'><a
														href="<%=request.getContextPath()%>/product/DisplayProducts.do?action=getOne_For_Display&pId=${food_set2.productVO.p_no}">
															${food_set2.productVO.p_name}</a></li>
												</ul></li>

										</c:if>
									</c:forEach>
								</c:forEach>
							</ul></li>
					</c:forEach>

				</ul></li>
		</ul>
		<ul>
			<li  class="firstli" style="border-top: 0;"><a href="#"><img src="<%=request.getContextPath()%>/images/icon_cheese_off.png"><Br>乳酪</a>
				<ul class="firstul">
				<li style="width:600px;">請選擇您喜愛的食材</li>
					<c:forEach var="food_set" items="${getSomebydF_id2}">
						<li class="secli"><a href="#">${food_set.value}</a>
							<ul  class="secul">
							<li style="width:600px;">您喜歡哪種風味呢? <span style="font-size:10px;color:blue"> 乳酪 > ${food_set.value}</span></li>
								<c:forEach var="food_set1" items="${getSomebyI_id}">
									<c:forEach var="food_set2" items="${food_set1}">

										<c:if test="${food_set.key == food_set2.ingredientVO.i_id}">

											<li class="thirdli"><a href="#">${food_set2.sauceVO.s_name}</a>

												<ul class="thirdul">
<li style="width:600px;">太好了，這就是你今晚的美酒了! <span style="font-size:10px;color:blue">乳酪 > ${food_set.value} > ${food_set2.sauceVO.s_name}</span></li>
													<li class='forthli'><a
														href="<%=request.getContextPath()%>/product/DisplayProducts.do?action=getOne_For_Display&pId=${food_set2.productVO.p_no}">${food_set2.productVO.p_name}</a></li>
												</ul></li>

										</c:if>
									</c:forEach>
								</c:forEach>
							</ul></li>
					</c:forEach>
				</ul></li>
		</ul>
		<ul>
			<li  class="firstli" style="border-top: 0;"><a href="#"><img src="<%=request.getContextPath()%>/images/icon_dessert_off.png"><Br>甜點</a>
				<ul class="firstul">
				<li style="width:600px;">請選擇您喜愛的食材</li>
					<c:forEach var="food_set" items="${getSomebydF_id3}">
						<li class="secli"><a href="#">${food_set.value}</a>
							<ul class="secul">
							<li style="width:600px;">您喜歡哪種風味呢? <span style="font-size:10px;color:blue"> 甜點 > ${food_set.value}</span></li>
								<c:forEach var="food_set1" items="${getSomebyI_id}">
									<c:forEach var="food_set2" items="${food_set1}">

										<c:if test="${food_set.key == food_set2.ingredientVO.i_id}">

											<li class="thirdli"><a href="#">${food_set2.sauceVO.s_name}</a>

												<ul class="thirdul">
<li style="width:600px;">太好了，這就是你今晚的美酒了! <span style="font-size:10px;color:blue">甜點 > ${food_set.value} > ${food_set2.sauceVO.s_name}</span></li>
													<li class='forthli'><a
														href="<%=request.getContextPath()%>/product/DisplayProducts.do?action=getOne_For_Display&pId=${food_set2.productVO.p_no}">${food_set2.productVO.p_name}</a></li>
												</ul></li>

										</c:if>
									</c:forEach>
								</c:forEach>
							</ul></li>
					</c:forEach>
				</ul></li>
		</ul>
		<ul>
			<li  class="firstli" style="border-top: 0;"><a href="#"><img src="<%=request.getContextPath()%>/images/icon_pasta_off.png"><Br>穀類</a>
				<ul class="firstul">
				<li style="width:600px;">請選擇您喜愛的食材</li>
					<c:forEach var="food_set" items="${getSomebydF_id4}"> <!-- 第二層 -->
						<li class="secli"><a href="#">${food_set.value}</a>
							<ul class="secul">
							<li style="width:600px;">您喜歡哪種風味呢? <span style="font-size:10px;color:blue"> 穀類 > ${food_set.value}</span></li>
								<c:forEach var="food_set1" items="${getSomebyI_id}"> <!-- 3層 -->
									<c:forEach var="food_set2" items="${food_set1}">  <!--  4層 -->

										<c:if test="${food_set.key == food_set2.ingredientVO.i_id}">

											<li class="thirdli"><a href="#">${food_set2.sauceVO.s_name}</a>

												<ul class="thirdul">
<li style="width:600px;">太好了，這就是你今晚的美酒了! <span style="font-size:10px;color:blue">穀類 > ${food_set.value} > ${food_set2.sauceVO.s_name}</span></li>
													<li class='forthli'><a
														href="<%=request.getContextPath()%>/product/DisplayProducts.do?action=getOne_For_Display&pId=${food_set2.productVO.p_no}">${food_set2.productVO.p_name}</a></li>
												</ul></li>

										</c:if>
									</c:forEach>
								</c:forEach>
							</ul></li>
					</c:forEach>
				</ul></li>
		</ul>
		<ul>
			<li  class="firstli" style="border-top: 0;"><a href="#"><img src="<%=request.getContextPath()%>/images/icon_poultry_off.png"><Br>雞鴨</a>
				<ul class="firstul">
				<li style="width:600px;">請選擇您喜愛的食材</li>
					<c:forEach var="food_set" items="${getSomebydF_id5}">
						<li class="secli"><a href="#">${food_set.value}</a>
							<ul class="secul">
							<li style="width:600px;">您喜歡哪種風味呢?<span style="font-size:10px;color:blue">雞鴨 > ${food_set.value}</span></li>
								<c:forEach var="food_set1" items="${getSomebyI_id}">
									<c:forEach var="food_set2" items="${food_set1}">

										<c:if test="${food_set.key == food_set2.ingredientVO.i_id}">

											<li class="thirdli"><a href="#">${food_set2.sauceVO.s_name}</a>

												<ul class="thirdul">
<li style="width:600px;">太好了，這就是你今晚的美酒了! <span style="font-size:10px;color:blue">雞鴨 > ${food_set.value} > ${food_set2.sauceVO.s_name}</span></li>
													<li class='forthli'><a
														href="<%=request.getContextPath()%>/product/DisplayProducts.do?action=getOne_For_Display&pId=${food_set2.productVO.p_no}">${food_set2.productVO.p_name}</a></li>
												</ul></li>

										</c:if>
									</c:forEach>
								</c:forEach>
							</ul></li>
					</c:forEach>
				</ul></li>
		</ul>
		<ul>
			<li class="firstli" style="border-top: 0;"><a href="#"><img src="<%=request.getContextPath()%>/images/icon_seafood_off.png"><Br>海鮮</a>
				<ul class="firstul">
				<li style="width:600px;">請選擇您喜愛的食材</li>
					<c:forEach var="food_set" items="${getSomebydF_id6}">
						<li class="secli"><a href="#">${food_set.value}</a>
							<ul class="secul">
							<li style="width:600px;">您喜歡哪種風味呢? <span style="font-size:10px;color:blue">海鮮 > ${food_set.value}</span></li>
								<c:forEach var="food_set1" items="${getSomebyI_id}">
									<c:forEach var="food_set2" items="${food_set1}">

										<c:if test="${food_set.key == food_set2.ingredientVO.i_id}">

											<li class="thirdli"><a href="#">${food_set2.sauceVO.s_name}</a>

												<ul class="thirdul">
<li style="width:600px;">太好了，這就是你今晚的美酒了! <span style="font-size:10px;color:blue">海鮮 > ${food_set.value} > ${food_set2.sauceVO.s_name}</span></li>
													<li class='forthli'><a
														href="<%=request.getContextPath()%>/product/DisplayProducts.do?action=getOne_For_Display&pId=${food_set2.productVO.p_no}">${food_set2.productVO.p_name}</a></li>
												</ul></li>

										</c:if>
									</c:forEach>
								</c:forEach>
							</ul></li>
					</c:forEach>
				</ul></li>
		</ul>
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