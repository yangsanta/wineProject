<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link rel="shortcut icon" href="<%=request.getContextPath()%>/favicon.ico" />
<link rel="icon" href="<%=request.getContextPath()%>/favicon.ico" type="image/x-icon" />
	type="image/x-icon" />


<html>
<head>
<meta charset="utf-8">
	<title>酒迷|後台管理系統</title>
	<link media="all" rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/wine_admin/css/all.css" />
	<script src="http://code.jquery.com/jquery.js"></script>
	<link type="text/css"
		href="<%=request.getContextPath()%>/style/jquery.datepick.css"
		rel="stylesheet">
		<script type="text/javascript">
			window.jQuery
					|| document
							.write('<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.9.0.min.js"><\/script>');
		</script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/jquery.datepick.js"></script>
		<link href="<%=request.getContextPath()%>/style/reset.css"
			rel="stylesheet" type="text/css" />
		<link
			href="<%=request.getContextPath()%>/style/bootstrap/css/bootstrap.min.css"
			rel="stylesheet" media="screen">
			<script
				src="<%=request.getContextPath()%>/style/bootstrap/js/bootstrap.js"></script>
			<script src="<%=request.getContextPath()%>/js/jquery.validate.min.js"
				type="text/javascript"></script>
			<script src="<%=request.getContextPath()%>/js/messages_tw.js"
				type="text/javascript"></script>
			<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="css/ie.css" /><![endif]-->
			<script type="text/javascript" charset="utf-8">
				$(document).ready(function() {
					$('#commentForm').validate({
						success : function(label) {
							label.addClass("success").text("Ok!");
						}
					});

					$('#ts_date').datepick({
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
			<!-- TinyMCE -->
			<script type="text/javascript"
				src="<%=request.getContextPath()%>/js/tinymcec/jscripts/tiny_mce.js"></script>
			<script type="text/javascript"
				src="<%=request.getContextPath()%>/js/tinymcec/tinymac.js"></script>

			<style type="text/css">
.buttons li.TS a {
	background: url(<%= request.getContextPath ()%>/wine_admin/images/sprite.png)
		no-repeat -113px -2px;
	margin: 0 -21px 0 0;
	padding: 0 21px 0 0;
}

.buttons li.TS a :hover {
	color: yellow;
}

.buttons li.TS a em {
	top: 40px;
}

.buttons .TS .ico1 span {
	background-position: 0 -23px;
}

.buttons .TS .ico2 span {
	background-position: -2px -73px;
}

.buttons .ico3 span {
	background-position: -2px -97px;
}

.buttons .TS .ico3 span {
	background-position: -2px -126px;
}

.buttons .ico4 span {
	background-position: -2px -153px;
}

.buttons .TS .ico4 span {
	background-position: -2px -178px;
}

.buttons .ico5 span {
	background-position: -1px -206px;
}

.buttons .TS .ico5 span {
	background-position: -2px -232px;
}

.buttons .ico6 span {
	background-position: -2px -262px;
}

.buttons .TS .ico6 span {
	background-position: -3px -291px;
}

.buttons .ico7 span {
	background-position: -4px -321px;
}

.buttons .TS .ico7 span {
	background-position: -4px -352px;
}

.buttons .ico8 span {
	background-position: -4px -380px;
}

.buttons .TS .ico8 span {
	background-position: -4px -415px;
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

.datepick-month-year {
	width: 100px
}
</style></head>
<body>
	<div id="wrapper">
		<div id="content">
			<div class="c1">
				<%@ include file="view_model/total_tab.jsp"%>
				<div class="tabs">
					<div id="tab-1" class="tab">

						<div class="text-section">
							<h1>首頁限時特賣商品上下架</h1>
							<p> 您目前正在修改的是 首頁的限時商品特賣 商品頁面</p>
						</div>

						<div style="width: 900px; margin: 0 auto">
							<form
								action="<%=request.getContextPath()%>/wine_admin/set_timing_sales"
								method="post" enctype="multipart/form-data" id="commentForm">
								<input type="hidden" name="action" value="update" />
								<input type="hidden" name="ts_id" value="${ts.ts_id}" />
								限惠編號：${ts.ts_id} <span>${ErrMsg.errTs_id}</span><br />
								<br />

								<table>
									<tr>
										<td>限惠圖片：<img
											src="<%=request.getContextPath()%>/images/timingSales/${ts.ts_pic}"
											style="width: 200px; border-width: 3px; border-style: solid;" /><br><input
												type="file" name="file" value="選擇圖片" /><span>${ErrMsg.errTs_pic}</span><br /></td>
										<td style="padding-left:30px"  valign="top">
											<div id="divContent">
												限惠商品：<input type="text" name="p_no" value="10"
													id="search_query" /><span>${ErrMsg.errP_no}</span><br />
												<table>
													<tbody id="ulResult">
													</tbody>
												</table>
											</div> 限惠價格：<input type="text" name="ts_price"
											value="${ts.ts_price}" /><span>${ErrMsg.errTs_price}</span><br />
											限惠日期：<input type="text" name="ts_date" value="${ts.ts_date}"
											id="ts_date" readonly /><span>${ErrMsg.errTs_date}</span><br /> 限惠標語：<input
											type="text" name="ts_slogan" value="${ts.ts_slogan}" /><span>${ErrMsg.errTs_slogan}</span><br />
										</td>
									</tr>
								</table>

								限惠文宣：
								<textarea rows="20" name="ts_content" style="width: 600px;">${ts.ts_content}</textarea>
								<span>${ErrMsg.errTs_content}</span><br /> 售出數量：<input
									type="text" name="ts_totalsale" value="${ts.ts_totalsale}"
									readonly="readonly" /><span>${ErrMsg.errTs_totalsale}</span><br />
								<input type="submit" value="送出" />
							</form>

							<%@ include file="view_model/footer.jsp"%>
						</div>
						<script
							src="<%=request.getContextPath()%>/js/timingSales/timingSales.js"></script>
						</article>
					</div>

				</div>
			</div>
		</div>
		<%@ include file="view_model/admin_menu.jsp"%>
	</div>
</body>
</html>

