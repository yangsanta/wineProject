<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link rel="shortcut icon" href="<%=request.getContextPath()%>/favicon.ico" />
<link rel="icon" href="<%=request.getContextPath()%>/favicon.ico" type="image/x-icon" />
<head>
<meta charset="utf-8">
	<title>酒迷|後台管理系統</title>
	<link media="all" rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/wine_admin/css/all.css" />
		 <c:if test="${sessionScope.admin_access!='y'}"><meta http-equiv="refresh" content="0; url=index.jsp"></c:if>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript">
	window.jQuery|| document.write('<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.9.0.min.js"><\/script>');
	</script>
	<link href="<%=request.getContextPath()%>/style/bootstrap/css/bootstrap.min.css"
		rel="stylesheet" media="screen">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script src="<%=request.getContextPath()%>/style/bootstrap/js/bootstrap.js"></script>
		<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="css/ie.css" /><![endif]-->
			<style type="text/css">
	.buttons li.prodis a {
	background:url(<%=request.getContextPath()%>/wine_admin/images/sprite.png) no-repeat -113px -2px;
	margin:0 -21px 0 0;
	padding:0 21px 0 0;
}
.buttons li.prodis a :hover{color:yellow;}
.buttons li.prodis a em {top:40px;}
.buttons .prodis .ico1 span {background-position:0 -23px;}
.buttons .prodis .ico2 span {background-position:-2px -73px;}
.buttons .ico3 span {background-position:-2px -97px;}
.buttons .prodis .ico3 span {background-position:-2px -126px;}
.buttons .ico4 span {background-position:-2px -153px;}
.buttons .prodis .ico4 span {background-position:-2px -178px;}
.buttons .ico5 span {background-position:-1px -206px;}
.buttons .prodis .ico5 span {background-position:-2px -232px;}
.buttons .ico6 span {background-position:-2px -262px;}
.buttons .prodis .ico6 span {background-position:-3px -291px;}
.buttons .ico7 span {background-position:-4px -321px;}
.buttons .prodis .ico7 span {background-position:-4px -352px;}
.buttons .ico8 span {background-position:-4px -380px;}
.buttons .prodis .ico8 span {background-position:-4px -415px;}
</style>
	<script>
			Array(1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999,
					2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009,
					2010, 2011, 2012);
		</script>
		<script>
		var theId=0;
		$(document).ready(function(){
			
			$('#correspondence').change(function(){
				$('#P'+theId).css('display','none')
			 theId=$(this).val();
			$('#P'+theId).css('display','inline')
			})
		});
		</script>
</head>
<body>
	<div id="wrapper">
		<div id="content">
			<div class="c1">
		<%@ include file="view_model/total_tab.jsp"%>
				<div class="tabs">
					<div id="tab-1" class="tab">

						<div class="text-section">
							<h1>商品專區</h1>
							<p>可在這邊修改商品喔!!!</p>
						</div>
		<ul class="states">
						
						</ul>
	
						<div style="width: 80%; margin: 0 auto">
						<table>
						<tr>
						<td>
						<div><img src="<%=request.getContextPath()%>/images/products/${ productVO.p_pic }" style="vertical-align: top; width: 100px;"/><br/>
						</div>
						<span>${productVO.p_sales}區商品</span><br/>
						<span>商品編號:${productVO.p_no}</span><br/> 
						<span>商品名稱:${productVO.p_name}</span><br/>
						<span>商品價錢:${productVO.p_price}</span><br/>
						</td>
						<td>
						<span>請選擇對應的商品:</span>
						 <form action="MaintainSales" action="post">
						<input type="hidden" name="action" value="SET_A_OR_B"></input>
						<input type="hidden" name="p_no" value="${productVO.p_no}"></input>
						<input type="hidden" name="p_sales" value="${productVO.p_sales}"></input>
						<input type="hidden" name="page" value="${page}"></input>
						<input type="hidden" name="oldSales" value="${oldSales}"></input>
						<select name="correspondence" id="correspondence">
						<option >請選擇</option>
						<c:forEach var="products" items="${productList}">
						<c:if test="${productVO.p_no!=products.p_no}"><option value="${products.p_no}">NO.${products.p_no} ${products.p_name}</option></c:if>
						</c:forEach>
						</select><br>
						<input type="submit" class="btn btn-success" style="width: 220px;height: 40px;"value="確認送出"></input>
						</form>
						</td>
					
				<c:forEach var="productintro" items="${productList}">
						<c:if test="${productVO.p_no!=products.p_no}">
						<td id="P${productintro.p_no}" style="display:none">
						<div><img src="<%=request.getContextPath()%>/images/products/${productintro.p_pic }" style="vertical-align: top; width: 100px;"/><br/>
						</div>
						<span>商品編號:${productintro.p_no}</span><br/> 
						<span>商品名稱:${productintro.p_name}</span><br/>
						<span>商品價錢:${productVO.p_price}</span><br/>
						</td>
						</c:if>
						</c:forEach>
						</tr>
						</table>
							



						

						
					<%@ include file="view_model/footer.jsp"%>
						</div>

						</article>
					</div>

				</div>
			</div>
		</div>
<%@ include file="view_model/admin_menu.jsp"%>
	</div>
</body>
</html>