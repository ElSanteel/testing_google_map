import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPosition;

  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
        zoom: 20, target: LatLng(30.786596595960322, 31.000377688642068));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(initialCameraPosition: initialCameraPosition);
  }
}

// world view 0 --> 3
// country view 4 --> 6
// city view 10 --> 12
// street view 13 --> 17
// building view 18 --> 20
