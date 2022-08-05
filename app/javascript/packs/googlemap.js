let mapInstance
let marker = []

function initMap() {
  if (gon.campLat) {
    mapInstance = new google.maps.Map(document.getElementById('map'), {
      center: {lat: gon.campLat[0], lng: gon.campLng[0]},
      zoom: 10,
      mapTypeControl: false,
      fullscreenControl: false,
      streetViewControl: false
    });

    for (var i = 0; i < gon.campLat.length; i++) {
      let pos = new google.maps.LatLng({
        lat: gon.campLat[i],
        lng: gon.campLng[i]
      });
      marker[i] = new google.maps.Marker({
        map: mapInstance,
        position: pos
      });
    }
  }
  else{
    mapInstance = new google.maps.Map(document.getElementById('map'), {
      center: {lat: 35.399, lng: 138.562},
      zoom: 10,
      mapTypeControl: false,
      fullscreenControl: false,
      streetViewControl: false
    });
  }
}


window.onload = function () {
  initMap();
};

