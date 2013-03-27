<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><link rel="shortcut icon" href="<%=request.getContextPath()%>/favicon.ico" /><link rel="icon" href="<%=request.getContextPath()%>/favicon.ico" type="image/x-icon" /><head><meta charset="utf-8">	<title>酒迷|後台管理系統</title>	<link media="all" rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/wine_admin/css/all.css" />	<script src="http://code.jquery.com/jquery.js"></script>	<script type="text/javascript">		window.jQuery|| document.write('<script type="text/javascript" src="js/jquery-1.7.2.min.js"><\/script>');	</script>	<link href="<%=request.getContextPath()%>/style/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">		<script src="<%=request.getContextPath()%>/style/bootstrap/js/bootstrap.js"></script>		<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="css/ie.css" /><![endif]--></head><body>	<div id="wrapper">		<div id="content">			<div class="c1">				<%@ include file="view_model/total_tab.jsp"%>				<div class="tabs">					<div id="tab-1" class="tab">						<article>							<div class="text-section">								<h1>儀表板</h1>								<p>觀看所有的網站系統目前狀態</p>							</div>							<ul class="states">								<li class="error">錯誤 : 系統錯誤，海尼根綠茶庫存沒了，請盡速補貨</li>								<li class="warning">注意: 您還有三則訂單尚未處理.</li>								<li class="succes">成功 : 你剛完成了5筆訂單.</li>							</ul>							<div>														<h1>執行成功</h1><a href="<%=request.getContextPath()%>/wine_admin/ademin_Fs_index.jsp">回原畫面</a>							<%@ include file="view_model/footer.jsp"%>							</div>																																																</article>					</div>									</div>			</div>		</div>		<%@ include file="view_model/admin_menu.jsp"%>	</div></body></html>