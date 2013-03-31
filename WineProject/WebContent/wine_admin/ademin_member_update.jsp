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
	window.jQuery|| document.write('<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.9.0.min.js"><\/script>');
	</script>
<link href="<%=request.getContextPath()%>/style/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="css/ie.css" /><![endif]-->
<script type="text/javascript" src="../wine_admin/js/ademin_member.js"></script>
<link rel="stylesheet" href="../wine_admin/css/ademin_member.css" type="text/css" />
<link type="text/css" href="<%=request.getContextPath()%>/style/jquery.datepick.css" rel="stylesheet">

<script src="<%=request.getContextPath()%>/js/jquery.validate.min.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/messages_tw.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.datepick.js"></script>


<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		$('#MForm').validate({
			success : function(label) {
				label.addClass("success").text("Ok!");
			}
		});
		$('#m_bday').datepick({
			dateFormat : 'yyyy-mm-dd'
		});
		$('#inlineDatepicker').datepick({
			onSelect : showDate
		});
		

		
	});

	function showDate(date) {
		alert('The date chosen is ' + date);
	}

</script>
<style type="text/css">
.datepick-month-year {
width: 80px;height: 30px !important;
}
.datepick-month-header{height: 30px;}
label{display: inline-block;margin-left: 10px;}
label.error {
	background: url("<%=request.getContextPath()%>/images/unchecked.gif")
		no-repeat 0px 0px;
	padding-left: 16px;
}

label.success {
	background: url("<%=request.getContextPath()%>/images/checked.gif")
		no-repeat 0px 0px;
	padding-left: 16px;
}
</style>

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
						<div class="text-section">
							<h1>會員中心</h1>
							<p>管理網站的所有會員資訊。</p>
						</div>		
						<div style="margin:0 auto ;width:1100px" >	
						<table style="margin-left: 100px;margin-top: 30px;"><tr><td>
						<form method="post" action="mempic"enctype="multipart/form-data">					
					<p >圖片：</p>
					
					<input type="hidden" name="m_no" value="${memberVO.m_no}"/>
					<img src="<%request.getContextPath();%>/WineProject/images/${memberVO.m_pic}" style="vertical-align: top; width: 100px;"/><br/>
					 <input	style="background: #FFFFFF" type="file" name="p_pic" size="40" /><br/> 
					 <button type="submit" class="btn btn-info" style="width: 150px;"><i class=" icon-plus icon-white"></i> 上傳圖片</button>		
					</form>
					</td><td>
					<p ><span style="font-size:20px;">您目前正在修改的是 會員編號：${memberVO.m_no}</span>
					<form id="MForm" title="酒迷網" subtitle="會員資料修改" method="post" action="mem" >
						
							<input type="hidden" name="m_pic" value="${memberVO.m_pic}"/>
							<input type="hidden" name="m_no" value="${memberVO.m_no}"/></p>
							<span style="width:90px;display:inline-block" >帳號：</span><span>${memberVO.m_id}<input type="hidden" name="m_id" value="${memberVO.m_id}""/></p>
							<span style="width:90px;display:inline-block" >姓名：</span><span><input type="text" name="m_name" require="true" label="姓名" value="${memberVO.m_name}" class="required" minlength="2"/></p>
							<input type="hidden" name="m_pwd" require="true" label="密碼" value="${memberVO.m_pwd}"/></p>
							<span style="width:90px;display:inline-block" >E-mail：</span><span><input type="text" validate="email" name="m_email" value="${memberVO.m_email}" class="required email"></p>																				
							<span style="width:90px;display:inline-block" >生日：</span><span><input id="m_bday" type="text" validate="bday" name="m_bday" value="${memberVO.m_bday}" readonly
										style="cursor: pointer"/><br>
							<span style="width:90px;display:inline-block" >行動電話：</span><span><input type="text" validate="mobile" name="m_mobile" value="${memberVO.m_mobile}" class="required number" minlength="10" maxlength="10"/></p>
							<span style="width:90px;display:inline-block" >通訊地址：</span><span><input type="text" name="m_addr" value="${memberVO.m_addr}" class="required" minlength="10"/></p>
							
							<span style="width:90px;display:inline-block" >安全提問：</span><span><input type="text" name="m_safety_q" value="${memberVO.m_safety_q}"/></p>
							<span style="width:90px;display:inline-block" >答案：</span><span><input type="text" name="m_safety_a" value="${memberVO.m_safety_a}"/></p>
							<span style="width:90px;display:inline-block" >狀態：</span><select name="m_status">
  <option value="0" <c:if test="${memberVO.m_status  eq 0}">selected</c:if>>封鎖停用</option>
  <option value="1" <c:if test="${memberVO.m_status  eq 1}">selected</c:if>>正常使用</option>
</select><br>

							
							<input type="hidden" name="action" value="update">
							<input type="hidden" name="m_no" value="<%=memberVO.getM_no()%>">
							<input type="submit" value="送出修改"  class="btn btn-primary"/>
							
						</form></td></tr></table>
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