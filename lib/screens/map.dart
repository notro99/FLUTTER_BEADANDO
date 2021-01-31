import 'dart:collection';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hello_word_android_studio/l10n/app_localization.dart';

class GMap extends StatefulWidget {
  GMap(): super();



  @override
  _GMapState createState() => _GMapState();
}

class _GMapState extends State<GMap> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(46.2587, 20.14222);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  static final CameraPosition _position1 = CameraPosition(
    bearing: 0,
    target: LatLng(46.2587, 20.14222),
    tilt: 0,
    zoom:11.0,
  );

  Future<void> _goToPosition1() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_position1));
  }

  _onMapCreated(GoogleMapController controller){
    _controller.complete(controller);
  }

  _onCameraMove(CameraPosition position){
    _lastMapPosition = position.target;
  }

  _onMapTypeButtonPressed(){
    setState(() {
      _currentMapType = _currentMapType == MapType.normal ? MapType.satellite : MapType.normal;
    });
  }

  _onAddMarkerButtonPressed(){
    setState(() {
      _markers.add(Marker(markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: AppLocalizations.of(context).destination,
          snippet: AppLocalizations.of(context).goThere,
        ),
        icon: BitmapDescriptor.defaultMarker,
      )
      );
    }
    );
  }
  
  /*Widget button (Function function, IconData icon){
    return FloatingActionButton(onPressed: function,materialTapTargetSize: MaterialTapTargetSize.padded,
    backgroundColor: Colors.blue,
      child: Icon(icon,size: 36.0,),
    );
  }*/



  @override
  Widget build(BuildContext context){
    return MaterialApp(home:Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).map),
        backgroundColor: Colors.teal,
      ),
      body:Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom:11.0,
            ),
            mapType: _currentMapType,
            markers: _markers,
            onCameraMove: _onCameraMove,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
            alignment: Alignment.topRight,
            child: Column(
              children: <Widget>[


                FloatingActionButton(heroTag:'btn1', onPressed: _onAddMarkerButtonPressed,materialTapTargetSize: MaterialTapTargetSize.padded,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.add_location,size: 36.0,),

                ),
              SizedBox(height: 10),
              FloatingActionButton(heroTag:'btn2',onPressed: _goToPosition1,materialTapTargetSize: MaterialTapTargetSize.padded,
              backgroundColor: Colors.blue,
              child: Icon(Icons.location_searching,size: 36.0,),
              ), // button(_onAddMarkerButtonPressed,Icons.add_location),
              ],

            ),
          ),
          ),
        ],
      ),

    )
    );
  }

}
