<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="<%=request.getContextPath()%>/favicon.ico" type="image/x-icon" />
<html>
<head>
<meta http-equiv="Content-Language" content="zh-tw">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>酒迷 | 討論區</title>
		<meta content="酒迷 | 歷久彌新的香濃口感。" name="description" />
		<meta content="酒迷 | 歷久彌新的香濃口感" name="keywords" />
		<link href="style/reset.css" rel="stylesheet" type="text/css" />
		<link href="style/bootstrap/css/bootstrap.min.css" rel="stylesheet"
			media="screen">
			<script src="http://code.jquery.com/jquery.js"></script>
			<script src="style/bootstrap/js/bootstrap.js"></script>
			<script type="text/javascript" src="js/jquery.fancybox.js?v=2.1.4"></script>
			<link rel="stylesheet" type="text/css"
				href="style/jquery.fancybox.css?v=2.1.4" media="screen" />
			<link rel="stylesheet" type="text/css" href="style/index.css?v=1.1"
				media="screen" />
			<script type="text/javascript" src="js/index.js?v=1.0"></script>
			<style type="text/css">
#main {
	color: #333
}

#content {
	margin: 0px;
	background: #ad8667 url('images/disz_bg.png');
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
						<div align="center">
							<h2>文章</h2>
						</div>
						<span>首頁 » 討論區 » 文章</span>
						<div class="well font-small">

							<strong><span class="label label-success">歡迎!</span></strong> <br><span
								style="margin-left: 50px">你可以在這邊與各方的酒友一起討論酒香的芬芳以及在味蕾上跳動的喜悅。現在就發表一篇文章來與大家認識認識吧。</span>
						</div>
	<form action="insertDiscussion" method="post">
		Title:<input type="text" name="d_title" value="${discussionVO.d_title}"><br /> 
		Content:<textarea cols="50" rows="3" id="textContext" name="d_context">${discussionVO.d_context}</textarea><br />
		<input type="submit" value="Send">
		<input type="hidden" name="action" value="update">
		<input type="hidden" name="d_datetime" value="${discussionVO.d_datetime}">
		<input type="hidden" name="d_status" value="${discussionVO.d_status}">
		<input type="hidden" name="m_no" value="${discussionVO.memberVO.m_no}">
		<input type="hidden" name="d_no" value="${discussionVO.d_no}">
	</form><br/>
						<br class="clear" />
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