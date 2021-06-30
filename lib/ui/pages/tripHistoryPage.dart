

import 'package:ev_project/ui/widgets/TripHistoryTile.dart';
import 'package:ev_project/utils/appResources.dart';
import 'package:flutter/material.dart';


class TripHistoryPage extends StatefulWidget {

  const TripHistoryPage({Key? key}) : super(key: key);

  @override
  _TripHistoryPageState createState() => _TripHistoryPageState();
}

class _TripHistoryPageState extends State<TripHistoryPage> {
  final AppResources resources = AppResources();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.app_settings_alt_outlined),
      //   onPressed: (){
      //     resources.sendFeedback(context);
      //   },
      // ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        toolbarHeight: 45.0,
        leading: IconButton(
          icon: Icon(Icons.chevron_left,
              size: 35,
            color: resources.primaryColor,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 20,
            itemBuilder: (context, index){
          return ListTile(
            title: TripHistoryTile(
              pickup: "Pickup Location",
              destination: "Drop Off Location",
              date: "12 Jan 2020",
              stars: 4.5,
            ),
          );
        }),
      ),
    );
  }
}

