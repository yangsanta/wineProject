<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="discussion.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="<%=request.getContextPath()%>/favicon.ico"
	type="image/x-icon" />
<html>
<head>
<meta http-equiv="Content-Language" content="zh-tw">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>酒迷 | 討論區</title>
		<meta content="酒迷 | 歷久彌新的香濃口感。" name="description" />
		<meta content="酒迷 | 歷久彌新的香濃口感" name="keywords" />
		<link href="<%=request.getContextPath()%>/style/reset.css"
			rel="stylesheet" type="text/css" />
		<link
			href="<%=request.getContextPath()%>/style/bootstrap/css/bootstrap.min.css"
			rel="stylesheet" media="screen">
			<script src="http://code.jquery.com/jquery.js"></script>
			<script
				src="<%=request.getContextPath()%>/style/bootstrap/js/bootstrap.js"></script>
			<script type="text/javascript"
				src="<%=request.getContextPath()%>/js/jquery.fancybox.js?v=2.1.4"></script>
			<link rel="stylesheet" type="text/css"
				href="<%=request.getContextPath()%>/style/jquery.fancybox.css?v=2.1.4"
				media="screen" />
			<link rel="stylesheet" type="text/css"
				href="<%=request.getContextPath()%>/style/index.css?v=1.1"
				media="screen" />
			<script type="text/javascript"
				src="<%=request.getContextPath()%>/js/index.js?v=1.0"></script>
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
	background-color: rgb(255, 255, 255);;
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
			<script type="text/javascript">
				
			</script>
</head>

	<body>
		<div id="shadow_bg">
			<div id="body">
				<%@ include file="../view_model/index_header.jsp"%>
				<div id="main">


					<div id="content">
						<%@ include file="../view_model/page_alert.htm"%>
<!-- 搜尋功能條						 -->
						<div align="right">

							<form action="DiscussionList.do" method="post" class="form-search">
							<p style="color:red;font-size:12pt">${msgbox}</p>
							<form action="DiscussionList.do" method="post" class="form-search">

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
<!-- ---------------			-->
						<div align="center">
							<h2>討論區</h2>
						</div>
						<span><a href="<%=request.getContextPath()%>/index.jsp">首頁</a> » 討論區</span>
						<div class="well font-small">

							<strong><span class="label label-success">歡迎!</span></strong> <br><span
								style="margin-left: 50px">你可以在這邊與各方的酒友一起討論酒香的芬芳以及在味蕾上跳動的喜悅。現在就發表一篇文章來與大家認識認識吧。</span>
						</div>

						<a href="<c:if test="${m_no!=null}">discussion/insertDiscussion.jsp</c:if><c:if test="${m_no==null}">login.jsp</c:if>"><button
								class="btn btn-large btn-primary" style="float: right"
								type="button">
								<i class="icon-pencil icon-white"></i> 發表文章
							</button> </a> <br><br>
								<table border="0" width="100%" cellspacing="0" cellpadding="0">
									<thead>
										<tr>
											<td>類型</td>
											<td>主題</td>
											<td>作者</td>
											<td>回復數</td>
											<td>發表時間</td>
										</tr>
									</thead>

									<c:forEach var="discussionVO" items="${list}"
										begin="${pageIndex}" end="${pageIndex+rowsPerPage-1}">
										<tr>
											<td class="img_type"><img
												src="images/discussion_paper.gif"></td>
											<td class="table_title"><a
												href="DiscussionList.do?d_no=${discussionVO.d_no}&action=getOne">${discussionVO.d_title}</a></td>
											<td class="tdcenter">${discussionVO.memberVO.m_id}</td>
											<td class="tdcenter">${fn:length(discussionVO.replies)}</td>
											<td class="table_time"><fmt:formatDate
													value="${discussionVO.d_datetime}"
													pattern="yyyy/MM/dd HH:mm:ss" /></td>
									</c:forEach>
								</table>
								<div class="pagination pagination-centered"
									style="margin-top: 50px">
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
												<li class=""><a
													href="${url}?action=${action}&whichPage=${i}">${i}</a></li>
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
								</div> <br class="clear" /> <%@ include
									file="../view_model/index_fast_login.htm"%>
					</div>
					<br class="clear" />
				</div>
			</div>
			<%@ include file="../view_model/index_footer.htm"%>

		</div>

		</div>
	</body>
</html>


