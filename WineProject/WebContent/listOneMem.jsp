<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<%@ page import="member.model.*"%>

<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO"); //MemberServlet.java (Controller), 存入req的memberVO物件 (包括幫忙取出的memberVO, 也包括輸入資料錯誤時的memberVO物件)
%>
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

<script type="text/javascript">
$(document).ready(function()
  { $('#MyForm').formly({'onBlur':false});
   });
</script>
<style type="text/css">
#content{background: url('<%=request.getContextPath()%>/images/mem_infobg.png');background-repeat: no-repeat;
background-position: bottom right;
background-color: #fff;}
.listtag{line-height: 40px;width:90px;display:inline-block;font-weight: bold;}
</style>
<script type="text/javascript">


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
					<%@ include file="../view_model/page_alert.htm"%>

	<div>
			<div align=center>
		<h2>修改會員資料</h2><hr>
		</div>
		<div style="overflow:auto; ">
		<div style="width:200px;float:left;padding-top: 40px;">
					<img
				src="<%request.getContextPath();%>/WineProject/images/memberPic/${memberVO.m_pic}"
				width="160px" height="200px" /> <br />
			<form method="post" action="<%request.getContextPath();%>/WineProject/MenberPicByUser" enctype="multipart/form-data">
				<input type="hidden" name="m_no" value="${memberVO.m_no}" class="btn btn-info btn-small">
				<input style="background: #FFFFFF;width: 200px;" type="file" name="p_pic" />
				<button type="submit" style="width: 180px;height: 35px;"  class="btn btn-info "><i class="icon-plus icon-white"></i>上傳圖片</button>
			</form>
		</div>
		<div style="width:400px;float:left">
		<form id="MyForm" width="300px" align=center title="酒迷網"
			subtitle="會員資料修改" method="post"
			action="<%request.getContextPath();%>/WineProject/MemberUpdate.do">
			<p align=center>
				帳號：<span>${memberVO.m_id}</span><input type="hidden" name="m_id"
					value="${memberVO.m_id}" />
			</p>
			<p align=center>
				<span class="listtag"><b>姓名：</b></span><input type="text" name="m_name" require="true" label="姓名"
					value="${memberVO.m_name}" />
			</p>
			<p align=center>
				<span class="listtag"><b>E-mail：</b></span><input type="text" validate="email" name="m_email"
					value="${memberVO.m_email}" />
			</p>
			<p align=center>
				<span class="listtag"><b>生日：</b></span><input type="text" validate="bday" name="m_bday"
					value="${memberVO.m_bday}" />
			</p>
			<p align=center>
				<span class="listtag"><b>行動電話：</b></span><input type="text" validate="mobile" name="m_mobile"
					value="${memberVO.m_mobile}" />
			</p>
			<p align=center>
				<span class="listtag"><b>通訊地址：</b></span><input type="text" name="m_addr" value="${memberVO.m_addr}" />
			</p>
			<p align=center>
				<span class="listtag"><b>安全提問：</b></span><input type="text" name="m_safety_q"
					value="${memberVO.m_safety_q}" />
			</p>
			<p align=center>
				<span class="listtag"><b>答案：</b></span><input type="text" name="m_safety_a"
					value="${memberVO.m_safety_a}" />
			</p>
			<p align=center>
				<input type="hidden" name="m_status" value="${memberVO.m_status}" />
			</p>
<input type="hidden" name="m_pic" value="${memberVO.m_pic}" />
			<input type="hidden" name="action" value="member_update"> <input
				type="hidden" name="m_no" value="${memberVO.m_no}"> <button
				type="submit" class="btn btn-primary" style="width: 280px;height: 40px" ><i class="icon-ok icon-white"></i> 存 檔 送 出	 </button>
				</form>
		</div>
		</div>
	

		
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