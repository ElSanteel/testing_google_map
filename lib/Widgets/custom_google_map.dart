import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_map_course/models/place_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'dart:ui' as ui;

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPosition;
  late GoogleMapController googleMapController;
  // Set<Marker> markers = {};
  // Set<Polyline> polyLines = {};
  Set<Polygon> polygons = {};

  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
      // this zoom is for trying geodesic property
      // zoom: 1,
      zoom: 4,
      target: LatLng(30.786596595960322, 31.000377688642068),
    );

    // preferred to initialize markers in initMarkers method in the initState
    // initMarkers();

    // initPolyLines();

    initPolygons();
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
        // to hide zoom controllers
        zoomControlsEnabled: false,
        // markers: markers,
        // polylines: polyLines,
        polygons: polygons,

        onMapCreated: (GoogleMapController controller) {
          // initialize google map controller
          googleMapController = controller;

          initMapStyle();
        },
        initialCameraPosition: initialCameraPosition,
      ),
      // Positioned(
      //   bottom: 16,
      //   left: 16,
      //   right: 16,
      //   child: ElevatedButton(
      //     onPressed: () {},
      //     child: const Text("Change Location"),
      //   ),
      // )
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

  // method change size of marker icon
  // Future<Uint8List> getImageFromRawData(String image, double width) async {
  // covert image to raw data format (Tharwat Explain this in the video)
  // Load the image data from the specified asset (a marker icon in this case) into memory for further use.
  //   var imageData = await rootBundle.load('assets/images/icons8-marker-50.png');

  // change the width of the image and return it as a byte data
  // Instantiate an image codec from the image data buffer, specifying the target width. This is used to decode the image data into a frame.
  //   var imageCodec = await ui.instantiateImageCodec(
  //       imageData.buffer.asUint8List(),
  //       targetWidth: width.round());

  // retrieve image frame information (Tharwat Explain this in the video)
  // Retrieve the next frame from the image codec. This is used to get the decoded image data for rendering.
  //   var imageFrameInfo = await imageCodec.getNextFrame();

  // convert image to byte data but with modified properties
  //   var imageByteData =
  //       await imageFrameInfo.image.toByteData(format: ui.ImageByteFormat.png);

  //   return imageByteData!.buffer.asUint8List();
  // }

  // method to create multiple markers
  // void initMarkers() async {
  // change marker icon if you will use getImageFromRawData method

  // var customMarkerIcon = BitmapDescriptor.fromBytes(
  //     await getImageFromRawData('assets/images/icons8-marker-50.png', 70));

  // change marker icon if you will use getImageFromRawData method
  //   var customMarkerIcon = await BitmapDescriptor.fromAssetImage(
  //       const ImageConfiguration(), 'assets/images/icons8-marker-50.png');

  //   var myMarkers = places
  //       .map((placeModel) => Marker(
  //             icon: customMarkerIcon,
  //             markerId: MarkerId(placeModel.id.toString()),
  //             position: placeModel.latLng,
  // this comment is put here to see the use of infoWindow
  //             infoWindow: InfoWindow(title: placeModel.name),
  //           ))
  //       .toSet();
  //   markers.addAll(myMarkers);
  //   setState(() {});
  // }

  // void initPolyLines() {
  //   Polyline polyLine = Polyline(
  //     polylineId: const PolylineId('1'),
  //     points: const [
  //       LatLng(30.781647165030805, 30.99564275849909),
  //       LatLng(30.78697008694028, 31.00022235705082),
  //       LatLng(30.78459591541297, 31.004907874672455),
  //       LatLng(30.780135938641447, 31.003634585857398),

  //       // these points to try geodesic property
  //       // LatLng(-28.718313313545117, 22.86984894027408),
  //       // LatLng(81.73748455120459, 145.67510849968693)
  //     ],
  //     color: Colors.red,
  //     startCap: Cap.roundCap,
  //     width: 5,
  //     zIndex: 2,
  //     patterns: [PatternItem.dot, PatternItem.gap(10)],
  //     geodesic: false,
  //   );

  //   Polyline polyLine2 = Polyline(
  //     polylineId: const PolylineId('2'),
  //     points: const [
  //       LatLng(30.785253447644422, 31.000195661080703),
  //       LatLng(30.78871166158042, 31.00148987292484)

  // these points to try geodesic property
  // LatLng(-28.718313313545117, 22.86984894027408),
  // LatLng(81.73748455120459, 145.67510849968693)
  //     ],
  //     color: Colors.black,
  //     startCap: Cap.roundCap,
  //     width: 5,
  //     zIndex: 1,
  //     patterns: [PatternItem.dot, PatternItem.gap(10)],
  //     geodesic: false,
  //   );
  //   polyLines.add(polyLine);
  //   polyLines.add(polyLine2);
  // }

  void initPolygons() {
    var polygon = Polygon(
        polygonId: const PolygonId('1'),
        points: const [
          LatLng(31.66707692557948, 25.08956741360882),
          LatLng(22.077005231704607, 25.00879213543131),
          LatLng(22.052052095922043, 36.80198274934764),
          LatLng(30.049219069687506, 32.54781809866549)
        ],
        fillColor: Colors.black.withOpacity(0.5),
        strokeWidth: 3,
        holes: const [
          [
            LatLng(30.031194754428565, 31.259648332163763),
            LatLng(31.20301791724987, 29.95886713833016),
            LatLng(28.895913350680814, 27.285499533877548),
            LatLng(29.752279573851133, 33.924922788616406),
          ]
        ]);
    polygons.add(polygon);
  }
}

// world view 0 --> 3
// country view 4 --> 6
// city view 10 --> 12
// street view 13 --> 17
// building view 18 --> 20
