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

	<div>

			<span>帳號：${memberVO.m_id}</span><br>
			<span>姓名：${memberVO.getM_name()}</span><br>
			<span>密碼：${memberVO.getM_pwd()}</span><br>
			<span>e-Mail：${memberVO.getM_email()}</span><br>
			<span>生日：${memberVO.getM_bday()}</span><br>
			<span>行動電話：${memberVO.getM_mobile()}</span><br>
			<span>通訊地址：${memberVO.getM_addr()}</span><br>
			<span>圖片：${memberVO.getM_pic()}</span><br>
			<span>安全提問：${memberVO.getM_safety_q()}</span><br>
			<span>答案：${memberVO.getM_safety_a()}</span><br>
			
			<input type="button" value="返回會員專區" onclick="window.location='MemberService'">
			
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