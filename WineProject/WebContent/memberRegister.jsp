<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/Dtd/xhtml1-transitional.dtd">
<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="<%=request.getContextPath()%>/favicon.ico"
	type="image/x-icon" />
<html>
<head>
<meta http-equiv="Content-Language" content="zh-tw">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>酒迷 | 歷久彌新的香濃口感</title>
<meta content="酒迷 | 歷久彌新的香濃口感。" name="description" />
<meta content="酒迷 | 歷久彌新的香濃口感" name="keywords" />
<link href="style/reset.css" rel="stylesheet" type="text/css" />
<link href="style/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	media="screen">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="style/bootstrap/js/bootstrap.js"></script>

<script type="text/javascript" src="js/jquery.fancybox.js?v=2.1.4"></script>
<link rel="stylesheet" type="text/css"
	href="style/jquery.fancybox.css?v=2.1.4" media="screen" />
<link rel="stylesheet" type="text/css" href="style/index.css?v=1.0"
	media="screen" />
<link type="text/css" href="style/jquery.datepick.css" rel="stylesheet">
<script type="text/javascript" src="js/index.js?v=1.0"></script>
<script src="<%=request.getContextPath()%>/js/jquery.validate.min.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/messages_tw.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.datepick.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/js/ajax-road.js"></script>

<script type="text/javascript" charset="utf-8">
	
	$(function(){
		
		$(document).on('keyup', 'input[name="m_id"]', function(){
			$('#duplicateM_id').remove();
			
			$.ajax({
				url : '/WineProject/product/memberRegister.do',
				type : 'POST',
				data : {
					m_id : $(this).val(),
					action : "chkHasM_idOrNot"
				},
				dataType : 'text',
				success : function(data) {
					
					var result = data.split('_')[0];
					
					if (result == "duplicateMid")
						$('<span id="duplicateM_id" style="color:#be0000; font-size:10pt"></span>').text("  " + data.split('_')[1]).insertAfter('input[name="m_id"]');
					
				}
			});//ajax
			
		});//keyup
		
		
		});
</script>
	
<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		$('#commentForm').validate({
			success : function(label) {
				label.addClass("success").text("Ok!");
			}
		});

		$('#m_bday').datepick({
			dateFormat : 'yyyy-mm-dd'
		});
		$('#inlineDatepicker').datepick({
			onSelect : showDate
		});
		
		$('#chkpwd').focus(function(){
			$('#btnMSubmit').attr('disabled','disabled');
		});
		$('input[name="m_pwd"]').focus(function(){
			$('#btnMSubmit').attr('disabled','disabled');
		});
		
		$('#chkpwd').blur(function(){
			$('#notSamePwd').remove();
			if ($('input[name="m_pwd"]').val() != $('#chkpwd').val()){
				$('#btnMSubmit').attr('disabled','disabled');
				$('<span id="notSamePwd" style="color:#be0000; font-size:10pt"></span>').text("  請輸入相同密碼。").insertAfter('#chkpwd');
			} else {
				$('#btnMSubmit').removeAttr('disabled');
			}
		});
		
		$('input[name="m_pwd"]').blur(function(){
			$('#notSamePwd').remove();
			if ($('#chkpwd').val()!="" && $('input[name="m_pwd"]').val() != $('#chkpwd').val()){
				$('#btnMSubmit').attr('disabled','disabled');
				$('<span id="notSamePwd" style="color:#be0000; font-size:10pt"></span>').text("  請輸入相同密碼。").insertAfter('#chkpwd');
			} else {
				$('#btnMSubmit').removeAttr('disabled');
			}
		})
	});

	function showDate(date) {
		alert('The date chosen is ' + date);
	}
	function switchpage() {
 		$("#firstpage").slideUp("slow");
 		$("#secendpage").delay(800).slideDown("slow")
	}
	
	
</script>

<style type="text/css">
label{display: inline-block;margin-left: 10px;}
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

#textSearch {
	width: 400px;
}

#divContent {
	float: right;
	position: absolute;
	background-color: white;
	margin-top: -12px;
	width: 400px;
	border: 1px solid rgb(213, 213, 213);;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

#ulResult {
	list-style-type: none;
	padding: 0px;
	margin: 0px;
	padding-left: 5px;
	cursor: pointer;
}

#ulResult ul li {
	padding: 0px 0 0px 0;
}

#ulResult .over {
	background-color: yellow;
	padding: 0px 0 0px 0;
}

#ulResult .out {
	padding: 0px 0 0px 0;
}
tr{height: 45px;}
</style>

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="twitter.github.com/bootstrap/assets/js/html5shiv.js"></script>
    <![endif]-->
</head>

<body>
	<div id="shadow_bg">
		<div id="body">
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
						<strong><span class="label label-success">歡迎!</span></strong> <br>
						<span style="margin-left: 50px">『朋友！你是第一次來這裡嗎？』
							酒莊裡的老闆舉起手中的紅酒杯向你致意。 這間坐落在冰天雪地中的小酒館，
							陳列了來自各地不同的香醇，或許你曾聽過它，或曾經過這，但無論如何，歡迎你的加入！</span>
					</div>

					<HR>
					<Form Action="product/memberRegister.do" method="post"
						id="commentForm" class="cmxform" name="aaa">
						<div id="firstpage">
						請您詳閱以下的使用者條款以及隱私權政策<br><br>
						<iframe name="main" frameborder="0" height="405" scrolling="yes" src="registerlist.html" width="610" allowtransparency="true"></iframe>
						<br><br><div class="aceptregister"  onclick="switchpage();" style="float:right;margin-right: 40px;"></div>
						</div>
						<div id="secendpage" style=" display:none;">
						<div style="float: left;padding-top: 80px;">
							<img src="images/ic_registrate_200.png">
						</div>
						
						<div style="float: left">
							<Table>
								<TR>
									<td align="right">帳號：<br></td>
									<td align="left"><input autocomplete="off" type="text" name="m_id" value=""
										size="20" ></td>
								</TR>
								<TR>
									<td align="right">密碼：<br></td>
									<td align="left"><input autocomplete="off" type="password" name="m_pwd"
										value="" size="20" class="required" minlength="8"></td>
								</TR>
								<TR>
									<td align="right">密碼確認：<br></td>
									<td align="left"><input autocomplete="off" type="password"
										value="" size="20" id="chkpwd"></td>
								</TR>
								<TR>
									<td align="right">姓名：<br></td>
									<td align="left"><input autocomplete="off" type="text" name="m_name"
										value="" size="30" class="required"></td>
								</TR>
								<TR>
									<td align="right">Email：</td>
									<td align="left"><input autocomplete="off" type="text" name="m_email"
										value="" size="40" class="required email"></td>
								</TR>
								<TR>
									<td align="right">手機：</td>
									<td align="left"><input autocomplete="off" type="text" name="m_mobile"
										value="" class="required number" minlength="10" maxlength="10"></td>
								</TR>
								<TR>
									<td align="right">生日：</td>
									<td align="left"><input autocomplete="off" type="text" id="m_bday"
										name="m_bday" value="2000-11-11" readonly
										style="cursor: pointer"></td>
								</TR>
								<TR>
									<td align="right">地址：</td>
									<td align="left"><input autocomplete="off" type="text" id="m_addr"
										name="m_addr" value="" onkeyup="showUser(this.value)"
										onclick="showUser(this.value)" style="width: 380px"> <br>
										<div id="divContent">
											<ul id="ulResult"></ul>
										</div></td>
								</TR>
								<TR>
									<td colspan="2" align="center"><input type="submit"
										value="送出註冊" class="btn btn-primary" id="btnMSubmit"></td>
								</TR>
							</Table>
						</div></div>
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



