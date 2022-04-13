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
		var url = "/memberListToAdmin";
		$.ajax({
			url: url,
			type:"get",
			success: function(result) {				
				var $result = $(result);
				var tag = "<ul>";
				tag += "<li>아이디</li><li>이름</li><li>등급</li><li>연락처</li><li>국적</li><li>선호지역</li><li>가입일</li>";
				
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
// 회원검색
$(document).ready(function(){
	$("#memberSearchFrm").click(function(){
		var url = "/memberSearchToAdmin";
		$.ajax({
			url: url,
			type: "get",
			data: $("#memberSearchFrm").serialize(),
			success: function(result) {
				console.log(result);
				$("#memberList").empty();
				
				var $result = $(result);
				var tag = "<ul>";
				tag += "<li>아이디</li><li>이름</li><li>등급</li><li>연락처</li><li>국적</li><li>선호지역</li><li>가입일</li>";
				
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
	})
});

$(function(){
	// 가게목록
	function restaurantListAll() {
		var url = "/restaurant/resListToAdmin";
		
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
//가게검색
$(document).ready(function(){
	$("#resSearchFrm").click(function(){
		var url = "/restaurant/resSearchToAdmin";
		$.ajax({
			url: url,
			type: "get",
			data: $("#resSearchFrm").serialize(),
			success: function(result) {
				console.log(result);
				$("#restaurantList").empty();
				
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
	})
});

$(function(){
	// 리뷰목록
	function reviewListAll() {
		var url = "/review/revListToAdmin";
		
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
//리뷰검색
$(document).ready(function(){
	$("#revSearchFrm").click(function(){
		var url = "/review/revSearchToAdmin";
		$.ajax({
			url: url,
			type: "get",
			data: $("#revSearchFrm").serialize(),
			success: function(result) {
				console.log(result);
				$("#reviewList").empty();
				
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
	})
});

$(function(){
	//업주신청목록
	function ownershipListAll() {
		var url = "/memberListToAdmin";
		$.ajax({
			url: url,
			type: "get",
			success: function(result) {
				var $result = $(result);
				var tag = "<ul>";
				tag += "<li>아이디</li><li>이름</li><li>연락처</li><li>상태</li>";
				
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
				ownershipListAll();
				
			},
			error: function(e){
				console.log(e.responseText);
			}
		});
	});
	ownershipListAll();
});

 $(function(){
	 // FAQ목록
	 function faqListAll() {
		 var url = "/faq/faqListToAdmin";
		 
		 $.ajax({
			url: url,
			success: function(result) {
				var $result = $(result);
				
				var tag = "";
				// tag += "<li>번호</li><li>내용</li>";
				
				$result.each(function(idx, vo){
					// tag += "<li>" + vo.no + "</li>";
					// tag += "<li>" + vo.content + "</li>";
					tag += "<div>";
					tag += "<b>" + vo.no + "</b><br/>";
					tag += "<span>" + vo.content + "</span><br/>";
					tag += "<input type='button' value='삭제' title='"+vo.no+"'/>";
					tag += "</div>";
				})
				
				
				
				$("#faqList").html(tag);
			},
			error: function(e) {
				console.log(e.responseText);	
			}
		 });
	 }
	 
	 // FAQ등록
	 $("#faqFrm").submit(function(){
		event.preventDefault();
		if($("#content").val()=="") {
			alert("내용을 입력 후 등록하세요.");
			return;
		}else {
			var url = "/faq/faqMakeOk";
			var params = $("#faqFrm").serialize();
			
			$.ajax({
				url: url,
				data: params,
				type: 'POST',
				success: function(result) {
					$("#content").val("");
					faqListAll();
				},
				error: function(e) {
					console.log(e.responseText);
				}
			});
		}
	 });
	 // FAQ삭제
	 $(document).on('click', '#faqList input[value=삭제]', function(){
		if(confirm('FAQ를 삭제하시겠습니까?')){
			var params = "no="+$(this).attr("title");
			$.ajax({
				url: '/faq/deltoadmin',
				data: params,
				success: function(result) {
					faqListAll();
				},
				error: function() {
					console.log(e.responseText);
				}
			});
		} 
	 });
	 
	 faqListAll();
 });

 $(function(){
	//광고신청목록
	function adListAll() {
		var url = "/ad/adListToAdmin";
		$.ajax({
			url: url,
			type: "get",
			success: function(result) {
				var $result = $(result);
				var tag = "<ul>";
				tag += "<li>번호</li><li>상호명</li><li>오너</li><li>연락처</li>";
				tag += "<li>파일</li><li>시작</li><li>종료</li><li>작성일</li><li>상태</li>";
				$result.each(function(idx, vo){
					tag += "<li>" + vo.no + "</li>";
					tag += "<li>" + vo.resname + "</li>";
					tag += "<li>" + vo.userid + "</li>";	
					tag += "<li>" + vo.tel + "</li>";
					tag += "<li>" + vo.bannerimg + "</li>";
					tag += "<li>" + vo.startdate + "</li>";
					tag += "<li>" + vo.enddate + "</li>";
					tag += "<li>" + vo.writedate + "</li>";
					tag += "<li>"+ vo.status + "<br/><form method='post'>";
					tag += "<input type='hidden' name='no' value='" + vo.no + "'/>";
					tag += "<select name='status'>";
					tag += "<option value='대기'>대기</option>";
					tag += "<option value='진행'>진행</option>";
					tag += "<option value='만료'>만료</option>";
					tag += "</select><input type='submit' value='확인'/></form></li>"
				});
				
				tag += "</ul>";
				
				$("#adList").html(tag);
			},
			error: function(e) {
				console.log(e.responseText);
			}
		});
	}
	// 광고신청처리(수정)
	$(document).on('submit', '#adList form', function(){
		event.preventDefault();
		
		var params = $(this).serialize();
		var url = "/adStatusChangeOk";
		$.ajax({
			url: url,
			data: params,
			type: "post",
			success: function(result){
				adListAll();
			},
			error: function(e){
				console.log(e.responseText);
			}
		});
	});
	adListAll();
});
</script>
<style>
.container{
	width: 1200px;
	margin: 0 auto;
	overflow: auto;
}
.hi_admin{
	font-size: 24px;
	margin-top: 20px;
}
.tab_title li.on{
	font-weight: 900;
	font-size: 48px;
	color: #2F4858;
}
.tab_title li:hover{
	transform: scale(1.2);
	outline: none;
}
.tab_content>div{
	display: none;
}
.tab_content>div.on{
	display: block;
}
.tab_title{
	width: 90%;
	height: 230px;
	margin: 0 auto;
	cursor:pointer;
	margin-top:20px;
	margin-bottom: 40px;
	font-weight: 700;
}
.tab_title li{
	float: left;
	outline: 1px solid #fff;
	text-align: center;
	color: white;
	font-size: 22px;
}
.tab_title li:nth-child(1){
	width: 25%;
	height: 230px;
	line-height: 230px;
	background-color: rgba(205, 188, 171, 0.7);
}
.tab_title li:nth-child(1):hover{
	background-color: rgba(205, 188, 171, 1);
}
.tab_title li:nth-child(2){
	width: 30%;
	height: 130px;
	line-height: 130px;
	background-color: rgba(165, 166, 143, 0.7);
}
.tab_title li:nth-child(2):hover{
	background-color: rgba(165, 166, 143, 1);
}
.tab_title li:nth-child(3){
	width: 20%;
	height: 130px;
	line-height: 130px;
	background-color: rgba(205, 188, 171, 0.7);
}
.tab_title li:nth-child(3):hover{
	background-color: rgba(205, 188, 171, 1);
}
.tab_title li:nth-child(4){
	width: 25%;
	height: 130px;
	line-height: 130px;
	background-color: rgba(165, 166, 143, 0.7);
}
.tab_title li:nth-child(4):hover{
	background-color: rgba(165, 166, 143, 1);
}
.tab_title li:nth-child(5){
	width: 25%;
	height: 100px;
	line-height: 100px;
	background-color: rgba(89, 121, 115, 0.7);
}
.tab_title li:nth-child(5):hover{
	background-color: rgba(89, 121, 115, 1);
}
.tab_title li:nth-child(6){
	width: 50%;
	height: 100px;
	line-height: 100px;
	background-color: rgba(125, 144, 159, 0.7);
}
.tab_title li:nth-child(6):hover{
	background-color: rgba(125, 144, 159, 1);
}
.tab_content{
	width: 90%;
	margin: 0 auto;
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
	background-color: rgba(205, 188, 171, 0.5);
	font-weight: bold;
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
	background-color: rgba(165, 166, 143, 0.5);
	font-weight: bold;
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
#reviewList>ul>li:nth-child(n+1):nth-child(-n+6){
	color: black;
	border-bottom: 3px solid #ddd;
	height: 40px;
	line-height: 40px;
	background-color: rgba(205, 188, 171, 0.5);
	font-weight: bold;
}

#ownershipList>ul>li{
	float: left;
	height: 40px;
	line-height: 40px;
	width: 25%;
	border-bottom:1px solid #ddd;
}
#ownershipList>ul>li:nth-child(n+1):nth-child(-n+4){
	color: black;
	border-bottom: 3px solid #ddd;
	height: 40px;
	line-height: 40px;
	background-color: rgba(165, 166, 143, 0.5);
	font-weight: bold;
}
#ownershipList select {
	width: 100px;
	height: 30px;
	background-color: rgba(205, 188, 171, 0.2);
	border: 1px solid #597973;
	border-right: none;
	vertical-align: top;
	margin-top: 5px;
}
#ownershipList select option{
	background-color: rgba(205, 188, 171, 0.7);
}
#ownershipList input[type="submit"] {
	color: #fff;
	background-color: rgba(89, 121, 115, 0.7);
	border: 1px solid #597973;
	border-left: none;
	height: 30px;
	width: 40px;
	margin-top: 4px;
}


#faqFrm textarea{
	width: 50%;
	resize: none;
	height: 44px;
	border: 1px solid #597973;
	border-right: none;
}
#faqFrm input[type="submit"]{
	height: 50px;
	vertical-align: top;
	margin-left: -7px;
	background-color: rgba(89, 121, 115, 0.7);
	border: 1px solid #597973;
	border-left: none;
	color: #fff;
	font-size: 16px;
}
#faqList>div{
 	float: left;
 	width: 45%;
 	height: 80px;
	border: 1px solid black;
	border-radius: 5px;
	margin: 10px 5px 5px 5px;
	padding: 10px;	
}
#faqList>div:nth-child(2n){
 	float: right;
 	width: 45%;
 	height: 80px;
 	border: 1px solid black;
	border-radius: 5px;
	margin: 10px 5px 5px 5px;
	padding: 10px;
}
#faqList>div:nth-child(4n+1),
#faqList>div:nth-child(4n){
	background-color: rgba(165, 166, 143, 0.3);
}
#faqList>div:nth-child(4n+2),
#faqList>div:nth-child(4n+3){
	background-color: rgba(89, 121, 115, 0.3);
}
#faqList>div>b{
	font-size: 20px;
}
#faqList>div>span{
	margin-left: 20px;
}
#faqList>div>input{
	float: right;
	margin-top: 5px;
	background-color: rgba(89, 121, 115, 0.7);
	border: 1px solid #597973;
	color: #fff;
	height: 30px;
	width: 40px;
}

#adList>ul>li {
	float: left;
	height: 80px;
	line-height: 40px;
	width: 5%;
	border-bottom:1px solid #ddd;
	overflow: auto;
	white-space:pre-wrap;	
}

#adList>ul>li:nth-child(9n+3){
	width: 8%;
}
#adList>ul>li:nth-child(9n),
#adList>ul>li:nth-child(9n+5),
#adList>ul>li:nth-child(9n+6),
#adList>ul>li:nth-child(9n+7){
	width: 10%;
}
#adList>ul>li:nth-child(9n+4),
#adList>ul>li:nth-child(9n+8){
	width: 15%;
}
#adList>ul>li:nth-child(9n+2){
	width: 17%;
}
#adList>ul>li:nth-child(n+1):nth-child(-n+9){
	color: black;
	border-bottom: 3px solid #ddd;
	height: 40px;
	line-height: 40px;
	background-color: rgba(125, 144, 159, 0.5);
	font-weight: bold;
}
#adList select {
	width: 50px;
	height: 30px;
	background-color: rgba(205, 188, 171, 0.2);
	border: 1px solid #597973;
	border-right: none;
	vertical-align: top;	
}
#adList select option{
	background-color: rgba(205, 188, 171, 0.7);
}
#adList input[type="submit"] {
	color: #fff;
	background-color: rgba(89, 121, 115, 0.7);
	border: 1px solid #597973;
	border-left: none;
	height: 30px;
	width: 40px;
	vertical-align: top;
}

.searchFrm{
	height: 40px;
	line-height: 40px;
}
.searchFrm select{
	width: 80px;
	height: 30px;
	border: 1px solid #2F4858;
	vertical-align: top;
	padding: 5px;
}
.searchFrm input[type="text"]{
	width: 200px;
	height: 26px;
	border: 1px solid #2F4858;
	vertical-align: top;
}
.searchFrm input[type="button"]{
	width:45px;
	height: 30px;
	border: 1px solid #2F4858;
	background-color: rgba(89, 121, 115, 0.7);;
	vertical-align: top;
	color: #fff;
	font-weight: 500;
}
</style>

<div class="container">
	<div class="hi_admin">
	Hello, <b>${username }</b>🍚<br/>
	Welcome to Admin
	</div>
	<ul class="tab_title">
		<li>회원목록</li>
		<li>가게목록</li>
		<li>리뷰목록</li>
		<li>업주승인</li>
		<li>FAQ등록</li>
		<li>광고신청목록</li>
	</ul>
	<div class="tab_content">
		<div>
			<!-- <h3>회원목록</h3> -->
			<div>
				<form method="get" class="searchFrm" id="memberSearchFrm">
					<select name="searchKey">
						<option value="userid">아이디</option>
						<option value="username">이름</option>
						<option value="usertype">등급</option>
						<option value="usernation">국적</option>
					</select>
					<input type="text" name="searchWord"/>
					<input type="button" value="검색"/>
				</form>
			</div>
			<div id="memberList">
			</div>
		</div>
		
		<div>
			<!-- <h3>가게목록</h3> -->
			<div>
				<form method="get" class="searchFrm" id="resSearchFrm">
					<select name="searchKey">
						<option value="resname">상호명</option>
						<option value="resadress">주소</option>
						<option value="userid">오너</option>
						<option value="resstate">위치</option>
					</select>
					<input type="text" name="searchWord"/>
					<input type="button" value="검색"/>
				</form>
			</div>
			<div id="restaurantList">
			</div>
		</div>
		
		<div>
			<!-- <h3>리뷰목록</h3> -->
			<div>
				<form method="get" class="searchFrm" id="revSearchFrm">
					<select name="searchKey">
						<option value="rev.userid">작성자</option>
						<option value="res.resname">식당</option>
						<option value="rev.grade">평점</option>
					</select>
					<input type="text" name="searchWord"/>
					<input type="button" value="검색"/>
				</form>
			</div>
			<div id="reviewList">
			</div>
		</div>
		
		<div>
			<!-- <h3>업주승인</h3> -->
			<div id="ownershipList">
			</div>
		</div>
		
		<div>
			<!-- <h3>FAQ등록</h3> -->
			<form method='post' id="faqFrm">
				<input type="hidden" name="no"/>
				<textarea name="content" id="content"></textarea>
				<input type="submit" value="등록"/>
			</form>
			<div id="faqList">
			</div>
		</div>
		
		<div class="on">
			<!-- <h3>광고신청목록</h3> -->
			<div id="adList">
			</div>
		</div>
		
	</div>
</div>