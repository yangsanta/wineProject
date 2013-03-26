<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="member.model.*"%>

<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO"); //MemberServlet.java (Controller), 存入req的memberVO物件 (包括幫忙取出的memberVO, 也包括輸入資料錯誤時的memberVO物件)
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

<title>會員資料修改</title>
</head>
<body >
	<div>
		<form id="MyForm" width="300px" align=center title="酒迷網" subtitle="會員資料修改" method="post" action="mem.do">
		
			<p align=right>帳號：<input type="text" name="m_id" value="${m_id}" readonly="readonly"/></p>
			<p align=right>密碼：<input type="password" name="m_pwd" require="true" label="密碼" value="${m_pwd}"/></p>
			<p align=right>e-Mail：<input type="text" name="m_email" value="${m_email}"/></p>
			<p align=right>姓名：<input type="text" name="m_name" require="true" label="賬號" value="${m_name}"/></p>
			<p align=right>生日：<input type="text" name="m_bday" value="${m_bday}"/></p>
			<p align=right>行動電話：<input type="text" name="m_mobile" value="${m_mobile}"/></p>
			<p align=right>通訊地址：<input type="text" name="m_addr" 	value="${m_addr}"/></p>
			<p align=right>圖片：<input type="text" name="m_pic" value="${m_pic}"/></p>
			<p align=right>安全提問：<input type="text" name="m_safety_q" value="${m_safety_q}"/></p>
			<p align=right>答案：<input type="text" name="m_safety_a" value="${m_safety_a}"/></p>
			<p align=right>狀態：<input type="text" name="m_status" value="${m_status}"/></p>
			
			<input type="hidden" name="action" value="member_update"> 
			<input type="hidden" name="m_no" value="${m_no}">
			<input type="submit" value="送出修改" /> <input type="reset" value="清除" />
			
		</form>
	</div>
</body>
</html>
