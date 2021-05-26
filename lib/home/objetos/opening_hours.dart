class Opening_hours {
  final Opening_hours open_now;
  // final opening_hours open_now;

  Opening_hours({this.open_now});

  Opening_hours.fromJson(Map<dynamic, dynamic> parsedJson)
      : open_now = Opening_hours.fromJson(parsedJson['open_now']);
}
