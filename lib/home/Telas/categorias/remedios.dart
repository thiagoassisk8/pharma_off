import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pharma_off/home/servicos/detalhes_produto.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pharma_off/home/objetos/estabelecimento.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pharma_off/home/servicos/geolocator_service.dart';
import 'package:pharma_off/palheta/size_config.dart';
import 'package:pharma_off/home/objetos/produto.dart';
import 'dart:math' as math;

class Remedios extends StatelessWidget {
  static String NomeNavegacao = "/remedios";
  List<Produto> remedioLista = Produto.remediolist;
  @override
  Widget build(BuildContext context) {
    final currentPosition = Provider.of<Position>(context);
    final placesProvider = Provider.of<Future<List<Estabecimento>>>(context);
    final geoService = GeoLocatorService();
    final sizeconfig = SizeConfig();

    return FutureProvider(
      create: (context) => placesProvider,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Remédios",
              textScaleFactor: 1.1,
              style:
                  TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
        ),
        body: (currentPosition != null)
            ? Consumer<List<Estabecimento>>(
                builder: (_, estabelecimentos, __) {
                  // var markers = (estabelecimentos != null) ? markerService.getMarkers(estabelecimentos) : List<Marker>();
                  return (estabelecimentos != null)
                      ? SingleChildScrollView(
                          child: Column(
                          children: <Widget>[
                            // sizeconfig.ContainerFoto('https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=ATtYBwIeAemsqnunA1sHcPl92yN5e0KDRk2xG7UdJqqelf8mWRMxk_88IPDfmGP34OYHix3sM4OSY3XBAdvVFbsADel1MD5zx9qVLMf1HuqYYt6kKJf-ETWYYOEP5CUbbgDGBR185Kpr6tnjLNatzkNSRyNFmeVciUNyFjdge3UGHHLxqf1Z&key=AIzaSyDfDu40RB7jGz3EJX2XR-T7q4GHhOge6i0'),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Categorias",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 32,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(FlutterIcons.search,
                                        color: Colors.black26),
                                    onPressed: null,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 300,
                              margin: EdgeInsets.symmetric(vertical: 16),
                              child: ListView.builder(
                                itemCount: remedioLista.length,
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) => DetailPage(
                                            remedioLista[index],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 240,
                                      margin: EdgeInsets.only(right: 16),
                                      child: Stack(
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(top: 25),
                                            // child: _buildBackground(index, 230),
                                          ),
                                          Positioned(
                                            bottom: 50,
                                            right: 0,
                                            child: Hero(
                                              tag:
                                                  "hero${remedioLista[index].imgPath}",
                                              child: Transform.rotate(
                                                angle: -math.pi / 27,
                                                child: Image(
                                                  width: 220,
                                                  image: AssetImage(
                                                      "assets/images/${remedioLista[index].imgPath}"),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 16),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "SÓ PARA VOCÊ",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 24),

                            ...remedioLista.map((data) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => DetailPage(
                                        data,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 16, right: 16, bottom: 10),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 24),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 1,
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Image(
                                        image: AssetImage(
                                            "assets/images/${data.imgPath}"),
                                        width: 80,
                                        height: 60,
                                      ),
                                      SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .4,
                                              child: Text(
                                                "${data.name}",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            // Text(
                                            // "${data.estabelecimento}",
                                            // style: TextStyle(
                                            // color: Colors.black26,
                                            // height: 1.5,
                                            // ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: Text(
                                          "R\$ ${data.price.toInt()}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ],
                        ))
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
