import 'package:ev_project/ui/widgets/CustomMap.dart';
import 'package:ev_project/utils/objects/provider/appState.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class PlaceSelectionPage extends StatefulWidget {
  const PlaceSelectionPage({Key? key}) : super(key: key);

  @override
  _PlaceSelectionPageState createState() => _PlaceSelectionPageState();
}

class _PlaceSelectionPageState extends State<PlaceSelectionPage> {



  CameraPosition position = CameraPosition(target: LatLng(5.761428062214558, -0.21983736931098521), zoom: 24);
  List<Marker> markers = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            LatLng center = context.read<AppState>().center;
            Navigator.pop(context, center);
          },
        ),
        body: Container(
            child: CustomMap(enable: true,
            )
        )
    );
  }
}
