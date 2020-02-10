import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(36, 10);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  MapType _currentMapType = MapType.normal;

  // void _onMapTypeButtonPressed() {
  //   setState(() {
  //     _currentMapType = _currentMapType == MapType.normal
  //         ? MapType.satellite
  //         : MapType.normal;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Google Maps'),
          backgroundColor: Colors.green[700],
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 7.0,
              ),
              mapType: _currentMapType,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Align(
            //     alignment: Alignment.topRight,
            //     child: FloatingActionButton(
            //       onPressed: _onMapTypeButtonPressed,
            //       materialTapTargetSize: MaterialTapTargetSize.padded,
            //       backgroundColor: Colors.green,
            //       child: const Icon(Icons.map, size: 36.0),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}