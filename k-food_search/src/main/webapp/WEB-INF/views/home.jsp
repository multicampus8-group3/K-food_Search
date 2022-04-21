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
	<script type="text/javascript">
		$(function() {
			$('.bx-prev').html('<');
			$('.bx-next').html('>');
			$('.map').maphilight({strokeColor: 'FFAA00', strokeWidth: 3, fill: true, fillColor: 'FFAA00',fillOpacity: 0.7, fade: false});
		});
	</script>
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
    
    /*추가 백동현*/
    .smallMenu{
    	display:inline-block;
    	font-family : "Binggrae";
    	color:rgb(50, 128, 70);
		font-size:1.5em;
		margin-top:20px;
		text-shadow:0px 5px 10px rgb(50, 128, 70);
    }
    hr{
    	height:1px;
    	background-color:rgb(50, 128, 70);
    	border:1px solid rgb(50, 128, 70);

    }
    .bx-prev{
    	color:#ddd !important
    }
    .bx-prev:hover{
    	color:black !important;
    }
    .bx-next{
    	color:#ddd !important
    }
    .bx-next:hover{
    	color:black !important
    }
    /*추가 백동현*/
    
    #jido_Box_before{
    	width: 100%;
    	overflow: hidden;
    	height: 620px;
    	background-color: rgba(205, 188, 171, 0.3);
    }
    #jido_Box{
    	width: 2400px;
    	height: 600px;
    	margin-bottom: 150px;
    }
    .jido_world{
    	margin-top: 0px;
    	float:left;
    }
    .jido1{
    	
    } 
    .jido2{
    margin-left:-9px;
    	
    }
</style>
</head>
<body>
	<div style="width:1200px; height:50px; margin:0 auto; margin-bottom:10px; margin-top:-10px;">
		<span class='smallMenu'>Select Map</span>
	</div>
	<div id="jido_Box_before">
		<div id="jido_Box">
			<div class="jido_world jido1" style=''>
				<%@ include file="home_world.jsp" %>
			</div>
			<div class="jido_world jido2" style=''>
				<%@ include file="home_world.jsp" %>
			</div>
		</div>
	</div>
<div class="container"> <!-- 컨테이너 -->

	<div id="mainContents"> <!-- 전체페이지(컨텐츠) -->
	
		
		<!-- 추가(백동현) -->
		<br/>
		<span class='smallMenu'>food Type</span>
		<hr/>
		<!-- 추가(백동현) -->
		
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
						<a onclick="menu_click('백반')" href="/restaurantDesignTest">
							<img class="img_box" src="../img/hansik_img/baekban.PNG" alt="">
							<h2>백반
								<span>
									<div class="inner_div">
										백반
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
		<!-- 음식 종류 메뉴 -->
		<div id="top_menu"> <!-- 평점 좋은 식당 -->
		
		<!-- 추가(백동현) -->
		<span class='smallMenu'>Editor's Pick</span>
		<hr/>
		<br/>
		<!-- 추가(백동현) -->
		<!--
			<h1 style="font-size:22px; margin-left:16px;">TOP</h1>
		-->
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
		
		<!-- 추가(백동현) -->
		<br/>
		<span class='smallMenu'>Recommend Restaurant</span>
		<hr/>
		<br/>
		<!-- 추가(백동현) -->
		
		<div id="gg"> <!-- 광고 -->
			<ul id="slider">
				<c:forEach var="ma" items="${mainadbanner}"> <!-- ma: main_ad -->
					<li class="ad_box">
						<a href="/restaurantInfo?resno=${ma.resno}"><img src="/adImg/${ma.bannerimg }"></a>
						<div id="ns" style="color:gray">
							${ma.resnation}, ${ma.resstate }
						</div><br/>
			    		<h1>${ma.resname }</h1><br/>
			    		<div style="color:gray">${ma.resadress} </div><br/>
			    		<div id="content">${ma.rescontent}</div> <br/>
					</li>
				</c:forEach>		
			</ul>
		</div><!-- 광고 -->

		
		<div id="footer1">
		
		</div> <!-- 바텀 예시 -->
		
	</div>
</div>
<script>
<!-- 양지석 수정 -->
	function menu_click(resty) {
		//alert(resty);
		event.preventDefault();
		//location.href="/shop_test?resty="+resty;
		location.href="/restaurantDesignTest?resty="+resty;
	}
<!-- 양지석 수정 -->
</script>
</body>
</html>