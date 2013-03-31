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
		<link href="<%=request.getContextPath()%>/style/reset.css"
			rel="stylesheet" type="text/css" />
		<link
			href="<%=request.getContextPath()%>/style/bootstrap/css/bootstrap.min.css"
			rel="stylesheet" media="screen">
			<script src="http://code.jquery.com/jquery.js"></script>
			<script
				src="<%=request.getContextPath()%>/style/bootstrap/js/bootstrap.js"></script>

			<script type="text/javascript"
				src="<%=request.getContextPath()%>/js/jquery.fancybox.js?v=2.1.4"></script>
			<link rel="stylesheet" type="text/css"
				href="<%=request.getContextPath()%>/style/jquery.fancybox.css?v=2.1.4"
				media="screen" />
			<link rel="stylesheet" type="text/css"
				href="<%=request.getContextPath()%>/style/index.css?v=1.0"
				media="screen" />

			<script type="text/javascript"
				src="<%=request.getContextPath()%>/js/index.js?v=1.0"></script>
			<style type="text/css">
.show_pro {
	border-bottom: #ccc 1px solid;
	overflow: auto;
	width: 100%;
	border-left: #ccc 1px solid;
	border-right: #ccc 1px solid;
}

.show_pro:hover {
	background: rgb(238, 245, 236)
}

.pro_list {
	float: left;
	list-style: none;
}

.pro_list2 {
	float: right;
	list-style: none;
	margin: 30px 30px 0 0;
}

.pro_list3 {
	float: left;
	list-style: none;
	width: 350px;
}

.mcntservice01 h3 {
	color: #006699;
	font-size: 123.1%;
	font-weight: 700;
}

.color_1 {
	color: #D80000;
}

.prod_img {
	background: #fff;
	border: #ccc 1px solid;
	padding: 3px;
	margin: 15px;
	width: 100px;
	height: 100px;
	text-align: center;
}

.buttonbuy {
	margin-top: 10px;
}

.pro_title {
	width: 100%;
	height: 21px;
	background-repeat: repeat-x;
	background: url(<%=request.getContextPath()%>/images/product_list_top.png);
	border-left: #ccc 1px solid;
	border-right: #ccc 1px solid;
}
</style>
			<script type="text/javascript">
				
			</script>
			<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
			<!--[if lt IE 9]>
      <script src="twitter.github.com/bootstrap/assets/js/html5shiv.js"></script>
    <![endif]-->
</head>

<body>
	<div id="shadow_bg">
		<div id="body">
			<%@ include file="../view_model/index_header.jsp"%>
			<div id="main">
				<div id="sidebar">
					<%@ include file="../view_model/product_list.jsp"%>
					<%@ include file="../view_model/index_left_hotsale.jsp"%>
				</div>

				<div id="content">
					<%@ include file="view_model/page_alert.htm"%>




					<div class="container_24 clearfix container_24bg">
						<h1 class="hidettl" >酒迷使用者條款</h1>
						<div class="grid_20 push_4 mcntservice01">
							<h2>
								<strong class="color_1">酒迷使用者條款</strong>
							</h2>
							<p>歡迎您使用酒迷創意行銷有限公司網站進行消費，在結帳前請您先詳細閱讀以下約定條款：</p>
							<ol class="mcntolservice01">
								<li>
									<h3>使用者的守法義務及承諾</h3>
									<p>任何以非法目的或經由任何非法方式使用本網站，並承諾遵守中華民國相關法規及一切使用網際網路之國際慣例。您若係中華民國以外之使用者，並同意遵守所屬國家或地域之法令。您同意並保證不得利用本服務從事侵害他人權益或違法之行為。
									        當您使用本網站之相關服務時，相關事實認定的依據，應以本網站之資料庫所記錄的資料及您舉出的證據資料為準。若有發生任何糾紛，雙方將以最大誠意提出各自所儲存的電子資料記錄或證據資料提交於法院或公正第三人作認定。
									        您得依據本服務所提供的確認商品數量及價格機制進行下單。本公司對您的下單內容，除於下單後兩個工作天內附正當理由拒絕外，為接受下單。但您已付款者，除法律另有規定外，視為交易成立。</p>
								</li>
								<li>
									<h3>使用者義務</h3>
									<p>本網站提供會員消費服務，如果您想在本網站消費，您必須在首次訂購流程中填入您合法且有效的電子郵件信箱並設定密碼，本系統將會紀錄您所填入之電子郵件信箱及密碼以及相關訂購人資訊，將該資訊設定為您私人的會員資料。 
										身為歐森會員您必須同意日後以該組電子郵件信箱及密碼登錄本網消費，且須同意以下事項：</p>
									<ul class="color_1">
										<li>
											<p>
												(1)&nbsp;如果您的個人資料有所異動，請您務必隨時更新，提供最新、正確的資訊，以保障您的權益。<br>
													(2)&nbsp;若您提供任何錯誤不實的資料，本網站有權暫停或終止您的帳號，並拒絕您使用本服務之全部或部分。<br>
														(3)&nbsp;您提供之個人資料若有填寫不實，或原所登錄之資料已不符合真實而未更新，或有任何誤導之嫌，本公司保留隨時終止您會員資格及使用各項服務資格之權利，若因此而產生之損失，本公司有權利請求損害賠償。<br>
															(4)&nbsp;您不得透過歐森網站進行任何商業宣傳、廣告、販售等活動。<br>
																(5)&nbsp;會員對會員本身於歐森或透過歐森有限公司傳輸的一切內容應自負全責。<br>
																	(6)&nbsp;使用本網站之服務時，若有(包括但不限於)提供錯誤或不實資料進行會員登錄、未經本人許可而盜刷其信用卡、無故未在通知期限內至該指定門市取貨超過本公司所定比率、非因物品本身瑕疵惡意退貨、連續向本公司客服部門主張與服務及商品無關的問題，或其他違反本條款內容、本網站設立宗旨及會員服務精神的情況時，本公司均得逕行暫停、終止或拒絕提供會員及其他一切服務。您在此承諾，不論任何原因，當本公司依本條款終止您的會員服務時，均無須得到您的同意，且本公司對您或任何第三人均不負任何義務或責任。
											</p>
										</li>					
									</ul>
								</li>
								<li>
									<h3>服務終止及免責條款</h3>
									<p>本公司確保以符合目前一般可合理期待安全性之方式及技術，維護本網站之正常運作。本公司有權於下列情況下暫停、中斷或拒絕提供本服務之全部或一部，且不負事先通知您的義務，本公司對使用者任何直接或間接的損害，均不負任何賠償或補償的義務：</p>
									<ul class="color_1">
										<li>
											<p>
												(1)&nbsp;對本服務相關軟硬體設備進行搬遷、更換、升級、保養或維修時。<br>
													(2)&nbsp;使用者有任何違反政府法令或本條款之情形。<br>
														(3)&nbsp;天災或其他不可抗力因素所導致的服務中止或中斷。<br>
															(4)&nbsp;其他不可歸責於本公司事由所致的服無中止或中斷。<br>
																(5)&nbsp;非本公司所得控制的事由而致本服務資訊顯示不正確、或遭偽造、竄改、刪除或擷取、或致系統中斷或不能正常運作時。<br>
																	(6)&nbsp;使用本公司簡訊發送或其他電子訊息傳輸服務時，出現誹謗、攻擊或傷害性字眼，或其他違背公序良俗的內容，本公司有權拒絕您使用本服務。
																		(7)&nbsp;其他本公司認為有需要中止或中斷服務之情形。
											</p>
										</li>					
									</ul>
								</li>
							
								<li>
									<h3>酒迷聲明</h3>
									<p>客戶與本公司之權利義務關係，應依網路規範及中華民國法令解釋及規章、慣例為依據辦理。本公司的任何聲明、條款如有未盡完善之處，將以最大誠意，依誠實信用、平等互惠原則，共商解決之道。</p>
								</li>
							</ol>
								
						</div>



						<%@ include file="../view_model/index_fast_login.htm"%>


						<br class="clear" />

					</div>
					<br class="clear" />
				</div>
			</div>
			<%@ include file="../view_model/index_footer.htm"%>

		</div>

	</div>
</body>

</html>