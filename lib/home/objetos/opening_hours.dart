
class opening_hours {
  final opening_hours open_now;
  // final opening_hours open_now;

  opening_hours({this.open_now});

  opening_hours.fromJson(Map<dynamic,dynamic> parsedJson)
      :open_now = opening_hours.fromJson(parsedJson['open_now']);
}

