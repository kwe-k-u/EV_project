import 'package:ev_project/utils/appResources.dart';
import 'package:ev_project/utils/objects/controllers/LocationController.dart';
import 'package:ev_project/utils/objects/place_search.dart';
import "package:flutter/material.dart";
import 'package:splash/splash.dart';

class LocationTextField extends StatefulWidget {
  final String label;
  final LocationController controller;
  final Color color;
  final Color labelColor;
  // final Color selectedColor;
  final double widthFactor;
  final IconData icon;
  final Function(String value) onChanged;
  final void Function()? onIconTap;
  // final FocusNode focusNode;

  LocationTextField({
    required this.label,
    required this.icon,
    // required this.validator,
    required this.controller,
    this.color = Colors.white,
    this.labelColor = Colors.white,
    this.widthFactor = 0.8,
    required this.onChanged,
    // required this.focusNode,
    this.onIconTap,
  });

  @override
  _LocationTextFieldState createState() => _LocationTextFieldState();
}

class _LocationTextFieldState extends State<LocationTextField> {
  List<PlaceSearch> places = [];
  bool showDropDown = false;
  AppResources resources = AppResources();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            width: size.width * widget.widthFactor,
            child: TextFormField(

              keyboardType: TextInputType.text,
              controller: widget.controller,
              decoration: InputDecoration(
                labelText: widget.label,
                contentPadding: EdgeInsets.all(8),
                border: OutlineInputBorder()
              ),
            ),
        ),

        ClipRRect(//todo round button
          borderRadius: BorderRadius.circular(36),
          child: InkWell(
            splashFactory: WaveSplash.splashFactory,
              onTap: widget.onIconTap,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(widget.icon),
              )
          ),
        )
      ],
    );
    // return Theme(
    //   data: new ThemeData(
    //       primaryColor: widget.selectedColor
    //   ),
    //   child:  Container(
    //     padding: EdgeInsets.only(left: 8.0, right: 8.0),
    //     width: size.width * widget.widthFactor,
    //     height: size.width * 0.15,
    //     decoration:BoxDecoration(
    //       color: Colors.grey.withOpacity(0.2),
    //         borderRadius:  BorderRadius.circular(16.0),
    //     ),
    //     child: Column(
    //       children: [
    //         Row(
    //           children: [
    //             Flexible(
    //               flex: 8,
    //               child: Focus(
    //                 onFocusChange: (bool){
    //                   setState(() {
    //                     showDropDown = bool;
    //                   });
    //                 },
    //                 child: TextFormField(
    //
    //                   // validator: widget.validator,
    //                   obscureText: widget.obscureText,
    //                   controller: widget.controller,
    //                   keyboardType: TextInputType.text,
    //                   // focusNode: widget.focusNode,
    //                   onChanged: (value) async{
    //                     if (value.isNotEmpty) {
    //                       getPlaceSuggestions(value, "en").then((pl) {
    //                         setState(() {
    //                           places = pl;
    //                         });
    //                       });
    //                     } else {
    //                       setState(() {
    //                         places = [];
    //                       });
    //                     }
    //                   },
    //                   onTap: (){
    //                     // widget.focusNode.requestFocus();
    //                   },
    //                   decoration: InputDecoration(
    //
    //                     enabledBorder: UnderlineInputBorder(
    //                         borderSide: BorderSide(color: widget.color)
    //                     ),
    //                     labelText: widget.label ,
    //                     labelStyle: TextStyle(color: widget.labelColor),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //
    //             arg.ArgonButton(
    //               padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
    //               height: MediaQuery.of(context).size.width * 0.05,
    //               roundLoadingShape: true,
    //               width: MediaQuery.of(context).size.width * 0.05,
    //               borderRadius: 5.0,
    //               color: Colors.transparent,
    //               elevation: 0,
    //               child: Icon(Icons.my_location),
    //
    //               onTap: (startLoading, stopLoading, btnState) {
    //                 startLoading();
    //
    //                 widget.onIconTap();
    //
    //                 stopLoading();
    //               },
    //               loader: Container(
    //                 padding: EdgeInsets.all(10),
    //                 child:  CircularProgressIndicator(),//todo custom Locading indicator
    //               ),
    //             )
    //           ],
    //         ),
    //
    //         if (showDropDown && places.isNotEmpty)
    //           Card(
    //             elevation: 6.0,
    //             child: SizedBox(
    //               height: size.height * 0.15,
    //
    //               child:  ListView.builder(
    //                   itemCount: places.length,
    //                   itemBuilder: (context, index) {
    //                     return ListTile(
    //                       onTap: (){
    //                         setState(() {
    //                           widget.controller.text = places[index].name;
    //                         });
    //
    //                       },
    //                       subtitle: Divider(color: Colors.white, thickness: 2.0,),
    //                       title: Text(places[index].name),
    //                       tileColor: Colors.grey.shade300,
    //                     );
    //                   }),
    //             ),
    //           )
    //       ],
    //     ),
    //   ),
    // );
  }
}
