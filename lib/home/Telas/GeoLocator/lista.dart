import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pharma_off/home/objetos/estabelecimento.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pharma_off/home/servicos/geolocator_service.dart';
import 'package:pharma_off/palheta/theme.dart';
// import 'package:pharma_off/services/marker_service.dart';

class Lista extends StatelessWidget {
  static String NomeNavegacao = "/lista";
  @override
  Widget build(BuildContext context) {
    final currentPosition = Provider.of<Position>(context);
    final placesProvider = Provider.of<Future<List<Estabecimento>>>(context);
    final geoService = GeoLocatorService();

    return FutureProvider(
      create: (context) => placesProvider,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Farmácias próximas",
              textScaleFactor: 1.1,
              style:
                  TextStyle(color: AzulPrimario, fontWeight: FontWeight.bold)),
        ),
        body: (currentPosition != null)
            ? Consumer<List<Estabecimento>>(
                builder: (_, estabelecimentos, __) {
                  // var markers = (estabelecimentos != null) ? markerService.getMarkers(estabelecimentos) : List<Marker>();
                  return (estabelecimentos != null)
                      ? Column(
                          children: <Widget>[
                            Expanded(
                              child: (estabelecimentos.length > 0)
                                  ? ListView.builder(
                                      itemCount: estabelecimentos.length,
                                      itemBuilder: (context, index) {
                                        return FutureProvider(
                                          create: (context) =>
                                              geoService.getDistance(
                                                  currentPosition.latitude,
                                                  currentPosition.longitude,
                                                  estabelecimentos[index]
                                                      .geometry
                                                      .location
                                                      .lat,
                                                  estabelecimentos[index]
                                                      .geometry
                                                      .location
                                                      .lng),
                                          child: Card(
                                            child: ListTile(
                                              title: Text(
                                                  estabelecimentos[index].name),
                                              subtitle: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  SizedBox(
                                                    height: 3.0,
                                                  ),
                                                  (estabelecimentos[index]
                                                              .rating !=
                                                          null)
                                                      ? Row(
                                                          children: <Widget>[
                                                            RatingBarIndicator(
                                                              rating:
                                                                  estabelecimentos[
                                                                          index]
                                                                      .rating,
                                                              itemBuilder: (context,
                                                                      index) =>
                                                                  Icon(
                                                                      Icons
                                                                          .star,
                                                                      color: Colors
                                                                          .amber),
                                                              itemCount: 5,
                                                              itemSize: 10.0,
                                                              direction: Axis
                                                                  .horizontal,
                                                            )
                                                          ],
                                                        )
                                                      : Row(),
                                                  SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  Consumer<double>(
                                                    builder: (context, meters,
                                                        wiget) {
                                                      return (meters != null)
                                                          ? Text(
                                                              '${estabelecimentos[index].vicinity} \u00b7 ${meters.round()} metros ')
                                                          : Container();
                                                    },
                                                  )
                                                ],
                                              ),
                                              trailing: IconButton(
                                                icon: Icon(Icons.directions),
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                onPressed: () {
                                                  _launchMapsUrl(
                                                      estabelecimentos[index]
                                                          .geometry
                                                          .location
                                                          .lat,
                                                      estabelecimentos[index]
                                                          .geometry
                                                          .location
                                                          .lng);
                                                },
                                              ),
                                            ),
                                          ),
                                        );
                                      })
                                  : Center(
                                      child: Text(
                                          'Não há nenhuma farmácia por aqui'),
                                    ),
                            )
                          ],
                        )
                      : Center(child: CircularProgressIndicator());
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  void _launchMapsUrl(double lat, double lng) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possivel encontrar a $url';
    }
  }
}
