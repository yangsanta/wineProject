<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/Dtd/xhtml1-transitional.dtd">
<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="<%=request.getContextPath()%>/favicon.ico" type="image/x-icon" />
<html>
<head>
	<meta http-equiv="Content-Language" content="zh-tw">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>酒迷 | 歷久彌新的香濃口感</title>
	<meta content="酒迷 | 歷久彌新的香濃口感。" name="description" />
 	<meta content="酒迷 | 歷久彌新的香濃口感" name="keywords" />
        <link href="style/reset.css" rel="stylesheet" type="text/css" />
		<link href="style/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
		<script src="http://code.jquery.com/jquery.js"></script>
		<script src="style/bootstrap/js/bootstrap.js"></script>

		<script type="text/javascript" src="js/jquery.fancybox.js?v=2.1.4"></script>
		<link rel="stylesheet" type="text/css" href="style/jquery.fancybox.css?v=2.1.4" media="screen" />
		<link rel="stylesheet" type="text/css" href="style/index.css?v=1.0" media="screen" />
   <link type="text/css" href="style/jquery.datepick.css" rel="stylesheet">
		<script type="text/javascript" src="js/index.js?v=1.0"></script>
		     <script src="<%=request.getContextPath()%>/js/jquery.validate.min.js" type="text/javascript" ></script>
     <script src="<%=request.getContextPath()%>/js/messages_tw.js" type="text/javascript" ></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.datepick.js"></script>
     <script type="text/javascript" charset="utf-8">
        $(document).ready( function(){
            $('#commentForm').validate({
                success: function(label) {
                    label.addClass("success").text("Ok!");
                }
            });
   
	$('#m_bday').datepick();
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

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="twitter.github.com/bootstrap/assets/js/html5shiv.js"></script>
    <![endif]-->
</head>

<body >
<div id="shadow_bg" >
	<div id="body" >
			<%@ include file="view_model/index_header.jsp"%>
	<div id="main">
					<div id="sidebar">
						<%@ include file="view_model/product_list.jsp"%>
						<%@ include file="view_model/index_left_hotsale.jsp"%>	
					</div>
	
					<div id="content">
					<%@ include file="view_model/page_alert.htm"%>
<H1>註冊成為酒迷</H1>
<div class="well font-small">
  <strong><span class="label label-success">歡迎!</span></strong> <br><span style="margin-left:50px">『朋友！你是第一次來這裡嗎？』 酒莊裡的老闆舉起手中的紅酒杯向你致意。 這間坐落在冰天雪地中的小酒館， 陳列了來自各地不同的香醇，或許你曾聽過它，或曾經過這，但無論如何，歡迎你的加入！</span>
</div>

<HR>
<Form Action="product/memberRegister.do" method="post" id="commentForm" class="cmxform" >
<div style="float:left;">
<img src="images/ic_registrate_200.png"></div>
<div style="float:left">
    <Table>
         <TR>
             <td align="right">帳號：<br></td>
             <td align="left"><input	type="text" name="m_id" value="" size="20" class="required" minlength="3"></td>
         </TR>
         <TR>
             <td align="right">密碼：<br></td>
             <td align="left" ><input	type="password" name="m_pwd" value="" size="20" class="required" minlength="8"></td>
         </TR>             
         <TR>
             <td align="right">姓名：<br></td>
             <td align="left" ><input	type="text" name="m_name" value=""  size="30"></td>
         </TR>             
         <TR>
             <td align="right">Email：</td>
             <td align="left" ><input type="text" name="m_email" value="" size="40" class="required email"></td>
         </TR>             
         <TR>
             <td align="right">手機：</td>
             <td align="left" > <input type="text" name="m_mobile" value="" class="required number" minlength="10" maxlength="11"></td>
         </TR>             
         <TR>
             <td align="right">生日：</td>
             <td align="left" > <input type="text" id="m_bday" name="m_bday" value="2000-11-11" ></td>
         </TR>
         <TR>
             <td align="right">地址：</td>
             <td align="left" > <input type="text" name="m_addr" value=""></td>
         </TR>    
        <TR>
            <td colspan="2" align="center">      <input type="submit" value="送出註冊" class="btn btn-primary"> </td>
            </TR>
         </Table></div>
</Form>
	<br class="clear" />
				</div>
				<%@ include file="view_model/index_fast_login.htm"%>
			<br class="clear" />
				</div>
			</div>
<%@ include file="view_model/index_footer.htm"%>
				
			</div>
			
</div>
</body>

</html>



</html>
