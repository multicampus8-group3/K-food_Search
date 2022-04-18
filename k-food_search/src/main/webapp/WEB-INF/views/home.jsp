<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="../css/home_second.css" type="text/css" />
	<link rel="stylesheet" href="../css/jquery.bxslider_multiSlider_second.css" type="text/css">
	
	<script async src='/cdn-cgi/bm/cv/669835187/api.js'></script>
	
	
	<script type="text/javascript">(function(){window['__CF$cv$params']={r:'6de3fd42ca3e0fb9',m:'0GgGI7zDnSr1gpNO2aZt8xuf09.XqNFNAl26Nz09FSY-1644985288-0-ASIOJg74TZmDRx8PzqS0GkltyDGVyqiSSZLtikz9s36I2aTVOteA5aILjGLx/TvgGfZOC34QXGdgGJEI7UTyYI2swg2rVlcLG+zN8s1omkQCLVVc7WXj34iS7QfsW1JQL3W3rSS9+7lm604st4BH9AV/jLfEPihAMuP3FjzGHBqZzvoQQUge0wcXl4Kh1PCIYD2ajQu35bDszAae0YT0SjQ=',s:[0x2900a90da7,0xbc627ac0ef],}})();</script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript" src="../js/mango_test_multi_slide.js"></script>
	<script type="text/javascript" src="../js/jquery.bxslider.js"></script>
	<script type="text/javascript" src="../js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="../js/bxslider_jquery.js"></script>
	
	<script type="text/javascript" src="../js/jquery.maphilight.min.js"></script>
	<script type="text/javascript">$(function() {
		$('.map').maphilight({fade: false});
	});</script>
	<script type="text/javascript" src="/js/bm_jy.js"></script>
	
	
	<script>
		function formatDate() { 
			var today = new Date(); 
			var inYear = 2022; 
			var inMonth = 4; 
			var inDate = 8; 
			var stdDate = new Date(inYear,(inMonth-1),inDate); 
			var gapDate = stdDate.getTime() - today.getTime(); 
			var gapDay = Math.ceil(gapDate / (60*1000*60*24)); 
			var gapImg = gapDay % 4; 
	
			if(gapImg==0) { 
				$(".bm_box img").attr("src",'이미지 URL 주소').attr("alt",'텍스트'); 
			} else if(gapImg==1) { 
				$(".bm_box img").attr("src",'이미지 URL 주소').attr("alt",'텍스트');
			} else if(gapImg==2) { 
				$(".bm_box img").attr("src",'이미지 URL 주소').attr("alt",'텍스트'); 
			} else if(gapImg==3) { 
				$(".bm_box img").attr("src",'이미지 URL 주소').attr("alt",'텍스트'); 
			} 
		} 
		formatDate();
		</script>
		
		<script type="text/javascript" src="../js/jquery.rwdImageMaps.js"></script>
		<script>
		$(function(){
		
		   $('img[usemap]').rwdImageMaps();
		
		});
		</script>
		
<style type="text/css">
img[usemap] {
	max-height: 150%;
	height: 600px;
	max-width: 150%;
	width: 1200px;
   }
</style>



<style>
	#slider ul,li{
		margin:0;
		padding:0;
	}
    #slider img{
    	width: 50%;
    	height: 400px;
    	float:left; 
    	margin-right: 20px;
    }
    .map{
    	size: width: 1200px;
    }
</style>
</head>
<body>

<div class="container"> <!-- 컨테이너 -->

	<div id="mainContents"> <!-- 전체페이지(컨텐츠) -->
		
		<div id="jido_world">
			<%@ include file="home_world.jsp" %>
		</div> <!-- 상단지도 -->
		
		<div id="menu">
			<div class="menuslide controls">
				<ul class="multiple_slider">
					<li>
						<a href="/restaurantDesignTest"><img src="../img/1.jpg" alt=""><h2>비빔밥<span><div class="inner_div">비빔밥</div></span></h2></a>
						<a href="/restaurantDesignTest"><img src="../img/2.jpg" alt=""><h2>볶음밥<span><div class="inner_div">볶음밥</div></span></h2></a>
					</li>
					
					<li>
						<a href="/restaurantDesignTest"><img src="../img/3.jpg" alt=""><h2>죽<span><div class="inner_div">죽</div></span></h2></a>
						<a href="/restaurantDesignTest"><img src="../img/4.jpg" alt=""><h2>영양돌솥밥<span><div class="inner_div">영양돌솥밥</div></span></h2></a>
					</li>
					
					<li>
						<a href="/restaurantDesignTest"><img src="../img/5.jpg" alt=""><h2>된장찌개<span><div class="inner_div">된장찌개</div></span></h2></a>
						<a href="/restaurantDesignTest"><img src="../img/6.jpg" alt=""><h2>철판볶음밥<span><div class="inner_div">철판볶음밥</div></span></h2></a>
					</li>
					
					<li>
						<a href="/restaurantDesignTest"><img src="../img/7.jpg" alt=""><h2>김밥<span><div class="inner_div">김밥</div></span></h2></a>
						<a href="/restaurantDesignTest"><img src="../img/8.jpg" alt=""><h2>떡볶이<span><div class="inner_div">떡볶이</div></span></h2></a>
					</li>
					
					<li>
						<a href="/restaurantDesignTest"><img src="../img/1.jpg" alt=""><h2>비빔밥<span><div class="inner_div">비빔밥</div></span></h2></a>
						<a href="/restaurantDesignTest"><img src="../img/2.jpg" alt=""><h2>볶음밥<span><div class="inner_div">볶음밥</div></span></h2></a>
					</li>
					
					<li>
						<a href="/restaurantDesignTest"><img src="../img/3.jpg" alt=""><h2>죽<span><div class="inner_div">죽</div></span></h2></a>
						<a href="/restaurantDesignTest"><img src="../img/4.jpg" alt=""><h2>영양돌솥밥<span><div class="inner_div">영양돌솥밥</div></span></h2></a>
					</li>
					
					<li>
						<a href="/restaurantDesignTest"><img src="../img/5.jpg" alt=""><h2>된장찌개<span><div class="inner_div">된장찌개</div></span></h2></a>
						<a href="/restaurantDesignTest"><img src="../img/6.jpg" alt=""><h2>철판볶음밥<span><div class="inner_div">철판볶음밥</div></span></h2></a>
					</li>
					
					<li>
						<a href="/restaurantDesignTest"><img src="../img/7.jpg" alt=""><h2>김밥<span><div class="inner_div">김밥</div></span></h2></a>
						<a href="/restaurantDesignTest"><img src="../img/8.jpg" alt=""><h2>떡볶이<span><div class="inner_div">떡볶이</div></span></h2></a>
					</li>
				</ul>
			</div>
		</div> <!-- 메뉴 -->
		
		<div id="top_menu">
			<h1 style="font-size:20px;">TOP</h1>
			<ul id="bm_list" >
				<li class="bm_box">
					<img src="/img/bibim.PNG" alt="" >
					평점: ${vo.grade}
				</li>
				<li class="bm_box">
					<img src="/img/makgeolli.PNG" alt="">
				</li>
				<li class="bm_box">
					<img src="/img/kimchisoup.PNG" alt="">
				</li>
				<li class="bm_box">
					<img src="/img/rice.PNG" alt="">
				</li>
			</ul>
		</div>
		<div id="gg"> <!-- 광고 -->
			<ul id="slider">
			    <li class="ad_box">배너이미지: ${vo.bannerimg} 식당정보</li>
			    <li class="ad_box"><img src="/img/2.jpg" title="목록2..." >식당정보</li>
			    <li class="ad_box"><img src="/img/3.jpg" title="목록3..." >식당정보</li>
			    <li class="ad_box"><img src="/img/4.jpg" title="목록4..." >식당정보</li>
			    <li class="ad_box"><img src="/img/5.jpg" title="목록5..." >식당정보</li>
			    <li class="ad_box"><img src="/img/6.jpg" title="목록6..." >식당정보</li>
			    <li class="ad_box"><img src="/img/7.jpg" title="목록7..." >식당정보</li>
			    <li class="ad_box"><img src="/img/8.jpg" title="목록8..." >식당정보</li>
			</ul>
		</div><!-- 광고 -->
		
		<div id="footer1">
		
		</div> <!-- 바텀 예시 -->
		
	</div>
</div>
<script>
/*
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
}
*/
</script>
</body>
</html>