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
      document.getElementById('jido'), {center: sydney, zoom: 15});

  var request = {
	location: sydney,
	radius: '100000',
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

