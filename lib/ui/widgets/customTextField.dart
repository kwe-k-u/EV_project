import 'package:ev_project/utils/appResources.dart';
import 'package:flutter/material.dart';



class CustomTextField extends StatefulWidget {
  final String? hintText;
  final bool obscureText;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final TextInputType? keyboardType;
  final IconData? icon;
  final TextEditingController? controller;

  const CustomTextField({Key? key,
    this.obscureText = false,
    this.width,
    this.icon,
    this.padding,
    this.controller,
    this.keyboardType,
    this.height,
    this.hintText})
      : super(key: key);
//todo center text vertically

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  AppResources resources = AppResources();


  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry padding =  EdgeInsets.all(6.0);
    InputBorder border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(color: resources.primaryColor)
    );


    return Container(
      width: widget.width,
      decoration:BoxDecoration(
        // color: resources.secondaryColor.withOpacity(0.2),
        borderRadius:  BorderRadius.circular(16.0)
      ),
      height: widget.height,
      margin: widget.padding == null ? padding : widget.padding,
      child: TextFormField(
        style: TextStyle(),
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          prefixIcon: widget.icon == null ? null : Icon(widget.icon, color: resources.secondaryColor,),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: resources.primaryColor),
          fillColor: resources.secondaryColor.withOpacity(0.5),
          contentPadding: EdgeInsets.all(8.0),
          hoverColor: resources.secondaryColor,
          focusColor: resources.secondaryColor,
          border: border,
          enabledBorder: border,
        ),
      ),
    );



    // return Container(
    //   width: widget.width,
    //   height: widget.height,
    //   child: Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: TextFormField(
    //       controller: widget.controller,
    //       textAlign: TextAlign.justify,
    //       obscureText: widget.obscureText,
    //       decoration: InputDecoration(
    //         prefixIcon: Icon(Icons.check_circle),
    //         contentPadding: EdgeInsets.all(26.0),
    //         hintText: widget.hintText,
    //         border: OutlineInputBorder(
    //           borderRadius: BorderRadius.circular(12.0),
    //
    //         )
    //       ),
    //     ),
    //   ),
    // );
  }
}
