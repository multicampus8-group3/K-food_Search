<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 꽃가루 이펙트 -->
<script src="https://tistory4.daumcdn.net/tistory/3134841/skin/images/confetti_v2.js"></script>
<link rel="stylesheet"  href='/css/backCSS/restaurantMain.css' type="text/css"/>
<script src="/js/backjs/restaurantMain.js"></script>
	<canvas id="canvas"></canvas>
	<button id="stopButton" style='display:none;'>Stop Confetti</button>
	<button id="startButton"  style='display:none;'>Drop Confetti</button>
	<div id='resMainDiv'>
		<div><img src='/img/bell.png' class='bell' title='클릭 하세요.'/> 사업체 관리.</div>
		${username }님 환영합니다.
		<hr style='margin-bottom:40px;'/>
		<ul id='resMain'>
			<li><a href='/myrestaurant/restaurantSignUp'>업체 등록</a></li>
			<li>10.</li>
			<li>- 당신의 사업체를 등록하세요.</li>
			<li><a href='/myrestaurant/restaurantUpdateList'>내 업체 정보</a></li>
			<li>13.</li>
			<li>- 등록된 업체의 정보를 확인하세요.</li>
			<li><a href='/myrestaurant/restaurantReserveCheck'>예약 현황</a></li>
			<li>13.</li>
			<li>- 고객의 예약 현황을 확인하세요.</li>
			<li><a href='/myrestaurant/restaurantAdApplication'>광고 신청</a></li>
			<li>15.</li>
			<li>- 당신의 업장을 광고하세요.</li>
		</ul>		
	</div>
</body>
</html>