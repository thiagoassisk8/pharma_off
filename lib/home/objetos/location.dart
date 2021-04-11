class Location{
  final double lat;
  final double lng;
  // final String photo_reference;

  Location({this.lat, this.lng});

  Location.fromJson(Map<dynamic,dynamic> parsedJson)
      :lat = parsedJson['lat'],
      lng = parsedJson['lng'];
      // photo_reference=parsedJson['photo_reference'];

}