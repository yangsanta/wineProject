<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link rel="shortcut icon" href="<%=request.getContextPath()%>/favicon.ico" />
<link rel="icon" href="<%=request.getContextPath()%>/favicon.ico" type="image/x-icon" />
<head>
<meta charset="utf-8">
	<title>酒迷|後台管理系統</title>
	
	<link media="all" rel="stylesheet" type="text/css" href="css/all.css" />
	 <c:if test="${sessionScope.admin_access!='y'}"><meta http-equiv="refresh" content="0; url=index.jsp"></c:if>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript">
	window.jQuery|| document.write('<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.9.0.min.js"><\/script>');
	</script>
	<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="css/ie.css" /><![endif]-->
	<style type="text/css">
	.buttons li.adminboard a {
	background:url(<%=request.getContextPath()%>/wine_admin/images/sprite.png) no-repeat -113px -2px;
	margin:0 -21px 0 0;
	padding:0 21px 0 0;
}
.buttons li.adminboard a :hover{color:yellow;}
.buttons li.adminboard a em {top:40px;}
.buttons .adminboard .ico1 span {background-position:0 -23px;}
.buttons .adminboard .ico2 span {background-position:-2px -73px;}
.buttons .ico3 span {background-position:-2px -97px;}
.buttons .adminboard .ico3 span {background-position:-2px -126px;}
.buttons .ico4 span {background-position:-2px -153px;}
.buttons .adminboard .ico4 span {background-position:-2px -178px;}
.buttons .ico5 span {background-position:-1px -206px;}
.buttons .adminboard .ico5 span {background-position:-2px -232px;}
.buttons .ico6 span {background-position:-2px -262px;}
.buttons .adminboard .ico6 span {background-position:-3px -291px;}
.buttons .ico7 span {background-position:-4px -321px;}
.buttons .adminboard .ico7 span {background-position:-4px -352px;}
.buttons .ico8 span {background-position:-4px -380px;}
.buttons .adminboard .ico8 span {background-position:-4px -415px;}

	
.table {
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	border-bottom-left-radius: 3px;
	border: 1px solid rgb(223, 223, 223);
	background-color: rgb(249, 249, 249);
	border-collapse: collapse;
	border-right: 1px solid fff;
	border-left: 1px solid fff;
	width: 100%;
}

.table_head {
	background: #f1f1f1;
	background-image: -webkit-gradient(linear, left bottom, left top, from(#ececec),
		to(#f9f9f9));
	background-image: -webkit-linear-gradient(bottom, #ececec, #f9f9f9);
}

.table_head_td {
	line-height: 30px;
	font-size: 14px;
	color: #555;
	text-shadow: rgba(255, 255, 255, 0.8) 0 1px 0;
	padding-left: 10px
}

.tr {
	border-top: 1px solid #fff;;
	border-bottom: 1px solid #dfdfdf;
	line-height: 1.6em;
}

.td {
	padding: 4px 7px 2px;
	color: #555;
}

.table_a {
	color: #21759b;
}

.table_a:hover {
	color: #d54e21;;
}
</style>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['資訊', 'last', 'now'],
          ['上月/本月訪客',  ${visiter.numlastmonth} ,      ${visiter.nummonth}],
          ['昨日/今日訪客',  ${visiter.numyesterday},     ${visiter.numday}],
          ['上月/本月PageView', ${pv.numlastmonth},      ${pv.nummonth}],
          ['昨日/今日PageView',${pv.numyesterday}, ${pv.numday}]
        ]);

        var options = {
          title: '資訊圖表',
          hAxis: {title: '網站總覽', titleTextStyle: {color: 'red'}}
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
</head>
<body>
	<div id="wrapper">
		<div id="content">
			<div class="c1">
	<%@ include file="view_model/total_tab.jsp"%>
				<div class="tabs">
					<div id="tab-1" class="tab">
						<article>
						<div class="text-section">
							<h1>儀表板</h1>
							<p>觀看所有的網站系統目前狀態</p>
						</div>
						<!-- 						<ul class="states"> --> <!-- 							<li class="error">錯誤 : 系統錯誤，海尼根綠茶庫存沒了，請盡速補貨</li> -->
						<!-- 							<li class="warning">注意: 您還有三則訂單尚未處理.</li> --> <!-- 							<li class="succes">成功 : 你剛完成了5筆訂單.</li> -->
						<!-- 						</ul> -->
						<div style="width: 80%; margin: 0 auto">
							</BR>
						<h1>網站總覽</h1>
								<table class="table">

									<tr class="table_head">
										<td class="table_head_td" style="margin-left: 10px"></td>
										<td class="table_head_td" width="130px">總數</td>
										<td class="table_head_td" width="150px">上月</td>
										<td class="table_head_td" width="150px">本月</td>
										<td class="table_head_td" width="150px">昨天</td>
										<td class="table_head_td" width="150px">今天</td>
									</tr>
									<tr class="tr">
										<td class="td">訪客<br> Visitor</td>
										<td class="td">${visiter.num}人</td>
										<td class="td">${visiter.numlastmonth}人</td>
										<td class="td">${visiter.nummonth}人<span style="background: #ddd;padding: 3px;" > <fmt:formatNumber value="${(visiter.nummonth-visiter.numlastmonth)*100/visiter.numlastmonth}" pattern="0.0"/>% </span></td>
										<td class="td">${visiter.numyesterday}人</td>
										<td class="td">${visiter.numday}人<span style="background: #ddd;padding: 3px;" > <fmt:formatNumber value="${(visiter.numday-visiter.numyesterday)*100/visiter.numyesterday}" pattern="0.0"/>% </span></td>
									</tr>
									<tr class="tr">
										<td class="td">瀏覽量<br>Page View</td>
										<td class="td">${pv.num}</td>
										<td class="td">${pv.numlastmonth}</td>
										<td class="td">${pv.nummonth}<span style="background: #ddd;padding: 3px;" > <fmt:formatNumber value="${(pv.nummonth-pv.numlastmonth)*100/pv.numlastmonth}" pattern="0.0"/>% </span></td>
										<td class="td">${pv.numyesterday}</td>
										<td class="td">${pv.numday}<span style="background: #ddd;padding: 3px;" > <fmt:formatNumber value="${(pv.numday-pv.numyesterday)*100/pv.numyesterday}" pattern="0.0"/>% </span></td>
									</tr>
								</table>
								 <div id="chart_div" style="width: 100%; height: 300px;"></div>
								<br><br>
							<h1>Last agents</h1>
							<table class="table">

								<tr class="table_head">
									<td class="table_head_td">Agent</td>
									<td class="table_head_td" width="130px">OS</td>
									<td class="table_head_td" width="150px">Browser</td>
								</tr>


								<c:forEach var="product" items="${list}">
									<tr class="tr">
										<td class="td">${product.userAgent}</td>
										<td class="td"><c:if
												test="${fn:contains(product.user_os, 'Windows7')}">
												<img src="images/os/windows_7.png" width="16px" />
											</c:if> <c:if test="${fn:contains(product.user_os, 'WindowsXP')}">
												<img src="images/os/windows.png" width="16px" />
											</c:if> <c:if test="${fn:contains(product.user_os, 'mac')}">
												<img src="images/os/mac.png" width="16px" />
											</c:if> <c:if test="${fn:contains(product.user_os, 'Safari')}">
												<img src="images/os/Safari.png" width="16px" />
											</c:if> <c:if test="${fn:contains(product.user_os, 'Android')}">
												<img src="images/os/android.jpg" width="16px" />
											</c:if> <c:if test="${fn:contains(product.user_os, 'iPad')}">
												<img src="images/os/ipad.jpg" width="16px" />
											</c:if> <c:if test="${fn:contains(product.user_os, 'iPhone')}">
												<img src="images/os/iphone.png" width="16px" />
											</c:if> ${product.user_os}</td>
										<td class="td"><c:if
												test="${fn:contains(product.user_browser, 'Internet Explorer 9')}">
												<img src="images/browsers/internetexplorer6.png"
													width="16px" />
											</c:if> <c:if
												test="${fn:contains(product.user_browser, 'Internet Explorer 8')}">
												<img src="images/browsers/internetexplorer8.png"
													width="16px" />
											</c:if> <c:if
												test="${fn:contains(product.user_browser, 'Internet Explorer 7')}">
												<img src="images/browsers/internetexplorer7.png"
													width="16px" />
											</c:if> <c:if
												test="${fn:contains(product.user_browser, 'Internet Explorer 6')}">
												<img src="images/browsers/internetexplorer6.png"
													width="16px" />
											</c:if> <c:if test="${fn:contains(product.user_browser, 'Chrome')}">
												<img src="images/browsers/chrome.png" width="16px" />
											</c:if> <c:if test="${fn:contains(product.user_browser, 'Firefox')}">
												<img src="images/browsers/firefox3.png" width="16px" />
											</c:if> <c:if test="${fn:contains(product.user_browser, 'Safari')}">
												<img src="images/browsers/safari.png" width="16px" />
											</c:if> <c:if test="${fn:contains(product.user_browser, 'mozilla')}">
												<img src="images/browsers/mozilla.png" width="16px" />
											</c:if> <c:if
												test="${fn:contains(product.user_browser, 'netscape')}">
												<img src="images/browsers/netscape.png" width="16px" />
											</c:if> <c:if test="${fn:contains(product.user_browser, 'opera')}">
												<img src="images/browsers/opera.png" width="16px" />
											</c:if> ${product.user_browser}</td>
									</tr>
								</c:forEach>
							</table>
							</BR>
							</BR>
							<h1>站外來源 lastReferer</h1>
							<table class="table">
								<tr class="table_head">
									<td class="table_head_td" width="130px">日期</td>
									<td class="table_head_td" width="130px">時間</td>
									<td class="table_head_td">來源位址</td>
									<td class="table_head_td" width="130px">IP</td>
								</tr>


								<c:forEach var="lastReferer" items="${lastReferer}">
									<tr class="tr">
										<td class="td"><fmt:formatDate
												value="${lastReferer.viewedate}" pattern="yyyy/MM/dd" /></td>
										<td class="td"><fmt:formatDate
												value="${lastReferer.viewedate}" pattern="HH:mm:ss" /></td>
										<td class="td"><a class="table_a"
											href="${lastReferer.lastReferer}">${lastReferer.lastReferer}</a></td>
										<td class="td">${lastReferer.remoteAddr}</td>
									</tr>
								</c:forEach>
							</table>

							<br />
							<br />
							<br />
							<br />
			<%@ include file="view_model/footer.jsp"%>
							<br />
							<br />

						</div>

						</article>
					</div>

				</div>
			</div>
		</div>
<%@ include file="view_model/admin_menu.jsp"%>
	</div>
</body>
</html>