import 'dart:io';

import 'package:flutter/material.dart';


class ProfileImageWidget extends StatefulWidget {
  final double width;
  final double height;
  final Function()? onPressed;
  final String url;
  final File? file;


  ProfileImageWidget({Key? key,
    required this.width,
    required this.url,
    this.file,
    required this.height, this.onPressed}) : super(key: key);

  @override
  _ProfileImageWidgetState createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(60),
          child: widget.file == null ?
          Image.network(widget.url,
            loadingBuilder: (context, widget, chunk){
            if (chunk == null) return widget;
            return CircularProgressIndicator(
              value: chunk.expectedTotalBytes == null
                  ? null
                  : chunk.cumulativeBytesLoaded/chunk.expectedTotalBytes!,
            );
            },
            errorBuilder: (context,object, stacktrace){
              return Column(
              children: [
                Icon(Icons.error_outline),
                Text("Could not load image", overflow: TextOverflow.fade,)
              ],
            );
            },
            fit: BoxFit.fill,
            width: widget.width,
            height: widget.height,
          )
              : Image.file(
            widget.file!,
            fit: BoxFit.fill,
            width: widget.width,
            height: widget.height,
          )
      ),
    );
  }
}
