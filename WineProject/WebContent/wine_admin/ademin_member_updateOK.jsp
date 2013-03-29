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
<link href="<%=request.getContextPath()%>/style/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
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
.listtag{width: 190px;
display: inline-block;
line-height: 30px;
font-size: 18px;
font-weight: bold;
text-align: right;}
table{font-size:16px}
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
											
				<table><tr><td>			
							<img src="<%request.getContextPath();%>/WineProject/images/${memberVO.m_pic}" style="vertical-align: top; width: 100px;"/>
							</td><td>
							<span class="listtag">會員編號：</span><span>${memberVO.m_no}</span><br>
							<span class="listtag">帳號：</span><span>${memberVO.m_id}</span><br>
							<span class="listtag">密碼：</span><span>${memberVO.m_pwd}</span><br>
							<span class="listtag">e-Mail：</span><span>${memberVO.m_email}</span><br>
							<span class="listtag">姓名：</span><span>${memberVO.m_name}</span><br>														
							<span class="listtag">生日：</span><span>${memberVO.m_bday}</span><br>
							<span class="listtag">行動電話：</span><span>${memberVO.m_mobile}</span><br>
							<span class="listtag">通訊地址：</span><span>${memberVO.m_addr}</span><br>
							<span class="listtag">圖片：</span><span>${memberVO.m_pic}</span><br>
							<span class="listtag">安全提問：</span><span>${memberVO.m_safety_q}</span><br>
							<span class="listtag">答案：</span><span>${memberVO.m_safety_a}</span><br>
							<span class="listtag">狀態：</span><span>${memberVO.m_status}</span><br>
						</td></tr></table>	
							<input type="button" value="返回會員列表" class="btn btn-primary" onclick="window.location='../wine_admin/ademin_member.jsp'">
													
					
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