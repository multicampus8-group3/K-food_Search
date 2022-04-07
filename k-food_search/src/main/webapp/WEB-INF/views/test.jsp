<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD7y1CkSuj5WLkvPCBAuAIypeZHov83Gbg&callback=iniMap&region=KR&libraries=places"></script>
<style>
	#gmap{
		width:100%;
		height:700px;
		border:1px solid gray;
	}
	#mapSearch{
		text-align:center;
		line-height:30px;
		margin:30px 50%;
		transform:translate(-50%,0);
		position:absolute;
		z-index:1;
		background-color:gray;
		border:1px solid black;
	}
</style>
</head>
<body>
<!-- 지명 또는 건물을 입력하기 위한 폼 -->
<div id="gmap"></div>
<script>
var map;
var service;
var infowindow;
function createMarker(place) {
	console.log("좌표:"+place.geometry.location);
	console.log("이름:"+place.name);
	//https://developers.google.com/maps/documentation/places/web-service/search-nearby#AddressComponent
    new google.maps.Marker({
        position: place.geometry.location,
        map: map
    });
}
function iniMap() {
  var sydney = new google.maps.LatLng(-33.867, 151.195);

  infowindow = new google.maps.InfoWindow();

  map = new google.maps.Map(
      document.getElementById('gmap'), {center: sydney, zoom: 15});

  var request = {
	location: sydney,
	radius: '10000',
	keyword: ['불고기']
  //https://developers.google.com/maps/documentation/places/web-service/supported_types
  };

  var service = new google.maps.places.PlacesService(map);

  service.nearbySearch(request, function(results, status) {
	  
    if (status === google.maps.places.PlacesServiceStatus.OK) {
      for (var i = 0; i < results.length; i++) {
    	  
        createMarker(results[i]);
      }
      map.setCenter(results[0].geometry.location);
    }
  });
}


</script>
</body>
</html>