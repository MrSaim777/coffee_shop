import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DeliveryController extends GetxController {
  late GoogleMapController mapController;

  final LatLng center = const LatLng(-33.86, 151.20);

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
}
