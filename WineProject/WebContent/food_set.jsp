<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


