<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<head>
<meta charset="utf-8">
<title>酒迷|後台管理系統</title>
<link media="all" rel="stylesheet" type="text/css" href="css/all.css" />
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript">
	window.jQuery
			|| document
					.write('<script type="text/javascript" src="js/jquery-1.7.2.min.js"><\/script>');
</script>
<script type="text/javascript" src="js/jquery.main.js"></script>
<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="css/ie.css" /><![endif]-->
<style type="text/css">
.table{-webkit-border-radius: 5px;
-moz-border-radius: 5px;
border-radius: 5px;
 border-bottom-left-radius: 3px;
  border: 1px solid rgb(223, 223, 223);
 background-color: rgb(249, 249, 249);
 border-collapse: collapse;
border-right: 1px solid fff;
border-left: 1px solid fff;
width:100%;}
 .table_head{

 background: #f1f1f1;
background-image: -webkit-gradient(linear,left bottom,left top,from(#ececec),to(#f9f9f9));
background-image: -webkit-linear-gradient(bottom,#ececec,#f9f9f9);}
 .table_head_td{line-height: 30px;font-size: 14px;color:#555;text-shadow: rgba(255,255,255,0.8) 0 1px 0;padding-left:10px
}
 
.tr{  border-top: 1px solid #fff;;
    border-bottom: 1px solid #dfdfdf;line-height: 1.6em;}
.td{ 	
	padding: 4px 7px 2px;color:#555;
	}
.table_a{color: #21759b;}
.table_a:hover{color: #d54e21;;}
</style>
</head>
<body>
	<div id="wrapper">
		<div id="content">
			<div class="c1">
				<div class="controls">
					<nav class="links">
					<ul>
						<li><a href="#" class="ico1">訊息 <span class="num">26</span></a></li>
						<li><a href="#" class="ico2">Alerts <span class="num">5</span></a></li>
						<li><a href="#" class="ico3">訂單<span class="num">3</span></a></li>
					</ul>
					</nav>
					<div class="profile-box">
						<span class="profile"> <a href="#" class="section"> <img
								class="image" src="images/img1.png" alt="image description"
								width="26" height="26" /> <span class="text-box">
									Welcome <strong class="name">楊明華</strong>
							</span>
						</a> <a href="#" class="opener">opener</a>
						</span> <a href="#" class="btn-on">On</a>
					</div>
				</div>
				<div class="tabs">
					<div id="tab-1" class="tab">
						<article>
						<div class="text-section">
							<h1>儀表板</h1>
							<p>觀看所有的網站系統目前狀態</p>
						</div>
<!-- 						<ul class="states"> -->
<!-- 							<li class="error">錯誤 : 系統錯誤，海尼根綠茶庫存沒了，請盡速補貨</li> -->
<!-- 							<li class="warning">注意: 您還有三則訂單尚未處理.</li> -->
<!-- 							<li class="succes">成功 : 你剛完成了5筆訂單.</li> -->
<!-- 						</ul> -->
						<div style="width:80%;margin:0 auto">
</BR>
									<h1>	Last agents</h1>
							<table class="table">

								<tr class="table_head">
									<td class="table_head_td">Agent</td>
									<td class="table_head_td" width="130px">OS</td>
									<td class="table_head_td" width="150px">Browser</td>
								</tr>


								<c:forEach var="product" items="${list}">
									<tr class="tr">
										<td class="td">${product.userAgent}</td>
										<td class="td">
										<c:if test="${fn:contains(product.user_os, 'Windows7')}"><img src="images/os/windows_7.png" width="16px"/></c:if>
										<c:if test="${fn:contains(product.user_os, 'WindowsXP')}"><img src="images/os/windows.png" width="16px"/></c:if>
										<c:if test="${fn:contains(product.user_os, 'mac')}"><img src="images/os/mac.png" width="16px"/></c:if>
										<c:if test="${fn:contains(product.user_os, 'Safari')}"><img src="images/os/Safari.png" width="16px"/></c:if>
										<c:if test="${fn:contains(product.user_os, 'Android')}"><img src="images/os/android.jpg" width="16px"/></c:if>	
										<c:if test="${fn:contains(product.user_os, 'iPad')}"><img src="images/os/ipad.jpg" width="16px"/></c:if>	
										<c:if test="${fn:contains(product.user_os, 'iPhone')}"><img src="images/os/iphone.png" width="16px"/></c:if>	
																				
										${product.user_os}</td>
										<td class="td">
										<c:if test="${fn:contains(product.user_browser, 'Internet Explorer 9')}"><img src="images/browsers/internetexplorer6.png" width="16px"/></c:if>
										<c:if test="${fn:contains(product.user_browser, 'Internet Explorer 8')}"><img src="images/browsers/internetexplorer8.png" width="16px"/></c:if>
										<c:if test="${fn:contains(product.user_browser, 'Internet Explorer 7')}"><img src="images/browsers/internetexplorer7.png" width="16px"/></c:if>
										<c:if test="${fn:contains(product.user_browser, 'Internet Explorer 6')}"><img src="images/browsers/internetexplorer6.png" width="16px"/></c:if>
										<c:if test="${fn:contains(product.user_browser, 'Chrome')}"><img src="images/browsers/chrome.png" width="16px"/></c:if>
										<c:if test="${fn:contains(product.user_browser, 'Firefox')}"><img src="images/browsers/firefox3.png" width="16px"/></c:if>
										<c:if test="${fn:contains(product.user_browser, 'Safari')}"><img src="images/browsers/safari.png" width="16px"/></c:if>
										<c:if test="${fn:contains(product.user_browser, 'mozilla')}"><img src="images/browsers/mozilla.png" width="16px"/></c:if>
										<c:if test="${fn:contains(product.user_browser, 'netscape')}"><img src="images/browsers/netscape.png" width="16px"/></c:if>
										<c:if test="${fn:contains(product.user_browser, 'opera')}"><img src="images/browsers/opera.png" width="16px"/></c:if>										
										${product.user_browser}</td>
									</tr>
								</c:forEach>
							</table>
</BR></BR>
							<h1>站外來源 lastReferer</h1>
							<table class="table">
							<tr class="table_head">
									<td class="table_head_td"width="130px">日期</td>
									<td class="table_head_td"width="130px">時間</td>
									<td class="table_head_td">來源位址</td>
									<td class="table_head_td"width="130px">IP</td>
								</tr>


								<c:forEach var="lastReferer" items="${lastReferer}">
									<tr class="tr">
										<td class="td"><fmt:formatDate value="${lastReferer.viewedate}"
												pattern="yyyy/MM/dd" /></td>
										<td class="td"><fmt:formatDate value="${lastReferer.viewedate}"
												pattern="HH:mm:ss" /></td>
										<td class="td"><a class="table_a" href="${lastReferer.lastReferer}">${lastReferer.lastReferer}</a></td>
										<td class="td">${lastReferer.remoteAddr}</td>
									</tr>
								</c:forEach>
							</table>

<br/><br/><br/><br/>
<div class="footer"><hr>酒迷創意行銷股份有限公司</div><br/><br/>

						</div>






						</article>
					</div>

				</div>
			</div>
		</div>
		<aside id="sidebar"> <strong class="logo"><a href="#">lg</a></strong>
		<ul class="tabset buttons">
			<li class="active"><a href="#tab-1" class="ico1"><span>儀表板</span><font
					class="text_con">儀表板</font><em></em></a> <span class="tooltip"><span>儀表板</span></span>
			</li>
			<li><a href="#tab-2" class="ico2"><span>會員管理</span><font
					class="text_con">會員管理</font><em></em></a> <span class="tooltip"><span>會員管理</span></span>
			</li>
			<li><a href="#tab-3" class="ico3"><span>商品管理</span><font
					class="text_con">商品管理</font><em></em></a> <span class="tooltip"><span>商品管理</span></span>
			</li>
			<li><a href="#tab-4" class="ico4"><span>優惠設定</span><font
					class="text_con">優惠設定</font><em></em></a> <span class="tooltip"><span>優惠設定</span></span>
			</li>
			<li><a href="#tab-5" class="ico5"><span>討論區管理</span><font
					class="text_con">討論區管理</font><em></em></a> <span class="tooltip"><span>討論區管理</span></span>
			</li>
			<li><a href="#tab-6" class="ico6"> <span>空的</span><em></em>
			</a> <span class="num">常用</span> <span class="tooltip"><span>空的</span></span>
			</li>
			<li><a href="#tab-7" class="ico7"><span>訂單管理</span><em></em></a>
				<span class="tooltip"><span>訂單管理</span></span></li>
			<li><a href="#tab-8" class="ico8"><span>Settings</span><em></em></a>
				<span class="tooltip"><span>Settings</span></span></li>
		</ul>
		<span class="shadow"></span> </aside>
	</div>
</body>
</html>