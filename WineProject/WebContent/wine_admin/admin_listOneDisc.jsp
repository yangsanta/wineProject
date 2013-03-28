<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><link rel="shortcut icon" href="favicon.ico" /><link rel="icon" href="favicon.ico" type="image/x-icon" /><head>	<meta charset="utf-8">	<title>酒迷|後台管理系統</title>	<link media="all" rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/wine_admin/css/all.css" />	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>	<script type="text/javascript">window.jQuery || document.write('<script type="text/javascript" src="js/jquery-1.7.2.min.js"><\/script>');</script>	<script type="text/javascript" src="<%=request.getContextPath()%>/wine_admin/js/jquery.main.js"></script>			<link href="<%=request.getContextPath()%>/style/reset.css"			rel="stylesheet" type="text/css" />		<link			href="<%=request.getContextPath()%>/style/bootstrap/css/bootstrap.min.css"			rel="stylesheet" media="screen">			<script				src="<%=request.getContextPath()%>/style/bootstrap/js/bootstrap.js"></script><style type="text/css">	.buttons li.discussion a {	background:url(<%=request.getContextPath()%>/wine_admin/images/sprite.png) no-repeat -113px -2px;	margin:0 -21px 0 0;	padding:0 21px 0 0;}.buttons li.discussion a :hover{color:yellow;}.buttons li.discussion a em {top:40px;}.buttons .discussion .ico1 span {background-position:0 -23px;}.buttons .discussion .ico2 span {background-position:-2px -73px;}.buttons .ico3 span {background-position:-2px -97px;}.buttons .discussion .ico3 span {background-position:-2px -126px;}.buttons .ico4 span {background-position:-2px -153px;}.buttons .discussion .ico4 span {background-position:-2px -178px;}.buttons .ico5 span {background-position:-1px -206px;}.buttons .discussion .ico5 span {background-position:-2px -232px;}.buttons .ico6 span {background-position:-2px -262px;}.buttons .discussion .ico6 span {background-position:-3px -291px;}.buttons .ico7 span {background-position:-4px -321px;}.buttons .discussion .ico7 span {background-position:-4px -352px;}.buttons .ico8 span {background-position:-4px -380px;}.buttons .discussion .ico8 span {background-position:-4px -415px;}table {	border-top: 1px solid #ccc;	color: #333}thead {	background-color: rgba(114, 113, 113, 0.47);	text-align: center;	font-size: 12px;}td {	border-bottom: 1px solid #ccc;	padding: 5px;}.dis_table {	border-color: rgb(209, 202, 202);	border-width: 1px;	border-style: solid;	width: 100%}.table_member {	width: 200px;	background: #E8F3FD;}.img_type {	Width: 40px;	text-align: center;}.tdcenter {	text-align: center;}.table_time {	Width: 120px;	font-size: 14px;}.table_title {	font-weight: bold;}</style>	<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="css/ie.css" /><![endif]--></head><body>	<div id="wrapper">		<div id="content">			<div class="c1">			<%@ include file="view_model/total_tab.jsp"%>				<div class="tabs">					<div id="tab-1" class="tab">						<article>							<div class="text-section">								<h1>討論區管理 </h1>								<p>管理文章內容</p>							</div><!-- 							<ul class="states"> --><!-- 								<li class="error">錯誤 : 系統錯誤，海尼根綠茶庫存沒了，請盡速補貨</li> --><!-- 								<li class="warning">注意: 您還有三則訂單尚未處理.</li> --><!-- 								<li class="succes">成功 : 你剛完成了5筆訂單.</li> --><!-- 							</ul> --><div style="margin:0 auto;width:1000px"><br/><div><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">管理主頁</a> »<a href="<%=request.getContextPath()%>/wine_admin/DiscussionManagment?action=getAll"> 討論區管理</a> » 文章內容</span>	<!-- 搜尋功能條						 -->	<div align="right">		<p style="color: red; font-size: 12pt">${msgbox}</p>		<form action="DiscussionManagment" method="post"			class="form-search">			<input type="text" name="txtsrch" class="input-medium search-query" />			<select name="srchThing" style="width: 100px">				<option value="d_title">主題</option>				<option value="d_context">文章內容</option>				<option value="m_id">會員帳號</option>			</select> <input type="submit" value="search" class="btn btn-primary" /> <input				type="hidden" name="action" value="search" />		</form>	</div></div>	<!-- --------------- -->	<div align="right">		<FORM METHOD="post"	ACTION="<%=request.getContextPath()%>/wine_admin/DiscussionManagment">			<input type="submit" value="修改此文章" class="btn btn-success"> 			<input type="hidden" name="d_no" value="${discussionVO.d_no}">			<input type="hidden" name="action" value="edit">		</FORM>	</div>	<table border="1" cellspacing="1" class="table table-condensed">		<tr class="info">			<td colspan="2">主題:${discussionVO.d_title}</td>		</tr>		<tr class="success">			<td class="table_member">				<div>					作者帳號:${discussionVO.memberVO.m_id}<br> <img						src="http://placekitten.com/100/100"						style="background: #ededed; padding: 5px;"><br>UID:1438832					<br>註冊時間:2006-3-18				</div>			</td>			<td style="background: #fff"><span style="font-size: 10px">發表日期:<fmt:formatDate						value="${discussionVO.d_datetime}" pattern="yyyy/MM/dd HH:mm:ss" /></span>				<hr style="margin: 0">				<div style="padding: 10px">${discussionVO.d_context}</div></td>		</tr>	</table>	<!-- 回文內容 -->	<c:if test="${fn:length(discussionVO.replies)!=0}">	<c:forEach var="i" begin="0"		end="${fn:length(discussionVO.replies) - 1}">		<table border="1" class="dis_table" cellspacing="1"			style="margin-top: 20px">			<tr>				<td class="table_member"><div class="defalut">						${discussionVO.replies[i].memberVO.m_id}<br> <img							src="http://placekitten.com/100/100"							style="background: #ededed; padding: 5px;"><br> 初入社會<br>						UID:1438832 <br> 帖子:9 <br> 精華:0 <br> 積分:4 <br>						遊樂幣:0 代幣 <br> 閱讀權限:10 <br> 註冊時間:2006-3-18					</div></td>				<td style="background: #fff"><span style="font-size: 10px">發表日期:<fmt:formatDate							value="${discussionVO.replies[i].r_datetime}"							pattern="yyyy/MM/dd HH:mm:ss" /></span>					<hr style="margin: 0">					<div style="padding: 10px">${discussionVO.replies[i].r_context}</div></td>	<div align="right">		<FORM METHOD="post"	ACTION="ReplyManagment">			<input type="submit" value="<c:if test="${discussionVO.replies[i].r_status=='ooo'}">隱藏下列之回文</c:if> <c:if test="${discussionVO.replies[i].r_status=='xxx'}">顯示下列之回文</c:if>" class="<c:if test="${discussionVO.replies[i].r_status=='ooo'}">btn btn-primary</c:if><c:if test="${discussionVO.replies[i].r_status=='xxx'}">btn btn-success</c:if>"/>			<input type="hidden" value="${discussionVO.replies[i].r_no}" name="r_no"/>			<input type="hidden" name="action" value="invisible"/>		</FORM><!-- 		<form action="DiscussionManagment" method="post"> --><!-- 					<input type="submit" value="刪除此回文"/> --><%-- 					<input type="hidden" name="${discussionVO.replies[i].r_no}" value="r_no"/> --%><!-- 					<input type="hidden" name="action" value="delete"/> --><!-- 		</form> -->	</div>				</tr>		</table>	</c:forEach>	</c:if><%@ include file="view_model/footer.jsp"%>													</div>							</article>					</div>									</div>			</div>		</div><%@ include file="view_model/admin_menu.jsp"%>	</div></body></html>