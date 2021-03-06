function initMapContact(contact) {
    var myCoords = new google.maps.LatLng(contact.latitude, contact.longitude);
    var mapOptions = {
    center: myCoords,
    zoom: 14
    };
    var map = new google.maps.Map(document.getElementById('contact-map'), mapOptions);

    var marker = new google.maps.Marker({
    position: myCoords,
    map: map,
    title: contact.first_name +' '+contact.last_name,
    icon: 'http://maps.google.com/mapfiles/ms/icons/red-dot.png'
});
}
function initMapContactEdit() {
    var lat = document.getElementById('contact_latitude').value;
    var lng = document.getElementById('contact_longitude').value;

    // if not defined create default position
    if (!lat || !lng){
        lat=18.1;
        lng=-77.3;

    }
    var myCoords = new google.maps.LatLng(lat, lng);
    var mapOptions = {
    center: myCoords,
    zoom: 8
    };
    var map = new google.maps.Map(document.getElementById('initMapContactEdit'), mapOptions);
    var marker = new google.maps.Marker({
        position: myCoords,
        animation: google.maps.Animation.DROP,
        map: map,
        draggable: true,
        icon: 'http://maps.google.com/mapfiles/ms/icons/red-dot.png'
    });
    // refresh marker position and recenter map on marker
    function refreshMarker(){
        var lat = document.getElementById('contact_latitude').value;
        var lng = document.getElementById('contact_longitude').value;
        var myCoords = new google.maps.LatLng(lat, lng);
        marker.setPosition(myCoords);
        map.setCenter(marker.getPosition());
    }
    // when input values change call refreshMarker
    document.getElementById('contact_latitude').onchange = refreshMarker;
    document.getElementById('contact_longitude').onchange = refreshMarker;
    // when marker is dragged update input values
    marker.addListener('drag', function() {
        latlng = marker.getPosition();
        newlat=(Math.round(latlng.lat()*1000000))/1000000;
        newlng=(Math.round(latlng.lng()*1000000))/1000000;
        document.getElementById('contact_latitude').value = newlat;
        document.getElementById('contact_longitude').value = newlng;
    });
    // When drag ends, center (pan) the map on the marker position
    marker.addListener('dragend', function() {
        map.panTo(marker.getPosition());
    });
}
$(document).ready(function() {
  var oldValue = '';
  $('#phone input').on('click', function() {
    $input = $(this)

    // save the old value
    oldValue = $input.val();

    // blank out the value
    $input.val('');

    // after 1 milisecond put the value back in. this tricks datalist into showing us all
    // available options without having to backspace the whole input
    setTimeout(function() { $input.val(oldValue); }, 1)
  });
})
