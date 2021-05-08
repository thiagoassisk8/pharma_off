import 'package:pharma_off/home/objetos/location.dart';

class Photo {
  final Location location;

  Photo({this.location});

  Photo.fromJson(Map<dynamic,dynamic> parsedJson)
      :location = Location.fromJson(parsedJson['photo_reference']);
}