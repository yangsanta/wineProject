<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>會員 ${m_id} 專區</title>
<link rel="stylesheet" href="../style/Member_Info.css">
</head>
<body>
	${m_id} 您好
	<hr>
	<div class="mem_in_outer">
		<div class="mem_in_title">優惠券</div>

		<div class="mem_in_title">各項設定/維護</div>
		<div class="mem_in_inner">
			<a href="#">可訂購時通知我</a>
		</div>

		<div class="mem_in_title">會員資料</div>
		<div class="mem_in_inner">
			<a href="#">修改會員資料</a>
		</div>
		<div class="mem_in_inner">
			<a href="#">修改密碼</a>
		</div>

		<div class="mem_in_title">訂單查詢</div>
		<div class="mem_in_orders">
			<table>
				<thead>
					<tr><th>訂單編號</th><th>訂購時間</th><th>訂單金額</th><th>商品名稱</th><th>數量</th><th>處理狀態</th></tr>
				</thead>
				<tbody>
					<c:forEach var="order" items="${theOrders}">
						<tr><td>${order.o_no}</td><td>${order.o_date}</td><td>${order.o_after_sales}</td><td>商品名稱</td><td>數量</td><td>${order.o_status}</td></tr>
					</c:forEach>
				</tbody>
			</table>
			<c:forEach var="order" items="${theOrders}">
				${order.o_date}<br>
			</c:forEach>
		</div>

		<div class="bar"></div>
	</div>
</body>
</html>