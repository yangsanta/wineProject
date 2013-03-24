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
<script src="http://code.jquery.com/jquery.js"></script>
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
.coupons {
	border-width: 2px;
	border-style: solid;
	background: rgb(255, 205, 47);
	width: 100px;
	float: left;
	margin: 30px;
}

.mem_in_coupons {
	overflow: auto;
}

.mem_in_inner {
	width: 200px;
	margin: 30px;
	float: left;
}

.mem_in_title {
	font-weight: bold
}
</style>
<script type="text/javascript">
	
</script>
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="twitter.github.com/bootstrap/assets/js/html5shiv.js"></script>
    <![endif]-->
</head>

<body>
	<div id="shadow_bg">
		<div id="body">
			<%@ include file="/view_model/index_header.jsp"%>
			<div id="main">
				<div id="sidebar">
					<%@ include file="../view_model/product_list.jsp"%>
					<%@ include file="../view_model/index_left_hotsale.jsp"%>
				</div>

				<div id="content">
					<%@ include file="/view_model/page_alert.htm"%>

					${m_id} 您好
					<hr>
						<div class="mem_in_outer">
							<span class="mem_in_title"><b>優惠券</b></span>
							<div class="mem_in_coupons">
								<c:forEach var="coupon" items="${theCoupons}">
									<div class="coupons">
										${coupon.c_price}<br>${coupon.c_key} 
									</div>
								</c:forEach>
							</div>
							<div class="mem_in_coupons">
								<span class="mem_in_title"><b>各項設定/維護</b></span><br>
								<a href="#"><b>可訂購時通知我</b></a>
							</div>
							<span class="mem_in_title">會員資料</span>
							<div class="mem_in_coupons">
								<div class="mem_in_inner">
									<a href="#">修改會員資料</a>
								</div>
								<div class="mem_in_inner">
									<a href="#">修改密碼</a>
								</div>
							</div>
							<div class="mem_in_title">
								<b>訂單查詢</b>
							</div>
							<div class="mem_in_orders">
								<table border="1">
									<thead style="background: #ccc">
										<tr>
											<th>訂單編號</th>
											<th>訂購時間</th>
											<th>訂單金額</th>
											<th>商品名稱</th>
											<th>數量</th>
											<th>處理狀態</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="order" items="${theOrders}">
											<tr>
												<td>${order.o_no}</td>
												<td>${order.o_date}</td>
												<td>${order.o_after_sales}</td>
												<td><c:forEach var="detail"
														items="${order.order_details}"> ${detail.productVO.p_name} <br>
													</c:forEach></td>
												<td><c:forEach var="detail"
														items="${order.order_details}"> ${detail.p_num} <br>
													</c:forEach></td>
												<td>${order.o_status}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>

							</div>

							<div class="bar"></div>
						</div><%@ include file="/view_model/index_fast_login.htm"%>


					<br class="clear" />
				</div>
				<br class="clear" />
			</div>
		</div>
		<%@ include file="/view_model/index_footer.htm"%>

	</div>

	</div>
</body>

</html>