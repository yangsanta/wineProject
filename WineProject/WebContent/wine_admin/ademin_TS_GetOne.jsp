<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<script type="text/javascript">window.jQuery || document.write('<script type="text/javascript" src="js/jquery-1.7.2.min.js"><\/script>');</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/wine_admin/js/jquery.main.js"></script>
<link href="<%=request.getContextPath()%>/style/bootstrap/css/bootstrap.min.css"
			rel="stylesheet" media="screen">
<script	src="<%=request.getContextPath()%>/style/bootstrap/js/bootstrap.js"></script>
</head>
<body>
<div align="right">
	<form action="<%=request.getContextPath()%>/set_timing_sales" method="post">
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
</body>
</html>