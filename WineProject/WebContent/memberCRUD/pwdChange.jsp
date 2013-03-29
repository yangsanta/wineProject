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

<title>會員密碼修改</title>
</head>
<body >
	<div>
		<form id="MyForm" width="300px" align=center title="酒迷網" subtitle="密碼修改" method="post" action="<%request.getContextPath();%>/WineProject/memberCRUD/MemberUpdate">
			
			<input type="hidden" name="action" value="password_update"> 
			<input type="hidden" name="m_no" value="${m_no}">
			<input type="hidden" name="action1" match="m_pwd" value="${sessionScope.m_pwd}"> 
			<p align=right>請輸入舊密碼：<input type="text" name="m_pwd" require="true" label="舊密碼" value="${memberVO.m_pwd}"/></p>
			<p align=right>請輸入新的密碼<input type="text" name="Password" require="true" label="新的密碼" value="${memberVO.m_pwd}"/></p>
			<p align=right>確認新密碼<input type="text" name="PasswordMatch" match="Password" label="確認新密碼"/></p>
			
			<input type="submit" value="送出修改" /> <input type="reset" value="清除" />
		
		</form>
	</div>
</body>
</html>
