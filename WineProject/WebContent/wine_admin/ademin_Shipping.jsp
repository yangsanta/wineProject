<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ page import="java.util.*"%><%@ page import="shipping_set.model.*"%><%-- 此頁練習採用 EL 的寫法取值 --%><%	Shipping_setDAO dao = new Shipping_setDAO();			List<Shipping_setVO> list = dao.getAll();			pageContext.setAttribute("list", list);	%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><link rel="shortcut icon" href="favicon.ico" /><link rel="icon" href="<%=request.getContextPath()%>/favicon.ico"	type="image/x-icon" /><head><meta charset="utf-8" /><title>酒迷|後台管理系統</title><link media="all" rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/wine_admin/css/all.css" /><script src="http://code.jquery.com/jquery.js"></script><script type="text/javascript">window.jQuery|| document.write('<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.9.0.min.js"><\/script>');</script><link	href="<%=request.getContextPath()%>/style/bootstrap/css/bootstrap.min.css"	rel="stylesheet" media="screen">	<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="css/ie.css" /><![endif]-->		<style type="text/css">.buttons li.free a {	background:url(<%=request.getContextPath()%>/wine_admin/images/sprite.png) no-repeat -113px -2px;	margin:0 -21px 0 0;	padding:0 21px 0 0;}.buttons li.free a :hover{color:yellow;}.buttons li.free a em {top:40px;}.buttons .free .ico1 span {background-position:0 -23px;}.buttons .free .ico2 span {background-position:-2px -73px;}.buttons .ico3 span {background-position:-2px -97px;}.buttons .free .ico3 span {background-position:-2px -126px;}.buttons .ico4 span {background-position:-2px -153px;}.buttons .free .ico4 span {background-position:-2px -178px;}.buttons .ico5 span {background-position:-1px -206px;}.buttons .free .ico5 span {background-position:-2px -232px;}.buttons .ico6 span {background-position:-2px -262px;}.buttons .free .ico6 span {background-position:-3px -291px;}.buttons .ico7 span {background-position:-4px -321px;}.buttons .free .ico7 span {background-position:-4px -352px;}.buttons .ico8 span {background-position:-4px -380px;}.buttons .free .ico8 span {background-position:-4px -415px;}</style></head><body>	<div id="wrapper">		<div id="content">			<div class="c1">				<%@ include file="view_model/total_tab.jsp"%>				<div class="tabs">					<div id="tab-1" class="tab">						<article>						<div class="text-section">							<h1>優惠功能設定</h1>							<p>這邊是設定 [ 免運費價格 ] 跟 [ 優惠卷 ] 功能</p>						</div>						<ul class="states" style="height: 60px;">							.							<li class="error">錯誤 : 購物金額請輸入大於 0 的數字</li>							<li id="warning_info" class="warning" style="display: none">注意:								您剛剛成功的 刪除了一筆優惠券設定.</li>							<li id="succes_info" class="succes" style="display: none">成功								: 你剛更新了1筆優惠券設定.</li>						</ul>						<br>							<div style="width: 1000px; margin: 0 auto">								<!--------------------------------------------------------------->								<h1>免運費設定</h1>								<table class="table table-hover">								<thead style="color:black">									<tr>										<th style="width:335px">原免運下限</th>										<th style="width:500px">新免運下限</th>										<th>修改</th>									</tr>								</thead>								<tbody>									<c:forEach var="shipping_setVO" items="${list}">										<tr align='center' valign='middle'>										<FORM method="post"												action="<%=request.getContextPath()%>/shipping_set/.do">											<td>${shipping_setVO.min_pirce}</td>																						<td><input id="text_shippingset" type="text" name="min_pirce" value="" placeholder="新免運下限"></td>											<td><button id="btn_shippingset" class="btn btn-success" type="submit" ><i class=" icon-pencil icon-white"></i>修改</button></td>																					</tr>										</FORM>									</c:forEach>								</tbody>								</table>																<br/>																<h1>優惠券贈送設定</h1>								<table class="table table-hover">									<thead style="color:black">										<tr>											<th>購物金額達</th><th>贈送優惠券面額</th><th>刪除</th>										</tr>									</thead>									<tbody  id="csTbody">										<tr>											<td>												<input type="text" placeholder="設定已有或新的購物金額" class="new_cs_limit_price" />											</td>											<td>												設定新的優惠券面額：												<select class="new_cs_price">													<option value="50">50</option>													<option value="100">100</option>													<option value="500">500</option>													<option value="1000">1000</option>													<option value="2000">2000</option>												</select>											</td>											<td>												<a class="btn btn-success addCouponSet" href="#"><i class=" icon-pencil icon-white"></i>修改</a>											</td>										</tr>										<c:forEach var="coupon_setVO" items="${clist}">											<tr  class ="csTr" align='center' valign='middle'>												<td>${coupon_setVO.cs_limit_price}</td>												<td>${coupon_setVO.cs_price}</td>												<td>													<a class="btn btn-primary deleteCouponSet" href="${coupon_setVO.cs_limit_price}"><i class=" icon-remove icon-white"></i> 刪除</a>												</td>											</tr>										</c:forEach>																			</tbody>								</table>							</div>						</article>					</div>				</div>			</div>		</div>		<%@ include file="view_model/admin_menu.jsp"%>	</div>	<script type="text/javascript"		src="<%=request.getContextPath()%>/wine_admin/js/ademin_shippingcoupon.js"></script></body></html>