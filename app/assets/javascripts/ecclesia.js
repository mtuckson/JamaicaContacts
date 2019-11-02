function initMapEcclesia(ecclesium, contacts) {
  var myCoords = new google.maps.LatLng(ecclesium.latitude, ecclesium.longitude);
  var mapOptions = {
    center: myCoords,
    zoom: 14
  };
  var map = new google.maps.Map(document.getElementById('map'), mapOptions);
  var infowindow = new google.maps.InfoWindow({
    content: "Content"
  });
  var markers = new Array();

  var marker = new google.maps.Marker({
    position: myCoords,
    map: map,
    title: ecclesium.name +' Ecclesia',
    icon: 'http://maps.google.com/mapfiles/ms/icons/green-dot.png'
  });
  markers.push(marker);
  google.maps.event.addListener(marker, 'click', (function(marker) {
    return function() {
      infowindow.setContent('<a href="/ecclesia/'+ecclesium.id+'">'+ecclesium.name+' Ecclesia</a>');
      infowindow.open(map, marker);
    }
  })(marker));

  var markersForContacts = new Array();
  for (i = 0; i < contacts.length; i++) {

    var myCoords = new google.maps.LatLng(contacts[i].latitude, contacts[i].longitude);

    var marker = new google.maps.Marker({
      position: myCoords,
      map: map,
      title: contacts[i].first_name +' '+contacts[i].last_name,
      icon: 'http://maps.google.com/mapfiles/ms/icons/red-dot.png'
    });
    markersForContacts.push(marker);

    google.maps.event.addListener(marker, 'click', (function(marker, i) {
      return function() {
        infowindow.setContent('<a href="/contacts/'+contacts[i].id+'">'+contacts[i].first_name+' '+ contacts[i].last_name+'</a>');
        infowindow.open(map, marker);
      }
    })(marker, i));

  }



}
function initMapEcclesiaEdit() {
  var lat = document.getElementById('ecclesium_latitude').value;
  var lng = document.getElementById('ecclesium_longitude').value;

  // if not defined create default position
  if (!lat || !lng){
    lat=18.1;
    lng=-77.3;

  }
  var myCoords = new google.maps.LatLng(lat, lng);
  var mapOptions = {
    center: myCoords,
    zoom: 9
  };
  var map = new google.maps.Map(document.getElementById('initMapEcclesiaEdit'), mapOptions);
  var marker = new google.maps.Marker({
    position: myCoords,
    animation: google.maps.Animation.DROP,
    map: map,
    draggable: true,
    icon: 'http://maps.google.com/mapfiles/ms/icons/green-dot.png'
  });
  // refresh marker position and recenter map on marker
  function refreshMarker(){
    var lat = document.getElementById('ecclesium_latitude').value;
    var lng = document.getElementById('ecclesium_longitude').value;
    var myCoords = new google.maps.LatLng(lat, lng);
    marker.setPosition(myCoords);
    map.setCenter(marker.getPosition());
  }
  // when input values change call refreshMarker
  document.getElementById('ecclesium_latitude').onchange = refreshMarker;
  document.getElementById('ecclesium_longitude').onchange = refreshMarker;
  // when marker is dragged update input values
  marker.addListener('drag', function() {
    latlng = marker.getPosition();
    newlat=(Math.round(latlng.lat()*1000000))/1000000;
    newlng=(Math.round(latlng.lng()*1000000))/1000000;
    document.getElementById('ecclesium_latitude').value = newlat;
    document.getElementById('ecclesium_longitude').value = newlng;
  });
  // When drag ends, center (pan) the map on the marker position
  marker.addListener('dragend', function() {
    map.panTo(marker.getPosition());
  });
}




function initMapEcclesias(Ecclesia) {
  var myCoords = new google.maps.LatLng(18.1096, -77.2975);
  var mapOptions = {
    center: myCoords,
    zoom: 9
  };
  var map = new google.maps.Map(document.getElementById('initMapEcclesias'), mapOptions);
  var infowindow = new google.maps.InfoWindow({
    content: "Content"
  });
  var markers = new Array();

  var i;
  for (i = 0; i < Ecclesia.length; i++) {

    var myCoords = new google.maps.LatLng(Ecclesia[i].latitude, Ecclesia[i].longitude);

    var marker = new google.maps.Marker({
      position: myCoords,
      map: map,
      title: Ecclesia[i].name +' Ecclesia',
      icon: 'http://maps.google.com/mapfiles/ms/icons/green-dot.png'
    });
    markers.push(marker);

    google.maps.event.addListener(marker, 'click', (function(marker, i) {
      return function() {
        infowindow.setContent('<a href="/ecclesia/'+Ecclesia[i].id+'">'+Ecclesia[i].name+' Ecclesia</a>');
        infowindow.open(map, marker);
      }
    })(marker, i));

  }


}
