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

$(function(){
	// 회원목록
	function memberListAll() {
		var url = "myapp/member/list";
		var params = "userid=${vo.userid}";
		$.ajax({
			url: url,
			data: params,
			success: function(result) {
				var $result = $(result);
				
				var tag = "<ul>";
				tag += "<li>아이디</li><li>이름</li><li>등급</li><li>전화번호</li>";
				tag += "<li>국적</li><li>선호지역</li><li>가입일</li>";
				
				$result.each(function(idx, vo){
					tag += "<li>" + vo.userid + "</li>";
					tag += "<li>" + vo.username + "</li>";
					tag += "<li>" + vo.usertype + "</li>";
					tag += "<li>" + vo.tel + "</li>";
					tag += "<li>" + vo.usernation + "</li>";
					tag += "<li>" + vo.favornation + vo.favorstate + "</li>";
					tag += "<li>" + vo.writedate + "</li>";
				});
				
				tag += "</ul>";
				
				$("#memberList").html(tag);
			},
			error: function(e) {
				console.log(e.responseText);
			}
		});
	}
	
	// 가게목록
	function restaurantListAll() {
		var url = "myapp/restaurant/list";
		var params = "resno=${vo.resno}";
		$.ajax({
			url: url,
			data: params,
			success: function(result) {
				var $result = $(result);
				
				var tag = "<ul>";
				tag += "<li>번호</li><li>상호명</li><li>주소</li><li>평점</li>";
				tag += "<li>오너</li><li>위치</li><li>등록일</li>";
				
				$result.each(function(idx, vo){
					tag += "<li>" + vo.resno + "</li>";
					tag += "<li>" + vo.resname + "</li>";
					tag += "<li>" + vo.resadress + "</li>";
					tag += "<li>" + vo.resgrade + "</li>";
					tag += "<li>" + vo.userid + "</li>";
					tag += "<li>" + vo.resnation + vo.resstate + "</li>";
					tag += "<li>" + vo.writedate + "</li>";
				});
				
				tag += "</ul>";
				
				$("#restaurantList").html(tag);
			},
			error: function(e) {
				console.log(e.responseText);
			}
		});
	}
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