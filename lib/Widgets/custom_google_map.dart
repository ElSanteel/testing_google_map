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
        // maptype in google maps

        // mapType: MapType.normal,
        // mapType: MapType.satellite,
        // mapType: MapType.hybrid,

        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
        // cameraTargetBounds:
        // CameraTargetBounds(
        //   LatLngBounds(
        //     southwest: const LatLng(30.78048403825332, 30.98951187092241),
        //     northeast: const LatLng(30.791987715969842, 31.008116299534766),
        //   ),
        // ),
        initialCameraPosition: initialCameraPosition,
      ),
      Positioned(
        bottom: 16,
        left: 16,
        right: 16,
        child: ElevatedButton(
          onPressed: () {
            // for updating the camera position
            // CameraPosition newLocation = const CameraPosition(
            //     zoom: 11,
            //     target: LatLng(31.19676238526783, 29.917865001858917));
            // googleMapController.animateCamera(CameraUpdate.newCameraPosition(newLocation),
            // );

            // for updating latlng only
            googleMapController.animateCamera(
              CameraUpdate.newLatLng(
                const LatLng(31.19676238526783, 29.917865001858917),
              ),
            );
          },
          child: const Text("Change Location"),
        ),
      )
    ]);
  }
}

// world view 0 --> 3
// country view 4 --> 6
// city view 10 --> 12
// street view 13 --> 17
// building view 18 --> 20
