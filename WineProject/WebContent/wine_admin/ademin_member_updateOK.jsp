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
	<style type="text/css">
	.buttons li.member a {
	background:url(<%=request.getContextPath()%>/wine_admin/images/sprite.png) no-repeat -113px -2px;
	margin:0 -21px 0 0;
	padding:0 21px 0 0;
}
.buttons li.member a :hover{color:yellow;}
.buttons li.member a em {top:40px;}
.buttons .member .ico1 span {background-position:0 -23px;}
.buttons .member .ico2 span {background-position:-2px -73px;}
.buttons .ico3 span {background-position:-2px -97px;}
.buttons .member .ico3 span {background-position:-2px -126px;}
.buttons .ico4 span {background-position:-2px -153px;}
.buttons .member .ico4 span {background-position:-2px -178px;}
.buttons .ico5 span {background-position:-1px -206px;}
.buttons .member .ico5 span {background-position:-2px -232px;}
.buttons .ico6 span {background-position:-2px -262px;}
.buttons .member .ico6 span {background-position:-3px -291px;}
.buttons .ico7 span {background-position:-4px -321px;}
.buttons .member .ico7 span {background-position:-4px -352px;}
.buttons .ico8 span {background-position:-4px -380px;}
.buttons .member .ico8 span {background-position:-4px -415px;}
</style>
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
					會員資料修改完成！				
							<img src="<%request.getContextPath();%>/WineProject/images/${memberVO.m_pic}" style="vertical-align: top; width: 100px;"/>
							<p >會員編號：${memberVO.m_no}</p>
							<p >帳號：${memberVO.m_id}</p>
							<p >密碼：${memberVO.m_pwd}</p>
							<p >e-Mail：${memberVO.m_email}</p>
							<p >姓名：${memberVO.m_name}</p>														
							<p >生日：${memberVO.m_bday}</p>
							<p >行動電話：${memberVO.m_mobile}</p>
							<p >通訊地址：${memberVO.m_addr}</p>
							<p >圖片：${memberVO.m_pic}</p>
							<p >安全提問：${memberVO.m_safety_q}</p>
							<p >答案：${memberVO.m_safety_a}</p>
							<p >狀態：${memberVO.m_status}</p>
														
							<input type="button" value="返回會員列表" onclick="window.location='../wine_admin/ademin_member.jsp'">
													
					
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