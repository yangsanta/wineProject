<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<aside id="sidebar"> <strong class="logo"><a href="#">lg</a></strong>
		<ul class="tabset buttons">
			<li class="active"><a href="admin_board.do?login=y" class="ico1"><span>儀表板</span><font
					class="text_con">儀表板</font><em></em></a> <span class="menu_tooltip"><span>儀表板</span></span>
			</li>
			<li><a href="ademin_member.jsp" class="ico2"><span>會員管理</span><font
					class="text_con">會員管理</font><em></em></a> <span class="menu_tooltip"><span>會員管理</span></span>
			</li>
			
			<li><a href="Maintain?action=getAll&pageNo=1" class="ico3"><span>商品管理</span><font
					class="text_con">商品管理</font><em></em></a> <span class="menu_tooltip"><span>商品管理</span></span>
			</li>
			 <span class="num">各項優惠</span>
			<li><a href="set_timing_sales?action=getAll" class="ico4"><span>優惠設定</span><font
					class="text_con">優惠設定</font><em></em></a> <span class="menu_tooltip"><span>優惠設定</span></span>
			</li>
			<li><a href="ademin_discount.jsp" class="ico5"><span>>首頁廣告</span><font
					class="text_con">首頁廣告</font><em></em></a> <span class="menu_tooltip"><span>首頁右邊的廣告</span></span>
			</li>
			<li><a href="set_timing_sales?action=getAll" class="ico5"><span>>每日限時</span><font
					class="text_con">每日限時</font><em></em></a> <span class="menu_tooltip"><span>首頁的每日限時商品</span></span>
			</li>			
			
			
			 <span class="num">常用</span>
			<li><a href="DiscussionManagment?action=getAll" class="ico3"><span>討論區管理</span><font
					class="text_con">討論區管理</font><em></em></a> <span class="menu_tooltip"><span>討論區管理</span></span>
			</li>
			
			<li><a href="ordersadmin.do?action=getall" class="ico7"><span>>訂單管理</span><font
					class="text_con">訂單管理</font><em></em></a> <span class="menu_tooltip"><span>訂單管理</span></span>
			</li>	
			

			<li><a href="#tab-8" class="ico8"><span>Settings</span><em></em></a>
				<span class="menu_tooltip"><span>Settings</span></span></li>
		</ul>
		<span class="shadow"></span> </aside>