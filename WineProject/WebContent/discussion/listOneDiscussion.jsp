<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="discussion.model.*"%>
<%@ page import="reply.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<html>
<head>
<meta http-equiv="Content-Language" content="zh-tw">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>酒迷 | 討論區</title>
		<meta content="酒迷 | 歷久彌新的香濃口感。" name="description" />
		<meta content="酒迷 | 歷久彌新的香濃口感" name="keywords" />
		<link href="style/reset.css" rel="stylesheet" type="text/css" />
		<link href="style/bootstrap/css/bootstrap.min.css" rel="stylesheet"
			media="screen">
			<script src="http://code.jquery.com/jquery.js"></script>
			<script src="style/bootstrap/js/bootstrap.js"></script>
			<script type="text/javascript" src="js/jquery.fancybox.js?v=2.1.4"></script>
			<link rel="stylesheet" type="text/css"
				href="style/jquery.fancybox.css?v=2.1.4" media="screen" />
			<link rel="stylesheet" type="text/css" href="style/index.css?v=1.1"
				media="screen" />
			<script type="text/javascript" src="js/index.js?v=1.0"></script>
			<style type="text/css">
#main {
	color: #333
}

#content {
	margin: 0px;
	background: #ad8667 url('images/disz_bg.png');
}

</style>
			<script type="text/javascript">
				
			</script>
</head>
<body>

	<body>
		<div id="shadow_bg">
			<div id="body">
				<div id="search">
					<input name="searchInput" type="text"
						class="search-query iconsearch" placeholder="搜尋"
						style="width: 70px; height: 10px; padding-left: 24px;"
						onfocus="this.style.width='100px'"
						onblur="this.style.width='70px'">
				</div>
				<br class="clear" />
				<%@ include file="../view_model/index_header.htm"%>
				<div id="main">


					<div id="content">
						<div align="center">
							<h2>文章</h2>
						</div>
						<span>首頁 » 討論區 » 文章</span>
						<div class="well font-small">

							<strong><span class="label label-success">歡迎!</span></strong> <br><span
								style="margin-left: 50px">你可以在這邊與各方的酒友一起討論酒香的芬芳以及在味蕾上跳動的喜悅。現在就發表一篇文章來與大家認識認識吧。</span>
						</div>
						<%-- 主題:${discussionVO.d_title}<br/> --%>
						<%-- 發表日期:${discussionVO.d_datetime}<br/> --%>
						<%-- 作者ID:${discussionVO.m_no}<br/> --%>
						<%-- 內文:${discussionVO.d_context} --%>
						<a
							href="<c:url value='/DiscussionList'/>?action=edit&d_no=${discussionVO.d_no}"><button
								class="btn btn-large btn-primary" style="float: right"
								type="button">
								<i class="icon-pencil icon-white"></i> 編輯此文章
							</button> </a>
						<table border='1' bordercolor='#CCCCFF' width='800'>
							<tr>
								<td>主題:${discussionVO.d_title}</td>
								<td>發表日期:<fmt:formatDate value="${discussionVO.d_datetime}"
										pattern="yyyy/MM/dd HH:mm:ss" /></td>
								<td>作者帳號:${discussionVO.memberVO.m_id}</td>
							</tr>
							<tr>
								<td colspan="3">內文:${discussionVO.d_context}</td>
							</tr>
							<c:if test="${fn:length(discussionVO.replies)!=0}">
								<c:forEach var="i" begin="0"
									end="${fn:length(discussionVO.replies) - 1}">
									<tr>
										<td>推文:${discussionVO.replies[i].r_context}</td>
										<td>發表日期:<fmt:formatDate
												value="${discussionVO.replies[i].r_datetime}"
												pattern="yyyy/MM/dd HH:mm:ss" /></td>
										<td>作者帳號:${discussionVO.replies[i].memberVO.m_id}</td>
									</tr>
								</c:forEach>
							</c:if>
						</table>
						<!-- 	--留言功能 -->
						<form action="<c:url value='/reply'/>">
							快速留言：
							<textarea cols="50" rows="3" name="r_context"></textarea>
							<br /> <input type="submit" value="Send" /> <input
								type="hidden" name="action" value="insert"> <input
								type="hidden" name="d_no" value="${discussionVO.d_no}">
						</form>
						<br class="clear" />
						<%@ include file="../view_model/index_fast_login.htm"%>
					</div>
					<br class="clear" />
				</div>
			</div>
			<%@ include file="../view_model/index_footer.htm"%>

		</div>

		</div>
	</body>
</html>