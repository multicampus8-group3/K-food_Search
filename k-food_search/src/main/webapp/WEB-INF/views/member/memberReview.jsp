<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/mypage.css" type="text/css"/>
<style>
.memberReviewList {
	width: 800px;
	height: 200px;
	border: 1px solid gray;
	margin-left: 100px;
	margin-bottom: 20px;
}
.memberReviewList img {
	float: right;
	padding-right: 10px;
	padding-top: 10px;
	
}
#a{
	width: 600px;
	display: block;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	font-size: 20px;
	margin-bottom: 5px;
}

#c{
	width: 500px;
	height: 125px;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	margin-top: 5px;
}
</style>
<div class='container'>
<%@ include file="mypage.jsp" %>
<div class='mypage_container'>
	<h1>내 리뷰보기</h1>
	
	<c:forEach var="vo" items="${list}">
		<div id="memberReviewList">
			<img id="resimg" name="resimg" src="/img/noImg.jpg"/>
			<span id="a">{vo.resgrade} <a href="#">{vo.resname}</a><br/></span>
			<span id="b">{vo.writedate}<br/></span>
			<div id="c">{vo.grade} {vo.content}</div>
		</div>
	</c:forEach>

</div>
</div>