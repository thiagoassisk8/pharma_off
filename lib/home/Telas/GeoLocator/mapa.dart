import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pharma_off/home/objetos/estabelecimento.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pharma_off/home/Telas/GeoLocator/lista.dart';
import 'package:pharma_off/palheta/size_config.dart';

import 'package:pharma_off/home/servicos/BuscaEstabelecimento.dart';

final sizeconfig = SizeConfig();

class MapaState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Marker> getMarkers(List<Estabecimento> estabelecimentos) {
      var markers = List<Marker>();

      estabelecimentos.forEach((place) {
        Marker marker = Marker(
          markerId: MarkerId(place.name),
          draggable: false,
          icon: place.icon,
          position:
              LatLng(place.geometry.location.lat, place.geometry.location.lng),
          infoWindow: InfoWindow(title: place.name, snippet: place.vicinity),
          onTap: () {
            BuscaEstabeleciemento().AddInfoFarmacias(context, place);
          },
        );

        markers.add(marker);
      });

      return markers;
    }

    final currentPosition = Provider.of<Position>(context);
    final estabelecimentosProvider =
        Provider.of<Future<List<Estabecimento>>>(context);
    // final markerService = MarkerService();

    return FutureProvider(
      create: (context) => estabelecimentosProvider,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          title: Image.asset(
            'assets/images/pharmaoff_logo_azul.png',
            height: 110,
            width: 110,
          ),
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.fromLTRB(0, 0, 35, 0),
              icon: Icon(
                Icons.assignment,
                color: Colors.black45,
                size: 38,
              ),
              onPressed: () =>
                  Navigator.pushNamed(context, Lista.NomeNavegacao),
            )
          ],
        ),
        body: (currentPosition != null)
            ? Consumer<List<Estabecimento>>(
                builder: (_, estabelecimentos, __) {
                  var markers = (estabelecimentos != null)
                      ? getMarkers(estabelecimentos)
                      : List<Marker>();
                  return (estabelecimentos != null)
                      ? Column(
                          children: <Widget>[
                            Container(
                              height: MediaQuery.of(context).size.height / 1.12,
                              child: GoogleMap(
                                mapType: MapType.normal,
                                initialCameraPosition: CameraPosition(
                                    target: LatLng(
                                      currentPosition.latitude,
                                      currentPosition.longitude,
                                    ),
                                    zoom: 15.0),
                                zoomGesturesEnabled: true,
                                markers: Set<Marker>.of(markers),
                                myLocationEnabled: true,
                                padding: EdgeInsets.fromLTRB(50, 50, 10, 50),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
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
}
