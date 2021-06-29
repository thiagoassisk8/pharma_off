import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pharma_off/home/objetos/estabelecimento.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:pharma_off/palheta/theme.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class BuscaEstabeleciemento {
  var tipodebusca = 'drugstore';
  final key = 'AIzaSyDfDu40RB7jGz3EJX2XR-T7q4GHhOge6i0';

  Future<List<Estabecimento>> getPlaces(
      double lat, double lng, BitmapDescriptor icon) async {
    // var response = await http.get('');
    var response = await http.get(
    'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&type=$tipodebusca&rankby=distance&key=$key');
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['results'] as List;

    return jsonResults.map((e) => Estabecimento.fromJson(e, icon)).toList();
    //https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=CnRtAAAATLZNl354RwP_9UKbQ_5Psy40texXePv4oAlgP4qNEkdIrkyse7rPXYGd9D_Uj1rVsQdWT4oRz4QrYAJNpFX7rzqqMlZw2h2E2y5IKMUZ7ouD_SlcHxYq1yL4KbKUv3qtWgTK0A6QbGh87GB3sscrHRIQiG2RrmU_jF4tENr9wGS_YxoUSSDrYjWmrNfeEHSGSc3FyhNLlBU&key=AIzaSyDfDu40RB7jGz3EJX2XR-T7q4GHhOge6i0
  }

// Direciona o usuário para o ponto do mapa desejado
  void launchMapsUrl(double lat, double lng) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possivel encontrar a $url';
    }
  }

// Detalhes da farmacia em um pop up
  void AddInfoFarmacias(context, place) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      context: context,
      // backgroundColor: Colors.green[700],
      builder: (BuildContext bc) {
        String buildPhotoURL(photoReference) {
          print(place.name);
          print(place.photo_reference);
          return "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoReference&key=AIzaSyDfDu40RB7jGz3EJX2XR-T7q4GHhOge6i0";

          // return "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${place.geometry.location.lat},${place.geometry.location.lng}&photo?maxwidth=400&photoreference=${photoReference}&type=drugstore&rankby=distance&key=AIzaSyDfDu40RB7jGz3EJX2XR-T7q4GHhOge6i0";
        }

        var chavefotolocalizacao =
            'ATtYBwIeAemsqnunA1sHcPl92yN5e0KDRk2xG7UdJqqelf8mWRMxk_88IPDfmGP34OYHix3sM4OSY3XBAdvVFbsADel1MD5zx9qVLMf1HuqYYt6kKJf-ETWYYOEP5CUbbgDGBR185Kpr6tnjLNatzkNSRyNFmeVciUNyFjdge3UGHHLxqf1Z';

        return Container(
          height: MediaQuery.of(context).size.height *
              .58, //não brinquem com isso não é o tamanho do pop up

          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(children: <Widget>[
              //place.photo_reference
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                    'https://i.ytimg.com/vi/w8eHBVL4xjE/maxresdefault.jpg',
                    height: 180.0,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover),
              ),

              Container(
                  color: AzulPrimario,
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(place.name,
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      ])),

              SizedBox(
                  width: MediaQuery.of(context).size.width, // set this
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Endereço: \n" + place.vicinity,
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'RobotoMono',
                                color: Colors.black)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 3.0,
                            ),
                            (place.rating != null)
                                ? Row(
                                    children: <Widget>[
                                      RatingBarIndicator(
                                        rating: place.rating,
                                        itemBuilder: (context, index) => Icon(
                                            Icons.star,
                                            color: Colors.amber),
                                        itemCount: 5,
                                        itemSize: 20.0,
                                        direction: Axis.horizontal,
                                      )
                                    ],
                                  )
                                : Row(),
                          ],
                        ),
                      ])),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
                indent: 0,
                endIndent: 0,
              ),

              FlatButton(
                  onPressed: () {
                    launchMapsUrl(place.geometry.location.lat,
                        place.geometry.location.lng);
                  },
                  // padding: EdgeInsets.fromLTRB(90, 0, 10, 0),
                  child: Image.asset(
                    'assets/icons/Gobutton.png',
                    height: 50,
                    width: 100,
                  )),
            ]),
          ),
        );
      },
    );
  }
}
