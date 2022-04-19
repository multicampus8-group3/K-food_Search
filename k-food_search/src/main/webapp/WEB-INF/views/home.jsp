<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="/css/home_second.css" type="text/css" />
	<link rel="stylesheet" href="/css/jquery.bxslider_multiSlider_second.css" type="text/css">
	
	<script async src='/cdn-cgi/bm/cv/669835187/api.js'></script>
	
	
	<script type="text/javascript">(function(){window['__CF$cv$params']={r:'6de3fd42ca3e0fb9',m:'0GgGI7zDnSr1gpNO2aZt8xuf09.XqNFNAl26Nz09FSY-1644985288-0-ASIOJg74TZmDRx8PzqS0GkltyDGVyqiSSZLtikz9s36I2aTVOteA5aILjGLx/TvgGfZOC34QXGdgGJEI7UTyYI2swg2rVlcLG+zN8s1omkQCLVVc7WXj34iS7QfsW1JQL3W3rSS9+7lm604st4BH9AV/jLfEPihAMuP3FjzGHBqZzvoQQUge0wcXl4Kh1PCIYD2ajQu35bDszAae0YT0SjQ=',s:[0x2900a90da7,0xbc627ac0ef],}})();</script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript" src="/js/mango_test_multi_slide.js"></script>
	<script type="text/javascript" src="/js/jquery.bxslider.js"></script>
	<script type="text/javascript" src="/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="/js/bxslider_jquery.js"></script>
	
	<script type="text/javascript" src="/js/jquery.maphilight.min.js"></script>
	<script type="text/javascript">$(function() {
		$('.map').maphilight({fade: false});
	});</script>
	<script type="text/javascript" src="/js/bm_jy.js"></script>
	<script type="text/javascript" src="/js/jquery.rwdImageMaps.js"></script>
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
		
		<div id="jido_world" style='background-color:pink'>
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
		
		<!-- 음식 종류 메뉴 -->
		<div id="top_menu"> <!-- 평점 좋은 식당 -->
			<h1 style="font-size:22px; margin-left:16px;">TOP</h1>
			<ul id="bm_list" >
				<c:forEach var="tr" items="${bmgrade}"> <!-- tr: top_res -->
						<li class="bm_box">
							<img src="/resImg/${tr.resimg }" alt="" >
							<a href="/restaurantInfo?resno=${tr.resno}"><strong style="font-size:16px;">${tr.resname}</strong><br/></a>
							${tr.resnation}, ${tr.resstate} <br/>
							<strong>${tr.resgrade}</strong> <br/>
						</li>
				</c:forEach>
			</ul>
		</div>
		
		<div id="gg"> <!-- 광고 -->
			<ul id="slider">
				<c:forEach var="ma" items="${mainadbanner}"> <!-- ma: main_ad -->
					<li class="ad_box">
						<a href="/restaurantInfo?resno=${ma.resno}"><img src="/adImg/${ma.bannerimg }"></a>
						<div id="ns" style="color:gray">
							${ma.resnation}, ${ma.resstate }
						</div><br/>
			    		<h1>${ma.resname }</h1><br/>
			    		<div id="addr" style="color:gray">${ma.resadress } </div><br/>
			    		<div id="content">${ma.rescontent}</div> <br/>
					</li>
				</c:forEach>		
			</ul>
		</div><!-- 광고 -->

		
		<div id="footer1">
		
		</div> <!-- 바텀 예시 -->
		
	</div>
</div>
</body>
</html>