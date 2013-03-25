<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="<%=request.getContextPath()%>/favicon.ico"
	type="image/x-icon" />

<html>
<head>


<meta http-equiv="Content-Language" content="zh-tw">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

		<title>酒迷| 歷久彌新的香濃口感</title>
		<meta content="酒迷 | 歷久彌新的香濃口感。" name="description" />
		<meta content="酒迷 | 歷久彌新的香濃口感" name="keywords" />
	<style>
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

	<form action="InsertProduct" method="post" enctype="multipart/form-data">

	   
		
		<img src="<%=request.getContextPath()%>/images/products/${ productVO.p_pic }" style="vertical-align: top; width: 100px;"/><br/> <input
			style="background: #FFFFFF" type="file" name="p_pic" size="40" /><span class="error">${ErrMsg.errPic}</span><br/> 
			
			<span>商品名稱:</span><input type="text" size="30"name="p_name" value="${insertMsgs.p_name}" /> <span class="error">${ErrMsg.errName}</span><br/> 
			<span>生產年分:</span><select name="p_year">
				<c:forEach var="years"
					items="1990,1991,1992,1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012">
					<c:if test="${years==insertMsgs.p_year}">
						<option value="${years}" selected>${years}</option>
					</c:if>
					<c:if test="${years!=insertMsgs.p_year}">
						<option value="${years}">${years}</option>
					</c:if>
				</c:forEach>
		</select> <br/> 
		     <span>生產國家:</span><input type="text" size="30" name="p_area"value="${insertMsgs.p_area}" /> <span class="error">${ErrMsg.errArea}</span><br/> 
		         <span>  生產地區:</span><input type="text" size="30" name="p_country" value="${insertMsgs.p_country}" /><br/>
			<span>庫存貨量:</span><input type="text" size="30" name="p_num"value="${insertMsgs.p_num}" /><span class="error">${ErrMsg.errNum}</span><br/>
			<span> 商品價錢:</span><input type="text"	size="30" name="p_price" value="${insertMsgs.p_price}" /><span class="error">${ErrMsg.errPrice}</span><br/>
			${insertMsgs.p_status}<span>商品狀態:</span><c:forEach var="status" items="已上架,已下架">
			<c:if test="${insertMsgs.p_status!=null}">
			<c:if test="${status==insertMsgs.p_status}">
			<input	type="radio" size="30" name="p_status" value="${status}" checked/><span>${status}</span>
			</c:if>
			<c:if test="${status!=insertMsgs.p_status}">
			<input	type="radio" size="30" name="p_status" value="${status}" /><span>${status}</span>
			</c:if>
			</c:if>
			<c:if test="${insertMsgs.p_status==null}">
			<input	type="radio" size="30" name="p_status" value="${status}" checked/><span>${status}</span>
			</c:if>
			</c:forEach>
			<span class="error">${ErrMsg.errStatus}</span>
			<br/> 
			<span>品牌酒莊:</span><input type="text" size="30"	name="p_winery" value="${insertMsgs.p_winery}" /><span class="error">${ErrMsg.errWinery}</span><br/>
			<span>口感風味:</span><input type="text" size="30" name="p_style"	value="${insertMsgs.p_style}" /><span class="error">${ErrMsg.errStyle}</span><br/> 
			${insertMsgs.p_sales}<span>優惠狀態:</span><c:forEach var="sales" items="R,G,A,B,half,NONE">
			
			<c:if test="${insertMsgs.p_sales!=null}">
	
			<c:if test="${sales==insertMsgs.p_sales}">
			<input	type="radio" size="30" name="p_sales" value="${sales}" checked/><span>${sales}  </span>
			</c:if>
			<c:if test="${sales!=insertMsgs.p_sales}">
			<input	type="radio" size="30" name="p_sales" value="${sales}" /><span>${sales}  </span>
			</c:if>
			</c:if>
				<c:if test="${insertMsgs.p_sales==null}">
						
			<input	type="radio" size="30" name="p_sales" value="${sales}" checked/><span>${sales}  </span>
			</c:if>
			</c:forEach>
			<span class="error">${ErrMsg.errSales}</span>
			<br/>
			<span>商品容量:</span><input type="text" size="30" name="p_vol"	value="${insertMsgs.p_vol}" /><span class="error">${ErrMsg.errVol}</span><br/> 
			<span>酒精濃度:</span><input	type="text" size="30" name="p_alcho" value="${insertMsgs.p_alcho}" /><span class="error">${ErrMsg.errAlcho}</span><br/>
			<span>上架日期:</span><input type="text" size="30" name="p_date"  value="${insertMsgs.p_date}" /><span class="error">${ErrMsg.errDate}</span><br/>
			<span>商品種類:</span>
			<c:forEach var="type" items="紅葡萄酒,白葡萄酒,氣泡酒">
			<c:if test="${insertMsgs.p_type!=null}">
			<c:if test="${type==insertMsgs.p_type}">
			<input	type="radio" size="30" name="p_type" value="${type}" checked/><span>${type}  </span>
			</c:if>
			<c:if test="${type!=insertMsgs.p_type}">
			<input	type="radio" size="30" name="p_type" value="${type}" /><span>${type}  </span>
			</c:if>
				</c:if>
					<c:if test="${insertMsgs.p_type==null}">
		
			<input	type="radio" size="30" name="p_type" value="${type}" checked/><span>${type}  </span>
		
				</c:if>
			</c:forEach><span class="error">${ErrMsg.errType}</span><br/> 
			<span>葡萄種類:</span><input type="text" size="30" name="p_grape" value="${insertMsgs.p_grape}" /><span class="error">${ErrMsg.errGrape}</span><br/>
			<span>商品介紹</span><textarea style="height: 100px; width: 350px"	name="p_intro">${insertMsgs.p_intro}</textarea><span class="error">${ErrMsg.errIntro}</span><br/> 
			<input type="submit"
			value="新增商品" />
	</form>
</body>

</html>