import 'package:awesome_dropdown/awesome_dropdown.dart';
import 'package:ev_project/utils/appResources.dart';
import 'package:flutter/material.dart';


class CustomDropDown extends StatefulWidget {
  final List<String> items;
  final double? width;
  final String? label;
  final double? height;
  final void Function(dynamic)? onChanged;

  const CustomDropDown({
    Key? key,
    this.label,
    required this.items,
    this.onChanged,
    this.width,
    this.height
  }) : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  AppResources resources = new AppResources();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Column(
        children: [
          widget.label != null ?
          Text(widget.label!, overflow: TextOverflow.fade,)
              :Container(width: 0, height: 0,),


          AwesomeDropDown(
              dropDownIcon: Icon(Icons.arrow_drop_down, color: resources.primaryColor,),
              dropDownListTextStyle: TextStyle(color: Colors.black),

              onDropDownItemClick: (s){

              },
              dropDownList: widget.items),
        ],
      ),
    );
  }
}
