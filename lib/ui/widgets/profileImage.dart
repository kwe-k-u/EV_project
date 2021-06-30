import 'package:flutter/material.dart';


class ProfileImageWidget extends StatefulWidget {
  final double width;
  final double height;
  ProfileImageWidget({Key? key,
    required this.width,
    required this.height}) : super(key: key);

  @override
  _ProfileImageWidgetState createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(60),
        child: Image.network("https://picsum.photos/200",
          fit: BoxFit.fill,
          width: widget.width,
          height: widget.height,
        )
    );
  }
}
