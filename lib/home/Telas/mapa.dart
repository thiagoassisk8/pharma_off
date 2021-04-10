import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pharma_off/home/objetos/estabelecimento.dart';
import 'package:provider/provider.dart';
import 'package:pharma_off/home/objetos/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pharma_off/home/Telas/lista.dart';



void AddInfoFarmacias(context, place) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    context: context,
    // backgroundColor: Colors.green[700],
    builder: (BuildContext bc) {

      String buildPhotoURL(photoReference) {
        return "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoReference&key=AIzaSyDfDu40RB7jGz3EJX2XR-T7q4GHhOge6i0";
      }
      var chavefotolocalizacao = 'ATtYBwIeAemsqnunA1sHcPl92yN5e0KDRk2xG7UdJqqelf8mWRMxk_88IPDfmGP34OYHix3sM4OSY3XBAdvVFbsADel1MD5zx9qVLMf1HuqYYt6kKJf-ETWYYOEP5CUbbgDGBR185Kpr6tnjLNatzkNSRyNFmeVciUNyFjdge3UGHHLxqf1Z';

      return Container(
        height: MediaQuery.of(context).size.height * .58, //não brinquem com isso não é o tamanho do pop up



        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
              children: <Widget>[

                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                  child: Image.network(buildPhotoURL(chavefotolocalizacao),
                      height: 200.0,
                      width:  MediaQuery.of(context).size.width,
                      fit:BoxFit.cover
                  ),
                ),


                Container(
                    color: Colors.blue,
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child:
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[

                          Text(place.name,
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'RobotoMono',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),

                          Text(place.open_now.toString(),
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'RobotoMono',
                                  color: Colors.black)),
                        ])),


                SizedBox(
                    width: MediaQuery.of(context).size.width, // set this
                    child:
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Text("Endereço",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'RobotoMono',
                                  color: Colors.black)),

                          Text("Rating",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'RobotoMono',
                                  color: Colors.black)),


                        ])),

                Divider(
                  height: 20,
                  thickness: 1,
                  color: Colors.grey,
                  indent: 0,
                  endIndent: 0,
                ),
                FlatButton(
                    onPressed:(){debugPrint("Ponto Visitado!");} ,
                    // padding: EdgeInsets.fromLTRB(90, 0, 10, 0),
                    child: Image.asset('assets/icons/Gobutton.png',
                      height: 50,
                      width: 100,
                    )),

              ]),
        ),
      );
    },
  );
}
class MapaState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {




    List<Marker> getMarkers(List<Estabecimento> estabelecimentos){
      var markers = List<Marker>();

      estabelecimentos.forEach((place){
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
    final estabelecimentosProvider = Provider.of<Future<List<Estabecimento>>>(context);
    // final markerService = MarkerService();

    return FutureProvider(
      create: (context) => estabelecimentosProvider,
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
                  Navigator.pushNamed(context, Lista.NomeNavegacao),
            )
          ],
        ),
        body: (currentPosition != null)
            ? Consumer<List<Estabecimento>>(
          builder: (_, estabelecimentos, __) {
            var markers = (estabelecimentos != null) ? getMarkers(estabelecimentos) : List<Marker>();
            return (estabelecimentos != null) ? Column(
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
