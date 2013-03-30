<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<html>
<head>
<meta http-equiv="Content-Language" content="zh-tw">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>酒迷 | 歷久彌新的香濃口感</title>
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
			<link rel="stylesheet" type="text/css" href="style/index.css?v=1.0"
				media="screen" />

			<script type="text/javascript" src="js/index.js?v=1.0"></script>
			<!-------JavaScript特定日期倒數計時 START-------->
			<script language="JavaScript">
				var DifferenceMinute = -1
				var DifferenceSecond = -1
				today = new Date();
				var str = today.getMonth() + 1 + " " + today.getDate() + ","
						+ today.getFullYear() + " 23:59:59"
				var Tday = new Date(str)
				var hoursms = 60 * 60 * 1000
				var Secondms = 60 * 1000
				var microsecond = 1000

				function clock() {
					var time = new Date()
					var hour = time.getHours()
					var minute = time.getMinutes()
					var second = time.getSeconds()
					var convertMinute = DifferenceMinute
					var convertSecond = DifferenceSecond
					var Diffms = Tday.getTime() - time.getTime()
					DifferenceMinute = Math.floor(Diffms / hoursms)
					Diffms -= DifferenceMinute * hoursms
					DifferenceSecond = Math.floor(Diffms / Secondms)
					Diffms -= DifferenceSecond * Secondms
					var dSecs = Math.floor(Diffms / microsecond)
					if (convertMinute != DifferenceMinute) {
						document.getElementById('hr').innerHTML = DifferenceMinute;
					}
					if (convertSecond != DifferenceSecond) {
						document.getElementById('min').innerHTML = DifferenceSecond;
					}
					document.getElementById('sec').innerHTML = dSecs;
					setTimeout("clock()", 1000)
				}
			// end hiding  -->
			</script>
			<style type="text/css">
/*右邊 廣告輪播 ad*/
#abgneBlock {
	width: 640px;
	height: 311px;
	position: relative;
	overflow: hidden;
	border: 1px solid #ccc;
}

#abgneBlock ul.list {
	padding: 0;
	margin: 0;
	list-style: none;
	position: absolute;
	width: 9999px;
	height: 100%;
}

#abgneBlock ul.list li {
	padding: 0px;
	float: left;
	width: 640px;
	height: 100%;
}

#abgneBlock .list img {
	width: 100%;
	height: 100%;
	border: 0;
}

#abgneBlock ul.playerControl {
	margin: 0;
	padding: 0;
	list-style: none;
	position: absolute;
	bottom: 5px;
	right: 5px;
	height: 14px;
}

#abgneBlock ul.playerControl li {
	float: left;
	width: 10px;
	height: 10px;
	cursor: pointer;
	margin: 0px 2px;
	background: url(images/cir_ctrl.png) no-repeat -10px 0;
}

#abgneBlock ul.playerControl li.current {
	background-position: 0 0;
}

.shopcart {
	height: 40px;
}

.shopcartlist {
	position: absolute;
	padding: 0;
	right: 0px;
	top: 41px;
	background-color: white;
	z-index: 1000;
	width: 300px;
	color: black
}

.displayshow {
	display: inline;
}

.displaynone {
	display: none
}

.timelimit_title {
	background-image: url(images/ppopTittleBG_02.png);
	background-repeat: repeat-x;
	float: left;
	height: 33px;
	font-size: 20px;
	color: #fff;
	font-weight: bold;
	line-height: 30px;
	padding-left: 5px;
	padding-right: 5px;
}

.timelimit_titleRight {
	background-image: url(images/ppopTittleBG_03.png);
	background-repeat: no-repeat;
	float: left;
	height: 33px;
	width: 16px;
}

.TScontent {
	background: #ffe;
	padding: 15px 20px 28px 20px;
	margin-left: -20px;
	width: 650px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	background-image: -webkit-gradient(linear, 50% 100%, 50% 0%, color-stop(5%, #ddedeb),
		color-stop(5%, rgba(221, 237, 235, 0)));
	background-image: -webkit-linear-gradient(bottom, #ddedeb 5%, rgba(221, 237, 235, 0)
		5%);
	background-image: -moz-linear-gradient(bottom, #ddedeb 5%, rgba(221, 237, 235, 0)
		5%);
	background-image: -o-linear-gradient(bottom, #ddedeb 5%, rgba(221, 237, 235, 0)
		5%);
	background-image: -ms-linear-gradient(bottom, #ddedeb 5%, rgba(221, 237, 235, 0)
		5%);
	background-image: linear-gradient(bottom, #ddedeb 5%, rgba(221, 237, 235, 0)
		5%);
	-webkit-background-size: 100% 24px;
	-moz-background-size: 100% 24px;
	-o-background-size: 100% 24px;
	background-size: 100% 24px;
	background-position: left top;
}

.TS_pricezone {
	-webkit-border-top-left-radius: 5px;
	-webkit-border-top-right-radius: 5px;
	-moz-border-radius-topleft: 5px;
	-moz-border-radius-topright: 5px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	background-color: blue;
	height: 170px;
	width: 450px;
	margin-left: -19px;
	padding-top: 10px;
	background: #959595; /* Old browsers */
	background: -moz-linear-gradient(top, #959595 0%, #0d0d0d 27%, #010101 32%, #0a0a0a
		53%, #4e4e4e 76%, #383838 87%, #1b1b1b 100%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #959595),
		color-stop(27%, #0d0d0d), color-stop(32%, #010101),
		color-stop(53%, #0a0a0a), color-stop(76%, #4e4e4e),
		color-stop(87%, #383838), color-stop(100%, #1b1b1b));
	/* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, #959595 0%, #0d0d0d 27%, #010101 32%,
		#0a0a0a 53%, #4e4e4e 76%, #383838 87%, #1b1b1b 100%);
	/* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top, #959595 0%, #0d0d0d 27%, #010101 32%, #0a0a0a
		53%, #4e4e4e 76%, #383838 87%, #1b1b1b 100%); /* Opera 11.10+ */
	background: -ms-linear-gradient(top, #959595 0%, #0d0d0d 27%, #010101 32%, #0a0a0a
		53%, #4e4e4e 76%, #383838 87%, #1b1b1b 100%); /* IE10+ */
	background: linear-gradient(to bottom, #959595 0%, #0d0d0d 27%, #010101 32%, #0a0a0a
		53%, #4e4e4e 76%, #383838 87%, #1b1b1b 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient(  startColorstr='#959595',
		endColorstr='#1b1b1b', GradientType=0); /* IE6-9 */
}

.TSlightbg {
	style ="-webkit-border-bottom-right-radius: 5px;
	-webkit-border-bottom-left-radius: 5px;
	-moz-border-radius-bottomright: 5px;
	-moz-border-radius-bottomleft: 5px;
	border-bottom-right-radius: 5px;
	border-bottom-left-radius: 5px;
	background-color: #d7f1f7;
	background-image: url(images/lightbg.jpg);
	position: relative;
	margin: 0 -40px -69px -40px;
	"
}
#buyinfo li{font-size:12px}
</style>
			<script type="text/javascript">
				//右邊輪播式廣告
				$(function() {
					// 先取得必要的元素並用 jQuery 包裝
					// 再來取得 $block 的高度及設定動畫時間
					var $block = $('#abgneBlock'), $slides = $('ul.list',
							$block), _width = $block.width(), $li = $('li',
							$slides), _animateSpeed = 600,
					// 加入計時器, 輪播時間及控制開關
					timer, _showSpeed = 3000, _stop = false;

					// 產生 li 選項
					var _str = '';
					for ( var i = 0, j = $li.length; i < j; i++) {
						// 每一個 li 都有自己的 className = playerControl_號碼
						_str += '<li class="playerControl_' + (i + 1)
								+ '"></li>';
					}

					// 產生 ul 並把 li 選項加到其中
					var $playerControl = $('<ul class="playerControl"></ul>')
							.html(_str).appendTo($slides.parent()).css('left',
									function() {
										// 把 .playerControl 移到置中的位置
										return (_width - $(this).width()) / 2;
									});

					// 幫 li 加上 click 事件
					var $playerControlLi = $playerControl.find('li').click(
							function() {
								var $this = $(this);
								$this.addClass('current').siblings('.current')
										.removeClass('current');

								clearTimeout(timer);
								// 移動位置到相對應的號碼
								$slides.stop().animate({
									left : _width * $this.index() * -1
								}, _animateSpeed, function() {
									// 當廣告移動到正確位置後, 依判斷來啟動計時器
									if (!_stop)
										timer = setTimeout(move, _showSpeed);
								});

								return false;
							}).eq(0).click().end();

					// 如果滑鼠移入 $block 時
					$block.hover(function() {
						// 關閉開關及計時器
						_stop = true;
						clearTimeout(timer);
					}, function() {
						// 如果滑鼠移出 $block 時
						// 開啟開關及計時器
						_stop = false;
						timer = setTimeout(move, _showSpeed);
					});

					// 計時器使用
					function move() {
						var _index = $('.current').index();
						$playerControlLi.eq(
								(_index + 1) % $playerControlLi.length).click();
					}
				});
			</script>
			<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
			<!--[if lt IE 9]>
      <script src="twitter.github.com/bootstrap/assets/js/html5shiv.js"></script>
    <![endif]-->
</head>

<body onload="clock();return true">
	<div id="shadow_bg">
		<div id="body">
			<%@ include file="view_model/index_header.jsp"%>
			<div id="main">
				<div id="sidebar">
					<%@ include file="view_model/product_list.jsp"%>
					<%@ include file="view_model/index_left_hotsale.jsp"%>
				</div>

				<div id="content">
					<%@ include file="view_model/page_alert.htm"%>
					<div id="abgneBlock">
						<ul class="list">
							<jsp:useBean id="adsAll" class="ads.model.AdsDAO">
								<c:forEach items="${adsAll.all}" var="ads">
									<li><a
										href="<%=request.getContextPath()%>/product/DisplayProducts.do?action=getOne_For_Display&pId=${ads.productVO.p_no}"><img
											src="images/ad/${ads.ads_filename}"></a></li> -->
								</c:forEach>
							</jsp:useBean>
						</ul>
					</div>
					<!-- 					限時特惠廣告起始位置 -->
					<div id="box1">
						<jsp:useBean class="timing_sales.model.Timing_SalesDAO" id="ts">
							<div class="timelimit_title">限時特賣!</div>
							<div class="timelimit_titleRight" style="display: inline">
							</div>
							<br>
								<h3>${ts.dailySales.ts_slogan}</h3> <img
								src="<%=request.getContextPath()%>/images/timingSales/${ts.dailySales.ts_pic}"
								style="width: 692px; height: 450px; border-width: 9px; border-style: solid; margin-left: -40px;">
									<div class="TSlightbg">
										<div style="margin-left: 30px; padding-top: 10px;">
											<div class="TS_pricezone">
												<div
													style="border-width: 2px; border-style: solid; background-color: white; margin-top: 10px; padding: 10px 0px 10px 20px; height: 150px;">
													<img src="<%=request.getContextPath()%>/images/tag.png"  style="left: -30px;top: 10px;float: left;width: 60px;position: absolute;}">
													<div style="width: 110px; float: left;margin-left: 20px;">
														<span style="font-size: 16px; font-weight: bold;">原價
														</span></br>
							<span
								style="font-size: 36px; color: red; text-decoration: line-through;">${ts.dailySales.productVO.p_price}</span>
							<br></div>

					<div style="width: 140px; float: left;">
						<span style="font-size: 16px; font-weight: bold;"> 折扣</span><br><span
							style="font-size: 36px; font-weight: bold;"> <fmt:formatNumber
									value="${ts.dailySales.ts_price / ts.dailySales.productVO.p_price * 10}"
									pattern="0.0" />折
						</span> <br />
					</div>
					<div style="width: 130px; float: left;">
						<span style="font-size: 16px; font-weight: bold;"> 現省</span><br><span
							style="font-size: 36px; font-weight: bold;">${ts.dailySales.productVO.p_price
								- ts.dailySales.ts_price }元</span><br>
					</div>
					<br class="clear" />

					<hr style="width: 400px; border-top: 1px solid rgb(53, 53, 53);">
						<div style="width: 150px; float: left; margin-top: -10px;">
							<i class="icon-user"></i> <span style="color: red">
								${ts.dailySales.ts_totalsale}</span>人已購買 <Br><i class=" icon-ok"></i>
								好康已成立
						</div>
						<div style="width: 150px; float: left;">
							<a
								href="<%=request.getContextPath()%>/product/DisplayProducts.do?action=getOne_For_Display&pId=${ts.dailySales.productVO.p_no}"><button
									class="btn btn-large  btn-success" type="button"
									style="width: 220px;">
									<i class=" icon-shopping-cart icon-white"></i> 我要買
								</button></a>
						</div>
				</div>
			</div>
			<div style="float: right; margin-right: 10px; margin-top: -90px;">
				<span
					style="margin-left: 26px; font-size: 24px; font-weight: bold; color: #333;">剩餘倒數時間</span>
				<div
					style="color: white; background-image: url(images/clock.png); width: 210px; height: 42px;">
					<span
						style="color: white; width: 50px; display: inline-block; margin: 5px 0 0 30px;"
						id="hr"></span> <span
						style="color: white; width: 50px; display: inline-block;" id="min"></span>
					<span style="color: white; width: 30px; display: inline-block;"
						id="sec"></span>
				</div>
			</div>

			<br class="clear">
				<div class="TScontent">
					<span><b>介紹:</b></span><br> <span>${ts.dailySales.ts_content}</span>
				</div>
		</div>

		<div align="right"
			style="width: 281px; height: 90px; position: absolute; top: 0px; right: -59px; background-image: url(images/gtag281.png); background-repeat: no-repeat;">
			<div  class="white60"
				style="width: 262px; height: 80px; line-height: 80px;text-align: left;">
				<span style="width: 210px;font-size: 35px; color: #FFF;">搶3購價$
					${ts.dailySales.ts_price} </span>
			</div>
		</div>

		<div
			style="background-color: #ccc; background-image: url(images/timebg.jpg); margin: 10px; -webkit-border-radius: 5px; -moz-border-radius: 5px; border-radius: 5px;">
			<img src="<%=request.getContextPath()%>/images/time_note.png" style="margin: 5px 5px 0 10px;width:30px"><span
				style="font-weight: bold;">購買注意事項!</span><br>
					<ul id ="buyinfo"
						style="background-color: rgba(255, 255, 255, 0.75); font-size: 10px; margin: 20px; padding: 5px; -webkit-border-radius: 5px; -moz-border-radius: 5px; border-radius: 5px;">
						<li>■ 優惠期間：2013/03/24至2013/04/24
							(國定假日或特殊節慶能否兌換需依店家當時規定，請先致電店家確認)。</li>
						<li>■ 優惠時間：因各分店兌換時間不同，請參考下方店家資訊。</li>
						<li>■ 本優惠限店取，不另提供宅配或外送服務。</li>
						<li>■ 購買時請選擇兌換分店，兌換券不可跨店使用，訂購成功後恕無法更換分店，請您仔細選擇。</li>
						<li>■ 若有本好康相關問題，請於週一至週日09:00-24:00來電(02)27131485洽「Wineme客服」。</li>
						<li>■ 酒迷創意行銷股份有限公司保有變更活動的權利。</li>
					</ul> <br>
		</div>
		<br><br> </jsp:useBean>
	</div><%@ include file="view_model/index_fast_login.htm"%>
	</div>

	<br class="clear" />
	</div>
	<br class="clear" />
	</div>
	</div>
	<%@ include file="view_model/index_footer.htm"%>

	</div>

	</div>

</body>

</html>


