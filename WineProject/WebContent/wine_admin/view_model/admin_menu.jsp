<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<aside id="sidebar"> <strong class="logo"><a href="#" onclick="alert("感謝您使用我們的網站，我們網站目前為止你還滿意嗎? :p")>lg</a></strong>
		<ul class="tabset buttons" style="width: 75px;">
			<li class="adminboard"><a href="<%=request.getContextPath()%>/wine_admin/admin_board.do?login=y" class="ico1"><span>儀表板</span><font
					class="text_con">儀表板</font><em></em></a> <span class="menu_tooltip"><span>儀表板</span></span>
			</li>
			<li class="member"><a href="<%=request.getContextPath()%>/wine_admin/ademin_member.jsp" class="ico2"><span>會員管理</span><font
					class="text_con">會員管理</font><em></em></a> <span class="menu_tooltip"><span>會員管理</span></span>
			</li>
			
			<li class="product"><a href="<%=request.getContextPath()%>/wine_admin/Maintain?action=getAll&pageNo=1" class="ico3"><span>商品管理</span><font
					class="text_con">商品管理</font><em></em></a> <span class="menu_tooltip"><span>商品管理</span></span>
			</li>
			 <span class="num">各項優惠</span>
			<li class="prodis"><a href="<%=request.getContextPath()%>/wine_admin/MaintainSales?action=getAll&pageNo=1" class="ico4"><span>商品優惠</span><font
					class="text_con">商品優惠</font><em></em></a> <span class="menu_tooltip"><span>商品優惠</span></span>
			</li>
			<li class="discount"><a href="<%=request.getContextPath()%>/wine_admin/ademin_discount.jsp" class="ico5"><span>>首頁廣告</span><font
					class="text_con">首頁廣告</font><em></em></a> <span class="menu_tooltip"><span>首頁右邊的廣告</span></span>
			</li>
			<li class="TS"><a href="<%=request.getContextPath()%>/wine_admin/set_timing_sales?action=getAll" class="ico5"><span>每日限時</span><font
					class="text_con">每日限時</font><em></em></a> <span class="menu_tooltip"><span>首頁的每日限時商品</span></span>
			</li>			
			
			
			 <span class="num">常用</span>
			<li class="discussion"><a href="<%=request.getContextPath()%>/wine_admin/DiscussionManagment?action=getAll" class="ico3"><span>討論區管理</span><font
					class="text_con">討論區管理</font><em></em></a> <span class="menu_tooltip"><span>討論區管理</span></span>
			</li>
			<li class="food"><a href="<%=request.getContextPath()%>/wine_admin/food.do?action=Foodsetinsert" class="ico3"><span>餐酒搭配</span><font
					class="text_con">餐酒搭配</font><em></em></a> <span class="menu_tooltip"><span>餐酒搭配</span></span>
			</li>
			
			<li class="order"><a href="<%=request.getContextPath()%>/wine_admin/ordersadmin.do?action=getall" class="ico7"><span>訂單管理</span><font
					class="text_con">訂單管理</font><em></em></a> <span class="menu_tooltip"><span>訂單管理</span></span>
			</li>	
			<li class="free"><a href="<%=request.getContextPath()%>/wine_admin/couponsetadmin.do?action=getAll" class="ico8"><span>優惠設定</span><font
					class="text_con">優惠設定</font><em></em></a> <span class="menu_tooltip"><span>免運費、優惠券設定</span></span>
			</li>	
				<span class="num">前台</span>
			<li><a href="<%=request.getContextPath()%>/index.jsp" class="ico7"><span>>回到前台</span><font
					class="text_con">回到前台</font><em></em></a> <span class="menu_tooltip"><span>回到網站前台頁面</span></span>
			</li>
				
		</ul>
		<span class="shadow"></span> </aside>