<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="../css/home.css" type="text/css" />
	<link rel="stylesheet" href="../css/jquery.bxslider_multiSlider.css" type="text/css">
	<script async src='/cdn-cgi/bm/cv/669835187/api.js'></script>
	
	<!-- <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD7y1CkSuj5WLkvPCBAuAIypeZHov83Gbg&callback=initMap&region=KR&libraries=places"></script> -->
	
	<script type="text/javascript">(function(){window['__CF$cv$params']={r:'6de3fd42ca3e0fb9',m:'0GgGI7zDnSr1gpNO2aZt8xuf09.XqNFNAl26Nz09FSY-1644985288-0-ASIOJg74TZmDRx8PzqS0GkltyDGVyqiSSZLtikz9s36I2aTVOteA5aILjGLx/TvgGfZOC34QXGdgGJEI7UTyYI2swg2rVlcLG+zN8s1omkQCLVVc7WXj34iS7QfsW1JQL3W3rSS9+7lm604st4BH9AV/jLfEPihAMuP3FjzGHBqZzvoQQUge0wcXl4Kh1PCIYD2ajQu35bDszAae0YT0SjQ=',s:[0x2900a90da7,0xbc627ac0ef],}})();</script>
	
	<script type="text/javascript" src="../js/menuslide.js"></script>
	<script type="text/javascript" src="../js/jquery.bxslider.js"></script>
	<script type="text/javascript" src="../js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="../js/bxslider_jquery.js"></script>
	
	<script type="text/javascript" src="../js/jquery.maphilight.min.js"></script>
	<script type="text/javascript">$(function() {
		$('.map').maphilight({fade: false});
	});</script>
<script>
		/*
		
		주석처리한 부분은 보조강사님께서 해주신 부분입니다.
		
		//home_world.jsp의 area영역에 data-nation="(숫자)" 속성값을 넣고
		//제이쿼리로 해당 영역을 선택자로 지정해서, 클릭했을때 데이터네이션값(숫자)을 가져온다.
		$(function(){
			$('map[name="world"]>area').click(function(){
				var na=$(this).attr('data-nation');
				//alert(na);
				getInfo(na);//해당 숫자값을 getInfo라는 함수에 넣어준다.
			})
		})
		function getInfo(na){
			$.ajax({
				type:'get',
				url:'/country_rest?code='+na,
				dataType:'json',
				success:function(data){
					alert(JSON.stringify(data));
					//<li><img src="../img/1.jpg" alt=""><h2>비빔밥</h2></li>
					//showMenu(data)
				},
				error:function(e){
					alert("데이터 출력 에러발생");
				}
			})
		}//-------------------------------
		function showMenu(data){
			var str='';
			$.each(data, function(i, item){
				alert(item.resname);
				str+='<li><img src="../img/1.jpg" alt=""><h2>'+item.resname+'</h2></li>'
			})
			$('.multiple_slider').html(str);
		}
		*/
		$(function(){
			$('map[name="world"]>area').click(function(){
				var nation=$(this).attr('data-nation');
				var state=$(this).attr('data-state');
				//alert(nation);
				//alert(state);
				getInfo(nation, state);
			})
		})
		
		function getInfo(nation, state){
			var nast = "nation="+nation+"&state="+state;
			$.ajax({
				type:'get',
				url:'/country_rest?'+nast,
				dataType:'json',
				success:function(data){
					alert(JSON.stringify(data));
					//일단 나오는 값은 아이디명, 국가명, 수도명, 음식점이름 (RestaurantVO2의 순서대로)이 나온다. 
				},
				error:function(e){
					alert("데이터 출력 에러발생");
				}
			})
		}//-------------------------------
		/**/
		
		
		</script>
	
<style>
	#slider ul,li{
		margin:0;
		padding:0;
	}
    #slider img{
    	width: 100%;
    	height: 400px;
    }
</style>
</head>
<body>


<div class="container1"> <!-- 컨테이너 -->
	<div id="mainContents"> <!-- 전체페이지(컨텐츠) -->

		<div id="jido_world">
			<%@ include file="home_world.jsp" %>
		</div>
		
		<!-- <div id="mapSearch">
			<input type="text" id="address"/>
			<input type="button" value="Search" id="geoSearch" onclick="geocodeAddress()"/>
		</div> -->
		
		<div id="menu">
			<div class="menuslide controls">
				<ul class="multiple_slider">
					<li><img src="../img/1.jpg" alt=""><h2>비빔밥</h2></li>
					<li><img src="../img/2.jpg" alt=""><h2>볶음밥</h2></li>
					<li><img src="../img/3.jpg" alt=""><h2>죽</h2></li>
					<li><img src="../img/4.jpg" alt=""><h2>영양돌솥밥</h2></li>	
					<li><img src="../img/5.jpg" alt=""><h2>된장찌개</h2></li>
					<li><img src="../img/6.jpg" alt=""><h2>철판볶음밥</h2></li>
					<li><img src="../img/7.jpg" alt=""><h2>김밥</h2></li>
					<li><img src="../img/8.jpg" alt=""><h2>떡볶이</h2></li>
				</ul>
			</div>
		</div> <!-- 메뉴 -->
		
		<div id="top_menu"></div> <!-- 순위 메뉴 -->
		
		<div id="gg"> <!-- 광고 -->
			<ul id="slider">
			    <li><img src="../img/1.jpg" title="목록1..."></li>
			    <li><img src="../img/2.jpg" title="목록2..."></li>
			    <li><img src="../img/3.jpg" title="목록3..."></li>
			    <li><img src="../img/4.jpg" title="목록4..."></li>
			    <li><img src="../img/5.jpg" title="목록5..."></li>
			    <li><img src="../img/6.jpg" title="목록6..."></li>
			    <li><img src="../img/7.jpg" title="목록7..."></li>
			    <li><img src="../img/8.jpg" title="목록8..."></li>
			</ul>
		</div> <!-- 광고 -->
	</div>
</div>


		