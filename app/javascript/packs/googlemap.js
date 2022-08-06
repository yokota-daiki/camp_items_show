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
        position: pos,
        icon: {
          url: "https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/camping-71.png",
          fillColor: "green",
          origin: new google.maps.Point(0,0),
          anchor: new google.maps.Point(20,20),
          fillOpacity: 0.6,
          scaledSize: new google.maps.Size(30, 30)
        }
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

