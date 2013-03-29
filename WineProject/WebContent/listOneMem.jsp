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
		<script src="http://code.jquery.com/jquery.js"></script>
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
						<%@ include file="../view_model/index_left_hotsale.jsp"%>	
					</div>
	
					<div id="content">
					<%@ include file="../view_model/page_alert.htm"%>

	<div>
		<div align=center>
			<img
				src="<%request.getContextPath();%>/WineProject/images/${memberVO.m_pic}"
				width="160px" height="200px" /> <br />
			<form method="post" action="<%request.getContextPath();%>/WineProject/MenberPicByUser" enctype="multipart/form-data">
				<input type="hidden" name="m_no" value="${memberVO.m_no}">
			
				<input type="submit" value="上傳圖片" /><input
					style="background: #FFFFFF" type="file" name="p_pic" size="40" />
			</form>
		</div>
		<form id="MyForm" width="300px" align=center title="酒迷網"
			subtitle="會員資料修改" method="post"
			action="<%request.getContextPath();%>/WineProject/MemberUpdate">
			<p align=center>
				帳號：<span>${memberVO.m_id}</span><input type="hidden" name="m_id"
					value="${memberVO.m_id}" />
			</p>
			<p align=center>
				姓名：<input type="text" name="m_name" require="true" label="姓名"
					value="${memberVO.m_name}" />
			</p>
			<p align=center>
				e-Mail：<input type="text" validate="email" name="m_email"
					value="${memberVO.m_email}" />
			</p>
			<p align=center>
				生日：<input type="text" validate="bday" name="m_bday"
					value="${memberVO.m_bday}" />
			</p>
			<p align=center>
				行動電話：<input type="text" validate="mobile" name="m_mobile"
					value="${memberVO.m_mobile}" />
			</p>
			<p align=center>
				通訊地址：<input type="text" name="m_addr" value="${memberVO.m_addr}" />
			</p>
			<p align=center>
				安全提問：<input type="text" name="m_safety_q"
					value="${memberVO.m_safety_q}" />
			</p>
			<p align=center>
				答案：<input type="text" name="m_safety_a"
					value="${memberVO.m_safety_a}" />
			</p>
			<p align=center>
				<input type="hidden" name="m_status" value="${memberVO.m_status}" />
			</p>
<input type="hidden" name="m_pic" value="${memberVO.m_pic}" />
			<input type="hidden" name="action" value="member_update"> <input
				type="hidden" name="m_no" value="${memberVO.m_no}"> <input
				type="submit" value="送出修改" /> <input type="reset" value="清除" />
				</form>
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