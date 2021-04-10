class Location{
  final double lat;
  final double lng;
  // final String photoReference;

  Location({this.lat, this.lng});

  Location.fromJson(Map<dynamic,dynamic> parsedJson)
      :lat = parsedJson['lat'],
      lng = parsedJson['lng'];

}