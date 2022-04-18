<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet"  href='/css/backCSS/restaurantAdApplication.css' type="text/css"/>
<link rel="stylesheet"  href='/css/backCSS/adHow.css' type="text/css"/>
<script src="/js/backjs/restaurantAdApplication.js"></script>
﻿<%@ include file="acordian.jspf" %>
<div class='resSignUpDiv'>
	<style>
		
	</style>
	<div id='addHow'>
		<div class='addHowLeft'>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<span style='color:white; font-size:1.2em'>온라인 광고 신청 방법</span><br/><br/>
			<div id='conputerImgDiv'></div>
		</div>
		<div class='addHowRight'>
			<div class='addHowBlue' style='line-height:50px;'>내 업체 정보에서<br/>'매장 등록 번호'를 확인합니다.</div>
			<div class='addHowYellow' style='line-height:50px;'>배너 이미지를 준비합니다.<br/>(???px * ???px)</div>
			<div class='addHowBlue' style='line-height:100px;'>광고 신청하기를 들어갑니다.</div>
			<div class='addHowYellow' style='line-height:33.3px;'>광고 개재일을 입력합니다.<br/>*광고 개재는<br/> 최소 1주일의 여유가 필요합니다.</div>
		</div>
		<div id='moveAd'><a href='/myrestaurant/restaurantAdApplicationWrite'>광고 신청하러 가기</a></div>
		<img src='/img/click.png' id='clickImg'/><br/><br/><br/>
	</div>
	<span id='adListMenu'>현재 진행 중인 광고 리스트</span><br/>
	<ul class='resList'></ul>
</div>
</body>
</html>