<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
$(document).ready(function(){
	$(".tab_title li").click(function(){
		var idx = $(this).index();
		$(".tab_title li").removeClass("on");
		$(".tab_title li").eq(idx).addClass("on");
		$(".tab_content>div").hide();
		$(".tab_content>div").eq(idx).show();
	});
});
</script>
<div class="container">
	<h1>관리자메뉴</h1>
	<ul class="tab_title">
		<li class="on">회원목록</li>
		<li>가게목록</li>
		<li>리뷰목록</li>
		<li>업주승인</li>
		<li>FAQ등록</li>
		<li>광고신청목록</li>
	</ul>
	
	<div class="tab_content">
		<div class="on">
			<h3>회원목록</h3>
			<div id="memberList">
			</div>
		</div>
		
		<div>
			<h3>가게목록</h3>
			<div id="restaurantList">
			</div>
		</div>
		
		<div>
			<h3>리뷰목록</h3>
			<div id="reviewList">
			</div>
		</div>
		
		<div>
			<h3>업주승인</h3>
			<div id="">
			</div>
		</div>
		
		<div>
			<h3>FAQ등록</h3>
			<div id="faqList">
			</div>
		</div>
		
		<div>
			<h3>광고신청목록</h3>
			<div id="adList">
			</div>
		</div>
		
	</div>
</div>