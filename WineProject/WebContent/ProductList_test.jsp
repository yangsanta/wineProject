<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ProductList_test</title>
</head>
<body>
<a href="product/DisplayProducts.do?action=getAll&pageNo=1">Product/DisplayProducts(getAll)</a><br/>
<a href="product/DisplayProducts.do?action=getSome_For_Display&pageNo=1&condition=p_vol&conditionValue=750">Product/DisplayProducts(getSome_For_Display)</a>
<a href="product/DisplayProducts.do?action=getSome_For_Display&condition=p_sales&conditionValue=">Product/DisplayProducts(getSome_For_Display)</a>
<a href="product/DisplayProducts.do?action=getSome_For_Display&condition=p_buy_count&conditionValue=10">Product/DisplayProducts(getSome_For_Display)</a>
<hr/>
<a href="member/MemberService">member/MemberService</a>
<hr/>
<a href="http://localhost:8080/WineProject/product/Advertisements.jsp">Advertisements.jsp</a>
</body>
</html>