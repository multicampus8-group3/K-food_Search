<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 꽃가루 이펙트 -->
<script src="https://tistory4.daumcdn.net/tistory/3134841/skin/images/confetti_v2.js"></script>
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
		.bell{
			width:50px;
		}
		.bell:hover {
	  		animation-duration: 0.5s;
	  		animation-name: rot;
	  		animation-iteration-count: infinite;
	  		animation-direction: alternate;
	  		transform-origin:50% 5%;
		}
		@keyframes rot {
	  		0% {transform: rotateZ(-30deg);}
	  		100% {transform: rotateZ(30deg);}
		}
		canvas{z-index:10;pointer-events: none;position: fixed;top: 0;transform: scale(1.1);}
	</style>
	<script>
		$(()=>{
			function reAction(){
				$("#startButton").trigger("click");
			  	setTimeout(function(){
			  		$("#stopButton").trigger("click");
				}, 5000);
			}
			$(".bell").on('click', function(){
			    reAction();
			});	
		});
	</script>
	<canvas id="canvas"></canvas>
	<button id="stopButton" style='display:none;'>Stop Confetti</button>
	<button id="startButton"  style='display:none;'>Drop Confetti</button>	
	<div id='resMainDiv'>
		<div><img src='img/bell.png' class='bell' title='클릭 하세요.'/> owner's Menu</div>
		${username }님 환영합니다.
		<hr style='margin-bottom:40px;'/>
		<ul id='resMain'>
			<li><a href='/restaurantSignUp'>업체 등록</a></li>
			<li>10.</li>
			<li>- 당신의 사업체를 등록하세요.</li>
			<li><a href='/restaurantUpdateList'>내 업체 정보</a></li>
			<li>13.</li>
			<li>- 등록된 업체의 정보를 확인하세요.</li>
			<li><a href='/restaurantReserveCheck'>예약 현황</a></li>
			<li>13.</li>
			<li>- 고객의 예약 현황을 확인하세요.</li>
			<li><a href='/restaurantAdApplication'>광고 신청</a></li>
			<li>15.</li>
			<li>- 당신의 업장을 광고하세요.</li>
		</ul>		
	</div>
</body>
</html>