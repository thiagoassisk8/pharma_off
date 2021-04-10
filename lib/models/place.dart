import 'package:pharma_off/models/geometry.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Place{

  final String name;
  final double rating;
  final int userRatingCount;
  final String vicinity;
  final Geometry geometry;
  final BitmapDescriptor icon;
  final String photo_reference;
  final bool open_now;

  // static var fromJson;


  Place({this.geometry, this.name, this.rating, this.userRatingCount, this.vicinity,this.icon,this.photo_reference,this.open_now});

  Place.fromJson(Map<dynamic, dynamic> parsedJson, BitmapDescriptor icon):
        name = parsedJson['name'],
        rating = (parsedJson['rating'] !=null) ? parsedJson['rating'].toDouble() : null,
        photo_reference =parsedJson['photoReference'],
        userRatingCount = (parsedJson['user_ratings_total'] != null) ? parsedJson['user_ratings_total'] : null,
        vicinity = parsedJson['vicinity'],
        open_now = parsedJson['open_now'] ,
        geometry = Geometry.fromJson(parsedJson['geometry']),
        icon=icon;

}

