<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>${ productVO.p_name }</title>
<link rel="stylesheet" href="../style/ProductOne.css">
</head>
<body>
<div class=p_content>
	<div class="p_pics">${ productVO.p_no }�Ϥ�</div>
	<div class="p_data">
		<div class="p_title">${ productVO.p_name} </div>
		<ul class="p_info1">
			<li>${ productVO.p_winery }�]${ productVO.p_year }�~�^�A${ productVO.p_area }�A${ productVO.p_area }�C</li>
			<li>�������:${ productVO.p_grape }</li>
			<li>�����G${ productVO.p_rate }</li>
		</ul>
		<div class="p_intro">${ productVO.p_intro }</div>
		<ul>
			<li class="p_info2">�e�q�G${ productVO.p_vol }</li>
			<li>�s��@��:${ productVO.p_alcho }</li>
		</ul>
		<div class="p_purchase">
			<ul>
			<li>����G${ productVO.p_price }</li>
			<li>�s�f�ƶq�G${ productVO.p_num }</li>
			</ul>
		</div>
	</div>
	<div class="bar"></div>
</div>

</body>
</html>