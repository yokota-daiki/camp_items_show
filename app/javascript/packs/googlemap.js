let mapInstance
let marker = []
let infoWindow = []

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
      marker[i] = new google.maps.Marker({ //地図にマーカを追加
        map: mapInstance,
        position: pos,
        icon: {
          url: "camp_icon2.png",
          scaledSize: new google.maps.Size(40,40)
        },
      });
      infoWindow[i] = new google.maps.InfoWindow({ //吹き出しを追加
        content: `<div>(${[i]})・${gon.campname[i]}</div>`
      });

      markerEvent(i); 
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

function markerEvent(i) { //マーカをクリックしたときに吹き出しを表示
  marker[i].addListener('click', function() {
    infoWindow[i].open(map, marker[i]);
  });
}


window.onload = function () {
  initMap();
};

