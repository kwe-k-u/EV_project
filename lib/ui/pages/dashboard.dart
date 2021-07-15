import 'package:ev_project/ui/pages/SettingsPage.dart';
import 'package:ev_project/ui/widgets/CustomMap.dart';
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

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // floatingActionButton: FloatingActionButton(
        //   heroTag: "",
        //   child: Icon(Icons.app_settings_alt_outlined),
        //   onPressed: (){
        //     resources.sendFeedback(context);
        //   },
        // ),
        body: Container(
          // padding: EdgeInsets.only(top: size.height * 0.05),
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

  
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomMap(
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
