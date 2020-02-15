import 'dart:async';
import 'package:community/pages/editProfil.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  static const routeName = '/Map';
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(42, 11);

  MapType _currentMapType = MapType.normal;

  List<Marker> allMarkers = [];

  @override
  void initState() {
    super.initState();
    allMarkers.add(
      Marker(
        markerId: MarkerId('myMarker'),
        draggable: false,
        onTap: () {
          print('Marker Tapped');
        },
        position: LatLng(55, 50),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final location = ModalRoute.of(context).settings.arguments as List;
    // // print(location);

    // final LatLng latlag = LatLng(location[0], location[1]);
    final LatLng latlag = LatLng(55, 50);

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
              markers: Set.from(allMarkers),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              initialCameraPosition: CameraPosition(
                target: latlag,
                zoom: 5.0,
              ),
              mapType: _currentMapType,
            ),
          ],
        ),
      ),
    );
  }
}
