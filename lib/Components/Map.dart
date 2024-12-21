import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:fry_guys/Constants/Colors.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class Map extends StatefulWidget {
  final LatLng? selectedLocation; // Accept the selected location
  final bool showRoute; // Indicate whether to show the route

  const Map({
    super.key,
    this.selectedLocation,
    this.showRoute = false,
  });

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  final MapController _mapController = MapController();
  LatLng? _myLocation;
  List<LatLng> _routePoints = []; // Points for the route
  final double _distanceToSelected = 0.0; // Distance to the selected location

  // Get current location
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    return await Geolocator.getCurrentPosition();
  }

  // Show current location
  void _showCurrentLocation() async {
    try {
      Position position = await _determinePosition();
      LatLng currentLatLng = LatLng(position.latitude, position.longitude);
      _mapController.move(currentLatLng, 15.0);
      setState(() {
        _myLocation = currentLatLng;
        _updateRoute(); // Update the route when location changes
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  // Update route to selected location
  void _updateRoute() {
    if (widget.showRoute &&
        widget.selectedLocation != null &&
        _myLocation != null) {
      setState(() {
        _routePoints = [_myLocation!, widget.selectedLocation!];
      });
    } else {
      setState(() {
        _routePoints = [];
      });
    }
  }

  @override
  void didUpdateWidget(Map oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateRoute(); // Update the route when the widget updates
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            bottom: 20,
            right: 20,
            child: widget.selectedLocation != null
                ? Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Distance: ${_distanceToSelected.toStringAsFixed(2)} km',
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter:
                  _myLocation ?? const LatLng(0, 0), // Default center
              initialZoom: 16.0,
              onTap: (tapPosition, point) {},
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              ),
              if (_myLocation != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _myLocation!,
                      child: const Icon(Icons.location_on, color: Colors.blue),
                    ),
                  ],
                ),
              if (widget.selectedLocation != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      point: widget.selectedLocation!,
                      child: const Icon(Icons.location_on, color: Colors.red),
                    ),
                  ],
                ),
              if (_routePoints.isNotEmpty)
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: _routePoints,
                      color: Colors.blue,
                      strokeWidth: 4.0,
                    ),
                  ],
                ),
            ],
          ),
          Positioned(
            top: 20,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: _showCurrentLocation,
              child: const Icon(
                Icons.my_location,
                color: yellow,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
