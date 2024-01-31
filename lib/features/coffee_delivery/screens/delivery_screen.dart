import 'package:coffee_shop/data/models/coffee.dart';
import 'package:coffee_shop/features/coffee_delivery/controller/delivery_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({super.key, required this.coffee});
  final Coffee coffee;
  @override
  Widget build(BuildContext context) {
    final deliveryController = Get.put(DeliveryController());
    return Scaffold(
      body: GoogleMap(
        onMapCreated: deliveryController.onMapCreated,
        initialCameraPosition: CameraPosition(
          target: deliveryController.center,
          zoom: 11.0,
        ),
        markers: {
          const Marker(
            markerId: const MarkerId("Sydney"),
            position: LatLng(-33.86, 151.20),
          ), // Marker
        }, // markers
      ),
    );
  }
}
