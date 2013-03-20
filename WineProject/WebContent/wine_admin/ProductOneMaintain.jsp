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
</head>

<body>
	<img
		src="<%=request.getContextPath()%>/images/products/${ productVO.p_pic }"
		style="vertical-align: top; width: 100px;">
		<form>
	           編號:<input type="text" size="30" name="p_no" value="${ productVO.p_no}" readonly/></br>
	           名稱:<input type="text" size="30" name="p_name" value="${productVO.p_name}"/></br>
	           年分:<input type="text" size="30" name="p_year" value="${productVO.p_year}"/></br>
	           國家:<input type="text" size="30" name="p_area" value="${productVO.p_area}"/></br>
	           地區:<input type="text" size="30" name="p_country" value="${productVO.p_country}"/></br>
	           存貨:<input type="text" size="30" name="p_num" value="${productVO.p_num}"/></br>
	           價錢:<input type="text" size="30" name="p_price" value="${productVO.p_price}"/></br>
	           狀態:<input type="text" size="30" name="p_status" value="${productVO.p_status}"/></br>
	           酒莊:<input type="text" size="30" name="p_winery" value="${productVO.p_winery}"/></br>
	           風味:<input type="text" size="30" name="p_style" value="${productVO.p_style}"/></br>
	          優惠:<input type="text" size="30" name="p_sales" value="${productVO.p_sales}"/></br>
	          容量:<input type="text" size="30" name="p_vol" value="${ productVO.p_vol}"/></br>
	        酒精:<input type="text" size="30" name="p_alcho" value="${productVO.p_alcho}"/></br>
	         上架日期:<input type="text" size="25" name="p_date" value="${productVO.p_date}"/></br>
	          酒種:<input type="text" size="30" name="p_type" value="${productVO.p_type}"/></br>
	          葡萄種:<input type="text" size="27" name="p_grape" value="${productVO.p_grape}"/></br>
	       介紹<textarea style="height:100px;width:350px" name="p_intro">${productVO.p_intro}"</textarea></br>
	       <input type="submit" value="修改"/>
	    </form>
</body>

</html>