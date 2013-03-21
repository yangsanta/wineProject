<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改風味特色</title>
<script type="text/javascript" src="Scripts/jquery-1.9.1.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<h1>修改風味特色</h1>
	<Form
		Action="<%=request.getContextPath()%>/product/saucein.do"
		method="post" id="commentForm" class="cmxform">
		風味編號：<input type="text" readonly name="s_id" value="${param.s_id}" /><br>

		風味名稱：<input type="text" name="s_name" value="" size="10" maxlength="20"><br>

		<input type="text" name="action" value="sauceupdate" size="10" style="display:none"><br>
		<input type="submit" value="送出" class="btn btn-primary">

	</Form>
	<a href="<%=request.getContextPath()%>/FoodWine/FoodTest.html">回原畫面</a>
</body>
</html>