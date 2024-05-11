import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel {
  final int id;
  final String name;
  final LatLng latLng;
  PlaceModel({
    required this.id,
    required this.name,
    required this.latLng,
  });
}

// 30.787027203618948, 31.000508649444928
// حلويات عدلي سويت
// 30.78689903124592, 31.001058295400178
// بنك فيصل فرع طنطا
// 30.78617166330643, 31.00110709684075
// فندق جرين هاوس
List<PlaceModel> places = [
  PlaceModel(
    id: 1,
    name: 'حلويات عدلي سويت',
    latLng: const LatLng(30.787027203618948, 31.000508649444928),
  ),
  PlaceModel(
    id: 2,
    name: 'بنك فيصل فرع طنطا',
    latLng: const LatLng(30.78689903124592, 31.001058295400178),
  ),
  PlaceModel(
    id: 3,
    name: 'فندق جرين هاوس',
    latLng: const LatLng(30.78617166330643, 31.00110709684075),
  ),
];
