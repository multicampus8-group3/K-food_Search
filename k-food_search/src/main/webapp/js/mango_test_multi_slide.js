$(function(){

	/* ---------- 멀티플 슬라이드 ---------- */
	$('.multiple_slider').bxSlider({
		minSlides:1, //1
		maxSlides:3, //6
		moveSlides : 3,
		slideWidth:248, //137 //248 //481
		slideMargin:30, //12 //30 //58
		pager:true,
		nextText: '▶',
		prevText: '◀',
		captions: true
	});
});//document ready jquery 