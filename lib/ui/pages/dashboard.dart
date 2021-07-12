import 'package:ev_project/ui/pages/SettingsPage.dart';
import 'package:ev_project/ui/widgets/request%20sheet/RequestSheet.dart';
import 'package:ev_project/utils/appResources.dart';
import 'package:ev_project/utils/objects/provider/rideUser.dart';
import 'package:ev_project/utils/services/locationHandler.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard( {Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  AppResources resources = AppResources();
  late RideUser user;

  @override
  void initState() {
    user = context.read<RideUser>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return SafeArea(
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   heroTag: "",
        //   child: Icon(Icons.app_settings_alt_outlined),
        //   onPressed: (){
        //     resources.sendFeedback(context);
        //   },
        // ),
        body: Container(
          padding: EdgeInsets.only(top: size.height * 0.05),
          child: RequestSheet(
            body:_Body(),
          ),
        ),
      ),
    );
  }





}



class _Body extends StatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  CameraPosition position = CameraPosition(target: LatLng(-22,401));
  late GoogleMapController _controller;
  List<Marker> markers = [];
  
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRect(
            child: GoogleMap(
            zoomControlsEnabled: false,
            initialCameraPosition: position,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            markers: markers.toSet(),
        onMapCreated: (controler){
          setState(() {
            _controller = controler;
            determinePosition().then((value) {
              _controller.animateCamera(
                  CameraUpdate.newLatLngZoom(value.latLng,14.0));

            }).onError((error, stackTrace) {
              _controller.animateCamera(CameraUpdate.newCameraPosition(position));
            });
          });
        },

        onTap: (cordinates){

          setState(() {
            _controller.animateCamera(
                CameraUpdate.newLatLngZoom(cordinates,14.0));

          });

          // if (widget.enabled) {
            _controller.animateCamera(CameraUpdate.newLatLng(cordinates));
            setState(() {
              markers.add(new Marker(markerId: MarkerId('current location'),
                  position: cordinates));
            });
          // }

        },
            )
        ),

        Container(
          margin: EdgeInsets.only(left: 6.0, top: 30.0),
          child: FloatingActionButton(
            mini: true,
            backgroundColor: Colors.white,
            child: Icon(Icons.menu, color: Colors.indigo,),

            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SettingsPage()));
            },
          ),
        ),

      ],
    );
  }
}
