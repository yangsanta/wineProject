<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<link href="style/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
		<script src="http://code.jquery.com/jquery.js"></script>
		<script src="style/bootstrap/js/bootstrap.js"></script>

		<script type="text/javascript" src="js/jquery.fancybox.js?v=2.1.4"></script>
		<link rel="stylesheet" type="text/css" href="style/jquery.fancybox.css?v=2.1.4" media="screen" />
		<link rel="stylesheet" type="text/css" href="style/index.css?v=1.0" media="screen" />

		<script type="text/javascript" src="js/index.js?v=1.0"></script>
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
	padding:0px;
		float: left;
		width: 640px;
		height: 100%;
	}
	#abgneBlock .list img{
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
	
	
	
	.shopcart {height: 40px;}
	.shopcartlist{position: absolute;
padding: 0 ;
right: 0px;
top: 41px;
background-color: white;
z-index: 1000;width:300px;color:black}
	 .displayshow {display:inline;}
	 .displaynone{display:none}
</style>
<script type="text/javascript">

	//右邊輪播式廣告
	$(function(){
		// 先取得必要的元素並用 jQuery 包裝
		// 再來取得 $block 的高度及設定動畫時間
		var $block = $('#abgneBlock'),
			$slides = $('ul.list', $block),
			_width = $block.width(),
			$li = $('li', $slides),
			_animateSpeed = 600, 
			// 加入計時器, 輪播時間及控制開關
			timer, _showSpeed = 3000, _stop = false;

		// 產生 li 選項
		var _str = '';
		for(var i=0, j=$li.length;i<j;i++){
			// 每一個 li 都有自己的 className = playerControl_號碼
			_str += '<li class="playerControl_' + (i+1) + '"></li>';
		}

		// 產生 ul 並把 li 選項加到其中
		var $playerControl = $('<ul class="playerControl"></ul>').html(_str).appendTo($slides.parent()).css('left', function(){
			// 把 .playerControl 移到置中的位置
			return (_width - $(this).width()) / 2;
		});
		
		// 幫 li 加上 click 事件
		var $playerControlLi = $playerControl.find('li').click(function(){
			var $this = $(this);
			$this.addClass('current').siblings('.current').removeClass('current');

			clearTimeout(timer);
			// 移動位置到相對應的號碼
			$slides.stop().animate({
				left: _width * $this.index() * -1
			}, _animateSpeed, function(){
				// 當廣告移動到正確位置後, 依判斷來啟動計時器
				if(!_stop) timer = setTimeout(move, _showSpeed);
			});

			return false;
		}).eq(0).click().end();

		// 如果滑鼠移入 $block 時
		$block.hover(function(){
			// 關閉開關及計時器
			_stop = true;
			clearTimeout(timer);
		}, function(){
			// 如果滑鼠移出 $block 時
			// 開啟開關及計時器
			_stop = false;
			timer = setTimeout(move, _showSpeed);
		});
		
		// 計時器使用
		function move(){
			var _index = $('.current').index();
			$playerControlLi.eq((_index + 1) % $playerControlLi.length).click();
		}
	});

</script>
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="twitter.github.com/bootstrap/assets/js/html5shiv.js"></script>
    <![endif]-->
</head>

<body >
	<div id="shadow_bg" >
	<div id="body" >
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
			<li><a href="#"><img src="images/ad/01.jpg"></a></li>
			<li><a href="#"><img src="images/ad/02.jpg"></a></li>
			<li><a href="#"><img src="images/ad/03.jpg"></a></li>
			<li><a href="#"><img src="images/ad/04.jpg"></a></li>
			<li><a href="#"><img src="images/ad/05.jpg"></a></li>
		</ul>
	</div>
						<div id="box1">
							<h2>
								限時特賣!
							</h2>
								<h3>美味的香濃紅葡萄酒 來自奧茲大地的甜美風味</h3>
								<img src="http://img1.groupon.com.tw/pi/19861-1-big.jpg?1363158213">
								<div style="background-color: #d7f1f7;background-image:url(images/lightbg.jpg);position:relative;margin:0 -40px 0 -40px">
								<div>
								<span style="font-size:16px">原價 $250<br>
 折扣 64折 <br>
 現省 $90<br>
 1477人已購買
好康已成立</span>
倒數計時 <button class="btn btn-large  btn-success" type="button">我要買</button>
fb推薦</div>

<div align="right" style="width:281px; height:90px; position:absolute; top:0px; right:-59px; background-image:url(images/gtag281.png); background-repeat:no-repeat;">
  	                <div align="center" class="white60" style="width:262px; height:80px; line-height:80px;">
  	                	<span style="font-size: 35px;color: #FFF;margin-right:80px">搶購$160  	</span>                </div>
  	            </div>
				<div style="background-color: #ccc;background-image:url(images/timebg.jpg);margin:10px"> 購買注意事項!<br>
				<ul style="background-color: rgba(255, 255, 255, 0.75);margin:20px;padding:5px;-webkit-border-radius: 5px;-moz-border-radius: 5px;border-radius: 5px;">
			<li>	■ 優惠期間：2013/03/24至2013/04/24 (國定假日或特殊節慶能否兌換需依店家當時規定，請先致電店家確認)。</li>
<li>■ 優惠時間：因各分店兌換時間不同，請參考下方店家資訊。</li>
<li>■ 本優惠限店取，不另提供宅配或外送服務。</li>
<li>■ 購買時請選擇兌換分店，兌換券不可跨店使用，訂購成功後恕無法更換分店，請您仔細選擇。</li>
<li>■ 若有本好康相關問題，請於週一至週日09:00-24:00來電(02)27131485洽「Wineme客服」。</li>
<li>■ 酒迷創意行銷股份有限公司保有變更活動的權利。</li>
				</ul>
				<br>
				</div>
				<br>
</div>
<%@ include file="view_model/index_fast_login.htm"%>
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


