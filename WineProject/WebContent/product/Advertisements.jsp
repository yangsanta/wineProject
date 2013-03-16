<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Advertisements Setting</title>
</head>
<body>
	<div id="dropbox">
		<span class="message">Drop images here to upload. <br />
		<i>(they will only be visible to you)</i></span>
	</div>

	<!-- Including The jQuery Library -->
	<script src="http://code.jquery.com/jquery-1.6.3.min.js"></script>
	<!-- Including the HTML5 Uploader plugin -->
	<script src="<%=request.getContextPath()%>/js/advertisements/jquery.filedrop.js"></script>
	<!-- The main script file -->
	<script src="<%=request.getContextPath()%>/js/advertisements/Advertisements.js"></script>

</body>
</html>