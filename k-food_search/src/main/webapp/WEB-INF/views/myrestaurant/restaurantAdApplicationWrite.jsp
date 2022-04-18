<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet"  href='/css/backCSS/restaurantAdApplicationWrite.css' type="text/css"/>
<script src="/js/backjs/restaurantAdApplicationWrite.js"></script>
<div class='resSignUpDiv'>
	<span class="topText">광고 등록 신청</span><br/>
	<hr style='margin-bottom:40px;'/> 
	<form method='post' action='/restaurantAdApplicationWriteOk' enctype="multipart/form-data" id='adFrm'>
		<span>매장 등록 번호</span><br/>
		<input type='text' name ='resno' placeholder='매장 등록 번호를 입력하세요.' id='resno'><br/>
		<span class='text'>*등록 번호는 내 업체 정보에서 확인하실 수 있습니다.</span><br/>
		<span>배너 광고 이미지</span><br/>
		<input type='file' name ='bennerimg1' id='bennerimg'  accept=".gif, .jpg, .png"><br/>
		<span>광고 개재일</span><br/>
		<input type="date" name ='startdate' id='startdate'><br/>
		<span>광고 종료일</span><br/>
		<input type='date' name ='enddate' id='enddate'><br/>
		<input type='hidden' name ='status' value='apply'>
		<button>신청</button>
	</form>
	<img src='/img/conputer.png' id='conputerImg'/>
</div>
</body>
</html>