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
			<!-- TinyMCE -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tinymcec/jscripts/tiny_mce.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tinymcec/tinymac.js"></script>
<!-- /TinyMCE -->
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
		<div id="content">
			<div align="center">
				<h2>文章</h2>
		</div>
		<div>		
		<form action="DiscussionManagment" method="post">
			Title:<input type="text" name="d_title" value="${discussionVO.d_title}"><br /> 
			Content:<textarea cols="170" rows="10" id="textContext" name="d_context">${discussionVO.d_context}</textarea><br/>
			<input type="submit" value="Send"/>
			<input type="hidden" name="action" value="update"/>
			<input type="hidden" name="d_datetime" value="${discussionVO.d_datetime}"/>
			<input type="hidden" name="d_status" value="${discussionVO.d_status}"/>
			<input type="hidden" name="m_no" value="${discussionVO.memberVO.m_no}"/>
			<input type="hidden" name="d_no" value="${discussionVO.d_no}"/>
		</form><br/>
		</div>
	</body>
</html>