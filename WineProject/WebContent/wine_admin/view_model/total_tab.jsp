<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="controls">
	<nav class="links">
		<ul>
			<li><a href="#" class="ico1">訊息 <span class="num">216</span></a></li>
			<li><a href="#" class="ico2">Alerts <span class="num">5</span></a></li>
			<li><a href="#" class="ico3">訂單<span class="num">3</span></a></li>
		</ul>
	</nav>
	<div class="profile-box">
		<span class="profile"> <a href="#" class="section"> <img
				class="image" src="images/NTUE_Andy.jpg" alt="image description"
				width="26" height="26" /> <span class="text-box"> Welcome <strong
					class="name">${sessionScope.a_name}</strong>
			</span>
		</a> <a href="#" class="opener">opener</a>
		</span> <a href="#" class="btn-on">On</a>
	</div>
</div>