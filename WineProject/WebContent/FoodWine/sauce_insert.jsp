<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增風味特色</title>
<script type="text/javascript" src="Scripts/jquery-1.9.1.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<Form Action="<%=request.getContextPath()%>/product/saucein" method="post" id="commentForm"
		class="cmxform">
		<TR>
			<td>新增風味特色：<br></td>
			<td><input type="text" name="s_name" value=""
				size="10"></td>
		</TR>
		<TR>
			<td colspan="2" align="center"><input type="submit" value="送出"
				class="btn btn-primary"></td>
		</TR>
</body>
</html>