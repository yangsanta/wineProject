<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

		<script type="text/javascript" src="js/index.js?v=1.0"></script>
<style type="text/css">

</style>
<script type="text/javascript">

</script>
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="twitter.github.com/bootstrap/assets/js/html5shiv.js"></script>
    <![endif]-->
</head>

<body >
<div id="shadow_bg" >
	<div id="body" >
				<div id="search">
					<input name="searchInput" type="text" class="search-query iconsearch" placeholder="搜尋" style="width: 70px; height: 10px; padding-left: 24px;" onfocus="this.style.width='100px'" onblur="this.style.width='70px'">
					</div>
						<br class="clear" />
			<%@ include file="view_model/index_header.htm"%>
	<div id="main">
					<div id="sidebar">
						<%@ include file="view_model/product_list.jsp"%>
						<%@ include file="view_model/index_left_hotsale.htm"%>	
					</div>
	
					<div id="content">
<H1>註冊成為酒迷</H1>
<div class="well font-small">
  <strong><span class="label label-success">歡迎!</span></strong> <br><span style="margin-left:50px">『朋友！你是第一次來這裡嗎？』 酒莊裡的老闆舉起手中的紅酒杯向你致意。 這間坐落在冰天雪地中的小酒館， 陳列了來自各地不同的香醇，或許你曾聽過它，或曾經過這，但無論如何，歡迎你的加入！</span>
</div>

<HR>
<Form Action="product/memberRegister" method="post" >
<div style="float:left;">
<img src="images/ic_registrate_200.png"></div>
<div style="float:left">
    <Table>
         <TR>
             <td align="right">帳號：<br></td>
             <td align="left"><input	type="text" name="m_id" value="" size="20"></td>
         </TR>
         <TR>
             <td align="right">密碼：<br></td>
             <td align="left" ><input	type="password" name="m_pwd" value="" size="20"></td>
         </TR>             
         <TR>
             <td align="right">姓名：<br></td>
             <td align="left" ><input	type="text" name="m_name" value=""  size="30"></td>
         </TR>             
         <TR>
             <td align="right">Email：</td>
             <td align="left" ><input type="text" name="m_email" value="" size="40"></td>
         </TR>             
         <TR>
             <td align="right">手機：</td>
             <td align="left" > <input type="text" name="m_mobile" value=""><br><br></td>
         </TR>             
         <TR>
             <td align="right">生日：</td>
             <td align="left" > <input type="text" name="m_bday" value="2000-11-11"></td>
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
