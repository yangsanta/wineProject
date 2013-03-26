<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="member.model.*"%>
<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO"); //MemberServlet.java (Controller), 存入req的memberVO物件 (包括幫忙取出的memberVO, 也包括輸入資料錯誤時的memberVO物件)
%>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/favicon.ico" />
<link rel="icon" href="<%=request.getContextPath()%>/favicon.ico" type="image/x-icon" />
<head>
<meta charset="utf-8">
<title>酒迷|後台管理系統</title>
<link media="all" rel="stylesheet" type="text/css" href="../wine_admin/css/all.css" />
		 <c:if test="${sessionScope.admin_access!='y'}"><meta http-equiv="refresh" content="0; url=index.jsp"></c:if>
	<script src="http://code.jquery.com/jquery.js"></script>
	<script type="text/javascript">
		window.jQuery|| document.write('<script type="text/javascript" src="js/jquery-1.7.2.min.js"><\/script>');
	</script>
<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="css/ie.css" /><![endif]-->
<script type="text/javascript" src="../wine_admin/js/ademin_member.js"></script>
<link rel="stylesheet" href="../wine_admin/css/ademin_member.css" type="text/css" />
<script type="text/javascript">
$(document).ready(function()
  { $('#MyForm').formly({'onBlur':false});
   });
</script>
</head>
<body>
	<div id="wrapper">
		<div id="content">
			<div class="c1">
				<%@ include file="view_model/total_tab.jsp"%>
				<div class="tabs">
					<div id="tab-1" class="tab">
						<article>			
						<div style="margin:0 auto;width:1000px;">
						<h2>會員資料修改完成！</h2>
						<div style="margin:0 auto; width:400px;">						
						<form id="MyForm" width="300px" align=center title="會員資料修改完成！" method="post" action="mem.do" >						
							
							<p align=left>流水號：<%=memberVO.getM_no()%></p>
							<p align=left>帳號：<%=memberVO.getM_id()%></p>
							<p align=left>密碼：<%=memberVO.getM_pwd()%></p>
							<p align=left>e-Mail：<%=memberVO.getM_email()%></p>
							<p align=left>姓名：<%=memberVO.getM_name()%></p>														
							<p align=left>生日：<%=memberVO.getM_bday()%></p>
							<p align=left>行動電話：<%=memberVO.getM_mobile()%></p>
							<p align=left>通訊地址：<%=memberVO.getM_addr()%></p>
							<p align=left>圖片：<%=memberVO.getM_pic()%></p>
							<p align=left>安全提問：<%=memberVO.getM_safety_q()%></p>
							<p align=left>答案：<%=memberVO.getM_safety_a()%></p>
							<p align=left>狀態：<%=memberVO.getM_status()%></p>
														
							<input type="button" value="返回會員列表" onclick="window.location='../wine_admin/ademin_member.jsp'">
													
						</form></div>
						<%@ include file="view_model/footer.jsp"%>
							</div>						
						</article>
					</div>

				</div>
			</div>
		</div>
<%@ include file="view_model/admin_menu.jsp"%>
	</div>
</body>
</html>