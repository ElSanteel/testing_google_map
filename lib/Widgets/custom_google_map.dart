import 'package:flutter/material.dart';
import 'package:google_map_course/models/place_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPosition;
  late GoogleMapController googleMapController;
  Set<Marker> markers = {};

  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
        zoom: 16, target: LatLng(30.786596595960322, 31.000377688642068));

    // preferred to initialize markers in initMarkers method in the initState
    initMarkers();
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
        markers: markers,
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
    // ignore: deprecated_member_use
    googleMapController.setMapStyle(nightMapStyle);
  }

  // method to create marker
  //   void initMarkers() {
  //     var myMarker = const Marker(
  //       markerId: MarkerId('1'),
  //       position: LatLng(30.786596595960322, 31.000377688642068),
  //     );
  //     markers.add(myMarker);
  //     setState(() {});
  //   }

  // method to create multiple markers
  void initMarkers() async {
    var customMarkerIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/images/icons8-marker-50.png');
    var myMarkers = places
        .map((placeModel) => Marker(
              icon: customMarkerIcon,
              markerId: MarkerId(placeModel.id.toString()),
              position: placeModel.latLng,
              // this comment is put here to see the use of infoWindow
              infoWindow: InfoWindow(title: placeModel.name),
            ))
        .toSet();
    markers.addAll(myMarkers);
    setState(() {});
  }
}

// world view 0 --> 3
// country view 4 --> 6
// city view 10 --> 12
// street view 13 --> 17
// building view 18 --> 20
