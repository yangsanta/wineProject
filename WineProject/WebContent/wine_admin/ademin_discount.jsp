<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><link rel="shortcut icon" href="favicon.ico" /><link rel="icon" href="favicon.ico" type="image/x-icon" /><head><meta charset="utf-8">	<title>酒迷|後台管理系統</title>	<link media="all" rel="stylesheet" type="text/css" href="css/all.css" />	<link rel="stylesheet"		href="<%=request.getContextPath()%>/style/advertisements/jquery-ui-1.10.2.custom.min.css" />	<link rel="stylesheet"		href="<%=request.getContextPath()%>/style/advertisements/Advertisements.css" />	<script type="text/javascript"		src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>	<script type="text/javascript">		window.jQuery				|| document						.write('<script type="text/javascript" src="js/jquery-1.7.2.min.js"><\/script>');	</script>	<script type="text/javascript" src="js/jquery.main.js"></script>	<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="css/ie.css" /><![endif]--></head><body>	<div id="wrapper">		<div id="content">			<div class="c1">				<div class="controls">					<nav class="links">					<ul>						<li><a href="#" class="ico1">訊息 <span class="num">26</span></a></li>						<li><a href="#" class="ico2">Alerts <span class="num">5</span></a></li>						<li><a href="#" class="ico3">訂單<span class="num">3</span></a></li>					</ul>					</nav>					<div class="profile-box">						<span class="profile"> <a href="#" class="section"> <img								class="image" src="images/img1.png" alt="image description"								width="26" height="26" /> <span class="text-box">									Welcome <strong class="name">楊明華</strong>							</span>						</a> <a href="#" class="opener">opener</a>						</span> <a href="#" class="btn-on">On</a>					</div>				</div>				<div class="tabs">					<div id="tab-1" class="tab">						<article>						<div class="text-section">							<h1>儀表板</h1>							<p>觀看所有的網站系統目前狀態</p>						</div>						<ul class="states">							<li class="error">錯誤 : 系統錯誤，海尼根綠茶庫存沒了，請盡速補貨</li>							<li class="warning">注意: 您還有三則訂單尚未處理.</li>							<li class="succes">成功 : 你剛完成了5筆訂單.</li>						</ul>						<div>							<div id="tabs">								<ul>									<li><a href="#tabs-1">新增廣告</a></li>									<li id="tabs-2-li"><a href="#tabs-2">修改廣告</a><form id="getAllForm" method="post"										action="<%=request.getContextPath()%>/product/adsToDb.do"><input type="hidden" name="action" value="getAll"></form></li>								</ul>								<div id="tabs-1">									<form id="searchform" method="post"										action="<%=request.getContextPath()%>/product/adsToDb.do" >										<div id="dropbox">											<c:choose>												<c:when test="${not empty fileName}">													<div class="preview" id="previewbox">														<span class="imageHolder"> <img															src="/WineProject/images/ad/${fileName}" /><span															class="uploaded"></span></span>													</div>												</c:when>												<c:otherwise>													<span class="message">請將圖片拖曳至此處 <br /> <i>(進度條跑完即上傳完成)</i></span>												</c:otherwise>											</c:choose>										</div>										<div id="divContent">											<input type="text" name="search_query" id="search_query"												placeholder=" 輸入商品編號或商品名搜尋，請點擊要設定的商品" size="40"												autocomplete="off" value="${productName}" />											<div id="errlist">												<p class="pNameErr">${AdsErrs.WrongP_no}</p>												<p class="fNameErr">${AdsErrs.EmptyFile}</p>												<p class="pNameErr">${AdsErrs.EmptyName}</p>												<p class="pNameErr">${AdsErrs.NoSuchProduct}</p>											</div>											<div id="okMsg">${AdsSuccess}</div>											<table>												<tbody id="ulResult">												</tbody>											</table>										</div>										<input type="submit" value="設定廣告" id="button" /> <input											type="text" name="fileName" id="fileName" value="${fileName}" />										<input type="text" name="productName" id="productName"											value="${productName}" />									</form>									<div id="bar"></div>								</div>								<div id="tabs-2">																	Phasellus mattis tincidunt nibh. Cras									orci urna, blandit id, pretium vel, aliquet ornare, felis.									Maecenas scelerisque sem non nisl. Fusce sed lorem in enim									dictum bibendum.																																			</div>							</div>						</div>						</article>					</div>				</div>			</div>		</div>		<aside id="sidebar"> <strong class="logo"><a href="#">lg</a></strong>		<ul class="tabset buttons">			<li class="active"><a href="#tab-1" class="ico1"><span>儀表板</span><font					class="text_con">儀表板</font><em></em></a> <span class="tooltip"><span>儀表板</span></span>			</li>			<li><a href="#tab-2" class="ico2"><span>會員管理</span><font					class="text_con">會員管理</font><em></em></a> <span class="tooltip"><span>會員管理</span></span>			</li>			<li><a href="#tab-3" class="ico3"><span>商品管理</span><font					class="text_con">商品管理</font><em></em></a> <span class="tooltip"><span>商品管理</span></span>			</li>			<li><a href="#tab-4" class="ico4"><span>優惠設定</span><font					class="text_con">優惠設定</font><em></em></a> <span class="tooltip"><span>優惠設定</span></span>			</li>			<li><a href="#tab-5" class="ico5"><span>討論區管理</span><font					class="text_con">討論區管理</font><em></em></a> <span class="tooltip"><span>討論區管理</span></span>			</li>			<li><a href="#tab-6" class="ico6"> <span>空的</span><em></em>			</a> <span class="num">常用</span> <span class="tooltip"><span>空的</span></span>			</li>			<li><a href="#tab-7" class="ico7"><span>訂單管理</span><em></em></a>				<span class="tooltip"><span>訂單管理</span></span></li>			<li><a href="#tab-8" class="ico8"><span>Settings</span><em></em></a>				<span class="tooltip"><span>Settings</span></span></li>		</ul>		<span class="shadow"></span> </aside>	</div>	<!-- 	For D&D images    -->	<!-- Including The jQuery Library -->	<script		src="<%=request.getContextPath()%>/js/advertisements/jquery-ui-1.10.2.custom.min.js"></script>	<!-- Including the HTML5 Uploader plugin -->	<script		src="<%=request.getContextPath()%>/js/advertisements/jquery.filedrop.js"></script>	<!-- The main script file -->	<script		src="<%=request.getContextPath()%>/js/advertisements/Advertisements.js"></script></body></html>