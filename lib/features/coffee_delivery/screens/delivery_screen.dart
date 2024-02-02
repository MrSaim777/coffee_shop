import 'package:coffee_shop/data/models/coffee.dart';
import 'package:coffee_shop/features/coffee_delivery/controller/delivery_controller.dart';
import 'package:coffee_shop/features/coffee_delivery/widgets/delivery_progress.dart';
import 'package:coffee_shop/features/coffee_delivery/widgets/loader.dart';
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
                markers: {
                  Marker(
                      markerId: const MarkerId('1'),
                      draggable: false,
                      icon: deliveryController.markerSourceIcon,
                      position: deliveryController.sourceLanLng),
                  Marker(
                      markerId: const MarkerId('2'),
                      icon: deliveryController.markerDestinationIcon,
                      position: LatLng(deliveryController.latitude,
                          deliveryController.longitude.value))
                },
                polylines: {
                  Polyline(
                    polylineId: const PolylineId("1"),
                    color: Colors.brown,
                    points: [
                      deliveryController.sourceLanLng,
                      LatLng(deliveryController.latitude,
                          deliveryController.longitude.value)
                    ],
                    width: 5,
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

// class MapPage extends StatefulWidget {
//   const MapPage({super.key});

//   @override
//   State<MapPage> createState() => _MapPageState();
// }

// class _MapPageState extends State<MapPage> {
//   Location _locationController = new Location();

//   final Completer<GoogleMapController> _mapController =
//       Completer<GoogleMapController>();

//   static const LatLng _pGooglePlex = LatLng(37.4223, -122.0848);
//   static const LatLng _pApplePark = LatLng(37.3346, -122.0090);
//   LatLng? _currentP = null;


//   @override
//   void initState() {
//     super.initState();
//     getLocationUpdates().then(
//       (_) => {
//         getPolylinePoints().then((coordinates) => {
//               generatePolyLineFromPoints(coordinates),
//             }),
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _currentP == null
//           ? const Center(
//               child: Text("Loading..."),
//             )
//           : GoogleMap(
//               onMapCreated: ((GoogleMapController controller) =>
//                   _mapController.complete(controller)),
//               initialCameraPosition: CameraPosition(
//                 target: _pGooglePlex,
//                 zoom: 13,
//               ),
//               markers: {
//                 Marker(
//                   markerId: MarkerId("_currentLocation"),
//                   icon: BitmapDescriptor.defaultMarker,
//                   position: _currentP!,
//                 ),
//                 Marker(
//                     markerId: MarkerId("_sourceLocation"),
//                     icon: BitmapDescriptor.defaultMarker,
//                     position: _pGooglePlex),
//                 Marker(
//                     markerId: MarkerId("_destionationLocation"),
//                     icon: BitmapDescriptor.defaultMarker,
//                     position: _pApplePark)
//               },
//               polylines: Set<Polyline>.of(polylines.values),
//             ),
//     );
//   }

//   Future<void> _cameraToPosition(LatLng pos) async {
//     final GoogleMapController controller = await _mapController.future;
//     CameraPosition _newCameraPosition = CameraPosition(
//       target: pos,
//       zoom: 13,
//     );
//     await controller.animateCamera(
//       CameraUpdate.newCameraPosition(_newCameraPosition),
//     );
//   }

//   Future<void> getLocationUpdates() async {
//     bool _serviceEnabled;
//     PermissionStatus _permissionGranted;

//     _serviceEnabled = await _locationController.serviceEnabled();
//     if (_serviceEnabled) {
//       _serviceEnabled = await _locationController.requestService();
//     } else {
//       return;
//     }

//     _permissionGranted = await _locationController.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await _locationController.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//         return;
//       }
//     }

//     _locationController.onLocationChanged
//         .listen((LocationData currentLocation) {
//       if (currentLocation.latitude != null &&
//           currentLocation.longitude != null) {
//         setState(() {
//           _currentP =
//               LatLng(currentLocation.latitude!, currentLocation.longitude!);
//           _cameraToPosition(_currentP!);
//         });
//       }
//     });
//   }

 
// }