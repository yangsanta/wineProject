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
		<title>酒迷 | 討論區</title>
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
	background: #ad8667
		url('<%=request.getContextPath()%>/images/disz_bg.png');
}

table {
	border-top: 1px solid #ccc;
	color: #333
}

thead {
	background-color: rgba(114, 113, 113, 0.47);
	text-align: center;
	font-size: 12px;
}

thead tr:hover {
	background-color: rgba(0, 0, 0, 0);
}

td {
	border-bottom: 1px solid #ccc;
	padding: 5px;
}

tr:hover {
	background-color: rgb(255, 255, 255);;
	border-bottom: 1px solid #000;
}

.img_type {
	Width: 40px;
	text-align: center;
}

.tdcenter {
	text-align: center;
}

.table_time {
	Width: 120px;
	font-size: 14px;
}

.table_title {
	font-weight: bold;
}
</style>
			<script type="text/javascript">
				
			</script>
</head>
<body>

	<body>
		<div id="shadow_bg">
			<div id="body">
				<div id="search">
					<input name="searchInput" type="text"
						class="search-query iconsearch" placeholder="搜尋"
						style="width: 70px; height: 10px; padding-left: 24px;"
						onfocus="this.style.width='100px'"
						onblur="this.style.width='70px'">
				</div>
				<br class="clear" />
				<%@ include file="../view_model/index_header.htm"%>
				<div id="main">


					<div id="content">
	<form action="<c:url value='/DiscussionList'/>" method="post">
		Title:<input type="text" name="d_title"><br /> 
		Content:<textarea cols="50" rows="3" id="textContext" name="d_context"></textarea><br />
		<input type="submit" value="Send">
		<input type="hidden" name="action" value="insert">
	</form>
	<%@ include file="../view_model/index_fast_login.htm"%>
						<br class="clear" />
					</div>
					<br class="clear" />
				</div>
			</div>
			<%@ include file="../view_model/index_footer.htm"%>
				
			</div>
			
</div>
</body>

</html>