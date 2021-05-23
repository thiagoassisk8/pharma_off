import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pharma_off/palheta/theme.dart';
import 'package:pharma_off/splash/splash_screen.dart';
import 'package:pharma_off/home/Navigation_bar/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pharma_off/home/objetos/estabelecimento.dart';
import 'package:pharma_off/home/servicos/geolocator_service.dart';
import 'package:pharma_off/home/servicos/BuscaEstabelecimento.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final teste=15;
  final locatorService = GeoLocatorService();
  final tipoEstabelecimento = BuscaEstabeleciemento();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider(create: (context) => locatorService.getLocation()),
        FutureProvider(create: (context) {
          ImageConfiguration configuration =
              createLocalImageConfiguration(context);

          return BitmapDescriptor.fromAssetImage(
              configuration, 'assets/images/farmacia145.png');
        }),
        ProxyProvider2<Position, BitmapDescriptor, Future<List<Estabecimento>>>(
          update: (context, position, icon, places) {
            return (position != null)
                ? tipoEstabelecimento.getPlaces(
                    position.latitude, position.longitude, icon)
                : null;
          },
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PharmaOFF',
        theme: theme(),
        initialRoute: SplashScreen.NomeNavegacao,
        routes: navegacoes,
      ),
    );
  }
}
