import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../models/place.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    this.location = const PlaceLocation(
      latitude: 37.422,
      longitude: -122.084,
      address: '',
    ),
    this.isSelecting = true,
  });

  final PlaceLocation location;
  final bool isSelecting;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedLocation;

  @override
  Widget build(BuildContext context) {
    final initialPosition = LatLng(
      widget.location.latitude,
      widget.location.longitude,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isSelecting ? 'Pick your Location' : 'Your Location'),
        actions: [
          if (widget.isSelecting)
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                if (_pickedLocation == null) return;
                Navigator.of(context).pop(_pickedLocation);
              },
            ),
        ],
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: initialPosition,
          initialZoom: 16.0,
          onTap: widget.isSelecting
              ? (tapPosition, point) {
            setState(() {
              _pickedLocation = point;
            });
          }
              : null,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.favouriteplaces',
          ),
          MarkerLayer(
            markers: [
              if (_pickedLocation != null || !widget.isSelecting)
                Marker(
                  point: _pickedLocation ?? initialPosition,
                  child: const Icon(Icons.location_on, color: Colors.red, size: 40),
                ),
            ],
          ),
        ],
      ),
    );
  }
}