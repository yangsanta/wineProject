<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link type="text/css" href="style/jquery.datepick.css" rel="stylesheet">

<html>
<head>
	<meta charset="utf-8">
	<title>酒迷|後台管理系統</title>
	<link media="all" rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/wine_admin/css/all.css" />
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<script type="text/javascript">window.jQuery || document.write('<script type="text/javascript" src="js/jquery-1.7.2.min.js"><\/script>');</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/wine_admin/js/jquery.main.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.datepick.js"></script>
			<link href="<%=request.getContextPath()%>/style/reset.css"
			rel="stylesheet" type="text/css" />
		<link
			href="<%=request.getContextPath()%>/style/bootstrap/css/bootstrap.min.css"
			rel="stylesheet" media="screen">
			<script
				src="<%=request.getContextPath()%>/style/bootstrap/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.validate.min.js" type="text/javascript" ></script>
<script src="<%=request.getContextPath()%>/js/messages_tw.js" type="text/javascript" ></script>
	<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="css/ie.css" /><![endif]-->
	     <script type="text/javascript" charset="utf-8">
        $(document).ready( function(){
            $('#commentForm').validate({
                success: function(label) {
                    label.addClass("success").text("Ok!");
                }
            });
   
	$('#ts_date').datepick({dateFormat: 'yyyy-mm-dd'});
	$('#inlineDatepicker').datepick({onSelect: showDate});
});

function showDate(date) {
	alert('The date chosen is ' + date);
}
</script>  
     
<style type="text/css">
 label.error {
            background:url("<%=request.getContextPath()%>/images/unchecked.gif") no-repeat 0px 0px;
            padding-left: 16px;
        }

        label.success {
            background:url("<%=request.getContextPath()%>/images/checked.gif") no-repeat 0px 0px;
            padding-left: 16px;
        }
        .datepick-month-year{width:100px}
</style>
</head>
<body>
	<form action="<%=request.getContextPath()%>/set_timing_sales" method="post" enctype="multipart/form-data" id="commentForm">
		限惠編號：<input type="text" name="ts_id" value="${ts.ts_id}" readonly="readonly"/><span>${ErrMsg.errTs_id}</span><br/>
		<div id="divContent">
		限惠商品：<input type="text" name="p_no" value="10" id="search_query"/><span>${ErrMsg.errP_no}</span><br/>
			<table>
				<tbody id="ulResult">
				</tbody>
			</table>
		</div>
		限惠價格：<input type="text" name="ts_price" value="${ts.ts_price}"/><span>${ErrMsg.errTs_price}</span><br/>
		限惠日期：<input type="text" name="ts_date" value="${ts.ts_date}" id="ts_date"/><span>${ErrMsg.errTs_date}</span><br/>
		限惠標語：<input type="text" name="ts_slogan" value="${ts.ts_slogan}"/><span>${ErrMsg.errTs_slogan}</span><br/>
		限惠圖片：<input type="file" name="file" value="選擇圖片"/><span><img src="<%=request.getContextPath()%>/images/timingSales/${ts.ts_pic}" />${ErrMsg.errTs_pic}</span><br/>
		限惠文宣：<textarea rows="20" cols="400" name="ts_content" >${ts.ts_content}</textarea><span>${ErrMsg.errTs_content}</span><br/>
		已購人數：<input type="text" name="ts_totalsale" value="${ts.ts_totalsale}" readonly="readonly"/><span>${ErrMsg.errTs_totalsale}</span><br/>
		<input type="submit" value="送出"/>			
	</form>
</body>
	<script
		src="<%=request.getContextPath()%>/js/timingSales/timingSales.js"></script>
</html>