import 'package:ev_project/ui/widgets/request%20sheet/createRequestSheet.dart';
import 'package:ev_project/ui/widgets/request%20sheet/requestStatusSheet.dart';
import 'package:ev_project/utils/appResources.dart';
import 'package:flutter/material.dart';


class RequestSheet extends StatefulWidget {
  final Widget body;
  final bool requestMade;
  RequestSheet({Key? key, required this.body, required this.requestMade}) : super(key: key);

  @override
  _RequestSheetState createState() => _RequestSheetState();
}

class _RequestSheetState extends State<RequestSheet> {
  @override
  Widget build(BuildContext context) {
    if (widget.requestMade)
      return RequestStatusSheet(body: widget.body);


    return CreateRequestSheet(body: widget.body);
    //
    // if (widget.requestMade)//use a stream builder or something to listen to changes made in the child nodes
    //   AppResources.openPage(context, RequestStatusSheet(body: widget.body));
    // else
    //   AppResources.openPage(context, CreateRequestSheet(body: widget.body,));
    // return Container(
    // );
  }
}
