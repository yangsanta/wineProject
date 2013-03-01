<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="discussion.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>酒迷討論區</title>
</head>
<body>
	<h2>酒迷討論區列表</h2>
	<a href="discussion/insertDiscussion.jsp">發表新文章</a>
	<table border='1' bordercolor='#CCCCFF' width='800'>
		<tr>
			<th>主題</th>
			<th>作者ID</th>
			<th>發文時間</th>
		</tr>

		<c:forEach var="discussionVO" items="${list}" begin="${pageIndex}"
			end="${pageIndex+rowsPerPage-1}">
			<tr align='center' valign='middle'>
				<td><a href="DiscussionOne?d_no=${discussionVO.d_no}&action=getOne">${discussionVO.d_title}</a></td>
				<td>${discussionVO.memberVO.m_id}</td>
				<td>${discussionVO.d_datetime}</td>
		</c:forEach>
	</table>
	第${whichPage}頁/第${pageNumber}頁
	<table border="0">
		<tr>
			<c:if test="${rowsPerPage<rowNumber}">
				<c:if test="${pageIndex>=rowsPerPage}">
					<td><A href="${url}?whichPage=1">至第一頁</A>&nbsp;</td>
					<td><A href="${url}?whichPage=${whichPage-1}">上一頁 </A>&nbsp;</td>
				</c:if>
				<c:if test="${pageIndex<pageIndexArray[pageNumber-1]}">
					<td><A href="${url}?whichPage=${whichPage+1}">下一頁</A>&nbsp;</td>
					<td><A href="${url}?whichPage=${pageNumber}">至最後一頁 </A>&nbsp;</td>
				</c:if>
			</c:if>
		</tr>
	</table>
	<c:if test="${pageNumber > 1}">
		<table border="0">
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<form method="post" action="${url}">
				<td><select size="1" name="whichPage">
						<c:forEach var="i" begin="1" end="${pageNumber}">
							<option value="${i}">跳至第${i}頁
						</c:forEach>
				</select> <input type="submit" value="確定"></td>
				</form>
			</tr>
		</table>
	</c:if>
</body>
</html>