<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"  %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/style/styles.css" />

<div id='cssmenu'>
<div class="box-heading"><span class="title">快速選單</span></div>
	
	
	<ul>
		<li class=' has-sub'><a href='#'><span>風味</span></a>
			<ul>
				<c:forEach var="creat" items="${style}">
					<li class='has-sub'><a
						href='<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_style&conditionValue=${creat}'><span>${creat}
						</span></a></li>
				</c:forEach>
			</ul></li>
		<li class=' has-sub'><a href='#'><span>國家/地區</span></a>
			<ul>
				<li class='has-sub'><a href='<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_area&conditionValue=法國'><span>法國</span></a>
					<c:if test="${fn:length(France)>1}"><ul>
						<c:forEach var="country" items="${France}">
							<c:if test="${not empty country}">
								<li class='last'><a
									href='<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_country&conditionValue=${country}'><span>${country}</span></a></li>
							</c:if>
						</c:forEach>
					</ul></c:if></li>
				<li class='has-sub'><a href='<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_area&conditionValue=澳洲'><span>澳洲 </span></a>
					<c:if test="${fn:length(Australia)>1}"><ul>
						<c:forEach var="country" items="${Australia}">
							<c:if test="${not empty country}">
								<li class='last'><a
									href='<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_country&conditionValue=${country}'><span>${country}</span></a></li>
							</c:if>
						</c:forEach>
					</ul></c:if></li>
				<li class='has-sub'><a href='<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_area&conditionValue=美國加州'><span>美國加州 </span></a>
					<c:if test="${fn:length(America)>1}"><ul>
						<c:forEach var="country" items="${America}">
							<c:if test="${not empty country}">
								<li class='last'><a
									href='<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_country&conditionValue=${country}'><span>${country}</span></a></li>
							</c:if>
						</c:forEach>
					</ul></c:if></li>
				<li class='has-sub'><a href='<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_area&conditionValue=義大利'><span>義大利 </span></a>
					<c:if test="${fn:length(Italy)>1}"><ul>
						<c:forEach var="country" items="${Italy}">
							<c:if test="${not empty country}">
								<li class='last'><a
									href='<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_country&conditionValue=${country}'><span>${country}</span></a></li>
							</c:if>
						</c:forEach>
					</ul></c:if></li>
				<li class='has-sub'><a href='<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_area&conditionValue=德國'><span>德國 </span></a>
					<c:if test="${fn:length(Germany)>1}"><ul>
						<c:forEach var="country" items="${Germany}">
							<c:if test="${not empty country}">
								<li class='last'><a
									href='<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_country&conditionValue=${country}'><span>${country}</span></a></li>
							</c:if>
						</c:forEach>
					</ul>	</c:if></li>
				<li class='has-sub'><a href='<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_area&conditionValue=西班牙'><span>西班牙 </span></a>
					<c:if test="${fn:length(Spain)>1}"><ul>
						<c:forEach var="country" items="${Spain}">
							<c:if test="${not empty country}">
								<li class='last'><a
									href='<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_country&conditionValue=${country}'><span>${country}</span></a></li>
							</c:if>
						</c:forEach>
					</ul>	</c:if></li>
				<li class='has-sub'><a href='<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_area&conditionValue=阿根廷'><span>阿根廷 </span></a>
					<c:if test="${fn:length(Argentina)>1}"><ul>
						<c:forEach var="country" items="${Argentina}">
							<c:if test="${not empty country}">
								<li class='last'><a
									href='<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_country&conditionValue=${country}'><span>${country}</span></a></li>
							</c:if>
						</c:forEach>
					</ul></c:if></li>
				<li class='has-sub'><a href='<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_area&conditionValue=智利'><span>智利 </span></a>
					<c:if test="${fn:length(Chile)>1}">
					<ul>
						<c:forEach var="country" items="${Chile}">
							<c:if test="${not empty country}">
								<li class='last'><a
									href='<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_country&conditionValue=${country}'><span>${country}</span></a></li>
							</c:if>
						</c:forEach>
					</ul>
						</c:if>
					</li>
				<li class='has-sub'><a href='<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_area&conditionValue=葡萄牙'><span>葡萄牙 </span></a>
					<c:if test="${fn:length(Portugal)>1}">
					<ul>
						<c:forEach var="country" items="${Portugal}">
							<c:if test="${not empty country}}">
								<li class='last'><a
									href='<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_country&conditionValue=${country}'><span>${country}</span></a></li>
							</c:if>
						</c:forEach>
					</ul>
						</c:if>
					</li>
			</ul></li>
		<li class=' has-sub'><a href='#'><span>品牌/酒莊</span></a>
			<ul>
				<c:forEach var="creat" items="${p_winery}">
					<li class='has-sub'><a
						href='<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_winery&conditionValue=${creat}'><span>${creat}
						</span></a></li>
				</c:forEach>
			</ul></li>
		<li class=' has-sub'><a href='#'><span>價格</span></a>
			<ul>
				<li class='has-sub'><a href='<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_price&conditionValue=0'><span>1000元以下 </span></a></li>
				<li class='has-sub'><a href='<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_price&conditionValue=1000'><span>1000元~2000元</span></a></li>
				<li class='has-sub'><a href='<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_price&conditionValue=2000'><span>2000元以上 </span></a></li>
			</ul></li>
		<li class=' has-sub'><a href='#'><span>容量</span></a>
			<ul>
				<c:forEach var="creat" items="${p_vol}">
					<li class='has-sub'><a
						href='<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_vol&conditionValue=${creat}'><span>${creat}ML
						</span></a></li>
				</c:forEach>
			</ul></li>
		<li class='has-sub'><a href='#'><span>酒種/葡萄種</span></a>
			<ul>
				<li class='has-sub'><a href='<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_type&conditionValue=紅葡萄酒'><span>紅葡萄酒 </span></a>
					<ul>

						<c:forEach var="grape" items="${redWine}">
							<li class='last'><a
								href='<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_grape&conditionValue=${grape}'><span>${grape}</span></a></li>
						</c:forEach>
					</ul></li>

				<li class='has-sub'><a href='<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_type&conditionValue=白葡萄酒'><span>白葡萄酒</span></a>
					<ul>

						<c:forEach var="grape" items="${whiteWine}">
							<li class='last'><a
								href='<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_grape&conditionValue=${grape}'><span>${grape}</span></a></li>
						</c:forEach>
					</ul></li>
				<li class='has-sub'><a href='<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_type&conditionValue=氣泡酒'><span>氣泡酒 </span></a>
					<ul>

						<c:forEach var="grape" items="${bubbleWine}">
							<li class='last'><a
								href='<%=request.getContextPath()%>/product/DisplayProducts.do?action=getSome_For_Display&condition=p_grape&conditionValue=${grape}'><span>${grape}</span></a></li>
						</c:forEach>
					</ul></li>
			</ul></li>
	</ul>
</div>
