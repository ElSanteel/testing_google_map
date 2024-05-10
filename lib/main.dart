import 'package:flutter/material.dart';
import 'package:google_map_course/Widgets/custom_google_map.dart';

void main() {
  runApp(const TestingGoogleMapsWithFlutter());
}

class TestingGoogleMapsWithFlutter extends StatelessWidget {
  const TestingGoogleMapsWithFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomGoogleMap(),
    );
  }
}
