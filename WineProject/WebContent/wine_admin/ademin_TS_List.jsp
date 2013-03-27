<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><link rel="shortcut icon" href="<%=request.getContextPath()%>/favicon.ico" /><link rel="icon" href="<%=request.getContextPath()%>/favicon.ico" type="image/x-icon" /><head><meta charset="utf-8">	<title>酒迷|後台管理系統</title>	<link media="all" rel="stylesheet" type="text/css"		href="<%=request.getContextPath()%>/wine_admin/css/all.css" />		 <c:if test="${sessionScope.admin_access!='y'}"><meta http-equiv="refresh" content="0; url=index.jsp"></c:if>	<script src="http://code.jquery.com/jquery.js"></script>	<script type="text/javascript">		window.jQuery|| document.write('<script type="text/javascript" src="js/jquery-1.7.2.min.js"><\/script>');	</script>		<link type="text/css"		href="<%=request.getContextPath()%>/style/jquery.datepick.css"	rel="stylesheet">		<script type="text/javascript"			src="<%=request.getContextPath()%>/js/jquery.datepick.js"></script>	<link href="<%=request.getContextPath()%>/style/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">		<script src="http://code.jquery.com/jquery.js"></script>		<script src="<%=request.getContextPath()%>/style/bootstrap/js/bootstrap.js"></script>		<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="css/ie.css" /><![endif]-->			<script type="text/javascript" charset="utf-8">	   		$('#ts_date').datepick({dateFormat: 'yyyy-mm-dd'});		$('#inlineDatepicker').datepick({onSelect: showDate});	function showDate(date) {		alert('The date chosen is ' + date);	}			</script><style type="text/css">.datepick-month-year{width:100px}</style></head><body>	<div id="wrapper">		<div id="content">			<div class="c1">		<%@ include file="view_model/total_tab.jsp"%>				<div class="tabs">					<div id="tab-1" class="tab">						<div class="text-section">							<h1>首頁限時特賣商品</h1>							<p>這邊可以修改 首頁的限時特價商品</p>						</div>						<div style="width: 80%; margin: 0 auto">	<div align="right">	<a href="<%=request.getContextPath()%>/wine_admin/ademin_TS_insert.jsp"><input type="button" class="btn btn-primary" value="新增限時特惠"/></a></div><div class="pagination">	<ul>		<c:if test="${rowsPerPage<rowNumber}">			<c:if test="${pageIndex>=rowsPerPage}">				<li class=""><a href="${url}?action=${action}&whichPage=1">						&laquo; </a></li>				<li class=""><a					href="${url}?action=${action}&whichPage=${whichPage-1}">上一頁</a></li>			</c:if>		</c:if>		<c:if test="${pageNumber > 1}">			<c:forEach var="i" begin="1" end="${pageNumber}">				<li class=""><a href="${url}?action=${action}&whichPage=${i}">${i}</a></li>			</c:forEach>		</c:if>		<c:if test="${rowsPerPage<rowNumber}">			<c:if test="${pageIndex<pageIndexArray[pageNumber-1]}">				<li class=""><a					href="${url}?action=${action}&whichPage=${whichPage+1}">下一頁</a></li>				<li class=""><a					href="${url}?action=${action}&whichPage=${pageNumber}">»</a></li>			</c:if>		</c:if>	</ul></div><!-- 搜尋功能條						 -->						<div align="right">							<p style="color:red;font-size:12pt">${msgbox}</p>							<form action="set_timing_sales" method="post" class="form-search">								依日期搜尋：<input type="text" name="txtsrch" class="input-medium search-query" id="ts_date"/>								<input type="submit" value="search" class="btn btn-primary"/>								<input type="hidden" name="action" value="search"/>							</form>							<span style="color:red;size:14px">${ErrMsg.errSearch}</span>						</div><!-- --------------- --><table class="table table-hover">	<thead>		<tr>			<th>限惠商品</th>			<th>限惠價格</th>			<th>限惠日期</th>			<th>商品圖片</th>			<th>修改</th>			<th>刪除</th>		</tr>	</thead><%-- 	<jsp:useBean id="timing_sales" class="timing_sales.model.Timing_SalesDAO"> --%><%-- 		<c:forEach items="${timing_sales.all}" var="ts"> --%>			<c:forEach var="ts" items="${list}" begin="${pageIndex}" end="${pageIndex+rowsPerPage-1}">			<tbody>				<tr>					<td>						<a href="<%=request.getContextPath()%>/wine_admin/set_timing_sales?action=getOne&ts_id=${ts.ts_id}">${ts.productVO.p_name}</a>					</td>					<td>${ts.ts_price}</td>					<td>${ts.ts_date}</td>					<td><img src="<%=request.getContextPath()%>/images/timingSales/${ts.ts_pic}" style="width:200px" /></td>					<td>						<form action="<%=request.getContextPath()%>/wine_admin/set_timing_sales" method="post">							<input type="submit" value="修改" class="btn btn-success"/>							<input type="hidden" name="ts_id" value="${ts.ts_id}" />							<input type="hidden" name="action" value="edit" />						</form>					</td>					<td>						<form action="<%=request.getContextPath()%>/wine_admin/set_timing_sales" method="post">							<input type="submit" value="刪除" class="btn btn-success"/>							<input type="hidden" name="ts_id" value="${ts.ts_id}" />							<input type="hidden" name="action" value="delete" />						</form>					</td>				</tr>			</tbody>		</c:forEach><%-- 	</jsp:useBean> --%></table>											<%@ include file="view_model/footer.jsp"%>						</div>						</article>					</div>				</div>			</div>		</div><%@ include file="view_model/admin_menu.jsp"%>	</div></body></html>