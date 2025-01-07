import 'dart:async';
import 'dart:convert';

import 'package:myproject/ex/location/location_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});
  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
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
      await Geolocator.openLocationSettings();
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  double bearingBetween({
    required double startLatitude,
    required double startLongitude,
    required double endLatitude,
    required double endLongitude,
  }) {
    double bearingBetween = Geolocator.bearingBetween(
        startLatitude, startLongitude, endLatitude, endLongitude);

    return bearingBetween;
  }

  double distanceInMeters({
    required double startLatitude,
    required double startLongitude,
    required double endLatitude,
    required double endLongitude,
  }) {
    double distanceInMeters = Geolocator.distanceBetween(
        startLatitude, startLongitude, endLatitude, endLongitude);

    return distanceInMeters;
  }

  late Future<Position> getLocation;
  late Stream<Position> streamLocation;
  late LatLng latLng;
  late Set<Marker> markers;
  @override
  void initState() {
    super.initState();
    markers = <Marker>{};

    getLocation = _determinePosition();

    streamLocation =
        Geolocator.getPositionStream(locationSettings: checkPlatform());
  }

  LocationSettings checkPlatform() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 0,
          forceLocationManager: true,
          intervalDuration: const Duration(milliseconds: 5000),
          //(Optional) Set foreground notification config to keep the app alive
          //when going to the background
          foregroundNotificationConfig: const ForegroundNotificationConfig(
            notificationText:
                "Example app will continue to receive your location even when you aren't using it",
            notificationTitle: "Running in Background",
            enableWakeLock: true,
          ));
    } else {
      return AppleSettings(
        accuracy: LocationAccuracy.high,
        activityType: ActivityType.fitness,
        distanceFilter: 0,
        pauseLocationUpdatesAutomatically: true,
        // Only set to true if our app will be started up in the background.
        showBackgroundLocationIndicator: false,
      );
    }
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: StreamBuilder(
              stream: streamLocation,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                if (snapshot.hasData) {
                  latLng =
                      LatLng(snapshot.data!.latitude, snapshot.data!.longitude);
                  markers.add(Marker(
                      markerId: const MarkerId('1'),
                      position: LatLng(
                          snapshot.data!.latitude, snapshot.data!.longitude)));
                  return GoogleMap(
                    mapType: MapType.normal,
                    onTap: (position) {
                      markers.add(
                          Marker(markerId: const MarkerId('2'), position: position));

                      drawPolyline(origin: latLng, destination: position);
                    },
                    markers: markers,
                    polylines: polylinePoints,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                          snapshot.data!.latitude, snapshot.data!.longitude),
                      zoom: 14.4746,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          // Center(
          //   child: FutureBuilder(
          //     future: getLocation,
          //     builder: (context, snapshot) {
          //       if (snapshot.hasError) {
          //         return Text(snapshot.error.toString());
          //       }
          //       if (snapshot.hasData) {
          //         return Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Text("  ${snapshot.data?.latitude}  "
          //                 "  ${snapshot.data?.longitude}  "),
          //             Text(bearingBetween(
          //                     startLatitude: snapshot.data!.latitude,
          //                     startLongitude: snapshot.data!.longitude,
          //                     endLatitude: 32.5403315,
          //                     endLongitude: 35.3018555)
          //                 .toString()),
          //             Text(distanceInMeters(
          //                     startLatitude: snapshot.data!.latitude,
          //                     startLongitude: snapshot.data!.longitude,
          //                     endLatitude: 32.5403315,
          //                     endLongitude: 35.3018555)
          //                 .toString()),
          //           ],
          //         );
          //       }
          //       return const CircularProgressIndicator();
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }

  String totalDistance = "";
  String totalTime = "";

  String apiKey = "api key";

  PolylineResponse polylineResponse = PolylineResponse();

  Set<Polyline> polylinePoints = {};

  void drawPolyline(
      {required LatLng origin, required LatLng destination}) async {
    try {
      var response = await http.post(Uri.parse(
          "https://maps.googleapis.com/maps/api/directions/json?key=$apiKey&units=metric&origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&mode=driving"));

      polylineResponse = PolylineResponse.fromJson(jsonDecode(response.body));
      // print("what is the ${response.body}");
    } catch (e) {
      // print("what is the e $e");
    }

    totalDistance = polylineResponse.routes![0].legs![0].distance!.text!;
    totalTime = polylineResponse.routes![0].legs![0].duration!.text!;

    for (int i = 0;
        i < polylineResponse.routes![0].legs![0].steps!.length;
        i++) {
      polylinePoints.add(Polyline(
          polylineId: PolylineId(
              polylineResponse.routes![0].legs![0].steps![i].polyline!.points!),
          points: [
            LatLng(
                polylineResponse
                    .routes![0].legs![0].steps![i].startLocation!.lat!,
                polylineResponse
                    .routes![0].legs![0].steps![i].startLocation!.lng!),
            LatLng(
                polylineResponse
                    .routes![0].legs![0].steps![i].endLocation!.lat!,
                polylineResponse
                    .routes![0].legs![0].steps![i].endLocation!.lng!),
          ],
          width: 3,
          color: Colors.red));
    }

    setState(() {});
  }
}
