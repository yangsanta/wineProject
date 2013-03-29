<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><link rel="shortcut icon" href="favicon.ico" /><link rel="icon" href="<%=request.getContextPath()%>/favicon.ico"	type="image/x-icon" /><head><meta charset="utf-8" /><title>酒迷|後台管理系統</title><link media="all" rel="stylesheet" type="text/css" href="css/all.css" /><script src="http://code.jquery.com/jquery.js"></script><script type="text/javascript">	window.jQuery			|| document					.write('<script type="text/javascript" src="js/jquery-1.7.2.min.js"><\/script>');</script><link	href="<%=request.getContextPath()%>/style/bootstrap/css/bootstrap.min.css"	rel="stylesheet" media="screen">	<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="css/ie.css" /><![endif]--></head><body>	<div id="wrapper">		<div id="content">			<div class="c1">				<%@ include file="view_model/total_tab.jsp"%>				<div class="tabs">					<div id="tab-1" class="tab">						<article>						<div class="text-section">							<h1>儀表板</h1>							<p>觀看所有的網站系統目前狀態</p>						</div>						<ul class="states" style="height: 60px;">							.							<!-- 								<li class="error">錯誤 : 系統錯誤，海尼根綠茶庫存沒了，請盡速補貨</li> -->							<li id="warning_info" class="warning" style="display: none">注意:								您剛剛成功的 刪除了一筆訂單.</li>							<li id="succes_info" class="succes" style="display: none">成功								: 你剛更新了1筆訂單.</li>						</ul>						<br>							<div style="width: 1000px; margin: 0 auto">								<input type="text" id="FilterTextBoxO_no" name="FilterTextBox" placeholder="搜尋訂單編號" />								<input type="text" id="FilterTextBoxM_no" name="FilterTextBox" placeholder="搜尋會員編號" />								<input type="text" id="FilterTextBox" name="FilterTextBox" placeholder="搜尋所有資料（以空白分隔條件）" style="float:right" />								<table class="table table-hover">									<thead style="color:black">										<tr>											<th>訂單編號</th>											<th>訂購時間</th>											<th>訂單金額</th>											<th>會員編號</th>											<th>商品名稱</th>											<th>數量</th>											<th>處理狀態</th>											<th>刪除訂單</th>										</tr>									</thead>									<tbody class="filterable1">										<c:forEach var="order" items="${theOrders}">											<tr>												<td class="filterData o_no">${order.o_no} </td>												<td class="filterData">${order.o_date} </td>												<td class="filterData">${order.o_after_sales}</td>												<td class="filterData m_no">${order.m_no} </td>												<td class="filterData"><c:forEach var="detail"														items="${order.order_details}"> ${detail.productVO.p_name} <br>													</c:forEach></td>												<td><c:forEach var="detail"														items="${order.order_details}"> ${detail.p_num} <br>													</c:forEach></td>												<td><c:if test="${order.o_status eq 'F'}">														<i class="filterData">未出貨</i><br>														<br><a href="${order.o_no}"															class="editOrders btn btn-primary">改為已出貨</a>													</c:if> <c:if test="${order.o_status eq 'T'}">														<i class="filterData">已出貨</i><br>														<br><a href="${order.o_no}"															class="editOrders btn btn-primary">改為未出貨</a>													</c:if></td>												<td><a href="${order.o_no}"													class="deleteOrders btn btn-primary">刪除</a></td>											</tr>										</c:forEach>									</tbody>								</table>								<%@ include file="view_model/footer.jsp"%>							</div>						</article>					</div>				</div>			</div>		</div>		<%@ include file="view_model/admin_menu.jsp"%>	</div>	<script type="text/javascript"		src="<%=request.getContextPath()%>/wine_admin/js/ademin_orders.js"></script>	<script type="text/javascript"		src="<%=request.getContextPath()%>/wine_admin/js/jquery.dataTables.js"></script></body></html>
