import 'package:coffee_shop/data/models/coffee.dart';
import 'package:coffee_shop/features/coffee_delivery/controller/delivery_controller.dart';
import 'package:coffee_shop/features/coffee_delivery/widgets/delivery_progress.dart';
import 'package:coffee_shop/features/coffee_delivery/widgets/loader.dart';
import 'package:coffee_shop/features/coffee_delivery/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key, required this.coffee});
  final Coffee coffee;

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  final deliveryController = Get.put(DeliveryController());

  @override
  void initState() {
    deliveryController.addSourceDestinationIcon();
    // deliveryController.getCurrentLocation();
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<DeliveryController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => GoogleMap(
                mapType: MapType.terrain,
                myLocationButtonEnabled:
                    deliveryController.myLocationButtonEnabled.value,
                myLocationEnabled: false,
                compassEnabled: false,
                zoomControlsEnabled: true,
                zoomGesturesEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: LatLng(deliveryController.latitude,
                      deliveryController.longitude.value),
                  zoom: 16,
                ),
                cameraTargetBounds: CameraTargetBounds.unbounded,
                markers: {
                  Marker(
                      markerId: const MarkerId('1'),
                      draggable: false,
                      icon: deliveryController.markerSourceIcon,
                      position: deliveryController.sourceLatLng),
                  Marker(
                      markerId: const MarkerId('2'),
                      icon: deliveryController.markerDestinationIcon,
                      position: LatLng(deliveryController.latitude,
                          deliveryController.longitude.value))
                },
                polylines: {
                  Polyline(
                    width: 5,
                    polylineId: const PolylineId("route"),
                    color: Colors.brown,
                    endCap: Cap.roundCap,
                    startCap: Cap.roundCap,
                    jointType: JointType.round,
                    geodesic: true,
                    points: [
                      LatLng(deliveryController.sourceLatLng.latitude,
                          deliveryController.sourceLatLng.longitude),
                      LatLng(deliveryController.latitude,
                          deliveryController.longitude.value),
                    ],
                  ),
                },
                onTap: (latlng) => deliveryController.onTapMap(latlng),
                onMapCreated: deliveryController.onMapCreated),
          ),
          Positioned(
            top: context.height / 16,
            left: context.width / 20,
            right: context.width / 20,
            child: buildDeliveryScreenAppbarWidget(context, deliveryController),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: buildDeliveryProgress(context),
          ),
          Obx(
            () => !deliveryController.fetchingLocation.value
                ? const SizedBox.shrink()
                : Positioned(
                    top: context.height / 3,
                    left: 0,
                    right: 0,
                    child: const AppLoaderWidget(message: "Fetching location")),
          ),
        ],
      ),
    );
  }
}
