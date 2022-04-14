<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<style>
		#resMainDiv{
			width:1000px;
			margin:0 auto;
			margin-top:100px;
			height:1000px;
			box-shadow:0px 0px 10px 1px;
			padding:50px;
		}
		#resMainDiv>div{
			font-size:3em;
			font-weight:bold;
		}
		#resMain li{
			float:left;
			box-sizeing:border-box;
		}
		#resMain li:nth-of-type(3n+1){
			width:90%;
		}
		#resMainDiv a{
			font-size:2em;
			font-weight:bold;
		}
		#resMain li:nth-of-type(3n+2){
			width:10%;
			font-size:1.5em;
			font-weight:bold;
		}
		#resMain li:nth-of-type(3n+3){
			width:100%;
			height:60px;
			font-size:1.2em;
		}
		.bell {
	  		animation-duration: 0.1s;
	  		animation-name: rot;
	  		animation-iteration-count: infinite;
	  		animation-direction: alternate;
	  		transform-origin:50% 5%;
	  		width:50px;
		}
	
		@keyframes rot {
	  		0% {transform: rotateZ(-30deg);}
	  		100% {transform: rotateZ(30deg);}
		}
		
		.balloon {
			position:relative;
			margin: 50px;
			width:400px;
			height:100px;
			background:#ddd;
			border-radius: 10px;
		}
		.balloon:after {
			border-top:15px solid #ddd;
			border-left: 15px solid transparent;
			border-right: 0px solid transparent;
			border-bottom: 0px solid transparent;
			content:"";
			position:absolute;
			top:10px;
			left:-15px;
		}
	</style>
	<div class='balloon'></div>
	<img src='img/bell.png' class='bell'/>
	<div id='resMainDiv'>
		<div>owner's Menu</div>
		${username }님 환영합니다.
		<hr style='margin-bottom:40px;'/>
		<ul id='resMain'>
			<li><a href='/restaurantSignUp'>업체 등록</a></li>
			<li>10.</li>
			<li>- 당신의 사업체를 등록하세요.</li>
			<li><a href='/restaurantUpdateList'>업체 수정</a></li>
			<li>13.</li>
			<li>- 업체에 등록된 정보를 수정하세요.</li>
			<li><a href='/restaurantReserveCheck'>예약 현황</a></li>
			<li>13.</li>
			<li>- 고객의 예약 현황을 확인하세요.</li>
			<li><a href=''>광고 신청</a></li>
			<li>15.</li>
			<li>- 당신의 업장을 광고하세요.</li>
		</ul>		
	</div>
</body>
</html>