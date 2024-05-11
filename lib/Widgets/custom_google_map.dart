import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPosition;
  late GoogleMapController googleMapController;

  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
        zoom: 16, target: LatLng(30.786596595960322, 31.000377688642068));

    super.initState();
  }

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          // initialize google map controller
          googleMapController = controller;
          

          initMapStyle();
        },
        initialCameraPosition: initialCameraPosition,
      ),
      Positioned(
        bottom: 16,
        left: 16,
        right: 16,
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("Change Location"),
        ),
      )
    ]);
  }

  void initMapStyle() async {
    var nightMapStyle = await DefaultAssetBundle.of(context)
        .loadString('assets/map_style/night_map_style.json');
    googleMapController.setMapStyle(nightMapStyle);

  }
}

// world view 0 --> 3
// country view 4 --> 6
// city view 10 --> 12
// street view 13 --> 17
// building view 18 --> 20
