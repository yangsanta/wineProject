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
			<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
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
#qaContent {
	margin-left: 50px;
	width: 500px;
}

#qaContent h3 {
	width: 500px;
	height: 22px;
	text-indent: -9999px;
}

#qaContent h3.qa_group_1 {
	background: url(<%=request.getContextPath()%>/images/qa_group_1.png)
		no-repeat;
}

#qaContent h3.qa_group_2 {
	background: url(<%=request.getContextPath()%>/images/qa_group_2.png)
		no-repeat;
}

#qaContent ul.accordionPart {
	margin: 10px 10px 50px 30px;
}

#qaContent ul.accordionPart li {
	border-bottom: solid 1px #e3e3e3;
	padding-bottom: 12px;
	margin-top: 12px;
}

#qaContent ul.accordionPart li .qa_title {
	background: url(<%=request.getContextPath()%>/images/icon_q_a.gif)
		no-repeat 0px 3px;
	padding-left: 28px;
	color: #1186ec;
	cursor: pointer;
	TEXT-ALIGN: left;
}

#qaContent ul.accordionPart li .qa_title_on {
	text-decoration: underline;
}

#qaContent ul.accordionPart li .qa_content {
	margin: 6px 0 0;
	background: url(<%=request.getContextPath()%>/images/icon_q_a.gif)
		no-repeat 0px -24px;
	padding-left: 28px;
	color: #666;
}
</style>
			<script type="text/javascript">
				$(function() {
					// 幫 div.qa_title 加上 hover 及 click 事件
					// 同時把兄弟元素 div.qa_content 隱藏起來
					$('#qaContent ul.accordionPart li div.qa_title').hover(
							function() {
								$(this).addClass('qa_title_on');
							}, function() {
								$(this).removeClass('qa_title_on');
							}).click(function() {
						// 當點到標題時，若答案是隱藏時則顯示它；反之則隱藏
						$(this).next('div.qa_content').slideToggle();
					}).siblings('div.qa_content').hide();
				});
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

					<BR><img border="0"
						src="http://192.192.126.21/interdiscoplinary/images/qa.jpg"
						width="707" height="37" alt="常見問題Q&A"><BR><BR>
									<div id="qaContent">
										<h3 class="qa_group_1">基本問題</h3>
										<ul class="accordionPart">
											<li><div class='qa_title'>我買的酒何時會到？</div>
												<div class='qa_content'>我們這是一個demo網站，所以你的酒我想應該是永遠不會到了。</div>
											</li>
											<li><div class='qa_title'>酒的品質會不會很差？</div>
												<div class='qa_content'>我們的酒都是當天空運來台，直接傘兵空投到我們的工廠的，保證新鮮香醇。</div>
											</li>
										</ul>
										<h3 class="qa_group_2">學程修課問題</h3>
										<ul class="accordionPart">
											<li><div class='qa_title'>你們要如何送貨？</div>
												<div class='qa_content'>我們會親自送貨到府上，因為未成年不能買酒，所以必須要在交貨時檢查一下您的證件以方便確認成年與否，還請進請見諒。</div>
											</li>
											<li><div class='qa_title'>網站交易安全嗎？</div>
												<div class='qa_content'>你在本網站完全沒辦法買到任何的真實世界的商品跟酒類，也沒有讓你填信用卡的地方所以保證安全。</div>
											</li>
											<li><div class='qa_title'>據說你們來自資策會？</div>
												<div class='qa_content'>我們的專業，不是來自木匠，而是來自資策會。在資策會之前我不會寫java，在資策會之後，連網站都會寫了</div></li>
										</ul>
									</div><%@ include file="../view_model/index_fast_login.htm"%>


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