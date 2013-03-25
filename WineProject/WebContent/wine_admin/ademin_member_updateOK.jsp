<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="member.model.*"%>

<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO"); //MemberServlet.java (Controller), 存入req的memberVO物件 (包括幫忙取出的memberVO, 也包括輸入資料錯誤時的memberVO物件)
%>
<link rel="shortcut icon" href="../wine_admin/images/favicon.ico" />
<link rel="icon" href="favicon.ico" type="../wine_admin/images/image/x-icon" />
<head>
<meta charset="utf-8">
<title>酒迷|後台管理系統</title>
<link media="all" rel="stylesheet" type="text/css" href="../wine_admin/css/all.css" />
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript">
	window.jQuery
			|| document
					.write('<script type="text/javascript" src="j../wine_admin/s/jquery-1.7.2.min.js"><\/script>');
</script>
<script type="text/javascript" src="../wine_admin/js/jquery.main.js"></script>
<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="css/ie.css" /><![endif]-->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
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
				<div class="controls">
					<nav class="links">
					<ul>
						<li><a href="#" class="ico1">訊息 <span class="num">26</span></a></li>
						<li><a href="#" class="ico2">Alerts <span class="num">5</span></a></li>
						<li><a href="#" class="ico3">訂單<span class="num">3</span></a></li>
					</ul>
					</nav>
					<div class="profile-box">
						<span class="profile"> <a href="#" class="section"> <img
								class="image" src="../wine_admin/images/img1.png" alt="image description"
								width="26" height="26" /> <span class="text-box">
									Welcome <strong class="name">楊明華</strong>
							</span>
						</a> <a href="#" class="opener">opener</a>
						</span> <a href="#" class="btn-on">On</a>
					</div>
				</div>
				<div class="tabs">
					<div id="tab-1" class="tab">
						<article>				
						<div >
						
						<form id="MyForm" width="300px" title="會員資料修改完成！" method="post" action="mem.do" >						
							流水號：&nbsp;&nbsp;&nbsp;<input type="text" name="m_no" value="<%=memberVO.getM_no()%>" readonly="readonly" /><br>
							帳號：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="m_id" value="<%=memberVO.getM_id()%>" readonly="readonly" /><br>
							密碼：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="m_pwd" require="true" label="密碼" readonly="readonly" value="<%=memberVO.getM_pwd()%>" /><br>
							e-Mail：&nbsp;&nbsp;&nbsp;<input type="text" name="m_email" readonly="readonly" value="<%=memberVO.getM_email()%>" /><br>
							姓名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="m_name" require="true" label="賬號" readonly="readonly" value="<%=memberVO.getM_name()%>" /><br>														
							生日：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="m_bday" readonly="readonly" value="<%=memberVO.getM_bday()%>" /><br>
							行動電話：<input type="text" name="m_mobile" readonly="readonly" value="<%=memberVO.getM_mobile()%>" /><br>
							通訊地址：<input type="text" name="m_addr" readonly="readonly" value="<%=memberVO.getM_addr()%>" /><br>
							圖片：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="m_pic" readonly="readonly" value="<%=memberVO.getM_pic()%>" /><br>
							安全提問：<input type="text" name="m_safety_q" readonly="readonly" value="<%=memberVO.getM_safety_q()%>" /><br>
							答案：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="m_safety_a" readonly="readonly" value="<%=memberVO.getM_safety_a()%>" /><br>
							狀態：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="m_status" readonly="readonly" value="<%=memberVO.getM_status()%>" /><br>
														
							<input type="button" value="返回會員列表" onclick="window.location='../wine_admin/ademin_member.jsp'">
						
						</form>
						</div>
						
						</article>
					</div>

				</div>
			</div>
		</div>
		<aside id="sidebar"> <strong class="logo"><a href="#">lg</a></strong>
		<ul class="tabset buttons">
			<li class="active"><a href="#tab-1" class="ico1"><span>儀表板</span><font
					class="text_con">儀表板</font><em></em></a> <span class="tooltip"><span>儀表板</span></span>
			</li>
			<li><a href="#tab-2" class="ico2"><span>會員管理</span><font
					class="text_con">會員管理</font><em></em></a> <span class="tooltip"><span>會員管理</span></span>
			</li>
			<li><a href="#tab-3" class="ico3"><span>商品管理</span><font
					class="text_con">商品管理</font><em></em></a> <span class="tooltip"><span>商品管理</span></span>
			</li>
			<li><a href="#tab-4" class="ico4"><span>優惠設定</span><font
					class="text_con">優惠設定</font><em></em></a> <span class="tooltip"><span>優惠設定</span></span>
			</li>
			<li><a href="#tab-5" class="ico5"><span>討論區管理</span><font
					class="text_con">討論區管理</font><em></em></a> <span class="tooltip"><span>討論區管理</span></span>
			</li>
			<li><a href="#tab-6" class="ico6"> <span>空的</span><em></em>
			</a> <span class="num">常用</span> <span class="tooltip"><span>空的</span></span>
			</li>
			<li><a href="#tab-7" class="ico7"><span>訂單管理</span><em></em></a>
				<span class="tooltip"><span>訂單管理</span></span></li>
			<li><a href="#tab-8" class="ico8"><span>Settings</span><em></em></a>
				<span class="tooltip"><span>Settings</span></span></li>
		</ul>
		<span class="shadow"></span> </aside>
	</div>
</body>
</html>