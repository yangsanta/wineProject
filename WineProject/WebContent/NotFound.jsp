<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="<%=request.getContextPath()%>/favicon.ico"
	type="image/x-icon" />
<html>
<head>
<meta http-equiv="Content-Language" content="zh-tw">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>迷酒 | 疑 酒迷勒?</title>
		<meta content="酒迷 | 歷久彌新的香濃口感。" name="description" />
		<meta content="酒迷 | 歷久彌新的香濃口感" name="keywords" />
		<link href="<%=request.getContextPath()%>/style/reset.css"
			rel="stylesheet" type="text/css" />
		<link
			href="<%=request.getContextPath()%>/style/bootstrap/css/bootstrap.min.css"
			rel="stylesheet" media="screen">
			<script src="http://code.jquery.com/jquery.js"></script>
			<script
				src="<%=request.getContextPath()%>/style/bootstrap/js/bootstrap.js"></script>
			<script type="text/javascript"
				src="<%=request.getContextPath()%>/js/jquery.fancybox.js?v=2.1.4"></script>
			<link rel="stylesheet" type="text/css"
				href="<%=request.getContextPath()%>/style/jquery.fancybox.css?v=2.1.4"
				media="screen" />
			<link rel="stylesheet" type="text/css"
				href="<%=request.getContextPath()%>/style/index.css?v=1.1"
				media="screen" />
			<script type="text/javascript"
				src="<%=request.getContextPath()%>/js/index.js?v=1.0"></script>
			<style type="text/css">
#main {
	color: #333
}

#content {
	margin: 0px;
	text-align:center;
	background: #ad8667
		url('<%=request.getContextPath()%>/images/disz_bg.png');
}

</style>
			<script type="text/javascript">
				
			</script>
</head>

<body>
	<div id="shadow_bg">
		<div id="body">
			<%@ include file="../view_model/index_header.jsp"%>
			<div id="main">


				<div id="content">
					<%@ include file="../view_model/page_alert.htm"%>
<h1>疑!?  網頁勒?</h1>
<div style="">
<p align="left"><font size="4"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;A problem has been detected and we has been nothing to do to prevent damage to our website. 
	<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The problem seems to be cause by the 
	following problem .BUT the website design's english is so bad.So... Let's talk in chinese.</b></font></p>
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
看來我們網站一定是出了甚麼事了，才會讓這個頁面跳出來!你現在正在瀏覽一個網頁，而這個網頁我們卻找不到了，<b>可能被我們工程團隊丟到垃圾桶、藏在床底下、忘記寫了、被駭客入侵了、資策會把網頁吃掉了、世界末日、莫非定理 </b>
	等以上多種理由。
	反正就是找不到就對了，找不到時理由總是特別多，你可以嘗試重新整理看看 
	會不會好，如果你一再的看到這個畫面代表其實你跟這頁也還蠻有緣的。縱使厲害如yahoo goole等世界大站也是有找不到的時候，而這只是我們邁向他們的第一步。<BR><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	如果你是資策會的學生，說不定可以考慮加入我們團隊。如果你是來徵才的廠商，那還真的請您當作沒看過這頁。</p>
	<p align="right">酒迷 技術團隊。</p>
</div>
<img src="<%=request.getContextPath()%>/images/error19.png">
				<%@ include file="../view_model/index_fast_login.htm"%>
				</div>
				<br class="clear" />
			</div>
		</div>
		<%@ include file="../view_model/index_footer.htm"%>

	</div>

	</div>
</body>
</html>


