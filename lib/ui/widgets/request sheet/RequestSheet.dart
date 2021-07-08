import 'package:ev_project/ui/widgets/request%20sheet/createRequestSheet.dart';
import 'package:ev_project/ui/widgets/request%20sheet/requestStatusWidget.dart';
import 'package:ev_project/utils/appResources.dart';
import 'package:ev_project/utils/objects/provider/appState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class RequestSheet extends StatefulWidget {
  final Widget body;
  RequestSheet({Key? key, required this.body}) : super(key: key);

  @override
  _RequestSheetState createState() => _RequestSheetState();
}

class _RequestSheetState extends State<RequestSheet> {
  @override
  Widget build(BuildContext context) {
    // RequestState requestState = context.read<AppState>().requestState;


    return Consumer<AppState>(
      builder: (context,val, child){

        switch(context.read<AppState>().requestState){
          case RequestState.Idle:
            return CreateRequestSheet(body: widget.body);
        // return CreateRequestSheet(body: widget.body, routeContext: widget.routeContext);
          case RequestState.Searching_rider:
          // TODO: Handle this case.

          case RequestState.Rider_found:
          //TODO: handle case
          case RequestState.Cancel:
          // TODO: Handle this case.z

          case RequestState.On_trip:
            return RequestStatusWidget(body: widget.body);
        }

      },
    );



  }
}
