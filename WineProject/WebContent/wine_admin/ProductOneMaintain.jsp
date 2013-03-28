<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="<%=request.getContextPath()%>/favicon.ico" type="image/x-icon" />
<head>
<meta charset="utf-8">
	<title>酒迷|後台管理系統</title>
	<link media="all" rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/wine_admin/css/all.css" />
		 <c:if test="${sessionScope.admin_access!='y'}"><meta http-equiv="refresh" content="0; url=index.jsp"></c:if>
	<script src="http://code.jquery.com/jquery.js"></script>
	<script type="text/javascript">
		window.jQuery|| document.write('<script type="text/javascript" src="js/jquery-1.7.2.min.js"><\/script>');
	</script>
	<link href="<%=request.getContextPath()%>/style/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
		<script src="http://code.jquery.com/jquery.js"></script>
		<script src="<%=request.getContextPath()%>/style/bootstrap/js/bootstrap.js"></script>
		<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="css/ie.css" /><![endif]-->
			<style>
		.buttons li.product a {
	background:url(<%=request.getContextPath()%>/wine_admin/images/sprite.png) no-repeat -113px -2px;
	margin:0 -21px 0 0;
	padding:0 21px 0 0;
}
.buttons li.product a :hover{color:yellow;}
.buttons li.product a em {top:40px;}
.buttons .product .ico1 span {background-position:0 -23px;}
.buttons .product .ico2 span {background-position:-2px -73px;}
.buttons .ico3 span {background-position:-2px -97px;}
.buttons .product .ico3 span {background-position:-2px -126px;}
.buttons .ico4 span {background-position:-2px -153px;}
.buttons .product .ico4 span {background-position:-2px -178px;}
.buttons .ico5 span {background-position:-1px -206px;}
.buttons .product .ico5 span {background-position:-2px -232px;}
.buttons .ico6 span {background-position:-2px -262px;}
.buttons .product .ico6 span {background-position:-3px -291px;}
.buttons .ico7 span {background-position:-4px -321px;}
.buttons .product .ico7 span {background-position:-4px -352px;}
.buttons .ico8 span {background-position:-4px -380px;}
.buttons .product .ico8 span {background-position:-4px -415px;}
	.error{color:red}
	</style>

		<script>
			Array(1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999,
					2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009,
					2010, 2011, 2012);
		</script>
		<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/tinymcec/jscripts/tiny_mce.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/tinymcec/tinymac.js"></script>
<!-- /TinyMCE -->
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

						<div style="width: 80%; margin: 0 auto">
	<form action="UpdateProduct" method="post" enctype="multipart/form-data">

	    <input type="hidden" size="30" name="page" value="${param.page}" />
		<input type="hidden" size="30" name="p_no" value="${ productVO.p_no}" />
		<img src="<%=request.getContextPath()%>/images/products/${ productVO.p_pic }" style="vertical-align: top; width: 100px;"/><br/> <input
			style="background: #FFFFFF" type="file" name="p_pic" size="40" /><br/> 
			<span>商品編號:${productVO.p_no}</span><br /> 
			<span>商品名稱:</span><input type="text" size="30"name="p_name" value="${productVO.p_name}" /> <span class="error">${ErrMsg.errName}</span><br/> 
			<span>生產年分:</span><select name="p_year">
				<c:forEach var="years"
					items="1990,1991,1992,1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012">
					<c:if test="${years==productVO.p_year}">
						<option value="${years}" selected>${years}</option>
					</c:if>
					<c:if test="${years!=productVO.p_year}">
						<option value="${years}">${years}</option>
					</c:if>
				</c:forEach>
		</select> <br/> 
		     <span>生產國家:</span><input type="text" size="30" name="p_area"value="${productVO.p_area}" /> <span class="error">${ErrMsg.errArea}</span><br/> 
		         <span>  生產地區:</span><input type="text" size="30" name="p_country" value="${productVO.p_country}" /><br/>
			<span>庫存貨量:</span><input type="text" size="30" name="p_num"value="${productVO.p_num}" /><span class="error">${ErrMsg.errNum}</span><br/>
			<span> 商品價錢:</span><input type="text"	size="30" name="p_price" value="${productVO.p_price}" /><span class="error">${ErrMsg.errPrice}</span><br/>
			<span>商品狀態:</span><c:forEach var="status" items="已上架,已下架">
			<c:if test="${status==productVO.p_status}">
			<input	type="radio" size="30" name="p_status" value="${status}" checked/><span>${status}  </span>
			</c:if>
			<c:if test="${status!=productVO.p_status}">
			<input	type="radio" size="30" name="p_status" value="${status}" /><span>${status}  </span>
			</c:if>
			</c:forEach><br/> 
			<span>品牌酒莊:</span><input type="text" size="30"	name="p_winery" value="${productVO.p_winery}" /><span class="error">${ErrMsg.errWinery}</span><br/>
			<span>口感風味:</span><input type="text" size="30" name="p_style"	value="${productVO.p_style}" /><span class="error">${ErrMsg.errStyle}</span><br/> 
			<span>優惠狀態:</span><c:forEach var="sales" items="R,G,A,B,half,NONE">
			<c:if test="${sales==productVO.p_sales}">
			<input	type="radio" size="30" name="p_sales" value="${sales}" checked/><span>${sales}  </span>
			</c:if>
			<c:if test="${sales!=productVO.p_sales}">
			<input	type="radio" size="30" name="p_sales" value="${sales}" /><span>${sales}  </span>
			</c:if>
			</c:forEach>
			<br/>
			<span>商品容量:</span><input type="text" size="30" name="p_vol"	value="${ productVO.p_vol}" /><span class="error">${ErrMsg.errVol}</span><br/> 
			<span>酒精濃度:</span><input	type="text" size="30" name="p_alcho" value="${productVO.p_alcho}" /><span class="error">${ErrMsg.errAlcho}</span><br/>
			<span>上架日期:</span><input type="text" size="30" name="p_date"  value="${productVO.p_date}" /><br/> 
			<span>商品種類:</span>
			<c:forEach var="type" items="紅葡萄酒,白葡萄酒,氣泡酒">
			<c:if test="${type==productVO.p_type}">
			<input	type="radio" size="30" name="p_type" value="${type}" checked/><span>${type}  </span>
			</c:if>
			<c:if test="${type!=productVO.p_type}">
			<input	type="radio" size="30" name="p_type" value="${type}" /><span>${type}  </span>
			</c:if>
			</c:forEach><span class="error">${ErrMsg.errType}</span><br/> 
			<span>葡萄種類:</span><input type="text" size="30" name="p_grape" value="${productVO.p_grape}" /><span class="error">${ErrMsg.errGrape}</span><br/>
			<span>商品介紹</span><textarea style="height: 100px; width: 350px"	name="p_intro">${productVO.p_intro}</textarea><span class="error">${ErrMsg.errIntro}</span><br/> 
			<input type="submit"
			value="修改" />
	</form>

						
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