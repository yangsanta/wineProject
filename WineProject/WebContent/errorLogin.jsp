<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"  import="java.util.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登入會員失敗</title>
</head>
<body>
<H1>登入會員失敗</h1>

<Font color='red' >檢查您的輸入資料時，發現含有下列錯誤，請更正後重新送出</font>
<c:forEach var="e" items="${ErrorMsgKey}">
    <li>${ e }</li>
</c:forEach>
<br>
<p/>
<small>&lt;&lt;<a href="login.jsp">回登入畫面</a>&gt;&gt;</small>
</body>
</html>