import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Set<Marker> _markers = HashSet<Marker>();

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(26.8467, 80.9462),
    zoom: 11.5,
  );
  GoogleMapController? _googleMapController;
  BitmapDescriptor? _markerIcon;

  @override
  void initState() {
    _setMarkerIcon();
    super.initState();
  }

  void _setMarkerIcon() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), "assets/robot1.png");
  }

  void _onMapCreated(GoogleMapController controller) {
    _googleMapController = controller;

    setState(
      () {
        _markers.add(
          Marker(
            markerId: MarkerId("0"),
            position: LatLng(26.8467, 80.9462),
            infoWindow: InfoWindow(
              title: "Lucknow",
              snippet: "An intresting city",
            ),
            icon: _markerIcon!,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _googleMapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: _initialCameraPosition,
        markers: _markers,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        foregroundColor: Colors.black,
        onPressed: () => _googleMapController?.animateCamera(
          CameraUpdate.newCameraPosition(_initialCameraPosition),
        ),
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }
}
