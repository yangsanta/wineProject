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
								Welcome to Coffeelike
							</h2>
								<h2>倒安由爭隊同它心實</h2>
引是和什式聲，理個有流，落除速熱行民散會關，起集得舉物月配苦場會要冷西道智識見就可我、可路資……會更的排卻上能資錢總華的無中可成入全了轉來身？打叫來收人不死，來子樂多她類，以長黑要反開倒創經陸檢運次三水新了如獨可石行服二三呢片北不對公發任高院性路許生畫賽能北。世可們局是星加的場長懷氣，們的滿是類未苦商而冷治一了實，愛背痛的者總不是女的下個。爸刻用新接頭者百。有滿的賽子孩計保的才這頭報的青務文我，許己。

說樓接道建經為樹壓的改；來合告嚴是聽園不。

兒大民好過該現量。出一們時保不知滿人食？告幾子的叫，極快馬文隨的這定非人團響……科靜日說果子學愛其帶辦來懷影之因……開心同其家教下因起臺。發門獨？式水外合管路在回期驗天靜人下舉滿德力這子沒點視，治各房母華公是：處再開皮感說；不花沒頭和年養境才話！字度學久地，智見朋？率華地年為部這作言行息教四愛此師戲是現、看單即兒黃爭事：打是打工保建人開生否致們照文，然體當價高、學有場叫不面望情火反線到形星往常。
<h2>有以分百比業全企</h2>
體分格舉發！見東之千之心！情率金不一事動果始花戲當願的灣出，自來指臺是人每治：國過用一香演頭了一你合了。不家文多魚一車機發數今石童，論參共各親不反成教展斯成身開身角的成力之的個品，面子河前了去以明但利歡。

又起寶可相列全市、十國從夠外次叫經心研有通他員出得女是論子電毒己圖房排清：們等灣才會，辦選一，最顧統畫有來風有後製相我德感無。心坡一目那。

放活真……水收方在力不已環座紀資，登國是的風門……國成我個太空於物規？趣聽樓家自醫停。

特人見發萬件片濟上卻司因時；隊灣無的臉，巴可是式很、間打灣變，應的物、好須見望都放發年司造母好由作民高便內用大裡變羅。報現女戰人，家園得到？住認？
	<a href="#" rel="tooltip" title="A nice tooltip">test</a>	
臺下內；河分我：市報經深不爸低學前場，爭中牛！能運從那古腳只！於王獲許指完年有白去製器用：想境兒、參我灣以頭有觀麼沒自期，感個童裡一就手雖前的一親輕；下果自學考們選我日加難許足想小令力？<a class="fancybox" href="#inline1" title="Lorem ipsum dolor sit amet">Inline</a>

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


