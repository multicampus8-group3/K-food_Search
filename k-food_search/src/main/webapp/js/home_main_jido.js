function geocodeAddress() {
		var address = document.getElementById('address');
		if(address.value=='') {
			alert("검색할 지명 또는 빌딩명을 입력하세요.");
			address.value ="";
			address.focus();
			return false;
		}
		setMapPosition(address.value);
	}

	var latitude;
	var longitude;
   
	var addr;
	var homePage;
	var popImg;
   
	function mapReset() {//구글맵 자동호출
		latitude = 37.5729503;
		longitude = 126.9793578;
		addr = [];
		homePage = [];
		popImg = [];
	}
	var map;
	function initMap() {
		mapReset();
      
    var mapProperties = {
		center : new google.maps.LatLng(latitude, longitude),
		zoom : 13,
		mapTypeId : google.maps.MapTypeId.ROADMAP
    }
      
    map = new google.maps.Map(document.getElementById("jido"), mapProperties);
      
	/*var request = {
		location: sydney,
		radius: '10000',
		keyword: ['불고기']
	};*/
	
	geoCoder = new google.maps.Geocoder();
      
	for(var i=0; i<addr.length; i++) {
		setMapPosition(addr[i], homePage[i], popImg[i]);
	}
		
	/*var service = new google.maps.places.PlacesService(map);

	service.nearbySearch(request, function(results, status) {
	  
	if (status === google.maps.places.PlacesServiceStatus.OK) {
		for (var i = 0; i < results.length; i++) {
			createMarker(results[i]);
		}
			map.setCenter(results[0].geometry.location);
		}
	});*/
	}// initMap
   
   
   var marker;
   
   function setMapPosition(addr2, home2, pop2) {
                     // 마커를 표시할 주소         주소를 이용한 정보 / 처리결과 "OK"주소가 존재한다.   
      geoCoder.geocode({'address': addr2},function(results, status){
		 geoSearch="";
         if(status=='OK') {//주소가 존재할 때
            console.log(results);
            //지도의 가운데 위치를 새로 셋팅
            map.setCenter(results[0].geometry.location);
            //map.setCenter(results[0]['geometry']['location']);
            
            
            //마커표시
            marker = new google.maps.Marker({
               map:map,
               title:results[0].formatted_address, //주소
               position:results[0].geometry.location //마커를 표시할 위치
            });
            
            //위도, 경도, 주소, 이미지, 이미지링크걸기
            var la = results[0]['geometry']['location']['lat'](); //():lat라는 함수,위도
            var lo = results[0]['geometry']['location']['lng'](); //경도
            
            var popMsg= "위도 : "+la;
            popMsg += "<br/>경도 : "+lo;
            popMsg += "<br/>주소 : "+results[0].formatted_address;
         
            var info = new google.maps.InfoWindow({content:popMsg});
            
            //이벤트에 의하여 대화상자 보여지도록 설정
            google.maps.event.addListener(marker,'click',function(){
               info.open(map, marker);
            });
            /*
            3초마다 마커 따라가는 기능
            map.addListener("center_changed", () => {
			    window.setTimeout(() => {
			      map.panTo(marker.getPosition());
			    }, 3000);
			});
			*/
			//마커 위치를 클릭시 디스플레이 중앙으로
			marker.addListener("click", () => {
				map.setZoom(13);
				map.setCenter(marker.getPosition());
			});
            
         } else {//주소가 없을 때
            console.log("존재하지 않는 주소입니다.");
         }//if
      });//geoCoder.geocode 
   
   }//setMapPosition