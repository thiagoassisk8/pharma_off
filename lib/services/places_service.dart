import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pharma_off/models/place.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PlacesService {
  var tipodebusca = 'drugstore';
  final key = 'AIzaSyDfDu40RB7jGz3EJX2XR-T7q4GHhOge6i0';

   Future<List<Place>> getPlaces(double lat, double lng,BitmapDescriptor icon) async {
    // var elementos = tipodebusca.map((e) => e);
    // print(elementos);
    var response = await http.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&type=$tipodebusca&rankby=distance&key=$key');
    // print(response);
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['results'] as List;
    return jsonResults.map((place) => Place.fromJson(place,icon)).toList();
  }

  //https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-15.7361710,-47.8960675&type=drugstore&rankby=distance&key=AIzaSyDfDu40RB7jGz3EJX2XR-T7q4GHhOge6i0
//-15.7361710, -47.8960675
}