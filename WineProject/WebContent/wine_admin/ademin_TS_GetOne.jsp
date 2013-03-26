<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="<%=request.getContextPath()%>/favicon.ico" type="image/x-icon" />
<head>
<meta charset="utf-8">
	<title>酒迷|後台管理系統</title>
	<link media="all" rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/wine_admin/css/all.css" />
	<script src="http://code.jquery.com/jquery.js"></script>
	<script type="text/javascript">
		window.jQuery|| document.write('<script type="text/javascript" src="js/jquery-1.7.2.min.js"><\/script>');
	</script>
	<link href="<%=request.getContextPath()%>/style/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
		<script src="http://code.jquery.com/jquery.js"></script>
		<script src="<%=request.getContextPath()%>/style/bootstrap/js/bootstrap.js"></script>
		<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="css/ie.css" /><![endif]-->
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