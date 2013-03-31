<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
							<!-- TinyMCE -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tinymcec/jscripts/tiny_mce.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tinymcec/tinymac.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.validate.min.js" type="text/javascript" ></script>
<script src="<%=request.getContextPath()%>/js/messages_tw.js" type="text/javascript" ></script>
<script type="text/javascript" charset="utf-8">
        $(document).ready( function(){
            $('#commentForm').validate({
                success: function(label) {
                    label.addClass("success").text("Ok!");
                }
            });
});
</script>  
<!-- /TinyMCE -->
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

label.error {
            background:url("<%=request.getContextPath()%>/images/unchecked.gif") no-repeat 0px 0px;
            padding-left: 16px;
        }

label.success {
            background:url("<%=request.getContextPath()%>/images/checked.gif") no-repeat 0px 0px;
            padding-left: 16px;
}
.drop-shadow {
-moz-border-radius: 4px;
border-radius: 4px;
position: relative;

padding: 1em;
margin: 2em 10px 4em;
background: #fff;
-webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset;
-moz-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset;
box-shadow: 0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset;
}
</style>
</head>

	<body>
		<div id="shadow_bg">
			<div id="body">
				<%@ include file="../view_model/index_header.jsp"%>
				<div id="main">

					<div id="content">
						<c:if test="${fn:length (ErrorMsgKey) gt 0}">
						<div class="alert" style="color: red;">
									<button type="button" class="close" data-dismiss="alert">&times;</button> 
									<c:forEach var="e" items="${ErrorMsgKey}">
    									<span class="label label-important">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;警告</span> 請輸入${e}
									</c:forEach>
						</div>
						</c:if>
					<img src="<%=request.getContextPath()%>/images/news.png" style="margin-top: -85px;margin-left: -20px; width:70px" />
	<form action="<c:url value='/DiscussionList.do'/>" method="post" id="commentForm" class="cmxform" >
		<img src="<%=request.getContextPath()%>/images/array.png" style="width:30px" /><span style="font-size: 22px;font-weight: bold;">文章標題:</span><br><input type="text" name="d_title" class="required" minlength="5" style="width:796px;margin-top:10px;height: 30px;" value="${dicussionVO.d_title}"/><br /> 
		<div class="drop-shadow ">
		<br><img src="<%=request.getContextPath()%>/images/array.png" style="width:30px" /><span style="font-size: 22px;font-weight: bold;">文章內容:</span>
		<div style="float:right;margin-right: 150px;margin-bottom: 10px;"><button class="btn  btn-primary" type="submit"><i class=" icon-ok icon-white"></i> 送出文章</button> </div>
		<br><div style="padding-left: 50px;width: 800px;height: 600px;"><textarea cols="90" rows="30"  id="textContext" name="d_context">${dicussionVO.d_content}</textarea></div><br />
		
		<input type="hidden" name="action" value="insert" style="margin:0px auto"/>
		
           
        </div>
	</form>
	
	
	<%@ include file="../view_model/index_fast_login.htm"%>
						<br class="clear" />
					</div>
					<br class="clear" />
				</div>
			</div>
			<%@ include file="../view_model/index_footer.htm"%>
				
			</div>
			

</body>

</html>