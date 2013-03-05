<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>${ productVO.p_name }</title>
<link rel="stylesheet" href="../style/ProductOne.css">
</head>
<body>
<div class=p_content>
	<div class="p_pics">${ productVO.p_pic }圖片</div>
	<div class="p_data">
		<div class="p_title">${ productVO.p_name} </div>
		<ul class="p_info1">
			<li>${ productVO.p_winery }（${ productVO.p_year }年），${ productVO.p_area }，${ productVO.p_area }。</li>
			<li>葡萄種類:${ productVO.p_grape }</li>
			<li>評分：${ productVO.p_rate }</li>
		</ul>
		<div class="p_intro">${ productVO.p_intro }</div>
		<ul>
			<li class="p_info2">容量：${ productVO.p_vol }</li>
			<li>酒精濃度:${ productVO.p_alcho }</li>
		</ul>
		<div class="p_purchase">
			<ul>
			<li>價格：${ productVO.p_price }</li>
			<li>存貨數量：${ productVO.p_num }</li>
			</ul>
		</div>
	</div>
	<div class="bar"></div>
</div>

</body>
</html>