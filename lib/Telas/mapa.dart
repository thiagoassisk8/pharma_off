import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pharma_off/models/place.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pharma_off/Telas/lista.dart';
import '../models/place.dart';



void AddInfoFarmacias(context, place) {
  showModalBottomSheet(
    context: context,
    // backgroundColor: Colors.green[700],
    builder: (BuildContext bc) {
      return Container(
          height: MediaQuery
              .of(context)
              .size.height * .98, //não brinquem com isso não é o tamanho do pop up

          child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                  children: <Widget>[

                    Column(
                        children: <Widget>[

                          Divider(
                            height: 10,
                            thickness: 1,
                            color: Colors.white.withOpacity(1),
                            indent: 0,
                            endIndent: 0,
                          ),

                          Text(place.name,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'RobotoMono',
                                  color: Colors.black)),
                          Divider(
                            height: 4,
                            // thickness: 5,
                            color: Colors.white,
                            // indent: 0,
                            // endIndent: 0,
                          ),
                          Text(place.open_now.toString(),
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'RobotoMono',
                                  color: Colors.black)),
                          Divider(
                            height: 14,
                            thickness: 5,
                            color: Colors.blue,
                            indent: 0,
                            endIndent: 0,
                          ),
                          Row(
                              children: <Widget>[
                                FlatButton(
                                    onPressed:(){debugPrint("Ponto Visitado!");} ,
                                    // padding: EdgeInsets.fromLTRB(90, 0, 10, 0),
                                    child: Image.asset('assets/icons/Gobutton.png',

                                      height: 228,
                                      width: 88,)),
                                // FlatButton(
                                //   onPressed: (){debugPrint("Rota Traçada!");},
                                //   child: Image.asset('assets/icons/Gobutton.png',
                                //     height: 88,
                                //     width: 88,
                                //   ),
                                // ),
                              ]),
                        ]),])));
    },
  );
}
class MapaState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<Marker> getMarkers(List<Place> places){
      var markers = List<Marker>();

      places.forEach((place){
        Marker marker = Marker(
          markerId: MarkerId(place.name),
          draggable: false,
          icon: place.icon,
          position: LatLng(place.geometry.location.lat, place.geometry.location.lng),
          infoWindow: InfoWindow(title: place.name, snippet: place.vicinity),
            onTap: () {
              AddInfoFarmacias(context, place);
              },


        );

        markers.add(marker);
      });

      return markers;
    }


    final currentPosition = Provider.of<Position>(context);
    final placesProvider = Provider.of<Future<List<Place>>>(context);
    // final markerService = MarkerService();

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
            var markers = (places != null) ? getMarkers(places) : List<Marker>();
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
