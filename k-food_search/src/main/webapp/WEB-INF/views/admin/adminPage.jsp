<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
// 탭메뉴설정
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
		var url = "/listtoadmin";
		$.ajax({
			url: url,
			type:"get",
			success: function(result) {
				var $result = $(result);
				console.log("ok");
				var tag = "<ul>";
				tag += "<li>아이디</li><li>이름</li><li>등급</li><li>전화번호</li><li>국적</li><li>선호지역</li><li>가입일</li>";
				
				$result.each(function(idx, vo){
					tag += "<li>" + vo.userid + "</li>";
					tag += "<li>" + vo.username + "</li>";
					tag += "<li>" + vo.usertype + "</li>";
					tag += "<li>" + vo.tel + "</li>";
					tag += "<li>" + vo.usernation + "</li>";
					tag += "<li>" + vo.favorstate + ", " + vo.favornation + "</li>";
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
	memberListAll();
});


$(function(){
	// 가게목록
	function restaurantListAll() {
		var url = "/restaurant/listtoadmin";
		
		$.ajax({
			url: url,
			success: function(result) {
				var $result = $(result);
				
				var tag = "<ul>";
				tag += "<li>번호</li><li>상호명</li><li>주소</li><li>평점</li><li>오너</li><li>위치</li><li>등록일</li>";
				
				$result.each(function(idx, vo){
					tag += "<li>" + vo.resno + "</li>";
					tag += "<li>" + vo.resname + "</li>";
					tag += "<li>" + vo.resadress + "</li>";
					tag += "<li>" + parseFloat(vo.resgrade).toFixed(1) + "</li>";
					tag += "<li>" + vo.userid + "</li>";
					tag += "<li>" + vo.resstate + ", " + vo.resnation + "</li>";
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
	restaurantListAll();
});


$(function(){
	// 리뷰목록
	function reviewListAll() {
		var url = "/review/listtoadmin";
		
		$.ajax({
			url: url,
			success: function(result) {
				var $result = $(result);
				
				var tag = "<ul>";
				tag += "<li>번호</li><li>작성자</li><li>식당</li><li>평점</li><li>내용</li><li>작성일</li>";
				
				$result.each(function(idx, vo){
					tag += "<li>" + vo.no + "</li>";
					tag += "<li>" + vo.userid + "</li>";
					tag += "<li>" + vo.resname + "</li>";
					tag += "<li>" + parseFloat(vo.grade).toFixed(1) + "</li>";
					tag += "<li>" + vo.content + "</li>";
					tag += "<li>" + vo.writedate + "</li>";
				});
				
				tag += "</ul>";
				
				$("#reviewList").html(tag);
			},
			error: function(e) {
				console.log(e.responseText);
			}
		});
	}
	reviewListAll();
});


$(function(){
	//업주신청목록
	function ownershipListAll() {
		var url = "/listtoadmin";
		$.ajax({
			url: url,
			type: "get",
			success: function(result) {
				var $result = $(result);
				console.log(result);
				var tag = "<ul>";
				tag += "<li>아이디</li><li>이름</li><li>전화번호</li><li>상태</li>";
				
				$result.each(function(idx, vo){
					if(vo.usertype == "owner(jin)") {
						tag += "<li>" + vo.userid + "</li>";
						tag += "<li>" + vo.username + "</li>";
						tag += "<li>" + vo.tel + "</li>";				
						tag += "<li><form method='post'>";
						tag += "<input type='hidden' name='userid' value='" + vo.userid + "'/>";
						tag += "<select name='usertype'>";
						tag += "<option value='owner(jin)'>보류</option>";
						tag += "<option value='owner'>승인</option>";
						tag += "<option value='normal'>거절</option>";
						tag += "</select><input type='submit' value='확인'/></form></li>"
					}
				});
				
				tag += "</ul>";
				
				$("#ownershipList").html(tag);
			},
			error: function(e) {
				console.log(e.responseText);
			}
		});
	}
	// 업주신청처리(수정)
	$(document).on('submit', '#ownershipList form', function(){
		event.preventDefault();
		
		var params = $(this).serialize();
		var url = "/ownershipChangeOk";
		$.ajax({
			url: url,
			data: params,
			type: "post",
			success: function(result){
				location.reload();
				ownershipListAll();
				memberListAll();
				
			},
			error: function(e){
				console.log(e.responseText);
			}
		});
	});
	ownershipListAll();
});



</script>
<style>
.container{
	width: 1200px;
	margin: 0 auto;
	overflow: auto;
}

.tab_title li.on{
	font-weight: 900;
	text-decoration: underline;	
}
.tab_content>div{
	display: none;
}
.tab_content>div.on{
	display: block;
}

.tab_title{
	width: 10%;
	float: left;
	border: 1px solid #ddd;
}
.tab_title li{
	height: 40px;
	line-height: 40px;
	border-bottom:1px solid #ddd;
	text-align: center;
}
.tab_content{
	width: 85%;
	float: right;
	padding: 0 20px 20px 20px;
}


#memberList {
	display: block;
	height: 500px;
}
#memberList>ul>li {
	float: left;
	height: 40px;
	line-height: 40px;
	width: 10%;
	border-bottom:1px solid #ddd;
	overflow-x: scroll;
	white-space:nowrap;
}
#memberList>ul>li:nth-child(7n){
	width: 17%;
}
#memberList>ul>li:nth-child(7n+2){
	width: 13%;
}
#memberList>ul>li:nth-child(7n+4),
#memberList>ul>li:nth-child(7n+6){
	width: 20%;
}

#memberList>ul>li:nth-child(n+1):nth-child(-n+7) {
	border-bottom: 3px solid #ddd;
}


#restaurantList {
	display: block;
	height: 500px;
}
#restaurantList>ul>li {
	float: left;
	height: 80px;
	line-height: 40px;
	width: 5%;
	border-bottom:1px solid #ddd;
	overflow: auto;
	white-space:pre-wrap;	
}
#restaurantList>ul>li:nth-child(7n+2){
	width: 25%;
}
#restaurantList>ul>li:nth-child(7n+3){
	width: 35%;
}
#restaurantList>ul>li:nth-child(7n+4){
	color: red;
}
#restaurantList>ul>li:nth-child(7n),
#restaurantList>ul>li:nth-child(7n+5),
#restaurantList>ul>li:nth-child(7n+6){
	width: 10%;
}

#restaurantList>ul>li:nth-child(n+1):nth-child(-n+7) {
	color: black;
	border-bottom: 3px solid #ddd;
	height: 40px;
	line-height: 40px;
}



#reviewList>ul>li {
	float: left;
	height: 80px;
	line-height: 40px;
	width: 5%;
	border-bottom:1px solid #ddd;
	overflow: auto;
	white-space:pre-wrap;	
}
#reviewList>ul>li:nth-child(6n){
	width: 15%;
}
#reviewList>ul>li:nth-child(6n+2){
	width: 10%;
}
#reviewList>ul>li:nth-child(6n+3){
	width: 25%;
}
#reviewList>ul>li:nth-child(6n+4){
	color: red;
}

#reviewList>ul>li:nth-child(6n+5){
	width: 40%;
}
#reviewList>ul>li:nth-child(n+1):nth-child(-n+6) {
	color: black;
	border-bottom: 3px solid #ddd;
	height: 40px;
	line-height: 40px;
}



#ownershipList>ul>li {
	float: left;
	height: 40px;
	line-height: 40px;
	width: 25%;
	border-bottom:1px solid #ddd;
}

#ownershipList>ul>li:nth-child(n+1):nth-child(-n+4) {
	color: black;
	border-bottom: 3px solid #ddd;
	height: 40px;
	line-height: 40px;
}




</style>
<div class="container">
	<h1>관리자메뉴</h1>
	<ul class="tab_title">
		<li>회원목록</li>
		<li>가게목록</li>
		<li class="on">리뷰목록</li>
		<li>업주승인</li>
		<li>FAQ등록</li>
		<li>광고신청목록</li>
	</ul>
	
	<div class="tab_content">
		<div>
			<h3>회원목록</h3>
			<div id="memberList">
			
			</div>
		</div>
		
		<div>
			<h3>가게목록</h3>
			<div id="restaurantList">
			</div>
		</div>
		
		<div class="on">
			<h3>리뷰목록</h3>
			<div id="reviewList">
			</div>
		</div>
		
		<div>
			<h3>업주승인</h3>
			<div id="ownershipList">
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