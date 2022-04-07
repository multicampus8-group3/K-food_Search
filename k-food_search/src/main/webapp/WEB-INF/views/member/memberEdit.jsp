<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/mypage.css" type="text/css"/>
<script>
	$(function() {
		$("#mFrm").submit(function() {
			if($('#userpwd').val()==''){
				alert("비밀번호 입력하세요.");
				return false;
			}
			if($('#userpwd').val()!=${vo.userpwd}){
				alert("비밀번호가 틀렸습니다.");
				return false;
			}
			return true;
		});
	});
</script>
<div class='container'>
<%@ include file="mypage.jsp" %>
<div class='mypage_container'>
	<h1>회원정보 수정</h1>
	<form method="post" action="/member/memberEdit2" id="mFrm">
		<ul>
			<li>아이디</li>
			<li><input type="text" name="userid" id="userid" value="${vo.userid}" readonly></li>
			<li>비밀번호</li>
			<li><input type="text" name="userpwd" id="userpwd" placeholder="비밀번호입력"></li>
			<li><input type="submit" value="확인하기"></li>
		</ul>
	</form>
</div>
</div>