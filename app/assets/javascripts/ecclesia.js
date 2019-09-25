function initMap(lat, lng) {
    var myCoords = new google.maps.LatLng(lat, lng);
    var mapOptions = {
    center: myCoords,
    zoom: 14
    };
    var map = new google.maps.Map(document.getElementById('map'), mapOptions);

    var marker = new google.maps.Marker({
    position: myCoords,
    map: map
});
}
function initMapEcclesiaEdit() {
    var lat = document.getElementById('ecclesium_latitude').value;
    var lng = document.getElementById('ecclesium_longitude').value;

    // if not defined create default position
    if (!lat || !lng){
        lat=51.5;
        lng=-0.125;
        document.getElementById('ecclesium_latitude').value = lat;
        document.getElementById('ecclesium_longitude').value = lng;
    }
    var myCoords = new google.maps.LatLng(lat, lng);
    var mapOptions = {
    center: myCoords,
    zoom: 14
    };
    var map = new google.maps.Map(document.getElementById('initMapEcclesiaEdit'), mapOptions);
    var marker = new google.maps.Marker({
        position: myCoords,
        animation: google.maps.Animation.DROP,
        map: map,
        draggable: true
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
