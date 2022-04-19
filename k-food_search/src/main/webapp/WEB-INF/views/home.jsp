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
		$('.map').maphilight({strokeColor: 'black', strokeWidth: 0, fill: 'ff0000', fillColor: 'ff0000', fade: false});
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
		
		<div id="jido_world" style='background-color:pink'>
			<%@ include file="home_world.jsp" %>
		</div> <!-- 상단지도 -->
		
		<div id="menu">
			<div class="menuslide controls">
				<ul class="multiple_slider">
					<li>
						<a onclick="menu_click('비빔밥')" href="/restaurantDesignTest">
							<img class="img_box" src="../img/hansik_img/bibimbab_title.PNG" alt="">
								<h2>비빔밥
								<span>
									<div class="inner_div">
									비빔밥
									</div>
								</span>
							</h2>
						</a>
						<a onclick="menu_click('볶음밥')" href="/restaurantDesignTest">
							<img class="img_box" src="../img/hansik_img/gimchi_rice.PNG" alt="">
								<h2>볶음밥
								<span>
									<div class="inner_div">
									볶음밥
									</div>
								</span>
							</h2>
						</a>
					</li>
					
					<li>
						<a onclick="menu_click('감자탕')" href="/restaurantDesignTest">
							<img class="img_box" src="../img/hansik_img/gamjatang.PNG" alt="">
							<h2>감자탕
								<span>
									<div class="inner_div">
										감자탕
									</div>
								</span>
							</h2>
						</a>
						<a onclick="menu_click('떡국')" href="/restaurantDesignTest">
							<img class="img_box" src="../img/hansik_img/dduckguk.PNG" alt="">
							<h2>떡국
								<span>
									<div class="inner_div">
										떡국
									</div>
								</span>
							</h2>
						</a>
					</li>
					
					<li>
						<a onclick="menu_click('국밥')" href="/restaurantDesignTest">
							<img class="img_box" src="../img/hansik_img/gukbab.PNG" alt="">
							<h2>국밥
								<span>
									<div class="inner_div">
										국밥
									</div>
								</span>
							</h2>
						</a>
						<a onclick="menu_click('꽃게탕')" href="/restaurantDesignTest">
							<img class="img_box" src="../img/hansik_img/ggogetang.PNG" alt="">
							<h2>꽃게탕
								<span>
									<div class="inner_div">
										꽃게탕
									</div>
								</span>
							</h2>
						</a>
					</li>
					
					<li>
						<a onclick="menu_click('김밥')" href="/restaurantDesignTest">
						<img class="img_box" src="../img/hansik_img/gimbab.PNG" alt="">
							<h2>김밥
								<span>
									<div class="inner_div">
										김밥
									</div>
								</span>
							</h2>
						</a>
						<a onclick="menu_click('칼국수')" href="/restaurantDesignTest">
						<img class="img_box" src="../img/hansik_img/kalguksu.PNG" alt="">
							<h2>칼국수
								<span>
									<div class="inner_div">
										칼국수
									</div>
								</span>
							</h2>
						</a>
					</li>
					
					<li>
						<a onclick="menu_click('떡볶이')" href="/restaurantDesignTest">
						<img class="img_box" src="../img/hansik_img/tteokbokki.PNG" alt="">
							<h2>떡볶이
								<span>
									<div class="inner_div">
										떡볶이
									</div>
								</span>
							</h2>
						</a>
						<a onclick="menu_click('어묵탕')" href="/restaurantDesignTest">
							<img class="img_box" src="../img/hansik_img/odentang.PNG" alt="">
							<h2>어묵탕
								<span>
									<div class="inner_div">
										어묵탕
									</div>
								</span>
							</h2>
						</a>
					</li>
					
					<li>
						<a onclick="menu_click('부침개')" href="/restaurantDesignTest">
						<img class="img_box" src="../img/hansik_img/Korean_pancake.PNG" alt="">
							<h2>부침개
								<span>
									<div class="inner_div">
										부침개
									</div>
								</span>
							</h2>
						</a>
						<a onclick="menu_click('냉면')" href="/restaurantDesignTest">
						<img class="img_box" src="../img/hansik_img/naengmyun.PNG" alt="">
							<h2>냉면
								<span>
									<div class="inner_div">
										냉면
									</div>
								</span>
							</h2>
						</a>
					</li>
					
					<li>
						<a onclick="menu_click('치킨')" href="/restaurantDesignTest">
						<img class="img_box" src="../img/hansik_img/chicken.PNG" alt="">
							<h2>치킨
								<span>
									<div class="inner_div">
										치킨
									</div>
								</span>
							</h2>
						</a>
						<a onclick="menu_click('닭꼬치')" href="/restaurantDesignTest">
						<img class="img_box" src="../img/hansik_img/darkggochi.PNG" alt="">
							<h2>닭꼬치
								<span>
									<div class="inner_div">
										닭꼬치
									</div>
								</span>
							</h2>
						</a>
					</li>
					
					<li>
						<a onclick="menu_click('삼겹살')" href="/restaurantDesignTest">
						<img class="img_box" src="../img/hansik_img/samgyupsal.jpg" alt="">
							<h2>삼겹살
								<span>
									<div class="inner_div">
										삼겹살
									</div>
								</span>
							</h2>
						</a>
						<a onclick="menu_click('갈비찜')" href="/restaurantDesignTest">
							<img class="img_box" src="../img/hansik_img/galbee.PNG" alt="">
							<h2>갈비찜
								<span>
									<div class="inner_div">
										갈비찜
									</div>
								</span>
							</h2>
						</a>
					</li>
					<li>
						<a onclick="menu_click('불고기')" href="/restaurantDesignTest">
						<img class="img_box" src="../img/hansik_img/bulgogi.PNG" alt="">
							<h2>불고기
								<span>
									<div class="inner_div">
										불고기
									</div>
								</span>
							</h2>
						</a>
						<a onclick="menu_click('족발')" href="/restaurantDesignTest">
						<img class="img_box" src="../img/hansik_img/jokbal.PNG" alt="">
							<h2>족발
								<span>
									<div class="inner_div">
										족발
									</div>
								</span>
							</h2>
						</a>
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
	function menu_click(resty) {
		//alert(resty);
		event.preventDefault();
		location.href="/shop_test?resty="+resty;
	}
</script>
</body>
</html>