<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><link rel="shortcut icon" href="favicon.ico" /><link rel="icon" href="<%=request.getContextPath()%>/favicon.ico"	type="image/x-icon" /><head><meta charset="utf-8" /><title>酒迷|後台管理系統</title><link media="all" rel="stylesheet" type="text/css" href="css/all.css" /><script src="http://code.jquery.com/jquery.js"></script><script type="text/javascript">window.jQuery|| document.write('<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.9.0.min.js"><\/script>');</script><link href="<%=request.getContextPath()%>/style/bootstrap/css/bootstrap.min.css"	rel="stylesheet" media="screen">	<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="css/ie.css" /><![endif]-->	<style type="text/css">.buttons li.order a {	background:url(<%=request.getContextPath()%>/wine_admin/images/sprite.png) no-repeat -113px -2px;	margin:0 -21px 0 0;	padding:0 21px 0 0;}.buttons li.order a :hover{color:yellow;}.buttons li.order a em {top:40px;}.buttons .order .ico1 span {background-position:0 -23px;}.buttons .order .ico2 span {background-position:-2px -73px;}.buttons .ico3 span {background-position:-2px -97px;}.buttons .order .ico3 span {background-position:-2px -126px;}.buttons .ico4 span {background-position:-2px -153px;}.buttons .order .ico4 span {background-position:-2px -178px;}.buttons .ico5 span {background-position:-1px -206px;}.buttons .order .ico5 span {background-position:-2px -232px;}.buttons .ico6 span {background-position:-2px -262px;}.buttons .order .ico6 span {background-position:-3px -291px;}.buttons .ico7 span {background-position:-4px -321px;}.buttons .order .ico7 span {background-position:-4px -352px;}.buttons .ico8 span {background-position:-4px -380px;}.buttons .order .ico8 span {background-position:-4px -415px;}.content {position:relative; margin:2px; padding:5px; text-decoration:none;margin-left: -300px;margin-top: 35px;display: none;-webkit-border-radius: 5px;-moz-border-radius: 5px;border-radius: 5px; }tr:hover span.content{background: url(<%=request.getContextPath()%>/wine_admin/images/z3.png); display:block; position:absolute;  width:300px; padding:15px; border:1px solid #ccc; text-align:left; color:#FFF;  z-index:20;}</style></head><body>	<div id="wrapper">		<div id="content">			<div class="c1">				<%@ include file="view_model/total_tab.jsp"%>				<div class="tabs">					<div id="tab-1" class="tab">						<article>						<div class="text-section">							<h1>訂單管理</h1>							<p>目前線上的所有訂單處理情形</p>						</div>						<ul class="states" style="height: 60px;">							.							<!-- 								<li class="error">錯誤 : 系統錯誤，海尼根綠茶庫存沒了，請盡速補貨</li> -->							<li id="warning_info" class="warning" style="display: none">注意:								您剛剛成功的 刪除了一筆訂單.</li>							<li id="succes_info" class="succes" style="display: none">成功								: 你剛更新了1筆訂單.</li>						</ul>						<br>							<div style="width: 1000px; margin: 0 auto">								<input type="text" id="FilterTextBoxO_no" name="FilterTextBox" placeholder="搜尋訂單編號" />								<input type="text" id="FilterTextBoxM_no" name="FilterTextBox" placeholder="搜尋會員編號" />								<input type="text" id="FilterTextBox" name="FilterTextBox" placeholder="搜尋所有資料（以空白分隔條件）" style="float:right" />								<table class="table table-hover">									<thead style="color:black">										<tr>											<th>訂單編號</th>											<th>訂購時間</th>											<th>訂單金額</th>											<th>會員編號</th>											<th>商品名稱</th>											<th>數量</th>											<th>處理狀態</th>											<th>刪除訂單</th>										</tr>									</thead>									<tbody class="filterable1">										<c:forEach var="order" items="${theOrders}">											<tr>												<td class="filterData o_no">${order.o_no} </td>												<td class="filterData">${order.o_date} </td>												<td class="filterData">${order.o_after_sales}</td>												<td class="filterData m_no">${order.m_no} </td>												<td class="filterData"><c:forEach var="detail"														items="${order.order_details}"> ${detail.productVO.p_name} <br>													</c:forEach></td>												<td><c:forEach var="detail"														items="${order.order_details}"> ${detail.p_num} <br>													</c:forEach>													<span class='content'><b><font color='#000'>[訂單資訊]</font></b><BR>收件人:${order.o_recipient}<BR>配送地點:${order.o_recipient_addr}<BR>聯絡電話: ${order.o_recipient_tel}</span>													</td>												<td><c:if test="${order.o_status eq 'F'}">														<i class="filterData"><span style="color:red"><b>未出貨<b/></span></i><br>														<br><a href="${order.o_no}"															class="editOrders btn btn-success btn-small">改為已出貨</a>													</c:if> <c:if test="${order.o_status eq 'T'}">														<i class="filterData">已出貨</i><br>														<br><a href="${order.o_no}"															class="editOrders btn btn-small">改為未出貨</a>													</c:if></td>												<td><a href="${order.o_no}"													class="deleteOrders btn btn-primary"><i class=" icon-remove icon-white"></i>  刪除</a></td>											</tr>										</c:forEach>									</tbody>								</table>								<%@ include file="view_model/footer.jsp"%>							</div>						</article>					</div>				</div>			</div>		</div>		<%@ include file="view_model/admin_menu.jsp"%>	</div>	<script type="text/javascript"		src="<%=request.getContextPath()%>/wine_admin/js/ademin_orders.js"></script></body></html>
