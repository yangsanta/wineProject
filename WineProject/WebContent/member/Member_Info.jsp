<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

.mem_in_coupons{background-color: #FBFBFB;
padding: 20px;
margin:10px 0;
-webkit-border-radius: 4px;
-moz-border-radius: 4px;
-o-border-radius: 4px;
-khtml-border-radius: 4px;
-webkit-box-shadow: rgba(0,0,0,0.35) 0 1px 3px;
-moz-box-shadow: rgba(0,0,0,0.35) 0 1px 3px;
box-shadow: rgba(0,0,0,0.35) 0 1px 3px;
overflow: auto;}
.mem_div {
	overflow: auto;
}

.mem_in_inner {
	width: 200px;
	margin: 30px;
	float: left;
}

.mem_in_title {
	font-weight: bold;
	margin-bottom:10px;
}
#content{background: url('<%=request.getContextPath()%>/images/mem_infobg.png');
background-repeat: no-repeat;
background-position: bottom right;
background-color: #fff;}
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

<%-- 					<%@ include file="../view_model/index_left_hotsale.jsp"%> --%>
<div class="abgne-news-scroll">
	<div align="center">
		<span class="title">暢銷商品</span>
	</div>
	<ul>
<jsp:useBean id="hot_product2" class="product.model.ProductDAO">
	 <c:forEach var="product" items="${hot_product2.topProduct}" >				
		<li style="height:110px">
			<div>
				<img
					src="<%=request.getContextPath()%>/images/products/${product.p_pic}"
					style="width: 50px;" /> <span>${product.p_name}<br> <br>特價$${product.p_price}！
					<a href="<%=request.getContextPath()%>/product/DisplayProducts.do?action=getOne_For_Display&pId=${product.p_no}"><br>
					  <button style="margin-top:10px;" class="btn btn-mini btn-danger" type="button">熱烈搶購!</button></a>
				</span>
			</div>
		</li>
							</c:forEach>
</jsp:useBean>
	
	</ul>
</div>
				</div>

				<div id="content">
					<%@ include file="/view_model/page_alert.htm"%>
					<c:if test="${update=='success'}">
<div class="alert" id="just_login" >
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  <span class="label label-success">Success!</span> <br> <span > 會員資料已成功修改!</span>
</div></c:if>
					<c:if test="${update=='error'}">
<div class="alert" id="just_login" >
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  <span class="label label-important">Error!</span> <br> <span > 會員資料修改失敗!</span>
</div></c:if>
<c:if test="${sessionScope.access=='y'}">
					${m_id} 您好
					<jsp:useBean id="memberDAO" class="member.model.MemberDAO" scope="page">
					<c:set var="memberVO" value="${memberDAO.findByPrimaryKey(m_no)}"></c:set>
					<hr>
					<div style="overflow:auto; ">
					<div style="width:200px;float:left">
					<img  src="<%request.getContextPath();%>/WineProject/images/${memberVO.m_pic}"
				width="160px" height="200px"/></td><td  valign="top" style="padding-left:10px"></div>
					<div style="width:300px;float:left">
					<span style="line-height: 40px;width:80px;display:inline-block"><b>姓名：</b></span>${memberVO.m_name}<br>
					<span style="line-height: 40px;width:80px;display:inline-block"><b>E-mail：</b></span>${memberVO.m_email}<br>
					<span style="line-height: 40px;width:80px;display:inline-block"><b>生日：</b></span>${memberVO.m_bday}<br>
					<span style="line-height: 40px;width:80px;display:inline-block"><b>行動電話：</b></span>${memberVO.m_mobile}<br>
					<span style="line-height: 40px;width:80px;display:inline-block"><b>通訊地址：</b></span>${memberVO.m_addr}<br></div>
					</div>

					
				</jsp:useBean>
			<jsp:useBean id="couponDAO" class="coupon.model.CouponDAO" scope="page">
			<c:set var="theCoupons" value="${couponDAO.findByM_no(m_no)}"></c:set>
						<div class="mem_in_outer">
							<span class="mem_in_title"><b>優惠券(${fn:length(theCoupons)}張)</b></span>
							<div class="mem_in_coupons">
								<c:forEach var="coupon" items="${theCoupons}">
							<a href="#" rel="tooltip" data-placement="bottom" style="margin-right:10px" title="優惠卷序號:${coupon.c_key} ">
							<img src="<%=request.getContextPath()%>/images/ticket${coupon.c_price}.png" width=50px /></a> 
								</c:forEach>
							</div>
					</jsp:useBean>		
							
							
							<span class="mem_in_title">會員資料</span>
							<div class="mem_div">
								<div class="mem_in_inner" style="text-align :center">
								<a style="text-decoration:none" href="<%request.getContextPath();%>/WineProject/MemberUpdate?action=getOne_For_Display&m_no=${m_no}"><img src="<%=request.getContextPath()%>/images/nav_safety.png" width=150px /><br>
									修改會員資料</a>
								</div>
								<div class="mem_in_inner" style="text-align :center">
							<c:if test="${fn:length(memberVO.m_fbuid) == 0}">
								<a style="text-decoration:none" href="<%=request.getContextPath()%>/listOneMemPass.jsp"><img src="<%=request.getContextPath()%>/images/mem_safety.png" width=150px />
								<br>修改密碼</a>
							</c:if>
							<c:if test="${fn:length(memberVO.m_fbuid) != 0}">
								您是FB會員，無法修改密碼!!!
							</c:if>
								</div>
							</div>
							<div class="mem_in_title">
								<b>訂單查詢</b>
							</div>
							<div class="mem_in_orders">
								<table border="1" class="table table-bordered table-hover">
									<thead style="background: #ccc">
										<tr>
											<th>編號</th>
											<th>訂購時間</th>
											<th>訂單金額</th>
											<th>商品名稱</th>
											<th>數量</th>
											<th>處理狀態</th>
										</tr>
									</thead>
									<tbody>
									<jsp:useBean id="ordersDAO" class="orders.model.OrdersDAO" scope="page">
			<c:set var="theOrders" value="${ordersDAO.getOrdersByM_no(m_no)}"></c:set>
										<c:forEach var="order" items="${theOrders}">
											<tr>
												<td>${order.o_no}</td>
												<td vertical-align:middle>${order.o_date}</td>
												<td vertical-align:middle>${order.o_after_sales}</td>
												<td><c:forEach var="detail"
														items="${order.order_details}"> ${detail.productVO.p_name} <br>
													</c:forEach></td>
												<td><c:forEach var="detail"
														items="${order.order_details}"> ${detail.p_num} 瓶<br>
													</c:forEach></td>
												<td>${order.o_status}</td>
											</tr>
										</c:forEach>
										</jsp:useBean>		
									</tbody>
								</table>

							</div>
							<div class="bar"></div>
						</div>
						</c:if>
						<c:if test="${sessionScope.access!='y'}">
						請先<a href='login.jsp'>登入</a>來使用完整的會員功能
						<script Language="JavaScript">
    setTimeout("location.href='login.jsp'",3000);
    </script>
							</c:if>
						<%@ include file="/view_model/index_fast_login.htm"%>


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