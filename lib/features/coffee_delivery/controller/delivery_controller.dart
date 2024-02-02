import 'dart:async';
import 'dart:developer';
import 'package:coffee_shop/common/constants/colors.dart';
import 'package:coffee_shop/common/constants/icons.dart';
import 'package:coffee_shop/features/coffee_delivery/controller/map_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DeliveryController extends GetxController {
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  double latitude = -33.86;
  RxDouble longitude = 151.20.obs;
  RxBool myLocationButtonEnabled = false.obs;
  RxBool fetchingLocation = false.obs;
  BitmapDescriptor markerSourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor markerDestinationIcon = BitmapDescriptor.defaultMarker;
  var marker = const Marker(markerId: MarkerId('1'));
  Map<PolylineId, Polyline> polylines = {};

  var sourceLanLng = const LatLng(32.942850664716296, 73.70796740055084);

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
    log("$latitude $longitude", name: "latlng");
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
    fetchingLocation.value = true;
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.bestForNavigation)
        .then((location) async {
      fetchingLocation.value = false;
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

  Future<List<LatLng>> getPolylinePoints() async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      mapKey,
      PointLatLng(_pGooglePlex.latitude, _pGooglePlex.longitude),
      PointLatLng(_pApplePark.latitude, _pApplePark.longitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
      // result.points.forEach((PointLatLng point) {
      // });
    } else {
      log(result.errorMessage.toString());
    }
    return polylineCoordinates;
  }

  void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) async {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: AppColors.buttonColor,
        points: polylineCoordinates,
        width: 8);

    polylines[id] = polyline;
  }
}
