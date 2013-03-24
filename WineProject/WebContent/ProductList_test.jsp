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
<a href="product/DisplayProducts.do?action=getSome_For_Display&pageNo=1&condition=p_vol&conditionValue=750">Product/DisplayProducts(getSome_For_Display)</a><br/>
<a href="product/DisplayProducts.do?action=getSome_For_Display&condition=p_sales&conditionValue=">Product/DisplayProducts(getSome_For_Display)</a><br/>
<a href="product/DisplayProducts.do?action=getSome_For_Display&condition=p_buy_count&conditionValue=10">Product/DisplayProducts(getSome_For_Display)</a><br/>
<a href="product/Maintain?action=getAll&pageNo=1">我是維護資料喔</a><br/>

<br/><br/>
<a href="wine_admin/admin_board.do">P</a><br/>
<a href="fbajaxlogin">fblogin</a><br/>



<form action = "fbajaxlogin" method="post" id="user-login">
<input class="span3" name="uid"  type="text" maxlength="128">
<input class="span3" name="cname"  type="text" maxlength="128">
<input class="span3" name="email"  type="text" maxlength="128">
<input class="span3" name="birthday"  type="text" maxlength="128">
<input type="submit"  value="登入" class="btn btn-success" style="Width:150px;Height:40px;"/>

123
</form>

<br/>
<hr />
<a href="member/MemberService">member/MemberService</a>
</body>
</html>