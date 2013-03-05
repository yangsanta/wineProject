<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/Dtd/xhtml1-transitional.dtd">
<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
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
										<div class="abgne-news-scroll">
										<div align="center"><span class="title">暢銷商品</span></div>
		<ul>
			<li>
				<div><a href="#"><img src="products/I0171_thumbnail.gif" style="width:50px;"/></a>
				<span>馬德里斯特紅酒<br> <br>特價$899！</span></div>
			</li>
			<li>
				<div><a href="#"><img src="products/I1101_thumbnail.gif" style="width:50px;"/></a>
				<span>義大利雪之邱 <br><br>售價$700</span></div>
			</li>
			<li>
				<div><a href="#"><img src="products/I1126_thumbnail.gif" style="width:50px;"/></a>
				<span>山之巔黃標紅酒 <br><br>售價$650！</span></div>
			</li>
			<li>
				<div><a href="#"><img src="products/I4602_thumbnail.gif" style="width:50px;"/></a>
				<span>匯雅粉紅香檳 <br><br>售價$3500</span></div>
			</li>
			<li>
				<div><a href="#"><img src="products/K0404_thumbnail.gif" style="width:50px;"/></a>
				<span>死亡之谷恢復紅血紅酒 <br><br>售價$899</span></div>
			</li>
		</ul>
	</div>
					</div>
	
					<div id="content">
<H1>會員註冊</H1>

<HR>
<Form Action="product/memberRegister" method="post" >
    <Table>
         <TR>
             <td align="right">帳號：</td>
             <td align="left"><input	type="text" name="m_id" value="helloSnoopy" size="20"></td>
         </TR>
         <TR>
             <td align="right">密碼：</td>
             <td align="left" ><input	type="password" name="m_pwd" value="123456" size="20"></td>
         </TR>             
         <TR>
             <td align="right">姓名：</td>
             <td align="left" ><input	type="text" name="m_name" value="史努比"  size="30"></td>
         </TR>             
         <TR>
             <td align="right">Email：</td>
             <td align="left" ><input type="text" name="m_email" value="snoopyHello@ppp.com.tw" size="40"></td>
         </TR>             
         <TR>
             <td align="right">行動電話號碼：</td>
             <td align="left" > <input type="text" name="m_mobile" value="0123456789"></td>
         </TR>             
         <TR>
             <td align="right">生日：</td>
             <td align="left" > <input type="text" name="m_bday" value="2000-11-11"></td>
         </TR>
         <TR>
             <td align="right">通訊地址：</td>
             <td align="left" > <input type="text" name="m_addr" value="taipei"></td>
         </TR>    
        <TR>
            <td colspan="2" align="center">      <input type="submit" value="送出註冊" class="btn btn-primary"> </td>
            </TR>
         </Table>
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
