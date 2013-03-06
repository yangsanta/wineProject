<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="discussion.model.*"%>
<%@ page import="reply.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 主題:${discussionVO.d_title}<br/> --%>
<%-- 發表日期:${discussionVO.d_datetime}<br/> --%>
<%-- 作者ID:${discussionVO.m_no}<br/> --%>
<%-- 內文:${discussionVO.d_context} --%>
<a href="<c:url value='/DiscussionList'/>?action=edit&d_no=${discussionVO.d_no}">編輯此文章</a>
<table  border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<td>主題:${discussionVO.d_title}</td>
		<td>發表日期:<fmt:formatDate value="${discussionVO.d_datetime}" pattern="yyyy/MM/dd HH:mm:ss"/></td>
		<td>作者帳號:${discussionVO.memberVO.m_id}</td>
	</tr>
	<tr>
		<td colspan="3">內文:${discussionVO.d_context}</td>
	</tr>
	<c:if test="${fn:length(discussionVO.replies)!=0}">
		<c:forEach var="i" begin="0" end="${fn:length(discussionVO.replies) - 1}">
			<tr>
				<td>推文:${discussionVO.replies[i].r_context}</td>
				<td>發表日期:<fmt:formatDate value="${discussionVO.replies[i].r_datetime}" pattern="yyyy/MM/dd HH:mm:ss"/></td>
				<td>作者帳號:${discussionVO.replies[i].memberVO.m_id}</td>
			</tr>
	</c:forEach>
	</c:if>
</table>
<!-- 	--留言功能 -->
	<form action="<c:url value='/reply'/>">
	快速留言：<textarea cols="50" rows="3" name="r_context"></textarea><br />
			<input type="submit" value="Send"/>
			<input type="hidden" name="action" value="insert">
			<input type="hidden" name="d_no" value="${discussionVO.d_no}">
	</form>
</body>
</html>