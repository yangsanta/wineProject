<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="<%=request.getContextPath()%>/favicon.ico" type="image/x-icon" />
<html>
<head>
	<meta http-equiv="Content-Language" content="zh-tw">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>酒迷| 歷久彌新的香濃口感</title>
	<meta content="酒迷 | 歷久彌新的香濃口感。" name="description" />
 	<meta content="酒迷 | 歷久彌新的香濃口感" name="keywords" />
        <link href="<%=request.getContextPath()%>/style/reset.css" rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath()%>/style/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script src="<%=request.getContextPath()%>/style/bootstrap/js/bootstrap.js"></script>

		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.fancybox.js?v=2.1.4"></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style/jquery.fancybox.css?v=2.1.4" media="screen" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style/index.css?v=1.0" media="screen" />

		<script type="text/javascript" src="<%=request.getContextPath()%>/js/index.js?v=1.0"></script>
<style type="text/css">
a{text-decoration:none}
.title{font-size:24px;}
#foodalldiv ul li ul{display:none;float:left;background-color:#ccc;position: absolute;left: 300px;margin-top: 30px;margin-right: 30px;} /*第一層選單藏起來 firstul*/
#foodalldiv ul li ul li {border-top: 0;float:left;margin-left:10px;margin-right:10px;list-style: none;padding: 10px;} /*第2層選單藏起來 secli*/
#foodalldiv ul li ul li ul{width: 600px;top: 120px;display:none;float:left;background-color:yellow;position: absolute;left: 0px;margin-top: 30px;} /*第二層選單藏起來 secul*/
#foodalldiv ul li ul li ul li {float:left;margin-left:10px;margin-right:10px;list-style: none;padding: 10px;} /*第3層選單藏起來 secli*/
#foodalldiv ul li ul li ul li ul{display:none;float:left;background-color:rgb(247, 77, 34);position: absolute;left: 0px;margin-left:0px} /*第3層選單藏起來 secul*/
.forthli{width:400px;border-top: 0;}
.firstli{display:block;float:left;margin-right:30px;}
.firstul{height: 130px;width: 600px;margin-left:-10px;border-width:1px; border-style:solid;-webkit-border-radius: 5px;-moz-border-radius: 5px;border-radius: 5px;background: #ad8667 url('<%=request.getContextPath()%>/images/disz_bg.png')}
.thirdli{margin-left:10px;border-top: 0;}
.secul{margin-left:0px;height: 120px;border-width:1px; border-style:solid;-webkit-border-radius: 5px;-moz-border-radius: 5px;border-radius: 5px;background: #ad8667 url('<%=request.getContextPath()%>/images/disz_bg.png')}
.thirdul{border-width:1px; border-style:solid;-webkit-border-radius: 5px;-moz-border-radius: 5px;border-radius: 5px;padding:10px 0 10px 0;background: #ad8667 url('<%=request.getContextPath()%>/images/disz_bg.png')}
</style>
<script type="text/javascript">

var URLs="food/all/sat.do?action=Foodset001#";
$("#foodcontent").fadeOut("slow");
$.ajax({
    url: URLs,
    type:"get",
    dataType:'text',

    success: function(msg){
		$("#foodcontent").html(msg).fadeIn("slow");
    },

     error:function(xhr, ajaxOptions, thrownError){ 
     }
});


$(document).on("click",
		".firstli",
		function(event) {
		$(".firstul").css( "display", "none" );
		$(this).find(".firstul").css( "display", "block" );
		});
$(document).on("click",
		".secli",
		function(event) {
		$(".secul").css( "display", "none" );
		$(this).find(".secul").css( "display", "block" );
		});
$(document).on("click",
		".thirdli",
		function(event) {
		$(".thirdul").css( "display", "none" );
		$(this).find(".thirdul").css( "display", "block" );
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
			<%@ include file="../view_model/index_header.jsp"%>
	<div id="main">
					<div id="sidebar">
						<%@ include file="../view_model/product_list.jsp"%>
						<%@ include file="../view_model/index_left_hotsale.jsp"%>	
					</div>
	
					<div id="content">
					<%@ include file="view_model/page_alert.htm"%>
	<div id="foodcontent">
	<div class="box-heading">
			<span class="title">餐酒搭配</span><hr>
		</div>

<span style="font-size: 26px;">餐酒資料比對中，請稍候</span><br><br>
<img src="<%=request.getContextPath()%>/images/ajax-load.gif" style="width:200px;">
</div>



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