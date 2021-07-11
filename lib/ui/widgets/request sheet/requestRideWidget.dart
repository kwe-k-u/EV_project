import 'package:ev_project/ui/widgets/LocationTextField.dart';
import 'package:ev_project/ui/widgets/customButton.dart';
import 'package:ev_project/utils/appResources.dart';
import 'package:ev_project/utils/objects/controllers/LocationController.dart';
import 'package:ev_project/utils/objects/provider/appState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RequestRideWidget extends StatefulWidget {
  const RequestRideWidget({Key? key}) : super(key: key);

  @override
  _RequestRideWidgetState createState() => _RequestRideWidgetState();
}

class _RequestRideWidgetState extends State<RequestRideWidget> {
  final AppResources resources = AppResources();
  late AppState appState;



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
              controller: LocationController(),
              icon: Icons.my_location,
              onChanged: (v){},
              onIconTap: (){}
          ),
          // Align(
          //     alignment: Alignment.centerLeft,
          //     child: Text("Enter Pickup location")),
          // CustomTextField(
          //   icon: Icons.not_listed_location_outlined,
          //   width: size.width * 0.7,
          // ),


        Padding(padding: EdgeInsets.all(8.0)),
          LocationTextField(
              label: "Destination",
              controller: LocationController(),
              icon: Icons.add,
              onChanged: (v){},
              onIconTap: (){}
          ),
          // Align(
          //     alignment: Alignment.centerLeft,
          //     child: Text("Enter destination")),
          // CustomTextField(
          //   hintText: "Destination",
          //   width: size.width * 0.7,
          // ),
          Spacer(flex: 1,),
          CustomRoundedButton(
              child: Text("REQUEST RIDE", style: TextStyle(color: Colors.white),),
              color: resources.secondaryColor,
              onPressed: () {
                setState(() {
                  appState.requestState = RequestState.Searching_rider;

                });
              }
          ),
          SizedBox(height: 2,),
          Divider(thickness: 2.0,),
          ListTile(
            leading: Icon(Icons.history),
            title: Text("Cafeteria"),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text("Lobby"),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text("Hakuna"),
            onTap: (){},
          ),

          Spacer(flex: 10,)
        ],
      ),
    );
  }
}
