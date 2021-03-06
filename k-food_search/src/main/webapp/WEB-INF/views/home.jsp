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
    
    /*?????? ?????????*/
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
    /*?????? ?????????*/
    
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
<div class="container"> <!-- ???????????? -->

	<div id="mainContents"> <!-- ???????????????(?????????) -->
	
		
		<!-- ??????(?????????) -->
		<br/>
		<span class='smallMenu'>food Type</span>
		<hr/>
		<!-- ??????(?????????) -->
		
		<div id="menu">
			<div class="menuslide controls">
				<ul class="multiple_slider">
					<li>
						<a onclick="menu_click('?????????')" href="/restaurantDesignTest">
							<img class="img_box" src="../img/hansik_img/bibimbab_title.PNG" alt="">
								<h2>?????????
								<span>
									<div class="inner_div">
									?????????
									</div>
								</span>
							</h2>
						</a>
						<a onclick="menu_click('?????????')" href="/restaurantDesignTest">
							<img class="img_box" src="../img/hansik_img/gimchi_rice.PNG" alt="">
								<h2>?????????
								<span>
									<div class="inner_div">
									?????????
									</div>
								</span>
							</h2>
						</a>
					</li>
					
					<li>
						<a onclick="menu_click('??????')" href="/restaurantDesignTest">
							<img class="img_box" src="../img/hansik_img/baekban.PNG" alt="">
							<h2>??????
								<span>
									<div class="inner_div">
										??????
									</div>
								</span>
							</h2>
						</a>
						<a onclick="menu_click('??????')" href="/restaurantDesignTest">
							<img class="img_box" src="../img/hansik_img/dduckguk.PNG" alt="">
							<h2>??????
								<span>
									<div class="inner_div">
										??????
									</div>
								</span>
							</h2>
						</a>
					</li>
					
					<li>
						<a onclick="menu_click('??????')" href="/restaurantDesignTest">
							<img class="img_box" src="../img/hansik_img/gukbab.PNG" alt="">
							<h2>??????
								<span>
									<div class="inner_div">
										??????
									</div>
								</span>
							</h2>
						</a>
						<a onclick="menu_click('?????????')" href="/restaurantDesignTest">
							<img class="img_box" src="../img/hansik_img/ggogetang.PNG" alt="">
							<h2>?????????
								<span>
									<div class="inner_div">
										?????????
									</div>
								</span>
							</h2>
						</a>
					</li>
					
					<li>
						<a onclick="menu_click('??????')" href="/restaurantDesignTest">
						<img class="img_box" src="../img/hansik_img/gimbab.PNG" alt="">
							<h2>??????
								<span>
									<div class="inner_div">
										??????
									</div>
								</span>
							</h2>
						</a>
						<a onclick="menu_click('?????????')" href="/restaurantDesignTest">
						<img class="img_box" src="../img/hansik_img/kalguksu.PNG" alt="">
							<h2>?????????
								<span>
									<div class="inner_div">
										?????????
									</div>
								</span>
							</h2>
						</a>
					</li>
					
					<li>
						<a onclick="menu_click('?????????')" href="/restaurantDesignTest">
						<img class="img_box" src="../img/hansik_img/tteokbokki.PNG" alt="">
							<h2>?????????
								<span>
									<div class="inner_div">
										?????????
									</div>
								</span>
							</h2>
						</a>
						<a onclick="menu_click('?????????')" href="/restaurantDesignTest">
							<img class="img_box" src="../img/hansik_img/odentang.PNG" alt="">
							<h2>?????????
								<span>
									<div class="inner_div">
										?????????
									</div>
								</span>
							</h2>
						</a>
					</li>
					
					<li>
						<a onclick="menu_click('?????????')" href="/restaurantDesignTest">
						<img class="img_box" src="../img/hansik_img/Korean_pancake.PNG" alt="">
							<h2>?????????
								<span>
									<div class="inner_div">
										?????????
									</div>
								</span>
							</h2>
						</a>
						<a onclick="menu_click('??????')" href="/restaurantDesignTest">
						<img class="img_box" src="../img/hansik_img/naengmyun.PNG" alt="">
							<h2>??????
								<span>
									<div class="inner_div">
										??????
									</div>
								</span>
							</h2>
						</a>
					</li>
					
					<li>
						<a onclick="menu_click('??????')" href="/restaurantDesignTest">
						<img class="img_box" src="../img/hansik_img/chicken.PNG" alt="">
							<h2>??????
								<span>
									<div class="inner_div">
										??????
									</div>
								</span>
							</h2>
						</a>
						<a onclick="menu_click('?????????')" href="/restaurantDesignTest">
						<img class="img_box" src="../img/hansik_img/darkggochi.PNG" alt="">
							<h2>?????????
								<span>
									<div class="inner_div">
										?????????
									</div>
								</span>
							</h2>
						</a>
					</li>
					
					<li>
						<a onclick="menu_click('?????????')" href="/restaurantDesignTest">
						<img class="img_box" src="../img/hansik_img/samgyupsal.jpg" alt="">
							<h2>?????????
								<span>
									<div class="inner_div">
										?????????
									</div>
								</span>
							</h2>
						</a>
						<a onclick="menu_click('?????????')" href="/restaurantDesignTest">
							<img class="img_box" src="../img/hansik_img/galbee.PNG" alt="">
							<h2>?????????
								<span>
									<div class="inner_div">
										?????????
									</div>
								</span>
							</h2>
						</a>
					</li>
					<li>
						<a onclick="menu_click('?????????')" href="/restaurantDesignTest">
						<img class="img_box" src="../img/hansik_img/bulgogi.PNG" alt="">
							<h2>?????????
								<span>
									<div class="inner_div">
										?????????
									</div>
								</span>
							</h2>
						</a>
						<a onclick="menu_click('??????')" href="/restaurantDesignTest">
						<img class="img_box" src="../img/hansik_img/jokbal.PNG" alt="">
							<h2>??????
								<span>
									<div class="inner_div">
										??????
									</div>
								</span>
							</h2>
						</a>
					</li>
				</ul>
			</div>
		</div> <!-- ?????? -->
		<!-- ?????? ?????? ?????? -->
		<div id="top_menu"> <!-- ?????? ?????? ?????? -->
		
		<!-- ??????(?????????) -->
		<span class='smallMenu'>Editor's Pick</span>
		<hr/>
		<br/>
		<!-- ??????(?????????) -->
		<!--
			<h1 style="font-size:22px; margin-left:16px;">TOP</h1>
		-->
			<ul id="bm_list" >
				<c:forEach var="tr" items="${bmgrade}"> <!-- tr: top_res -->
						<li class="bm_box">
							<img src="/resImg/${tr.resimg}" alt="" >
							<a href="/restaurantInfo?resno=${tr.resno}"><strong style="font-size:16px;">${tr.resname}</strong><br/></a>
							${tr.resnation}, ${tr.resstate} <br/>
							<strong>${tr.resgrade}</strong> <br/>
						</li>
				</c:forEach>
			</ul>
		</div>
		
		<!-- ??????(?????????) -->
		<br/>
		<span class='smallMenu'>Recommend Restaurant</span>
		<hr/>
		<br/>
		<!-- ??????(?????????) -->
		
		<div id="gg"> <!-- ?????? -->
			<ul id="slider">
				<c:forEach var="ma" items="${mainadbanner}"> <!-- ma: main_ad -->
					<li class="ad_box">
						<a href="/restaurantInfo?resno=${ma.resno}"><img src="/adImg/${ma.bannerimg }"></a>
						<div id="ns" style="color:gray; padding:2%;margin-bottom:-10px;">
							${ma.resnation}, ${ma.resstate }
						</div>
			    		<a href="/restaurantInfo?resno=${ma.resno}"><b style="font-size:48px; margin-bottom:5px;">${ma.resname }</b></a><br/><br/>
			    		<div style="color:gray">${ma.resadress}</div><br/>
			    		<div style="width:500px; float:right; margin-right:80px;" id="content">${ma.rescontent}</div>
			    		
					</li>
				</c:forEach>		
			</ul>
		</div><!-- ?????? -->

		
		<div id="footer1">
		
		</div> <!-- ?????? ?????? -->
		
	</div>
</div>
<script>
<!-- ????????? ?????? -->
	function menu_click(resty) {
		//alert(resty);
		event.preventDefault();
		//location.href="/shop_test?resty="+resty;
		location.href="/restaurantDesignTest?resty="+resty;
	}
<!-- ????????? ?????? -->
</script>
</body>
</html>