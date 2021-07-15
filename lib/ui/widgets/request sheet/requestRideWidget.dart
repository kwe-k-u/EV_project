import 'package:ev_project/ui/pages/placeSelectionPage.dart';
import 'package:ev_project/ui/widgets/LocationTextField.dart';
import 'package:ev_project/ui/widgets/customButton.dart';
import 'package:ev_project/utils/appResources.dart';
import 'package:ev_project/utils/objects/controllers/LocationController.dart';
import 'package:ev_project/utils/objects/provider/appState.dart';
import 'package:ev_project/utils/objects/provider/rideUser.dart';
import 'package:ev_project/utils/objects/rideLocation.dart';
import 'package:ev_project/utils/objects/rideRequest.dart';
import 'package:ev_project/utils/services/firebaseStorage.dart';
import 'package:ev_project/utils/services/locationHandler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class RequestRideWidget extends StatefulWidget {
  const RequestRideWidget({Key? key}) : super(key: key);

  @override
  _RequestRideWidgetState createState() => _RequestRideWidgetState();
}

class _RequestRideWidgetState extends State<RequestRideWidget> {
  final AppResources resources = AppResources();
  late AppState appState;
  LocationController destinationController = LocationController();
  LocationController pickupController = LocationController();



  @override
  void initState() {
    super.initState();
    appState = context.read<AppState>();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.72,
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          LocationTextField(
              label: "Start location",
              controller: pickupController,
              icon: Icons.my_location,
              onChanged: (v){},
              onIconTap: ()async{

                LatLng selected = await Navigator.push(context, MaterialPageRoute(
                    builder: (context) => PlaceSelectionPage()
                ));
                pickupController.latlng = selected;


              }
          ),


        Padding(padding: EdgeInsets.all(8.0)),
          LocationTextField(
              label: "Destination",
              controller: destinationController,
              icon: Icons.add,
              onChanged: (v){
              },
              onIconTap: () async{

                LatLng selected = await Navigator.push(context, MaterialPageRoute(
                  builder: (context) => PlaceSelectionPage()
                ));
                destinationController.latlng = selected;

              }
          ),
          Spacer(flex: 1,),
          CustomRoundedButton(
              child: Text("REQUEST RIDE",
                style: TextStyle(
                    color: Colors.white),
                overflow: TextOverflow.fade,
              ),
              color: resources.secondaryColor,
              onPressed: () async{

                RideRequest request = new RideRequest(
                    requestDateTime: DateTime.now(),
                  dropOffLocation: RideLocation(
                      latLng: destinationController.latLng ?? await getLatLngFromAddress(destinationController.text), name: destinationController.text),
                  pickupLocation: RideLocation(
                      latLng: pickupController.latLng ?? await getLatLngFromAddress(pickupController.text), name: pickupController.text),

                );


                requestRide(context.read<RideUser>(), request);

                setState(() {
                  appState.requestState = RequestState.Searching_rider;

                });
              }
          ),
          SizedBox(height: 2,),
          Divider(thickness: 2.0,),
          ListTile(
            leading: Icon(Icons.history),
            title: Text("Cafeteria", overflow: TextOverflow.fade,),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text("Lobby", overflow: TextOverflow.fade,),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text("Hakuna", overflow: TextOverflow.fade,),
            onTap: (){},
          ),

          Spacer(flex: 10,)
        ],
      ),
    );
  }
}
