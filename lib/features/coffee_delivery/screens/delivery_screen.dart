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
          // GoogleMap(
          //   mapType: MapType.terrain,
          //   onMapCreated: deliveryController.onMapCreated,
          //   initialCameraPosition: CameraPosition(
          //     target: deliveryController.center,
          //     zoom: 11.0,
          //   ),
          //   markers: {
          //     Marker(
          //       markerId: const MarkerId("Source"),
          //       position: const LatLng(-33.86, 151.20),
          //       icon: BitmapDescriptor.defaultMarkerWithHue(
          //           BitmapDescriptor.hueGreen),
          //     ),
          //     Marker(
          //       markerId: const MarkerId("Destination"),
          //       // position: destinationLatLng,
          //       position: const LatLng(-33.86, 251.20),
          //       icon: BitmapDescriptor.defaultMarkerWithHue(
          //           BitmapDescriptor.hueRed),
          //     ),
          //   },
          //   polylines: {
          //     const Polyline(
          //       polylineId: PolylineId("polyline"),
          //       color: Colors.brown,
          //       points: [
          //         LatLng(-33.86, 251.20),
          //         // destinationLatLng,
          //         LatLng(-33.86, 151.20),

          //       ],
          //       width: 5,
          //     ),
          //   },
          // ),
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
                zoom: 14.4746,
              ),
              markers: {deliveryController.marker},
              onTap: (latlng) => deliveryController.onTapMap(latlng),
              onMapCreated: (GoogleMapController controller) {
                deliveryController.mapController.complete(controller);
              },
            ),
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
          )
        ],
      ),
    );
  }
}

//  onTapMap(LatLng latlng) async {
//     checkoutController.latitude = latlng.latitude;
//     checkoutController.longitude = latlng.longitude;
//     setState(() {
//       marker = Marker(
//           markerId: const MarkerId(Constants.1), position: latlng);
//     });
//     await getAddressByCoordinates(latlng.latitude, latlng.longitude);
//   }
