<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="styles.css" />
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>



	<div id='cssmenu'>
		<ul>
			<li class='active has-sub'><a href='#'><span>風味</span></a>
				<ul>
					<c:forEach var="creat" items="${style}">
						<li class='has-sub'><a href='#'><span>${creat} </span></a></li>
					</c:forEach>
				</ul></li>
			<li class='active has-sub'><a href='#'><span>國家/地區</span></a>
				<ul>
					<c:forEach var="creat" items="${area}">
						<li class='has-sub'><a href='#'><span>${creat} </span></a></li>
					</c:forEach>
				</ul></li>
			<li class='active has-sub'><a href='#'><span>品牌/酒莊</span></a>
				<ul>
					<c:forEach var="creat" items="${p_winery}">
						<li class='has-sub'><a href='#'><span>${creat} </span></a></li>
					</c:forEach>
				</ul></li>
			<li class='active has-sub'><a href='#'><span>價格</span></a>
				<ul>
					<li class='has-sub'><a href='#'><span>400元以下 </span></a></li>
					<li class='has-sub'><a href='#'><span>400元~800元</span></a></li>
					<li class='has-sub'><a href='#'><span>800元以上 </span></a></li>
				</ul></li>
			<li class='active has-sub'><a href='#'><span>容量</span></a>
				<ul>
					<c:forEach var="creat" items="${p_vol}">
						<li class='has-sub'><a href='#'><span>${creat} </span></a></li>
					</c:forEach>
				</ul></li>
			<li class='active has-sub'><a href='#'><span>酒種/葡萄種</span></a>
				<ul>
					<li class='has-sub'><a href='#'><span>紅葡萄酒 </span></a>
						<ul>

							<c:forEach var="grape" items="${redWine}">
								<li class='last'><a href='#'><span>${grape}</span></a></li>
							</c:forEach>
						</ul></li>

					<li class='has-sub'><a href='#'><span>白葡萄酒</span></a>
						<ul>

							<c:forEach var="grape" items="${whiteWine}">
								<li class='last'><a href='#'><span>${grape}</span></a></li>
							</c:forEach>
						</ul></li>
					<li class='has-sub'><a href='#'><span>氣泡酒 </span></a>
						<ul>

							<c:forEach var="grape" items="${bubbleWine}">
								<li class='last'><a href='#'><span>${grape}</span></a></li>
							</c:forEach>
						</ul></li>
				</ul></li>
		</ul>
	</div>

</body>
</html>