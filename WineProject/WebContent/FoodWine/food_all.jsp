<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>食物種類</title>
<script type="text/javascript" src="Scripts/jquery-1.9.1.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<h1>食物種類</h1>
	<table border='1' bordercolor='#CCCCFF' width='800'>
		<tr>
			<th>種類編號</th>
			<th>種類名稱</th>
			<th>修改</th>
			<th>刪除</th>
		</tr>
		<%@ include file="page1.file"%>
		<c:forEach var="empVO" items="${list}" begin="<%=pageIndex%>"
			end="<%=pageIndex+rowsPerPage-1%>">
			<tr align='center' valign='middle'>
				<td>${empVO.empno}</td>
				<td>${empVO.ename}</td>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/emp/emp.do">
						<input type="submit" value="修改"> <input type="hidden"
							name="empno" value="${empVO.empno}"> <input type="hidden"
							name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/emp/emp.do">
						<input type="submit" value="刪除"> <input type="hidden"
							name="empno" value="${empVO.empno}"> <input type="hidden"
							name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="page2.file"%>
</body>
</html> --%>