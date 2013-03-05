<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="styles.css" />




	<div id='cssmenu'>
	<span class="title">快速選單</span>
		<ul>
			<li class=' has-sub'><a href='#'><span>風味</span></a>
				<ul>
					<c:forEach var="creat" items="${style}">
						<li class='has-sub'><a href='product/DisplayProducts?action=getSome_For_Display&condition=p_style&conditionValue=${creat}'><span>${creat} </span></a></li>
					</c:forEach>
				</ul></li>
			<li class=' has-sub'><a href='#'><span>國家/地區</span></a>
				<ul>
					<c:forEach var="creat" items="${area}">
						<li class='has-sub'><a href='product/DisplayProducts?action=getSome_For_Display&condition=p_area&conditionValue=${creat}'><span>${creat} </span></a></li>
					</c:forEach>
				</ul></li>
			<li class=' has-sub'><a href='#'><span>品牌/酒莊</span></a>
				<ul>
					<c:forEach var="creat" items="${p_winery}">
						<li class='has-sub'><a href='product/DisplayProducts?action=getSome_For_Display&condition=p_winery&conditionValue=${creat}'><span>${creat} </span></a></li>
					</c:forEach>
				</ul></li>
			<li class=' has-sub'><a href='#'><span>價格</span></a>
				<ul>
					<li class='has-sub'><a href='#'><span>400元以下 </span></a></li>
					<li class='has-sub'><a href='#'><span>400元~800元</span></a></li>
					<li class='has-sub'><a href='#'><span>800元以上 </span></a></li>
				</ul></li>
			<li class=' has-sub'><a href='#'><span>容量</span></a>
				<ul>
					<c:forEach var="creat" items="${p_vol}">
						<li class='has-sub'><a href='product/DisplayProducts?action=getSome_For_Display&condition=p_vol&conditionValue=${creat}'><span>${creat} </span></a></li>
					</c:forEach>
				</ul></li>
			<li class='has-sub'><a href='#'><span>酒種/葡萄種</span></a>
				<ul>
					<li class='has-sub'><a href='#'><span>紅葡萄酒 </span></a>
						<ul>

							<c:forEach var="grape" items="${redWine}">
								<li class='last'><a href='product/DisplayProducts?action=getSome_For_Display&condition=p_grape&conditionValue=${grape}'><span>${grape}</span></a></li>
							</c:forEach>
						</ul></li>

					<li class='has-sub'><a href='#'><span>白葡萄酒</span></a>
						<ul>

							<c:forEach var="grape" items="${whiteWine}">
								<li class='last'><a href='product/DisplayProducts?action=getSome_For_Display&condition=p_grape&conditionValue=${grape}'><span>${grape}</span></a></li>
							</c:forEach>
						</ul></li>
					<li class='has-sub'><a href='#'><span>氣泡酒 </span></a>
						<ul>

							<c:forEach var="grape" items="${bubbleWine}">
								<li class='last'><a href='product/DisplayProducts?action=getSome_For_Display&condition=p_grape&conditionValue=${grape}'><span>${grape}</span></a></li>
							</c:forEach>
						</ul></li>
				</ul></li>
		</ul>
	</div>
