$(function(){

	/* ---------- 멀티플 슬라이드 ---------- */
	$('.multiple_slider').bxSlider({
		minSlides:1,
		maxSlides:4,
		moveSlides : 1,
		slideWidth:200,
		slideMargin:30,
		pager:false,
		nextText: '▶',
		prevText: '◀'
	});
});//document ready jquery 