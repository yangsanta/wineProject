<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="member.model.*"%>
<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO"); //MemberServlet.java (Controller), 存入req的memberVO物件 (包括幫忙取出的memberVO, 也包括輸入資料錯誤時的memberVO物件)
	request.setAttribute("memberVO", memberVO);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="../memberCRUD/js/memberCRUD.js"></script>
<link rel="stylesheet" href="../memberCRUD/css/memberCRUD.css" type="text/css" />
<script type="text/javascript">
$(document).ready(function()
  { $('#MyForm').formly({'onBlur':false});
   });
</script>

<title>會員資料修改完成！</title>
</head>
<body >	

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
			
			<input type="button" value="返回會員專區" onclick="window.location='../member/Member_Info.jsp'">
			
		
	</div>
</body>
</html>
