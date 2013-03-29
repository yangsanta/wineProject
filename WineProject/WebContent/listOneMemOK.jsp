<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<%@ page import="member.model.*"%>
<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO"); //MemberServlet.java (Controller), 存入req的memberVO物件 (包括幫忙取出的memberVO, 也包括輸入資料錯誤時的memberVO物件)
	request.setAttribute("memberVO", memberVO);
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
<script type="text/javascript">
$(document).ready(function()
  { $('#MyForm').formly({'onBlur':false});
   });
</script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/index.js?v=1.0"></script>
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

	<c:if test="${not empty newCoupon}">
		<div>感謝您的註冊！您獲得了新的折價券:<br/>
				<div>
				${newCoupon.c_price}<br/>${newCoupon.c_key}<br/>
				</div>
		</div>
	</c:if>
	<div>
	<img
				src="<%request.getContextPath();%>/WineProject/images/${memberVO.m_pic}"
				width="160px" height="200px" />
		<sapn>會員資料修改完成！</sapn>

			<p align=right>帳號：<sapn>${memberVO.m_id}"<sapn>
			<p align=right>姓名：<sapn>${memberVO.getM_name()}<sapn>
			
			<p align=right>e-Mail：<sapn>${memberVO.getM_email()}<sapn>		
			<p align=right>生日：<sapn>${memberVO.getM_bday()}<sapn>
			<p align=right>行動電話：<sapn>${memberVO.getM_mobile()}<sapn>
			<p align=right>通訊地址：<sapn>${memberVO.getM_addr()}<sapn>
			<p align=right>圖片：<sapn>${memberVO.getM_pic()}<sapn>
			<p align=right>安全提問：<sapn>${memberVO.getM_safety_q()}<sapn>
			<p align=right>答案：<sapn>${memberVO.getM_safety_a()}<sapn>
			
			<input type="button" value="返回會員專區" onclick="window.location='<%request.getContextPath();%>/WineProject/member/Member_Info.jsp'">
			
		
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