<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ page import="java.util.*"%>
<%@ page import="product.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="styles.css" />
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
	<%
		ProductHibernateDAO dao = new ProductHibernateDAO();
		List<String> area = dao.findProductType("p_area");
		pageContext.setAttribute("area", area);
		List<String> style = dao.findProductType("p_style");
		pageContext.setAttribute("style", style);
		List<String> p_winery = dao.findProductType("p_winery");
		pageContext.setAttribute("p_winery", p_winery);
		List<String> p_vol = dao.findProductType("p_vol");
		pageContext.setAttribute("p_vol", p_vol);
	%>


	<div id='cssmenu'>
		<ul>
			<li class='active has-sub'><a href='#'><span>����</span></a>
				<ul>
					<c:forEach var="creat" items="${style}">
						<li class='has-sub'><a href='#'><span>${creat} </span></a></li>
					</c:forEach>
				</ul></li>
			<li class='active has-sub'><a href='#'><span>��a/�a��</span></a>
				<ul>
					<c:forEach var="creat" items="${area}">
						<li class='has-sub'><a href='#'><span>${creat} </span></a></li>
					</c:forEach>
				</ul></li>
			<li class='active has-sub'><a href='#'><span>�~�P/�s��</span></a>
				<ul>
					<c:forEach var="creat" items="${p_winery}">
						<li class='has-sub'><a href='#'><span>${creat} </span></a></li>
					</c:forEach>
				</ul></li>
			<li class='active has-sub'><a href='#'><span>����</span></a>
				<ul>
					<li class='has-sub'><a href='#'><span>400���H�U </span></a></li>
					<li class='has-sub'><a href='#'><span>400��~800��</span></a></li>
					<li class='has-sub'><a href='#'><span>800���H�W </span></a></li>
				</ul></li>
			<li class='active has-sub'><a href='#'><span>�e�q</span></a>
				<ul>
					<c:forEach var="creat" items="${p_vol}">
						<li class='has-sub'><a href='#'><span>${creat} </span></a></li>
					</c:forEach>
				</ul></li>
			<li class='active has-sub'><a href='#'><span>�s��</span></a>
				<ul>
					<li class='has-sub'><a href='#'><span>������s </span></a>
						<ul>
							<%
								List<String> redWine = dao.findGrapeType("������s");
								pageContext.setAttribute("redWine", redWine);
							%>
							<c:forEach var="grape" items="${redWine}">
							<li class='last'><a href='#'><span>${grape}</span></a></li>
						</c:forEach>
						</ul></li>

					<li class='has-sub'><a href='#'><span>�ո���s</span></a>
						<ul>
							<%
								List<String> whiteWine = dao.findGrapeType("�ո���s");
								pageContext.setAttribute("whiteWine", whiteWine);
							%>
							<c:forEach var="grape" items="${whiteWine}">
							<li class='last'><a href='#'><span>${grape}</span></a></li>
						</c:forEach>
						</ul></li>
					<li class='has-sub'><a href='#'><span>��w�s </span></a>
							<ul>
							<%
								List<String> bubbleWine = dao.findGrapeType("�ո���s");
								pageContext.setAttribute("bubbleWine", bubbleWine);
							%>
							<c:forEach var="grape" items="${bubbleWine}">
							<li class='last'><a href='#'><span>${grape}</span></a></li>
						</c:forEach>
						</ul></li>
				</ul></li>
		</ul>
	</div>

</body>
</html>