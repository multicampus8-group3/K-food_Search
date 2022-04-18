$(function(){

	/* ---------- 멀티플 슬라이드 ---------- */
	$('.multiple_slider').bxSlider({
		minSlides:1, //1
		maxSlides:3, //6
		moveSlides : 3,
		slideWidth:303, //137 //248 //303 //481
		slideMargin:36, //12 //30 //36 //58
		pager:true,
		nextText: '▶',
		prevText: '◀',
		captions: true
	});
});//document ready jquery 