import 'dart:async';

import 'package:coffee_shop/common/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DeliveryController extends GetxController {
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  double latitude = -33.86;
  RxDouble longitude = 151.20.obs;
  RxBool myLocationButtonEnabled = false.obs;

  var marker = const Marker(markerId: MarkerId('1'));
  BitmapDescriptor markerSourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor markerDestinationIcon = BitmapDescriptor.defaultMarker;

  var sourceLanLng = const LatLng(-33.86, 151.20);

  addSourceDestinationIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), AssetIcons.source)
        .then((icon) => markerSourceIcon = icon);

    BitmapDescriptor.fromAssetImage(const ImageConfiguration(), AssetIcons.pin)
        .then((icon) => markerDestinationIcon = icon);
  }

  onTapMap(LatLng latlng) async {
    latitude = latlng.latitude;
    longitude.value = latlng.longitude;
    marker = Marker(markerId: const MarkerId("1"), position: latlng);
  }

  onMapCreated(GoogleMapController controller) {
    mapController.complete(controller);
    addSourceDestinationIcon();
  }

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    final GoogleMapController controller = await mapController.future;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.bestForNavigation)
        .then((location) async {
      print('object');
      print('object');
      latitude = location.latitude;
      longitude.value = location.longitude;

      marker = Marker(
        markerId: const MarkerId('1'),
        position: LatLng(location.latitude, location.longitude),
      );
      await controller
          .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: marker.position,
        zoom: 14,
      )));
      return location;
    });
  }
}
