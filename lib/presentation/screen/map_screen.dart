import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
   MapScreen({Key? key}) : super(key: key);

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments as Map;

    return  GoogleMap(
      mapType: MapType.normal,
      markers: {
        Marker(
            markerId: const MarkerId('1'),
            //icon: BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, AppImage),
            infoWindow: InfoWindow(
              title:'د. ${arguments['name']}',
            ),
            position: LatLng(arguments['lat'], arguments['lon'],
            ))
      },
      initialCameraPosition: CameraPosition(
        target: LatLng(arguments['lat'], arguments['lon']),
        zoom: 16.4746,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
