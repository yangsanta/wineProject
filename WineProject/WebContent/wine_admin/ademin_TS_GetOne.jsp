<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link rel="shortcut icon" href="<%=request.getContextPath()%>/favicon.ico" />
<link rel="icon" href="<%=request.getContextPath()%>/favicon.ico" type="image/x-icon" />
<head>
<meta charset="utf-8">
	<title>酒迷|後台管理系統</title>
	<link media="all" rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/wine_admin/css/all.css" />
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript">
		window.jQuery|| document.write('<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.9.0.min.js"><\/script>');
	</script>
	<link href="<%=request.getContextPath()%>/style/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script src="<%=request.getContextPath()%>/style/bootstrap/js/bootstrap.js"></script>
		<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="css/ie.css" /><![endif]-->
			<style type="text/css">
	.buttons li.TS a {
	background:url(<%=request.getContextPath()%>/wine_admin/images/sprite.png) no-repeat -113px -2px;
	margin:0 -21px 0 0;
	padding:0 21px 0 0;
}
.buttons li.TS a :hover{color:yellow;}
.buttons li.TS a em {top:40px;}
.buttons .TS .ico1 span {background-position:0 -23px;}
.buttons .TS .ico2 span {background-position:-2px -73px;}
.buttons .ico3 span {background-position:-2px -97px;}
.buttons .TS .ico3 span {background-position:-2px -126px;}
.buttons .ico4 span {background-position:-2px -153px;}
.buttons .TS .ico4 span {background-position:-2px -178px;}
.buttons .ico5 span {background-position:-1px -206px;}
.buttons .TS .ico5 span {background-position:-2px -232px;}
.buttons .ico6 span {background-position:-2px -262px;}
.buttons .TS .ico6 span {background-position:-3px -291px;}
.buttons .ico7 span {background-position:-4px -321px;}
.buttons .TS .ico7 span {background-position:-4px -352px;}
.buttons .ico8 span {background-position:-4px -380px;}
.buttons .TS .ico8 span {background-position:-4px -415px;}
</style>
</head>
<body>
	<div id="wrapper">
		<div id="content">
			<div class="c1">
		<%@ include file="view_model/total_tab.jsp"%>
				<div class="tabs">
					<div id="tab-1" class="tab">

						<div class="text-section">
							<h1>商品專區</h1>
							<p>可在這邊修改商品喔!!!</p>
						</div>

						<div style="width: 80%; margin: 0 auto">
	<div align="right">
	<form action="<%=request.getContextPath()%>/wine_admin/set_timing_sales" method="post">
							<input type="submit" value="修改" class="btn btn-primary"/>
							<input type="hidden" name="ts_id" value="${ts.ts_id}" />
							<input type="hidden" name="action" value="edit" />
	</form>
</div>
<table class="table table-condensed">
	<thead>
		<tr>
			<th>限惠商品</th>
			<th>限惠價格</th>
			<th>限惠日期</th>
			<th>商品圖片</th>
			<th>特惠標語</th>
			<th>特惠內容</th>
			<th>已賣出數</th>
		</tr>
	</thead>
			<tbody>
				<tr>
					<td>${ts.productVO.p_name}</td>
					<td>${ts.ts_price}</td>
					<td>${ts.ts_date}</td>
					<td><img src="<%=request.getContextPath()%>/images/timingSales/${ts.ts_pic}" /></td>
					<td>${ts.ts_slogan}</td>
					<td>${ts.ts_content}</td>
					<td>${ts.ts_totalsale}</td>
				</tr>
			</tbody>
</table>

						
					<%@ include file="view_model/footer.jsp"%>
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