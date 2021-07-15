



import 'package:ev_project/utils/objects/provider/appState.dart';
import 'package:ev_project/utils/services/locationHandler.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class CustomMap extends StatefulWidget {
  final CameraPosition? initialPosition;
  final Function(LatLng)? onTap;
  final bool enable;
  CustomMap({
    Key? key,
    this.onTap,
    this.initialPosition,
    this.enable = false,
  }) : super(key: key);

  @override
  _CustomMapState createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  CameraPosition position = CameraPosition(target: LatLng(5.761428062214558, -0.21983736931098521), zoom: 14);
  late GoogleMapController _controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
            padding: EdgeInsets.all(8.0),
            mapToolbarEnabled: false,
            zoomGesturesEnabled: widget.enable,
            zoomControlsEnabled: widget.enable,
            initialCameraPosition: widget.initialPosition ?? position,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            mapType: MapType.normal,
            onMapCreated: (controler){


            setState(() {
              _controller = controler;

              determinePosition().then((value) {
                _controller.animateCamera(
                    CameraUpdate.newLatLngZoom(value.latLng,14.0));

              }).onError((error, stackTrace) {
                _controller.animateCamera(
                    CameraUpdate.newCameraPosition(widget.initialPosition ?? position)
                );
              });
            });
          },
            onCameraMove: (position){
            context.read<AppState>().center = position.target;
            },

          onTap: (cordinates)async{

            if (widget.onTap != null)
              widget.onTap!(cordinates);
          }
        ),



        widget.enable ?
        Align(
          alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.05),
              child: Icon(
                  Icons.location_pin,
                size: 40,
              ),
            )
        )
            : Container(),


        widget.enable ?
        Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
              color: Colors.white.withOpacity(0.7),
              padding: EdgeInsets.all(6.0),
              child: Text("Location name, ER", style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),),
            )
        )
            : Container(),


      ],
    );
  }
}
