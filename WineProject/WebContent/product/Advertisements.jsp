<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/reset.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/Advertisements.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Advertisements Setting</title>
</head>
<body>
	<div>
	<form id="searchform" method="post" action="adsToDb.do">
		<div id="dropbox">
			<span class="message">請將圖片拖曳至此處 <br /> <i>(進度條跑完即上傳完成)</i></span>
		</div>
		<div id="divContent">
			<input type="text" name="search_query" id="search_query"
				placeholder="請輸入部分商品名，或輸入 # 號列出全部商品" size="60"
				autocomplete="off" value="${productName}" />
			<table>
				<tbody id="ulResult">
				</tbody>
			</table>
		</div>

		<input type="submit" id="btnSubmit" value="設定新廣告" id="button_find" />
		<input type="text" name="fileName" id="fileName" /> <input
			type="text" name="productName" id="productName" value="${productName}" />
	</form>
	<div id="bar"></div>
	</div>
	<div id="errlist">
			${AdsErrs.WrongP_no}<br/ > ${AdsErrs.EmptyFile}<br />
			${AdsErrs.EmptyName}<br /> ${AdsErrs.NoSuchProduct}<br />
		</div>
		<div id="okMsg">
			${AdsSuccess}<br />
		</div>	
	<div id="display_results"></div>

	<!-- Including The jQuery Library -->
	<!-- 	<script src="http://code.jquery.com/jquery-1.6.3.min.js"></script> -->
	<script src="<%=request.getContextPath()%>/js/jquery-1.9.0.min.js"></script>
	<!-- Including the HTML5 Uploader plugin -->
	<script
		src="<%=request.getContextPath()%>/js/advertisements/jquery.filedrop.js"></script>
	<!-- The main script file -->
	<script
		src="<%=request.getContextPath()%>/js/advertisements/Advertisements.js"></script>

</body>
</html>