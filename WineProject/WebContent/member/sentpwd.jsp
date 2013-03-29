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
<title>酒迷 | 歷久彌新的香濃口感</title>
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
#content {
	padding: 40px 20px 30px 20px;
	background: url(<%=request.getContextPath()%>/images/page.png);
}

#content h2 {
	TEXT-ALIGN: center
}
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
					<form method="post" action="<%=request.getContextPath()%>/member/memberpw.do">
						<b><font size="5">忘記密碼</font></b>
						<hr>
							<div class="well font-small">
								<strong><span class="label label-success">謝謝!</span></strong> <br><span
									style="margin-left: 50px">已寄送新的密碼到您的信箱。
								</span>
							</div>
<!-- 							<div style="width:300px;margin:130px auto;background-color: rgba(255, 255, 255, 0.47); -->
<!-- border: 1px solid #e5e5e5;padding: 30px;border-radius: 10px;height: 200px;"> -->
							
<!-- 							<label style="width:80px">帳號 :</label> -->
<!-- 							<div class="input-prepend"> -->
<!-- 								<span class="add-on"><i class="icon-user"></i></span> -->
<!-- 								<input class="span3" name="m_id"  type="text" maxlength="128" /> -->
<!-- 							</div> -->

<!-- 							<div  id="login_submit"> -->
<!-- 						<input type="submit"  value="寄送新密碼" class="btn btn-success" style="Width:150px;Height:40px;"/> -->
<!-- 					</div> -->

							
<!-- 							</div> -->
					</form>



					<br class="clear" />
				</div>
				<br class="clear" />
			</div>
		</div>
		<%@ include file="/view_model/index_fast_login.htm"%>
		<%@ include file="/view_model/index_footer.htm"%>

	</div>

	</div>
</body>

</html>