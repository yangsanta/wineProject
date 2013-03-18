<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="food.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增食物種類</title>
<script type="text/javascript" src="Scripts/jquery-1.9.1.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<h1>新增食物種類</h1>
	<Form Action="<%=request.getContextPath()%>/product/foodin" method="post" id="commentForm"
		class="cmxform">
		<TR>
			<td>新增食物：<br></td>
			<td><input type="text" name="f_name" value=""
				size="10"></td>
		</TR>
		<%-- <tr>
			<td>食物種類:</td>
			<td><select size="1" name="f_id">
					<c:forEach var="Food" items="${Food }">
						<option>${Food.f_name}</option>
					</c:forEach>
			</select></td>
		</tr> --%>
		<TR>
			<td colspan="2" align="center"><input type="submit" value="送出"
				class="btn btn-primary"></td>
		</TR>
		<!-- <input type="hidden" name="action" value="insert"> <input
			type="submit" value="送出新增"> -->
	</FORM>
</body>
</html>