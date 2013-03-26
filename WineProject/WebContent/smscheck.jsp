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
.show_pro {
	border-bottom: #ccc 1px solid;
	overflow: auto;
	width: 100%;
	border-left: #ccc 1px solid;
	border-right: #ccc 1px solid;
}

.show_pro:hover {
	background: rgb(238, 245, 236)
}

.pro_list {
	float: left;
	list-style: none;
}

.pro_list2 {
	float: right;
	list-style: none;
	margin: 30px 30px 0 0;
}

.pro_list3 {
	float: left;
	list-style: none;
	width: 350px;
}

.prod_img {
	background: #fff;
	border: #ccc 1px solid;
	padding: 3px;
	margin: 15px;
	width: 100px;
	height: 100px;
	text-align: center;
}

.buttonbuy {
	margin-top: 10px;
}

.pro_title {
	width: 100%;
	height: 21px;
	background-repeat: repeat-x;
	background: url(<%=request.getContextPath()%>/images/product_list_top.png);
	border-left: #ccc 1px solid;
	border-right: #ccc 1px solid;
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
			<%@ include file="/view_model/index_header.jsp"%>
			<div id="main">
				<div id="sidebar">
					<%@ include file="/view_model/product_list.jsp"%>
					<%@ include file="/view_model/index_left_hotsale.jsp"%>
				</div>

				<div id="content">
					<%@ include file="view_model/page_alert.htm"%>

					<h2>快要成功溜!</h2>
					<c:if test="${not empty errorMsgs}">
						<font color='red'> <c:forEach var="message"
								items="${errorMsgs}">
														${message}<br>
							</c:forEach>
						</font>
					</c:if>
					<div class="well font-small">
						<strong><span class="label label-success">安全!</span></strong><span>Hello
							親愛的${ m_idKey }您好:<br><span style="margin-left: 40px">協助我們確保您的帳戶安全性
									只要驗證您的手機號碼，之後假如您丟失了您的帳戶，或是在本站的任何消費，我們將會用此手機號碼來確保您的消費安全。</span>
					</div>
					<img style="display: block; margin: auto;"
						/ src="<%=request.getContextPath()%>/images/verifiedphone_2.png"
						width="500px"> <br>
							<div
								style="background: #f1f1f1; border: 1px solid #e5e5e5; padding: 1em 1.5em 1.5em;">
								<form id="theform" method="post" action="smschecktomail.do">
									<h3>驗證您的手機號碼</h3>
									<span style="line-height: 17px; font-size: 10px">
										您的手機號碼只會用於本網站使用， 我們只會將這組號碼用於網站交易以及確保您的帳戶安全性。</span><br> <br>
											<c:if test="${not empty errorMsgs}">
												<font color='red'> <c:forEach var="message"
														items="${errorMsgs}">
														${message}<br>
													</c:forEach>
												</font>
											</c:if> <span style="font-size: 10px">輸入驗證碼</span><span
											style="margin-left: 30px; font-size: 10px"> 範例:123456</span><br>
												<input type="text" id="smscheck" name="smscheck"> <input
													type="submit" id="send-code-button"
													class="btn btn-success btn-small" value="傳送驗證碼">沒收到嗎?

												
								</form>
							</div> <%@ include file="/view_model/index_fast_login.htm"%>


							<br class="clear" />
				</div>
				<br class="clear" />
			</div>
		</div>
		<%@ include file="/view_model/index_footer.htm"%>
		<span style="font-size: 8px">${sessionScope.smscheck_num}</span>
	</div>

	</div>
</body>

</html>


