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
	<h1>新增風味特色</h1>
	<FORM METHOD="post" ACTION="food.do" name="form1">
		<tr>
			<td>風味特色:</td>
			<td><select size="1" name="f_id">
					<c:forEach var="Sauce" items="${Sauce }">
						<option value="${Sauce.s_id}">${Sauce.s_name}</option>
					</c:forEach>
			</select></td>
		</tr>
		<input type="hidden" name="action" value="insert"> <input
			type="submit" value="送出新增">
	</FORM>
</body>
</html>