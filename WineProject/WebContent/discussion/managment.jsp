<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="discussion.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	background: #ad8667
		url('<%=request.getContextPath()%>/images/disz_bg.png');
}

table {
	border-top: 1px solid #ccc;
	color: #333
}

thead {
	background-color: rgba(114, 113, 113, 0.47);
	text-align: center;
	font-size: 12px;
}

thead tr:hover {
	background-color: rgba(0, 0, 0, 0);
}

td {
	border-bottom: 1px solid #ccc;
	padding: 5px;
}

tr:hover {
	background-color: rgb(255, 255, 255);
	border-bottom: 1px solid #000;
}

.img_type {
	Width: 40px;
	text-align: center;
}

.tdcenter {
	text-align: center;
}

.table_time {
	Width: 120px;
	font-size: 14px;
}

.table_title {
	font-weight: bold;
}
</style>

</head>
<body>
<!-- 搜尋功能條						 -->
						<div align="right">
							<p style="color:red;font-size:12pt">${msgbox}</p>
							<form action="DiscussionManagment.do" method="post" class="form-search">

								<input type="text" name="txtsrch" class="input-medium search-query"/>
								<select name="srchThing" style="width:100px">
									<option value="d_title">主題</option>
									<option value="d_context">文章內容</option>
									<option value="m_id">會員帳號</option>
								</select>
								<input type="submit" value="search" class="btn btn-primary"/>
								<input type="hidden" name="action" value="search"/>
							</form>
						</div>
<!-- --------------- -->
<div id="content">
	<table class="table table-condensed">
		<thead>
			<tr>
				<th>類型</th>
				<th width="600px">主題</th>
				<th>作者</th>
				<th>回復數</th>
				<th>發表時間</th>
				<th>修改</th>
				<th>隱藏</th>
			</tr>
		</thead>
		<c:forEach var="discussionVO" items="${list}" begin="${pageIndex}"
			end="${pageIndex+rowsPerPage-1}">
			<tr>
				<td class="img_type"><img src="images/discussion_paper.gif"></td>
				<td class="table_title"><a
					href="DiscussionManagment.do?d_no=${discussionVO.d_no}&action=getOne">${discussionVO.d_title}</a></td>
				<td class="tdcenter">${discussionVO.memberVO.m_id}</td>
				<td class="tdcenter">${fn:length(discussionVO.replies)}</td>
				<td class="table_time"><fmt:formatDate
						value="${discussionVO.d_datetime}" pattern="yyyy/MM/dd HH:mm:ss" /></td>
				<td>
					 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/DiscussionManagment.do">
			    	 <input type="submit" value="修改" class="btn btn-success">
			     	 <input type="hidden" name="d_no" value="${discussionVO.d_no}">
			     	 <input type="hidden" name="action"	value="edit"></FORM>
				</td>
				<td>
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/DiscussionManagment.do">
			    	  <input type="submit" value='<c:if test="${discussionVO.d_status=='ooo'}">隱藏</c:if><c:if test="${discussionVO.d_status=='xxx'}">顯示</c:if>' class='<c:if test="${discussionVO.d_status=='xxx'}">btn btn-success</c:if><c:if test="${discussionVO.d_status=='ooo'}">btn btn-primary</c:if>'>
			     	 <input type="hidden" name="d_no" value="${discussionVO.d_no}">
			     	 <input type="hidden" name="action"	value="invisible"></FORM>
				</td>
		</c:forEach>
	</table>
<div class="pagination pagination-centered">
	<ul>
		<c:if test="${rowsPerPage<rowNumber}">
			<c:if test="${pageIndex>=rowsPerPage}">
				<li class=""><a href="${url}?action=${action}&whichPage=1">
						&laquo; </a></li>
				<li class=""><a
					href="${url}?action=${action}&whichPage=${whichPage-1}">上一頁</a></li>
			</c:if>
		</c:if>

		<c:if test="${pageNumber > 1}">
			<c:forEach var="i" begin="1" end="${pageNumber}">
				<li class=""><a href="${url}?action=${action}&whichPage=${i}">${i}</a></li>
			</c:forEach>
		</c:if>

		<c:if test="${rowsPerPage<rowNumber}">
			<c:if test="${pageIndex<pageIndexArray[pageNumber-1]}">
				<li class=""><a
					href="${url}?action=${action}&whichPage=${whichPage+1}">下一頁</a></li>
				<li class=""><a
					href="${url}?action=${action}&whichPage=${pageNumber}">»</a></li>

			</c:if>
		</c:if>
	</ul>
</div>
</div>
</body>
</html>