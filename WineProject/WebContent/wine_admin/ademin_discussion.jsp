<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><link rel="shortcut icon" href="favicon.ico" /><link rel="icon" href="favicon.ico" type="image/x-icon" /><head>	<meta charset="utf-8">	<title>酒迷|後台管理系統</title>	<link media="all" rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/wine_admin/css/all.css" />	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>	<script type="text/javascript">window.jQuery || document.write('<script type="text/javascript" src="js/jquery-1.7.2.min.js"><\/script>');</script>	<script type="text/javascript" src="<%=request.getContextPath()%>/wine_admin/js/jquery.main.js"></script>			<link href="<%=request.getContextPath()%>/style/reset.css"			rel="stylesheet" type="text/css" />		<link			href="<%=request.getContextPath()%>/style/bootstrap/css/bootstrap.min.css"			rel="stylesheet" media="screen">			<script				src="<%=request.getContextPath()%>/style/bootstrap/js/bootstrap.js"></script><style type="text/css">table {	border-top: 1px solid #ccc;	color: #333}thead {	background-color: rgba(148, 178, 231, 0.47);	text-align: center;	font-size: 12px;}thead tr:hover {	background-color: rgba(225, 225, 225, 0.47);}td {	border-bottom: 1px solid #ccc;	padding: 5px;}tr:hover {	background-color: #ddd;	border-bottom: 1px solid #000;}.img_type {	Width: 40px;	text-align: center;}.tdcenter {	text-align: center;}.table_time {	Width: 120px;	font-size: 14px;}.table_title {	font-weight: bold;}</style>	<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="css/ie.css" /><![endif]--></head><body>	<div id="wrapper">		<div id="content">			<div class="c1">				<div class="controls">					<nav class="links">						<ul>							<li><a href="#" class="ico1">訊息 <span class="num">26</span></a></li>							<li><a href="#" class="ico2">Alerts <span class="num">5</span></a></li>							<li><a href="#" class="ico3">訂單<span class="num">3</span></a></li>						</ul>					</nav>					<div class="profile-box">						<span class="profile">							<a href="#" class="section">								<img class="image" src="<%=request.getContextPath()%>/wine_admin/images/img1.png" alt="image description" width="26" height="26" />								<span class="text-box">									Welcome									<strong class="name">楊明華</strong>								</span>							</a>							<a href="#" class="opener">opener</a>						</span>						<a href="#" class="btn-on">On</a>					</div>				</div>				<div class="tabs">					<div id="tab-1" class="tab">						<article><!-- 							<div class="text-section"> --><!-- 								<h1>儀表板</h1> --><!-- 								<p>觀看所有的網站系統目前狀態</p> --><!-- 							</div> --><!-- 							<ul class="states"> --><!-- 								<li class="error">錯誤 : 系統錯誤，海尼根綠茶庫存沒了，請盡速補貨</li> --><!-- 								<li class="warning">注意: 您還有三則訂單尚未處理.</li> --><!-- 								<li class="succes">成功 : 你剛完成了5筆訂單.</li> --><!-- 							</ul> --><div>							<!--！！！！！！！！！！！！！！！！！！！！大家的後台放這邊!!!!!!!!!! --><br/><div><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">管理主頁</a> » 討論區管理</span>							<!-- 搜尋功能條						 -->						<div align="right">							<p style="color:red;font-size:12pt">${msgbox}</p>							<form action="DiscussionManagment" method="post" class="form-search">								<input type="text" name="txtsrch" class="input-medium search-query"/>								<select name="srchThing" style="width:100px">									<option value="d_title">主題</option>									<option value="d_context">文章內容</option>									<option value="m_id">會員帳號</option>								</select>								<input type="submit" value="search" class="btn btn-primary"/>								<input type="hidden" name="action" value="search"/>							</form>						</div></div><!-- --------------- --><div>	<table class="table table-condensed">		<thead>			<tr>				<th>類型</th>				<th width="600px">主題</th>				<th>作者</th>				<th>回復數</th>				<th>發表時間</th>				<th>修改</th>				<th>隱藏</th>			</tr>		</thead>		<c:forEach var="discussionVO" items="${list}" begin="${pageIndex}"			end="${pageIndex+rowsPerPage-1}">			<tr>				<td class="img_type"><img src="images/discussion_paper.gif"/></td>				<td class="table_title"><a					href="<%=request.getContextPath()%>/DiscussionManagment?d_no=${discussionVO.d_no}&action=getOne">${discussionVO.d_title}</a></td>				<td class="tdcenter">${discussionVO.memberVO.m_id}</td>				<td class="tdcenter">${fn:length(discussionVO.replies)}</td>				<td class="table_time"><fmt:formatDate						value="${discussionVO.d_datetime}" pattern="yyyy/MM/dd HH:mm:ss" /></td>				<td>					 <form method="post" action="<%=request.getContextPath()%>/DiscussionManagment">			    	 <input type="submit" value="修改" class="btn btn-success"/>			     	 <input type="hidden" name="d_no" value="${discussionVO.d_no}"/>			     	 <input type="hidden" name="action"	value="edit"/></form>				</td>				<td>					<form method="post" action="<%=request.getContextPath()%>/DiscussionManagment">			    	  <input type="submit" value='<c:if test="${discussionVO.d_status=='ooo'}">隱藏文章</c:if><c:if test="${discussionVO.d_status=='xxx'}">顯示文章</c:if>' class='<c:if test="${discussionVO.d_status=='xxx'}">btn btn-success</c:if><c:if test="${discussionVO.d_status=='ooo'}">btn btn-primary</c:if>' />			     	 <input type="hidden" name="d_no" value="${discussionVO.d_no}"/>			     	 <input type="hidden" name="action"	value="invisible"/></form>				</td>			</tr>		</c:forEach>	</table><div class="pagination pagination-centered">	<ul>		<c:if test="${rowsPerPage<rowNumber}">			<c:if test="${pageIndex>=rowsPerPage}">				<li class=""><a href="${url}?action=${action}&whichPage=1">						&laquo; </a></li>				<li class=""><a					href="${url}?action=${action}&whichPage=${whichPage-1}">上一頁</a></li>			</c:if>		</c:if>		<c:if test="${pageNumber > 1}">			<c:forEach var="i" begin="1" end="${pageNumber}">				<li class=""><a href="${url}?action=${action}&whichPage=${i}">${i}</a></li>			</c:forEach>		</c:if>		<c:if test="${rowsPerPage<rowNumber}">			<c:if test="${pageIndex<pageIndexArray[pageNumber-1]}">				<li class=""><a					href="${url}?action=${action}&whichPage=${whichPage+1}">下一頁</a></li>				<li class=""><a					href="${url}?action=${action}&whichPage=${pageNumber}">»</a></li>			</c:if>		</c:if>	</ul></div></div><!--！！！！！！！！！！！！！！！！！！！！大家的後台放這邊!!!!!!!!!! -->														</div>							</article>					</div>									</div>			</div>		</div>		<aside id="sidebar">			<strong class="logo"><a href="#">lg</a></strong>			<ul class="tabset buttons">				<li class="active">					<a href="#tab-1" class="ico1"><span>儀表板</span><font class="text_con">儀表板</font><em></em></a>					<span class="tooltip"><span>儀表板</span></span>				</li>				<li>					<a href="#tab-2" class="ico2"><span>會員管理</span><font class="text_con">會員管理</font><em></em></a>					<span class="tooltip"><span>會員管理</span></span>				</li>				<li>					<a href="#tab-3" class="ico3"><span>商品管理</span><font class="text_con">商品管理</font><em></em></a>					<span class="tooltip"><span>商品管理</span></span>				</li>				<li>					<a href="#tab-4" class="ico4"><span>優惠設定</span><font class="text_con">優惠設定</font><em></em></a>					<span class="tooltip"><span>優惠設定</span></span>				</li>				<li>					<a href="#tab-5" class="ico5"><span>討論區管理</span><font class="text_con">討論區管理</font><em></em></a>					<span class="tooltip"><span>討論區管理</span></span>				</li>				<li>					<a href="#tab-6" class="ico6">						<span>空的</span><em></em>					</a>					<span class="num">常用</span>					<span class="tooltip"><span>空的</span></span>				</li>				<li>					<a href="#tab-7" class="ico7"><span>訂單管理</span><em></em></a>					<span class="tooltip"><span>訂單管理</span></span>				</li>				<li>					<a href="#tab-8" class="ico8"><span>Settings</span><em></em></a>					<span class="tooltip"><span>Settings</span></span>				</li>			</ul>			<span class="shadow"></span>		</aside>	</div></body></html>