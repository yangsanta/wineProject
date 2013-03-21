<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ingredient.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增主要食材</title>
<script type="text/javascript" src="Scripts/jquery-1.9.1.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
<h1>新增主要食材</h1>
	<Form Action="<%=request.getContextPath()%>/product/ingin.do?action=ingin" method="post" id="commentForm"
		class="cmxform">
		<TR>
			<td>新增食材：<br></td>
			<td><input type="text" name="i_name" value=""
				size="10"></td>
		</TR>
		<TR>
			<td colspan="2" align="center"><input type="submit" value="送出"
				class="btn btn-primary"></td>
		</TR>
		<a href="<%=request.getContextPath()%>/FoodWine/FoodTest.html">回原畫面</a>
		<%-- <tr>
			<td>食物種類:</td>
			<td><select size="1" name="f_id">
					<c:forEach var="Food" items="${Food }">
						<option>${Food.f_name}</option>
					</c:forEach>
			</select></td>
		</tr> --%>
</body>
</html>