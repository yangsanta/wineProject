<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/reset.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/advertisements/jquery-ui-1.10.2.custom.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/advertisements/Advertisements.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Advertisements Setting</title>
</head>
<body>
	<div id="tabs">
		<ul>
			<li><a href="#tabs-1">新增廣告</a></li>
			<li><a href="#tabs-2">修改廣告</a></li>
		</ul>
		<div id="tabs-1">
			<form id="searchform" method="post"
				action="<%=request.getContextPath()%>/product/adsToDb.do">
				<div id="dropbox">
					<c:choose>
						<c:when test="${not empty fileName}">
							<div class="preview" id="previewbox">
								<span class="imageHolder"> <img
									src="/WineProject/images/ad/${fileName}" /><span
									class="uploaded"></span></span>
							</div>
						</c:when>
						<c:otherwise>
							<span class="message">請將圖片拖曳至此處 <br /> <i>(進度條跑完即上傳完成)</i></span>
						</c:otherwise>
					</c:choose>

				</div>
				<div id="divContent">
					<input type="text" name="search_query" id="search_query"
						placeholder="請輸入部分商品名，或輸入 # 號列出全部商品" size="40" autocomplete="off"
						value="${productName}" />
					<table>
						<tbody id="ulResult">
						</tbody>
					</table>
				</div>

				<input type="submit" value="設定新廣告" id="button" /> <input
					type="text" name="fileName" id="fileName" value="${fileName}" /> <input
					type="text" name="productName" id="productName"
					value="${productName}" />

			</form>
			<div id="bar"></div>
			<div id="errlist">
				${AdsErrs.WrongP_no}<br/ > ${AdsErrs.EmptyFile}<br />
				${AdsErrs.EmptyName}<br /> ${AdsErrs.NoSuchProduct}<br />
			</div>
			<div id="okMsg">
				${AdsSuccess}<br />
			</div>
		</div>

		<div id="tabs-2">Phasellus mattis tincidunt nibh. Cras orci
			urna, blandit id, pretium vel, aliquet ornare, felis. Maecenas
			scelerisque sem non nisl. Fusce sed lorem in enim dictum bibendum.</div>
	</div>

	<!-- Including The jQuery Library -->
	<!-- 	<script src="http://code.jquery.com/jquery-1.6.3.min.js"></script> -->
	<script src="<%=request.getContextPath()%>/js/jquery-1.9.0.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/advertisements/jquery-ui-1.10.2.custom.min.js"></script>
	<!-- Including the HTML5 Uploader plugin -->
	<script
		src="<%=request.getContextPath()%>/js/advertisements/jquery.filedrop.js"></script>
	<!-- The main script file -->
	<script
		src="<%=request.getContextPath()%>/js/advertisements/Advertisements.js"></script>

</body>
</html>