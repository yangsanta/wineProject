<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><link rel="shortcut icon"	href="<%=request.getContextPath()%>/favicon.ico" /><link rel="icon" href="<%=request.getContextPath()%>/favicon.ico"	type="image/x-icon" /><head><meta charset="utf-8">	<title>酒迷|後台管理系統</title>	<link media="all" rel="stylesheet" type="text/css"		href="<%=request.getContextPath()%>/wine_admin/css/all.css" />	<script src="http://code.jquery.com/jquery.js"></script>	<script type="text/javascript">	window.jQuery|| document.write('<script type="text/javascript" src="<%=request.getContextPath()%>		/js/jquery-1.9.0.min.js"><\/script>');	</script>	<link		href="<%=request.getContextPath()%>/style/bootstrap/css/bootstrap.min.css"		rel="stylesheet" media="screen">		<script			src="<%=request.getContextPath()%>/style/bootstrap/js/bootstrap.js"></script>		<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="css/ie.css" /><![endif]-->		<style type="text/css">.buttons li.food a {	background: url(<%=request.getContextPath()%>/wine_admin/images/sprite.png)		no-repeat -113px -2px;	margin: 0 -21px 0 0;	padding: 0 21px 0 0;}.buttons li.food a :hover {	color: yellow;}.buttons li.food a em {	top: 40px;}.buttons .food .ico1 span {	background-position: 0 -23px;}.buttons .food .ico2 span {	background-position: -2px -73px;}.buttons .ico3 span {	background-position: -2px -97px;}.buttons .food .ico3 span {	background-position: -2px -126px;}.buttons .ico4 span {	background-position: -2px -153px;}.buttons .food .ico4 span {	background-position: -2px -178px;}.buttons .ico5 span {	background-position: -1px -206px;}.buttons .food .ico5 span {	background-position: -2px -232px;}.buttons .ico6 span {	background-position: -2px -262px;}.buttons .food .ico6 span {	background-position: -3px -291px;}.buttons .ico7 span {	background-position: -4px -321px;}.buttons .food .ico7 span {	background-position: -4px -352px;}.buttons .ico8 span {	background-position: -4px -380px;}.buttons .food .ico8 span {	background-position: -4px -415px;}td {	line-height: 40px;}tr:hover {	background: rgb(230, 230, 230)}</style></head><body>	<div id="wrapper">		<div id="content">			<div class="c1">				<%@ include file="view_model/total_tab.jsp"%>				<div class="tabs">					<div id="tab-1" class="tab">						<article>						<div class="text-section">							<h1>風味特色</h1>							<p>目前有以下這幾種風味可以修改</p>						</div>						<ul class="states">							<!-- 								<li class="error">錯誤 : 系統錯誤，海尼根綠茶庫存沒了，請盡速補貨</li> -->							<!-- 								<li class="warning">注意: 您還有三則訂單尚未處理.</li> -->							<!-- 								<li class="succes">成功 : 你剛完成了5筆訂單.</li> -->						</ul>						<div>							<span style="font-size: 16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a								href="#">管理主頁</a> »<a								href="<%=request.getContextPath()%>/wine_admin/food.do?action=Foodsetinsert">									餐酒搭配管理</a> » 風味特色							</span>							<div style="width: 1000px; margin: 0 auto">								<br>									<table border='1' bordercolor='#CCCCFF' width='800'>										<tr>											<th>特色編號</th>											<th>特色名稱</th>											<th>修改</th>											<th>刪除</th>										</tr>										<c:forEach var="Sauce" items="${Sauce }">											<tr align='center' valign='middle'>												<td>${Sauce.s_id}</td>												<td>${Sauce.s_name}</td>												<td>													<FORM METHOD="post" style="margin: 0"														ACTION="<%=request.getContextPath()%>/wine_admin/admin_Food_Update.jsp">														<input type="submit" value="修改"															class="btn btn-primary  btn-small"> <input															type="hidden" name="s_id" value="${Sauce.s_id}">																<input type="hidden" name="Page" value="Sauce">													</FORM>												</td>												<td>													<FORM METHOD="post" style="margin: 0"														Action="<%=request.getContextPath()%>/product/saucein.do?action=saucedel">														<input type="submit" value="刪除"															class="btn btn-primary  btn-small"> <input															type="hidden" name="s_id" value="${Sauce.s_id}">																<input type="hidden" name="action" value="delete">													</FORM>												</td>											</tr>										</c:forEach>									</table>							</div>							<%@ include file="view_model/footer.jsp"%>						</div>						</article>					</div>				</div>			</div>		</div>		<%@ include file="view_model/admin_menu.jsp"%>	</div></body></html>