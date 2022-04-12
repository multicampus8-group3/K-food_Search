$(function () {
        $("#slider").bxSlider({
        	mode : 'horizontal'// 기본 -> 'horizontal', 'vertical', 'fade'
            ,slideWidth:980
            ,slideHeight:450
            ,speed:500
            ,pause:4000
            ,auto: true//자동시작
            ,randomStart:false//시작 슬라이드 랜덤
            ,captions: false//title속성에 있는 설명을 표시한다.=
            
            //,adaptiveHeight:true//이미지의 크기에 따라 높이 조절
            //,controls:true
            //,hideControllOnEnd:true
            
            //easing
            ,useCSS:false//easing을 true(사용못함), false(사용함)
            ,easing:'easeOutExpo'//linear
            ,onSliderLoad:function(){//슬라이드 로딩완료되면 호출됨
            	//alert("이미지 로딩 완료..");
            }
        	,onSliderAfter:function(){//슬라이드 움직인후 호출되는 함수
        		console.log("onSlideAfter함수 실행됨...");
        	}
        });
    });