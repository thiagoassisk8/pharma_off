import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pharma_off/Telas/lista.dart';
import '../models/place.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:pharma_off/services/geolocator_service.dart';
import 'package:pharma_off/services/marker_service.dart';

class MapaState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final currentPosition = Provider.of<Position>(context);
    final placesProvider = Provider.of<Future<List<Place>>>(context);
    final markerService = MarkerService();

    return FutureProvider(
      create: (context) => placesProvider,
      child:
      Scaffold(
        extendBodyBehindAppBar: true,

        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          title: Image.asset('assets/images/pharmaoff_logo_azul.png',
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
                  Navigator.pushNamed(context, Lista.routeName),
            )
          ],
        ),
        body: (currentPosition != null)
            ? Consumer<List<Place>>(
          builder: (_, places, __) {
            var markers = (places != null) ? markerService.getMarkers(places) : List<Marker>();
            return (places != null) ? Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 1.12,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                        target: LatLng(currentPosition.latitude,
                            currentPosition.longitude),
                        zoom: 17.0),
                    zoomGesturesEnabled: true,
                    markers: Set<Marker>.of(markers),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],

            ) : Center(child: CircularProgressIndicator());
          },
        ): Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

}
