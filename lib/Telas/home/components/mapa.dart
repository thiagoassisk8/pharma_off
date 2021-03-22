import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

Marker farmacia1 = Marker(
  markerId: MarkerId('rosario'),
  position: LatLng(-15.795981102602921, -47.89040207631975),
  infoWindow: InfoWindow(title: 'Drogaria Rosário'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueBlue,
  ),
);

Marker farmacia2 = Marker(
  markerId: MarkerId('drogasil'),
  position: LatLng(-15.794453191639626, -47.89164662125551),
  infoWindow: InfoWindow(title: 'Drogasil'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueBlue,
  ),
);
Marker farmacia3 = Marker(
  markerId: MarkerId('pacheco'),
  position: LatLng(-15.797738913630512, -47.887036081402684),
  infoWindow: InfoWindow(title: 'Drogarias Pacheco'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueBlue,
  ),
);

class Mapa extends StatefulWidget {
  @override
  static String routeName = "/Mapa";
  MapaState createState() => MapaState();
}

class MapaState extends State<Mapa> {
  Map<String, String> body = {"user_id": "Zjlq1nMf9XS2SrHc6b0gFHFuBTa2"};
  GoogleMapController mapController;
  final Geolocator _geolocator = Geolocator();
  Set<Marker> markers = new Set<Marker>();


  BitmapDescriptor pinLocationIcon;

  Position _currentPosition;
  double lat = -15.7905508;

  double long = -47.8949667;



  _getCurrentLocation() async {
    await _geolocator
        .getCurrentPosition()
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
    // setCustomMapPin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Image.asset('assets/images/pharmaoff_logo_azul.png',
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
            // onMapCreated: _onMapCreated,
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 22.0, bottom: 65.0),
                child: ClipOval(
                  child: Material(
                    color: Colors.blue, // button color
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
