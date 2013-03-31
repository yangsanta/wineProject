<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><link rel="shortcut icon"	href="<%=request.getContextPath()%>/favicon.ico" /><link rel="icon" href="<%=request.getContextPath()%>/favicon.ico"	type="image/x-icon" /><head><meta charset="utf-8">	<title>酒迷|後台管理系統</title>	<link media="all" rel="stylesheet" type="text/css"		href="<%=request.getContextPath()%>/wine_admin/css/all.css" />	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>	<script type="text/javascript">	window.jQuery|| document.write('<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.9.0.min.js"><\/script>');	</script>	<link		href="<%=request.getContextPath()%>/style/bootstrap/css/bootstrap.min.css"		rel="stylesheet" media="screen">		<script			src="<%=request.getContextPath()%>/style/bootstrap/js/bootstrap.js"></script>		<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="css/ie.css" /><![endif]-->		<style type="text/css">.buttons li.food a {	background: url(<%=request.getContextPath()%>/wine_admin/images/sprite.png)		no-repeat -113px -2px;	margin: 0 -21px 0 0;	padding: 0 21px 0 0;}.buttons li.food a :hover {	color: yellow;}.buttons li.food a em {	top: 40px;}.buttons .food .ico1 span {	background-position: 0 -23px;}.buttons .food .ico2 span {	background-position: -2px -73px;}.buttons .ico3 span {	background-position: -2px -97px;}.buttons .food .ico3 span {	background-position: -2px -126px;}.buttons .ico4 span {	background-position: -2px -153px;}.buttons .food .ico4 span {	background-position: -2px -178px;}.buttons .ico5 span {	background-position: -1px -206px;}.buttons .food .ico5 span {	background-position: -2px -232px;}.buttons .ico6 span {	background-position: -2px -262px;}.buttons .food .ico6 span {	background-position: -3px -291px;}.buttons .ico7 span {	background-position: -4px -321px;}.buttons .food .ico7 span {	background-position: -4px -352px;}.buttons .ico8 span {	background-position: -4px -380px;}.buttons .food .ico8 span {	background-position: -4px -415px;}.tips {	-moz-border-radius: 5px;	-webkit-border-radius: 5px;	color: black;	border: 1px solid #0C0;	padding: 8px;	margin: 15px 10px;}.listdiv {	background-color: rgb(193, 224, 255);	margin: 5px;	padding: 20px;	width: 200px;	float: left;}.newerea{margin: 5px; padding: 20px; background-color: #eee; width: 240px; float: left;}</style></head><body>	<div id="wrapper">		<div id="content">			<div class="c1">				<%@ include file="view_model/total_tab.jsp"%>				<div class="tabs">					<div id="tab-1" class="tab">						<article>						<div class="text-section">							<h1>餐酒搭配</h1>							<p>假如有新品上架的話，記得請 品酒公會 幫忙設計出合適的菜單。</p>						</div>						<ul class="states">							<c:if test="${not empty ErrorMsgKey}">							<li class="error">錯誤 : <Font color='red'>檢查您的輸入資料時，發現含有下列錯誤，請更正後重新提交</font>							<c:forEach var="e" items="${ErrorMsgKey}">								<span>${ e }</span><br>							</c:forEach>							</li></c:if>														<!-- 							<li class="warning">注意: 您還有三則訂單尚未處理.</li> -->							<!-- 							<li class="succes">成功 : 你剛完成了5筆訂單.</li> -->						</ul>						<div style="width: 1000px; margin: 0 auto">							<span style="font-size: 16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a								href="#">管理主頁</a> » 餐酒搭配管理<br><br><br>									<h1>餐酒搭配管理</h1>									<div style="overflow: auto">										<div class="tips">											<B>新增分類</b><br><br> <span style="margin-left: 33;">所有的食譜菜單的建立，都必須要先有食材才行，請透過這邊來輸入新增新的食材以方便後續建立新的食譜。</span>										</div>										<div class="newerea">											<h1>新增主要食材</h1><br>											<a style="line-height: 30px;float:right;margin-top: -50px;"  href="food.do?action=IngredientAll"><img class="image" src="<%=request.getContextPath()%>/wine_admin/images/180.png"  style="width:16px;height:16px" >修改</a>											<Form												Action="<%=request.getContextPath()%>/product/ingin.do?action=ingin"												method="post" id="commentForm" class="cmxform">												<input type="text" name="i_name" value="" size="8"													maxlength="12"><br> <button  type="submit"														 class="btn btn-primary" style="width: 220px;height: 40px;"><i class=" icon-ok icon-white"></i> 送 出</button>											</Form>										</div>										<div class="newerea">											<h1>新增風味特色</h1><br>											<a style="line-height: 30px;float:right;margin-top: -50px;" href="food.do?action=SauceAll"><img class="image" src="<%=request.getContextPath()%>/wine_admin/images/180.png"  style="width:16px;height:16px" >修改</a>											<Form												Action="<%=request.getContextPath()%>/product/saucein.do?action=saucein"												method="post" id="commentForm" class="cmxform">												<input type="text" name="s_name" value="" size="8"													maxlength="12"><br> <button type="submit"														 class="btn btn-primary" style="width: 220px;height: 40px;"><i class=" icon-ok icon-white"></i> 送 出</button>											</Form>										</div>										<div class="newerea">											<h1>新增食物種類</h1><br>											<a style="line-height: 30px;float:right;margin-top: -50px;" href="food.do?action=FoodAll"><img class="image" src="<%=request.getContextPath()%>/wine_admin/images/180.png"  style="width:16px;height:16px" >修改</a>											<Form												Action="<%=request.getContextPath()%>/product/foodin.do?action=foodin"												method="post" id="commentForm" class="cmxform">												<input type="text" name="f_name" value="" size="8"><br>														<button type="submit" class="btn btn-primary" style="width: 220px;height: 40px;"><i class=" icon-ok icon-white"></i> 送 出</button>											</Form>										</div>									</div>							<div style="width: 1000px; margin-top: 30px">									<h1>新增餐酒搭配</h1>									<a style="line-height: 30px;" href="food.do?action=Foodsetall">修改餐酒搭配</a>									<div class="tips">										<B>TIPS:</b><br><br> <span style="margin-left: 33;">找到品酒同好設計出了一款新的風味食譜搭配了嗎?												透過下拉式選單來新增一筆最新的食譜，讓訪客可以多一點選擇。</span>									</div>									<Form Action="setin.do?action=foodsetin" method="post"										id="commentForm" class="cmxform">										<span style="font-size: 36px; font-weight: bold">1.</span>										選擇商品名稱：<font color=red><b>*</b></font> <select id="product"											name="p_no">											<c:forEach var="Product" items="${Product }">												<option value="${Product.p_no}">${Product.p_name}</option>											</c:forEach>										</select><br><br>												<div style="overflow: auto">													<div class="listdiv">														<span style="font-size: 36px; font-weight: bold">2.</span><span style="line-height:40px">食物種類：</span><font															color=red><b>*</b></font> <select id="food" name="f_id"															style="width: 190px; height: 40px;">															<c:forEach var="Food" items="${Food }">																<option value="${Food.f_id}">${Food.f_name}</option>															</c:forEach>														</select>													</div>													<div														style="margin: 5px; padding-top: 25px; width: 60px; float: left;">														<img border="0"															src="<%=request.getContextPath()%>/images/array.png"															style="width:56px; height:49px">													</div>													<div class="listdiv">														<span style="font-size: 36px; font-weight: bold">3.</span><span style="line-height:40px">主要成分：</span><font															color=red><b>*</b></font> <select id="ingredient"															name="i_id" style="width: 190px; height: 40px;">															<c:forEach var="Ingredient" items="${Ingredient }">																<option value="${Ingredient.i_id}">${Ingredient.i_name}</option>															</c:forEach>														</select>													</div>													<div														style="margin: 5px; padding-top: 25px; width: 60px; float: left;">														<img border="0"															src="<%=request.getContextPath()%>/images/array.png"															width="56" height="49">													</div>													<div class="listdiv">														<span style="font-size: 36px; font-weight: bold">4.</span><span style="line-height:40px">風味特色：</span><font															color=red><b>*</b></font> <select id="sauce" name="s_id"															style="width: 190px; height: 40px;">															<c:forEach var="Sauce" items="${Sauce }">																<option value="${Sauce.s_id}">${Sauce.s_name}</option>															</c:forEach>														</select><br>													</div>												</div> <input type="submit" value="送出"												class="btn btn-primary btn-large"												style="float: right; margin-right: 120px;width: 230px;"> </input><br><br><br>									</form>								</div> <%@ include file="view_model/footer.jsp"%>						</div>						</article>					</div>				</div>			</div>		</div>		<%@ include file="view_model/admin_menu.jsp"%>	</div></body></html>