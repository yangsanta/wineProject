<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<%=request.getContextPath()%>/style/reset.css"
	rel="stylesheet" type="text/css" />
<link
	href="<%=request.getContextPath()%>/style/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script src="http://code.jquery.com/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/style/bootstrap/js/bootstrap.js"></script>
<style type="text/css">
#main {
	color: #333
}

#content {
	margin: 0px;
	background: #ad8667 url('images/disz_bg.png');
}

.defalut {
	padding: 0 20px 20px 20px
}

.dis_table {
	border-color: rgb(209, 202, 202);
	border-width: 1px;
	border-style: solid;
	width: 100%
}

.table_member {
	width: 200px;
	background: #E8F3FD;
}

.table_top_title {
	line-height: 31px;
	padding-left: 1em;
	background: #2F589C
		url(http://bbswefong.myweb.hinet.net/images/default/header_bg.gif);
	background-repeat: repeat-x;
	background-position: 0 0;
	color: #FFF;
}

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
<title>討論區-文章</title>
</head>
<body>
	<!-- 搜尋功能條						 -->
	<div align="right">
		<p style="color: red; font-size: 12pt">${msgbox}</p>
		<form action="DiscussionManagment.do" method="post"
			class="form-search">

			<input type="text" name="txtsrch" class="input-medium search-query" />
			<select name="srchThing" style="width: 100px">
				<option value="d_title">主題</option>
				<option value="d_context">文章內容</option>
				<option value="m_id">會員帳號</option>
			</select> <input type="submit" value="search" class="btn btn-primary" /> <input
				type="hidden" name="action" value="search" />
		</form>
	</div>
	<!-- --------------- -->
	<div align="right">
		<FORM METHOD="post"	ACTION="<%=request.getContextPath()%>/DiscussionManagment.do">
			<input type="submit" value="修改此文章" class="btn btn-success"> 
			<input type="hidden" name="d_no" value="${discussionVO.d_no}">
			<input type="hidden" name="action" value="edit">
		</FORM>
	</div>
	<table border="1" cellspacing="1" class="table table-condensed">
		<tr>
			<td colspan="2">主題:${discussionVO.d_title}</td>
		</tr>
		<tr>
			<td class="table_member">
				<div>
					作者帳號:${discussionVO.memberVO.m_id}<br> <img
						src="http://placekitten.com/100/100"
						style="background: #ededed; padding: 5px;"><br> 初入社會<br>UID:1438832
					<br>帖子:9 <br>精華:0 <br>積分:4 <br>註冊時間:2006-3-18
				</div>
			</td>
			<td style="background: #fff"><span style="font-size: 10px">發表日期:<fmt:formatDate
						value="${discussionVO.d_datetime}" pattern="yyyy/MM/dd HH:mm:ss" /></span>
				<hr style="margin: 0">
				<div style="padding: 10px">${discussionVO.d_context}</div></td>
		</tr>
	</table>
	<!-- 回文內容 -->
	<c:if test="${fn:length(discussionVO.replies)!=0}">
	<c:forEach var="i" begin="0"
		end="${fn:length(discussionVO.replies) - 1}">
	<div>
		<FORM METHOD="post"	ACTION="<%=request.getContextPath()%>/DiscussionManagment.do">
					<input type="submit" value="隱藏此回文"/>
					<input type="hidden" name="${discussionVO.replies[i].d_no}" value="d_no"/>
					<input type="hidden" name="${discussionVO.replies[i].r_no}" value="r_no"/>
					<input type="hidden" name="${discussionVO.replies[i].r_context}" value="r_context"/>
					<input type="hidden" name="${discussionVO.replies[i].m_no}" value="m_no"/>
					<input type="hidden" name="${discussionVO.replies[i].r_datetime}" value="r_datetime"/>
					<input type="hidden" name="${discussionVO.replies[i].r_status}" value="r_status"/>
					<input type="hidden" name="${discussionVO.replies[i].r_final_edit}" value="r_final_edit"/>
					<input type="hidden" name="action" value="invisible"/>
		</FORM>
		<form action="DiscussionManagment.do" method="post">
					<input type="submit" value="刪除此回文"/>
					<input type="hidden" name="${discussionVO.replies[i].r_no}" value="r_no"/>
					<input type="hidden" name="action" value="delete"/>
		</form>
	</div>	
		<table border="1" class="dis_table" cellspacing="1"
			style="margin-top: 20px">
			<tr>
				<td class="table_member"><div class="defalut">
						${discussionVO.replies[i].memberVO.m_id}<br> <img
							src="http://placekitten.com/100/100"
							style="background: #ededed; padding: 5px;"><br> 初入社會<br>
						UID:1438832 <br> 帖子:9 <br> 精華:0 <br> 積分:4 <br>
						遊樂幣:0 代幣 <br> 閱讀權限:10 <br> 註冊時間:2006-3-18
					</div></td>
				<td style="background: #fff"><span style="font-size: 10px">發表日期:<fmt:formatDate
							value="${discussionVO.replies[i].r_datetime}"
							pattern="yyyy/MM/dd HH:mm:ss" /></span>
					<hr style="margin: 0">
					<div style="padding: 10px">${discussionVO.replies[i].r_context}</div></td>				
			</tr>
		</table>
	</c:forEach>
	</c:if>
</body>
</html>