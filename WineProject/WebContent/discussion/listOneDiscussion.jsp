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
<link rel="icon" href="<%=request.getContextPath()%>/favicon.ico"
	type="image/x-icon" />
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
			<script src="<%=request.getContextPath()%>/js/jquery.validate.min.js"
				type="text/javascript"></script>
			<script src="<%=request.getContextPath()%>/js/messages_tw.js"
				type="text/javascript"></script>
			<script type="text/javascript"
				src="<%=request.getContextPath()%>/js/tinymcec/jscripts/tiny_mce.js"></script>
			<script type="text/javascript"
				src="<%=request.getContextPath()%>/js/tinymcec/tinymac.js"></script>
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

.m_pic {width: 140px;}
</style>
			<script type="text/javascript" charset="utf-8">
				$(document).ready(function() {
					$('#commentForm').validate({
						success : function(label) {
							label.addClass("success").text("Ok!");
						}
					});
				});
			</script>
</head>
<body>

	<body>
		<div id="shadow_bg">
			<div id="body">
				<%@ include file="../view_model/index_header.jsp"%>
				<div id="main">


					<div id="content">
						<!-- 搜尋功能條						 -->
						<div align="right">
							<form action="DiscussionList.do" method="post"
								class="form-search">

								<c:if test="${msgbox!=null}">
									<div class="alert" id="just_login">
										<button type="button" class="close" data-dismiss="alert">&times;</button>
										<span class="label label-warning">warning!</span> <span>
											${msgbox}</span>
									</div>
								</c:if>
								<form action="DiscussionList.do" method="post"
									class="form-search">

									<input type="text" name="txtsrch"
										class="input-medium search-query" /> <select name="srchThing"
										style="width: 100px">
										<option value="d_title">主題</option>
										<option value="d_context">文章內容</option>
									</select> <input type="submit" value="search" class="btn btn-primary " />
									<input type="hidden" name="action" value="search" />
								</form>
						</div>
						<!-- ---------------			-->
						<div align="center">
							<%@ include file="../view_model/page_alert.htm"%>
							<h2>文章</h2>
						</div>
						<span>首頁 »<a
							href="<%=request.getContextPath()%>/DiscussionList.do?action=getAll">
								討論區</a> » 文章
						</span>
						<div class="well font-small">

							<strong><span class="label label-success">歡迎!</span></strong> <br><span
								style="margin-left: 50px">你可以在這邊與各方的酒友一起討論酒香的芬芳以及在味蕾上跳動的喜悅。現在就發表一篇文章來與大家認識認識吧。</span>
						</div>
						<%-- 主題:${discussionVO.d_title}<br/> --%>
						<%-- 發表日期:${discussionVO.d_datetime}<br/> --%>
						<%-- 作者ID:${discussionVO.m_no}<br/> --%>
						<%-- 內文:${discussionVO.d_context} --%>
						<c:if
							test="${sessionScope.m_no==requestScope.discussionVO.memberVO.m_no}">
							<a
								href="<c:url value='/DiscussionList.do'/>?action=edit&d_no=${discussionVO.d_no}"><button
									class="btn btn-large btn-primary" style="float: right"
									type="button">
									<i class="icon-pencil icon-white"></i> 編輯此文章
								</button> </a>
						</c:if>




						<table id="dis_table" class="dis_table" border="1" cellspacing="1">
							<tr>
								<td colspan="2" class="table_top_title">主題:${discussionVO.d_title}</td>
							</tr>
							<tr>
								<td class="table_member">
									<div class="defalut">
										<br> <img
											src="<%=request.getContextPath() %>/images/${discussionVO.memberVO.m_pic}"
											style="background: #ededed; padding: 5px;" class="m_pic"><br>
													作者帳號:${discussionVO.memberVO.m_id}<br>
													UID:14381${discussionVO.memberVO.m_no} <br>
													
									</div>
								</td>
								<td style="background: #fff"><span style="font-size: 10px">發表日期:<fmt:formatDate
											value="${discussionVO.d_datetime}"
											pattern="yyyy/MM/dd HH:mm:ss" /></span>
									<hr style="margin: 0">
										<div style="padding: 10px">${discussionVO.d_context}</div></td>
							</tr>
						</table>




						<c:if test="${fn:length(discussionVO.replies)!=0}">
							<c:forEach var="i" begin="0"
								end="${fn:length(discussionVO.replies) - 1}">
								<c:if test="${discussionVO.replies[i].r_status=='ooo'}">

									<table border="1" class="dis_table" cellspacing="1"
										style="margin-top: 20px">
										<tr>
											<td class="table_member"><div class="defalut">
													${discussionVO.replies[i].memberVO.m_id}<br> <img
														src="<%=request.getContextPath() %>/images/${discussionVO.replies[i].memberVO.m_pic}"
														style="background: #ededed; padding: 5px;" class="m_pic"><br>
															UID:14381${discussionVO.replies[i].memberVO.m_no} 	
												</div></td>
											<td style="background: #fff"><span
												style="font-size: 10px">發表日期:<fmt:formatDate
														value="${discussionVO.replies[i].r_datetime}"
														pattern="yyyy/MM/dd HH:mm:ss" /></span>
												<hr style="margin: 0">
													<div style="padding: 10px">${discussionVO.replies[i].r_context}</div></td>
										</tr>
									</table>
								</c:if>
							</c:forEach>
						</c:if>
						<hr style="margin: 0">
							<br /> <!-- 	--留言功能 -->
						<c:if test="${m_no==null}"><span style="color:red;font-size:20px;font-weight:bold;">&lt;欲回文請登入會員&gt;</span></c:if>
						<c:if test="${m_no!=null}">
							<form action="<c:url value='/reply.do'/>" method="post"
								id="commentForm" class="cmxform">
								<img src="<%=request.getContextPath()%>/images/fast_discus.png" width=30px style="margin-bottom: 20px;">
								<span style="margin-bottom:10px;font-weight: bold;font-size:16px">快速留言：</span>
								<textarea cols="200" rows="6" name="r_context" class="required"
									minlength="10"
									style="margin: 0px 0px 10px; width: 866px; height: 200px"></textarea>
								<br /> <input type="submit" value="送出"
									class="btn btn-primary" /> <input type="hidden" name="action"
									value="insert"> <input type="hidden" name="d_no"
									value="${discussionVO.d_no}">
							</form>
						</c:if>




							<br class="clear" /> <%@ include
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
