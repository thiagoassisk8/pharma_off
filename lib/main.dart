import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharma_off/theme.dart';
import 'package:pharma_off/Telas/splash/splash_screen.dart';
import 'package:pharma_off/routes.dart';


import 'package:geolocator/geolocator.dart';
import 'package:pharma_off/models/place.dart';
import 'package:pharma_off/services/geolocator_service.dart';
import 'package:pharma_off/services/places_service.dart';
import 'package:provider/provider.dart';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final locatorService = GeoLocatorService();
  final placesService = PlacesService();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider(create: (context) => locatorService.getLocation()),
        ProxyProvider<Position,Future<List<Place>>>(
          update: (context,position,places){
            return (position !=null) ? placesService.getPlaces(position.latitude, position.longitude) :null;
          },
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PharmaOFF',
        theme: theme(),
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}