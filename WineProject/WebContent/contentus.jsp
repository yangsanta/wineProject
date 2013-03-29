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
		<title>酒迷| 歷久彌新的香濃口感</title>
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
				href="<%=request.getContextPath()%>/style/index.css?v=1.0"
				media="screen" />

			<script type="text/javascript"
				src="<%=request.getContextPath()%>/js/index.js?v=1.0"></script>
			<style type="text/css">
</style>
			<script type="text/javascript">
				
			</script>
			<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
			<!--[if lt IE 9]>
      <script src="twitter.github.com/bootstrap/assets/js/html5shiv.js"></script>
    <![endif]-->
</head>

<body>
	<div id="shadow_bg">
		<div id="body">
			<%@ include file="../view_model/index_header.jsp"%>
			<div id="main">
				<div id="sidebar">
					<%@ include file="../view_model/product_list.jsp"%>
					<%@ include file="../view_model/index_left_hotsale.jsp"%>
				</div>

				<div id="content">
					<%@ include file="view_model/page_alert.htm"%>

					<!-- 內容google地圖 -->
					<iframe width="625" height="650" frameborder="0" scrolling="no"
						marginheight="0" marginwidth="0"
						src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=zh-TW&amp;geocode=&amp;q=%E5%8F%B0%E7%81%A3%E5%8F%B0%E5%8C%97%E5%B8%82%E5%A4%A7%E5%AE%89%E5%8D%80%E8%B3%87%E7%AD%96%E6%9C%83&amp;aq=0&amp;oq=%E8%B3%87%E7%AD%96&amp;sll=25.032533,121.543835&amp;sspn=0.004195,0.006968&amp;ie=UTF8&amp;hq=%E8%B3%87%E7%AD%96%E6%9C%83&amp;hnear=%E5%8F%B0%E7%81%A3%E5%8F%B0%E5%8C%97%E5%B8%82%E5%A4%A7%E5%AE%89%E5%8D%80&amp;t=m&amp;ll=25.033769,121.543398&amp;spn=0.01324,0.006295&amp;output=embed"></iframe>
					<br />
					<small><a
						href="http://maps.google.com/maps?f=q&amp;source=embed&amp;hl=zh-TW&amp;geocode=&amp;q=%E5%8F%B0%E7%81%A3%E5%8F%B0%E5%8C%97%E5%B8%82%E5%A4%A7%E5%AE%89%E5%8D%80%E8%B3%87%E7%AD%96%E6%9C%83&amp;aq=0&amp;oq=%E8%B3%87%E7%AD%96&amp;sll=25.032533,121.543835&amp;sspn=0.004195,0.006968&amp;ie=UTF8&amp;hq=%E8%B3%87%E7%AD%96%E6%9C%83&amp;hnear=%E5%8F%B0%E7%81%A3%E5%8F%B0%E5%8C%97%E5%B8%82%E5%A4%A7%E5%AE%89%E5%8D%80&amp;t=m&amp;ll=25.033769,121.543398&amp;spn=0.01324,0.006295"
						style="color: #0000FF; text-align: left">檢視較大的地圖</a></small>
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