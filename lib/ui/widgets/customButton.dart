import 'package:flutter/material.dart';

class CustomRoundedButton extends StatefulWidget {
  final double? height;
  final double? width;
  final double? elevation;
  final double borderRadius;
  late final Widget child;
  late final Color color;
  late final void Function() onPressed;
  final Widget? icon;

  CustomRoundedButton(
      {Key? key,
        this.height,
        this.width,
        this.borderRadius = 15,
        required this.child,
        required this.color,
        this.icon,
        required this.onPressed,
        this.elevation,})
      : super(key: key);



  @override
  _CustomRoundedButtonState createState() => _CustomRoundedButtonState();
}

class _CustomRoundedButtonState extends State<CustomRoundedButton>{



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: widget.height != null ? widget.height : size.height * 0.06,
      width: widget.width != null ? widget.width : size.width * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, widget.elevation != null ? widget.elevation! : 5),
            blurRadius: 5,
            spreadRadius: 0,
            color: Colors.grey[400]!,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: Material(
          color: widget.color,
          child: InkWell(
            splashColor: Colors.black12,
            onTap: widget.onPressed,
            child: Center(
              child:  widget.icon == null
                  ? widget.child
                  : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  widget.icon!,
                  SizedBox(width: 15),
                  widget.child,
                ],
              )
            ),
          ),
        ),
      ),
    );
  }

}
