let mapInstance
let campLat = gon.campLat
let campLng = gon.campLng
let marker = []

function initMap() {
  mapInstance = new google.maps.Map(document.getElementById('map'), {
  center: {lat: 35.399, lng: 138.562,},
  zoom: 10,
  mapTypeControl: false,
  fullscreenControl: false,
  streetViewControl: false
  });

  if (campLat) {
    for (var i = 0; i < campLat.length; i++) {
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
}

newFunction();

function newFunction() {
  window.onload = function () {
    initMap();
  };
}
