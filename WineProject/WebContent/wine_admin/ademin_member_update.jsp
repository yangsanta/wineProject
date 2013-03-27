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
						<div >						
						<form id="MyForm" width="300px" align=center title="酒迷網" subtitle="會員資料修改" method="post" action="mem.do" >
						
							<p align=right>流水號：<input type="text" name="m_no" value="<%=memberVO.getM_no()%>" readonly="readonly"/></p>
							<p align=right>帳號：<input type="text" name="m_id" value="<%=memberVO.getM_id()%>" readonly="readonly"/></p>
							<p align=right>姓名：<input type="text" name="m_name" require="true" label="姓名" value="<%=memberVO.getM_name()%>"/></p>
							<p align=right>密碼：<input type="password" name="m_pwd" require="true" label="密碼" value="<%=memberVO.getM_pwd()%>"/></p>
							<p align=right>e-Mail：<input type="text" validate="email" name="m_email" value="<%=memberVO.getM_email()%>" /></p>																				
							<p align=right>生日：<input type="text" validate="bday" name="m_bday" value="<%=memberVO.getM_bday()%>"/><br>
							<p align=right>行動電話：<input type="text" validate="mobile" name="m_mobile" value="<%=memberVO.getM_mobile()%>"/></p>
							<p align=right>通訊地址：<input type="text" name="m_addr" value="<%=memberVO.getM_addr()%>"/></p>
							<p align=right>圖片：<input type="text" name="m_pic" value="<%=memberVO.getM_pic()%>"/></p>
							<p align=right>安全提問：<input type="text" name="m_safety_q" value="<%=memberVO.getM_safety_q()%>"/></p>
							<p align=right>答案：<input type="text" name="m_safety_a" value="<%=memberVO.getM_safety_a()%>"/></p>
							<p align=right>狀態：<input type="text" name="m_status" value="<%=memberVO.getM_status()%>"/></p>
							
							<input type="hidden" name="action" value="update">
							<input type="hidden" name="m_no" value="<%=memberVO.getM_no()%>">
							<input type="submit" value="送出修改" />
							<input type="reset" value="清除" />
							
						</form>
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