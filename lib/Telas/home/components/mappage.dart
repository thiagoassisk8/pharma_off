import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';


import 'dart:convert';


class MapPage extends StatefulWidget  {
  static String routeName = "/MapPage";
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Map<String, String> body = {"user_id": "Zjlq1nMf9XS2SrHc6b0gFHFuBTa2"};
  GoogleMapController mapController;
  final Geolocator _geolocator = Geolocator();
  Set<Marker> markers = new Set<Marker>();
  // ícone verde para o marcador de local
  BitmapDescriptor pinLocationIcon;

  Position _currentPosition;

  // localização torre de tv
  double lat = -15.7905508;
  double long = -47.8949667;



  // define a imagem para o marcador de local
  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'imagens/destination_map_marker.png');
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void AddInfoPontos(context, nomePonto) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.green[700],
      builder: (BuildContext bc) {
        return Container(
          height: MediaQuery
              .of(context)
              .size
              .height * .98,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
                children: <Widget>[

          Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Image.asset(
                      "imagens/infobsb.jpg",
                      fit: BoxFit.fitWidth,
                    )),
                Divider(
                  height: 10,
                  thickness: 1,
                  color: Colors.white.withOpacity(1),
                  indent: 0,
                  endIndent: 0,
                ),


                    Text("${nomePonto}",

                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'RobotoMono',
                            color: Colors.white)),

                Text("Pontos: 200",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'RobotoMono',
                        color: Colors.white)),
                Divider(
                  height: 10,
                  thickness: 1,
                  color: Colors.white.withOpacity(1),
                  indent: 0,
                  endIndent: 0,
                ),
                Row(
                    children: <Widget>[
                      FlatButton(
                          onPressed:(){debugPrint("Ponto Visitado!");} ,
                          padding: EdgeInsets.fromLTRB(100, 0, 10, 0),
                          child: Image.asset('imagens/botaoplus.png',
                            height: 88,
                            width: 88,)),
                   FlatButton(
                      onPressed: (){debugPrint("Rota Traçada!");},
                     padding: EdgeInsets.fromLTRB(0, 0, 90, 0),
                      child: Image.asset('imagens/gologo.png',
                        height: 88,
                        width: 88,
                      ),
                  ),
                      ]),
        ]),])));
      },
    );
  }

  _getCurrentLocation() async {
    await _geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        // Store the position in the variable
        _currentPosition = position;

        // For moving the camera to current location
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 17.0,
            ),
          ),
        );
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    setCustomMapPin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Image.asset('imagens/LOGO BSB GO.png',
          height: 110,
          width: 110,
        ),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(lat, long),
              zoom: 17.0,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            mapType: MapType.normal,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: false,
            markers: markers,
            onMapCreated: _onMapCreated,
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 22.0, bottom: 65.0),
                child: ClipOval(
                  child: Material(
                    color: Colors.green, // button color
                    child: InkWell(
                      splashColor: Colors.white, // inkwell color
                      child: SizedBox(
                        width: 56,
                        height: 56,
                        child: Icon(Icons.my_location),
                      ),
                      onTap: () {
                        mapController.animateCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: LatLng(
                                _currentPosition.latitude,
                                _currentPosition.longitude,
                              ),
                              zoom: 17.0,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}