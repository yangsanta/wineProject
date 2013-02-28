<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="discussion.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>�s�g�Q�װ�</title>
</head>
<body>
	<h2>�s�g�Q�װϦC��</h2>
	<a href="discussion/insertDiscussion.jsp">�o��s�峹</a>
	<table border='1' bordercolor='#CCCCFF' width='800'>
		<tr>
			<th>�D�D</th>
			<th>�@��ID</th>
			<th>�o��ɶ�</th>
		</tr>

		<c:forEach var="discussionVO" items="${list}" begin="${pageIndex}"
			end="${pageIndex+rowsPerPage-1}">
			<tr align='center' valign='middle'>
				<td><a href="DiscussionOne?d_no=${discussionVO.d_no}&action=getOne">${discussionVO.d_title}</a></td>
				<td>${discussionVO.m_no}</td>
				<td>${discussionVO.d_datetime}</td>
		</c:forEach>
	</table>
	-------------------------------------------------------------
	<table border="0">
		<tr>
			<c:if test="${rowsPerPage<rowNumber}">
				<c:if test="${pageIndex>=rowsPerPage}">
					<td><A href="${url}?whichPage=1">�ܲĤ@��</A>&nbsp;</td>
					<td><A href="${url}?whichPage=${whichPage-1}">�W�@�� </A>&nbsp;</td>
				</c:if>
				<c:if test="${pageIndex<pageIndexArray[pageNumber-1]}">
					<td><A href="${url}?whichPage=${whichPage+1}">�U�@��</A>&nbsp;</td>
					<td><A href="${url}?whichPage=${pageNumber}">�̫ܳ�@�� </A>&nbsp;</td>
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
							<option value="${i}">���ܲ�${i}��
						</c:forEach>
				</select> <input type="submit" value="�T�w"></td>
				</form>
			</tr>
		</table>
	</c:if>
</body>
</html>