import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pharma_off/home/objetos/estabelecimento.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class BuscaEstabeleciemento {
  var tipodebusca = 'drugstore';
  final key = 'AIzaSyDfDu40RB7jGz3EJX2XR-T7q4GHhOge6i0';

   Future<List<Estabecimento>> getPlaces(double lat, double lng,BitmapDescriptor icon) async {
    // var response = await http.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&photo?maxwidth=400&photoreference=ATtYBwKqFXzX_8Ot4E5-ylsopu3HEj5R23Y_Lqd-XOSXW9kuG-kQpmyS4EhAG7_7E83Qq8YASWKxz9mntV1nh5SDvt1wP-3aow-p3f40lDoAB69o_Jp7sxvRsspfexJOiSyGc1aWHgbrmohsr7KS8OrpzSgwHCmYHLiydSzGczeQBKdPni8&type=$tipodebusca&rankby=distance&key=$key');
    var response = await http.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&type=$tipodebusca&rankby=distance&key=$key');
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['results'] as List;


    return jsonResults.map((e) => Estabecimento.fromJson(e,icon)).toList();

  }

  //https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-15.7361710,-47.8960675&photo?maxwidth=400&photoreference=${photoReference}&type=drugstore&rankby=distance&key=AIzaSyDfDu40RB7jGz3EJX2XR-T7q4GHhOge6i0
//-15.7361710, -47.8960675
//https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${photoReference}&key=${kGoogleApiKey}

//https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=CnRtAAAATLZNl354RwP_9UKbQ_5Psy40texXePv4oAlgP4qNEkdIrkyse7rPXYGd9D_Uj1rVsQdWT4oRz4QrYAJNpFX7rzqqMlZw2h2E2y5IKMUZ7ouD_SlcHxYq1yL4KbKUv3qtWgTK0A6QbGh87GB3sscrHRIQiG2RrmU_jF4tENr9wGS_YxoUSSDrYjWmrNfeEHSGSc3FyhNLlBU&key=AIzaSyDfDu40RB7jGz3EJX2XR-T7q4GHhOge6i0
}