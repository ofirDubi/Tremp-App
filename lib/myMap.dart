import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

Widget buildMyMap() {
  // LatLng coords = searchedLocation.hasName
  //     ? LatLng(searchedLocation.coordinates)
  //     : const [51.509364, -0.128928];
  return FlutterMap(
    options: MapOptions(
      initialCenter: LatLng(51.509364, -0.128928),
      initialZoom: 9.2,
    ),
    children: [
      TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        userAgentPackageName: 'com.example.app',
      ),
      RichAttributionWidget(
        attributions: [
          TextSourceAttribution(
            'OpenStreetMap contributors',
            onTap: () =>
                launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
          ),
        ],
      ),
    ],
  );
}

Marker buildPin(LatLng point) => Marker(
      point: point,
      width: 60,
      height: 60,
      child: const Icon(Icons.location_pin, size: 60, color: Colors.black),
    );
