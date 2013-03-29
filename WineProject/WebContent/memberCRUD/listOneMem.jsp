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

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="../memberCRUD/js/memberCRUD.js"></script>
<link rel="stylesheet" href="../memberCRUD/css/memberCRUD.css"
	type="text/css" />
<script type="text/javascript">
	$(document).ready(function() {
		$('#MyForm').formly({
			'onBlur' : false
		});
	});
</script>

<title>會員資料修改</title>
</head>
<body>
	<div>
		<div align=center>
			<img
				src="<%request.getContextPath();%>/WineProject/images/${memberVO.m_pic}"
				width="160px" height="200px" /> <br />
			<form method="post" action="<%request.getContextPath();%>/WineProject/memberCRUD/MenberPicByUser" enctype="multipart/form-data">
				<input type="hidden" name="m_no" value="${memberVO.m_no}">
			
				<input type="submit" value="上傳圖片" /><input
					style="background: #FFFFFF" type="file" name="p_pic" size="40" />
			</form>
		</div>
		<form id="MyForm" width="300px" align=center title="酒迷網"
			subtitle="會員資料修改" method="post"
			action="<%request.getContextPath();%>/WineProject/memberCRUD/MemberUpdate">
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
		<c:forEach var="a" items="${errorMsgs}">${a }</c:forEach>
		          
	</div>
</body>
</html>
