import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(37.7749, -122.4194),
    zoom: 10,
  );

  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
        target: LatLng(30.786609216923875, 31.000410728835757));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(initialCameraPosition: initialCameraPosition);
  }
}
