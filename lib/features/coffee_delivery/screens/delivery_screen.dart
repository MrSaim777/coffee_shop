import 'package:coffee_shop/data/models/coffee.dart';
import 'package:coffee_shop/features/coffee_delivery/controller/delivery_controller.dart';
import 'package:coffee_shop/features/coffee_delivery/widgets/delivery_progress.dart';
import 'package:coffee_shop/features/coffee_delivery/widgets/top_bar.dart';
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
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.terrain,
            onMapCreated: deliveryController.onMapCreated,
            // polylines: ,
            initialCameraPosition: CameraPosition(
              target: deliveryController.center,
              zoom: 11.0,
            ),
            markers: {
              const Marker(
                markerId: MarkerId("Sydney"),
                position: LatLng(-33.86, 151.20),
              ),
            },
          ),
          Positioned(
            top: context.height / 16,
            left: context.width / 20,
            right: context.width / 20,
            child: buildDeliveryScreenAppbarWidget(context),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: buildDeliveryProgress(context),
          )
        ],
      ),
    );
  }
}
