import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:latlong2/latlong.dart';

import '../bo/article.dart';
import '../bo/cart.dart';

class AboutUsPage extends StatelessWidget {
  AboutUsPage({super.key});
  final mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informations"),
      ),
      body: FlutterMap(
        options: MapOptions(initialCenter: LatLng(47.2061667, -1.5419617)),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"),
          MarkerLayer(
            markers: [
              Marker(
                  point: LatLng(47.2061667, -1.5419617),
                  child: Icon(Icons.school)
              )
            ]
          )
        ],
        mapController: mapController,
      ),
    );
  }
}
