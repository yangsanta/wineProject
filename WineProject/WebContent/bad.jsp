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
		<title>酒迷 | 500</title>
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
<h1>系統正在遭受到攻擊!!</h1>
<div style="">
<p align="left"><font size="4"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;A problem has been detected and we has been nothing to do to prevent damage to our website. 
	<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The problem seems to be cause by the 
	following problem .BUT the website design's english is so bad.So... Let's talk in chinese.</b></font></p>
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
警告!我們網站系統正在遭受到攻擊! 系統將會在30秒內重新啟動。這絕對不是我們網站寫不好!這一定是駭客入侵!</p>
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


