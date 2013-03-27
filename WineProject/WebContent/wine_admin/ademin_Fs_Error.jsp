<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><link rel="shortcut icon" href="favicon.ico" /><link rel="icon" href="favicon.ico" type="image/x-icon" /><head><meta charset="utf-8">	<title>酒迷|後台管理系統</title>	<link media="all" rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/wine_admin/css/all.css" />	<script type="text/javascript"		src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>	<script type="text/javascript">		window.jQuery				|| document						.write('<script type="text/javascript" src="js/jquery-1.7.2.min.js"><\/script>');	</script>	<script type="text/javascript" src="js/jquery.main.js"></script>	<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="css/ie.css" /><![endif]--></head><body>	<div id="wrapper">		<div id="content">			<div class="c1">				<div class="controls">					<nav class="links">					<ul>						<li><a href="#" class="ico1">訊息 <span class="num">26</span></a></li>						<li><a href="#" class="ico2">Alerts <span class="num">5</span></a></li>						<li><a href="#" class="ico3">訂單<span class="num">3</span></a></li>					</ul>					</nav>					<div class="profile-box">						<span class="profile"> <a href="#" class="section"> <img								class="image" src="images/img1.png" alt="image description"								width="26" height="26" /> <span class="text-box">									Welcome <strong class="name">楊明華</strong>							</span>						</a> <a href="#" class="opener">opener</a>						</span> <a href="#" class="btn-on">On</a>					</div>				</div>				<div class="tabs">					<div id="tab-1" class="tab">						<article>						<div class="text-section">							<h1>儀表板</h1>							<p>觀看所有的網站系統目前狀態</p>						</div>						<ul class="states">							<li class="error">錯誤 : 系統錯誤，海尼根綠茶庫存沒了，請盡速補貨</li>							<li class="warning">注意: 您還有三則訂單尚未處理.</li>							<li class="succes">成功 : 你剛完成了5筆訂單.</li>						</ul>						<div>							<H1>執行失敗</h1>							<Font color='red'>檢查您的輸入資料時，發現含有下列錯誤，請更正後重新提交</font>							<c:forEach var="e" items="${ErrorMsgKey}">								<li>${ e }</li>							</c:forEach>							<br>								<p /> <small>&lt;&lt;<a									href="../wine_admin/ademin_Fs_index.jsp">回輸入畫面</a>&gt;&gt;							</small>						</div>						</article>					</div>				</div>			</div>		</div>		<aside id="sidebar"> <strong class="logo"><a href="#">lg</a></strong>		<ul class="tabset buttons">			<li class="active"><a href="#tab-1" class="ico1"><span>儀表板</span><font					class="text_con">儀表板</font><em></em></a> <span class="tooltip"><span>儀表板</span></span>			</li>			<li><a href="#tab-2" class="ico2"><span>會員管理</span><font					class="text_con">會員管理</font><em></em></a> <span class="tooltip"><span>會員管理</span></span>			</li>			<li><a href="#tab-3" class="ico3"><span>商品管理</span><font					class="text_con">商品管理</font><em></em></a> <span class="tooltip"><span>商品管理</span></span>			</li>			<li><a href="#tab-4" class="ico4"><span>優惠設定</span><font					class="text_con">優惠設定</font><em></em></a> <span class="tooltip"><span>優惠設定</span></span>			</li>			<li><a href="#tab-5" class="ico5"><span>討論區管理</span><font					class="text_con">討論區管理</font><em></em></a> <span class="tooltip"><span>討論區管理</span></span>			</li>			<li><a href="#tab-6" class="ico6"> <span>空的</span><em></em>			</a> <span class="num">常用</span> <span class="tooltip"><span>空的</span></span>			</li>			<li><a href="#tab-7" class="ico7"><span>訂單管理</span><em></em></a>				<span class="tooltip"><span>訂單管理</span></span></li>			<li><a href="#tab-8" class="ico8"><span>Settings</span><em></em></a>				<span class="tooltip"><span>Settings</span></span></li>		</ul>		<span class="shadow"></span> </aside>	</div></body></html>