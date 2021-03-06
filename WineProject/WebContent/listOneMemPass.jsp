<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="member.model.*"%>

<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO"); //MemberServlet.java (Controller), 存入req的memberVO物件 (包括幫忙取出的memberVO, 也包括輸入資料錯誤時的memberVO物件)
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="<%=request.getContextPath()%>/favicon.ico"
	type="image/x-icon" />
<html>
<head>
<meta http-equiv="Content-Language" content="zh-tw">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>酒迷| 歷久彌新的香濃口感</title>
<meta content="酒迷 | 歷久彌新的香濃口感。" name="description" />
<meta content="酒迷 | 歷久彌新的香濃口感" name="keywords" />
<link href="<%=request.getContextPath()%>/style/reset.css"
	rel="stylesheet" type="text/css" />
<link
	href="<%=request.getContextPath()%>/style/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script
	src="<%=request.getContextPath()%>/style/bootstrap/js/bootstrap.js"></script>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.fancybox.js?v=2.1.4"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style/jquery.fancybox.css?v=2.1.4"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style/index.css?v=1.0"
	media="screen" />

<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/index.js?v=1.0"></script>


<style type="text/css">
.listtag{line-height: 40px;width:150px;display:inline-block;font-weight: bold;}
#content{background: url('<%=request.getContextPath()%>/images/mem_infobg.png');
background-repeat: no-repeat;
background-position: bottom right;
background-color: #fff;}
</style>
<script type="text/javascript">
	
</script>
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="twitter.github.com/bootstrap/assets/js/html5shiv.js"></script>
    <![endif]-->
</head>

<body>
	<div id="shadow_bg">
		<div id="body">
			<%@ include file="../view_model/index_header.jsp"%>
			<div id="main">
				<div id="sidebar">
					<%@ include file="../view_model/product_list.jsp"%>
					<%@ include file="../view_model/index_left_hotsale.jsp"%>
				</div>

				<div id="content">
					<%@ include file="../view_model/page_alert.htm"%>
					<div>
			<div align=center>
		<h2>修改會員密碼</h2><hr>
			<div class="well font-small"align=left >

						<strong><span class="label label-info">注意!</span></strong> <br><span
							style="margin-left: 50px">請輸入一個包含英文大小寫、數字的密碼，且長度超過8個字元來達到最佳的帳號安全性。</span>
					</div>
		</div>
						<form id="MyForm" width="300px" align=center title="酒迷網"
							subtitle="密碼修改" method="post"
							action="<%request.getContextPath();%>/WineProject/MemberUpdate.do">

							<input type="hidden" name="action" value="password_update">
								<input type="hidden" name="m_no" value="${m_no}"> <input
									type="hidden" name="action1" match="m_pwd"
									value="${sessionScope.m_pwd}"> <sapn style="color:red">${error}<c:forEach
											var="errorMsg" items="${errorMsgs}">${errorMsg}</c:forEach></sapn>
							<p align=center>
								<span class="listtag"><b>請輸入舊密碼：</b></span><input type="password" name="m_pwd" require="true"
									label="舊密碼" "/>
							</p>
							<p align=center>
								<span class="listtag"><b>請輸入新的密碼：</b></span><input type="password" name="Password" require="true"
									label="新的密碼" "/>
							</p>
							<p align=center>
								<span class="listtag"><b>確認新密碼：</b></span><input type="password" name="PasswordChecked" match="Password"
									label="確認新密碼" />
							</p>
<br><br>
							<button type="submit"  style="width: 370px;height: 40px;" class="btn btn-primary"> <i class="icon-ok icon-white"></i>  送出修改</button>

						</form>
					</div>

					<%@ include file="../view_model/index_fast_login.htm"%>


					<br class="clear" />
				</div>
				<br class="clear" />
			</div>
		</div>
		<%@ include file="../view_model/index_footer.htm"%>

	</div>

	</div>
</body>

</html>