import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:tremp_app/place.dart';
import 'package:url_launcher/url_launcher.dart';

// Widget buildMyMap() {
//   // LatLng coords = searchedLocation.hasName
//   //     ? LatLng(searchedLocation.coordinates)
//   //     : const [51.509364, -0.128928];
//   return FlutterMap(
//     options: MapOptions(
//       initialCenter: LatLng(51.509364, -0.128928),
//       initialZoom: 9.2,
//     ),
//     children: [
//       TileLayer(
//         urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//         userAgentPackageName: 'com.example.app',
//       ),
//       RichAttributionWidget(
//         attributions: [
//           TextSourceAttribution(
//             'OpenStreetMap contributors',
//             onTap: () =>
//                 launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
//           ),
//         ],
//       ),
//     ],
//   );
// }

Widget buildMyMap2(MapController mapController, Place originLocation,
    Place destinationLocation) {
  // LatLng coordinates = searchedLocation.hasName
  //     ? searchedLocation.coordinates
  //     : LatLng(51.509364, -0.128928);

  return FlutterMap(
    mapController: mapController,
    options: MapOptions(
      initialCenter: LatLng(51.509364, -0.128928),
      initialZoom: 9.2,
      onTap: (_, p) => print("[+] clicked on $p"),
    ),
    children: [
      TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        userAgentPackageName: 'com.example.app',
      ),
      MarkerLayer(markers: [
        buildPin(originLocation.coordinates, Colors.black),
        buildPin(destinationLocation.coordinates, Colors.green.shade700)
      ]),
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

Marker buildPin(LatLng point, Color c) => Marker(
      point: point,
      width: 60,
      height: 60,
      child: Icon(Icons.location_pin, size: 60, color: c),
    );
