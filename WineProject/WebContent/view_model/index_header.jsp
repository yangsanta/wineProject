<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="search">
	<span> <c:if test="${sessionScope.access=='y'}">${sessionScope.m_id}，你好&nbsp;&nbsp; &nbsp;</c:if>
	</span><input name="searchInput" type="text" class="search-query iconsearch"
		placeholder="搜尋"
		style="width: 70px; height: 10px; padding-left: 24px;"
		onfocus="this.style.width='100px'" onblur="this.style.width='70px'">
</div>
<br class="clear" />
<div id="header">
	<div id="logo">
		<h1>
			<a href="<%=request.getContextPath()%>/index.jsp"><img
				src="<%=request.getContextPath()%>/images/logo.gif"
				style="margin-top: -50px; margin-left: -50px; width: 320px" /></a>
		</h1>
	</div>

	<div id="little_nav">
		<ul style="float: left">
			<c:if test="${sessionScope.access!='y'}">
				<li><a href="<%=request.getContextPath()%>/memberRegister.jsp">加入會員</a></li>
				<li><a class="fancybox" href="#inline1">登入</a></li>
			</c:if>
			<c:if test="${sessionScope.access=='y'}">
				<li><a class="fancybox"
					href="<%=request.getContextPath()%>/logout.jsp">登出</a></li>
			</c:if>
			<li><a href="<%=request.getContextPath()%>/member/MemberService">會員專區
			</a></li>
		</ul>
		<ul id="nav22">
			<li><a class="topa" href="#"><i
					class="icon-shopping-cart icon-white"></i> 購物車(<em>11</em>)件 </a>
				<ul class="downul">
					<span>最近加入的商品：</span>
					<br>
					<span style="margin-left: 20px; font-size: 10px;">商品</span>
					<span style="font-size: 10px; float: right; margin-right: 30px">小計</span>
					<hr style="margin: 5px 5px 5px 0">
					<div>


						<c:forEach var="products" items="${sessionScope.ShoppingCart.content}">
														<div class="babypart">
															<a href="#" class="aproimg"><img
																src="http://localhost:8080/WineProject/images/products/SWLA02G_img1.jpg" /></a>
															<div class="arr01-hd">
																<span><a href="#">${products.value.productName}</a></span>
																<p>x${products.value.productNumber}</p>
															</div>
															<div class="arr02-hd">
																<span>$<strong>${products.value.subTatle}</strong></span>
																<p class="del">删除</p>

															</div>
						</c:forEach>


						<p class="clear"></p>
					</div>
					<hr style="margin: 0 5px 5px 0">
					<div class="shopcar_buy">
						<a href="#">
							<button class="btn btn-mini  btn-success" type="button">結帳回家</button>
						</a>
					</div>
				</ul></li>
		</ul>
	</div>
	<div id="nav">
		<ul>
			<li class="first active"><a href="#" rel="tooltip"
				data-placement="bottom" title="介紹本月新上市的最新好酒，邀您一同來品嘗">本月新品</a></li>
			<li><a
				href="<%=request.getContextPath()%>/product/DisplayProducts?action=getSome_For_Display&condition=p_buy_count&conditionValue=10"
				rel="tooltip" data-placement="bottom" title="年度暢銷熱賣商品都在這邊，快來搶購!">暢銷商品</a>
			</li>
			<li><a
				href="<%=request.getContextPath()%>/product/DisplayProducts?action=getSome_For_Display&condition=p_sales&conditionValue="
				rel="tooltip" data-placement="bottom"
				title="最新的組合套餐優惠，您可以用最優惠的方式購買到此產品">優惠商品</a></li>
			<li><a href="food/setselectall" rel="tooltip"
				data-placement="bottom" title="不知道吃甚麼晚餐配甚麼樣的酒最浪漫美味嗎? 來這邊就對了">餐酒搭配</a></li>

			<li class="last"><a
				href="<%=request.getContextPath()%>/DiscussionList?action=getAll"
				rel="tooltip" data-placement="bottom"
				title="相信這世界上一定還有更多與你一樣愛酒的人士，一起討論吧">討論區</a></li>
		</ul>
		<br class="clear" />
	</div>
</div>